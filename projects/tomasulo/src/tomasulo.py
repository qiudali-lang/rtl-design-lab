"""Small, deterministic Tomasulo scheduling reference model."""

from __future__ import annotations

from collections import deque
from dataclasses import dataclass
from typing import Deque, Iterable, Optional


LATENCY = {"ADD": 1, "SUB": 1, "MUL": 3}


@dataclass(frozen=True)
class Instruction:
    op: str
    dst: int
    src1: int
    src2: int


@dataclass
class ROBEntry:
    tag: int
    dst: int
    ready: bool = False
    value: int = 0


@dataclass
class RSEntry:
    tag: int
    op: str
    dst_tag: int
    vj: int = 0
    vk: int = 0
    qj: Optional[int] = None
    qk: Optional[int] = None
    remaining: Optional[int] = None
    result: Optional[int] = None

    @property
    def operands_ready(self) -> bool:
        return self.qj is None and self.qk is None


class TomasuloCore:
    def __init__(self, registers: Iterable[int] = (0,) * 8, rob_size: int = 8, rs_size: int = 4):
        self.regs = list(registers)
        if len(self.regs) != 8:
            raise ValueError("exactly eight registers are required")
        self.rename: list[Optional[int]] = [None] * 8
        self.rob: Deque[ROBEntry] = deque()
        self.rs: list[RSEntry] = []
        self.rob_size = rob_size
        self.rs_size = rs_size
        self.next_tag = 1
        self.cycle = 0
        self.events: list[str] = []
        self.commit_log: list[int] = []
        self.broadcast_log: list[int] = []

    def _rob_by_tag(self, tag: int) -> ROBEntry:
        for entry in self.rob:
            if entry.tag == tag:
                return entry
        raise KeyError(f"ROB tag {tag} not found")

    def _source(self, reg: int) -> tuple[int, Optional[int]]:
        tag = self.rename[reg]
        if tag is None:
            return self.regs[reg], None
        producer = self._rob_by_tag(tag)
        if producer.ready:
            return producer.value, None
        return 0, tag

    def issue(self, inst: Instruction) -> bool:
        op = inst.op.upper()
        if op not in LATENCY:
            raise ValueError(f"unsupported operation: {inst.op}")
        if len(self.rob) >= self.rob_size or len(self.rs) >= self.rs_size:
            return False
        if not all(0 <= reg < 8 for reg in (inst.dst, inst.src1, inst.src2)):
            raise ValueError("register index outside 0..7")

        vj, qj = self._source(inst.src1)
        vk, qk = self._source(inst.src2)
        tag = self.next_tag
        self.next_tag += 1
        self.rob.append(ROBEntry(tag=tag, dst=inst.dst))
        self.rs.append(RSEntry(tag=tag, op=op, dst_tag=tag, vj=vj, vk=vk, qj=qj, qk=qk))
        self.rename[inst.dst] = tag
        self.events.append(f"C{self.cycle}: issue T{tag} {op} R{inst.dst}")
        return True

    @staticmethod
    def _compute(op: str, lhs: int, rhs: int) -> int:
        if op == "ADD":
            return lhs + rhs
        if op == "SUB":
            return lhs - rhs
        if op == "MUL":
            return lhs * rhs
        raise AssertionError(op)

    def _commit(self) -> None:
        if not self.rob or not self.rob[0].ready:
            return
        entry = self.rob.popleft()
        self.regs[entry.dst] = entry.value
        if self.rename[entry.dst] == entry.tag:
            self.rename[entry.dst] = None
        self.commit_log.append(entry.tag)
        self.events.append(f"C{self.cycle}: commit T{entry.tag} -> R{entry.dst}={entry.value}")

    def _broadcast(self) -> None:
        completed = [entry for entry in self.rs if entry.remaining == 0]
        if not completed:
            return
        winner = min(completed, key=lambda entry: entry.tag)
        assert winner.result is not None
        rob_entry = self._rob_by_tag(winner.dst_tag)
        rob_entry.ready = True
        rob_entry.value = winner.result
        for entry in self.rs:
            if entry.qj == winner.dst_tag:
                entry.qj = None
                entry.vj = winner.result
            if entry.qk == winner.dst_tag:
                entry.qk = None
                entry.vk = winner.result
        self.rs.remove(winner)
        self.broadcast_log.append(winner.tag)
        self.events.append(f"C{self.cycle}: CDB T{winner.tag}={winner.result}")

    def _execute(self) -> None:
        for entry in self.rs:
            if entry.remaining is None and entry.operands_ready:
                entry.remaining = LATENCY[entry.op]
                self.events.append(f"C{self.cycle}: start T{entry.tag}")
            if entry.remaining is not None and entry.remaining > 0:
                entry.remaining -= 1
                if entry.remaining == 0:
                    entry.result = self._compute(entry.op, entry.vj, entry.vk)
                    self.events.append(f"C{self.cycle}: finish T{entry.tag}")

    def step(self) -> None:
        self.cycle += 1
        self._commit()
        self._broadcast()
        self._execute()

    @property
    def empty(self) -> bool:
        return not self.rob and not self.rs

    def run(self, program: Iterable[Instruction], max_cycles: int = 200) -> list[int]:
        pending = deque(program)
        while (pending or not self.empty) and self.cycle < max_cycles:
            if pending and self.issue(pending[0]):
                pending.popleft()
            self.step()
        if pending or not self.empty:
            raise TimeoutError("program did not retire within max_cycles")
        return self.regs


def demo() -> None:
    core = TomasuloCore(registers=[2, 3, 5, 7, 0, 0, 0, 0])
    program = [
        Instruction("MUL", 4, 0, 1),
        Instruction("ADD", 5, 2, 3),
        Instruction("ADD", 6, 4, 5),
    ]
    core.run(program)
    print("\n".join(core.events))
    print("registers:", core.regs)


if __name__ == "__main__":
    demo()

