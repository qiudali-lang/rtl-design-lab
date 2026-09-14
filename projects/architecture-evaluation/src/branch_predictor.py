"""Trace-driven branch predictor models."""

from dataclasses import dataclass
from typing import Iterable


@dataclass
class PredictionStats:
    correct: int = 0
    total: int = 0

    @property
    def accuracy(self) -> float:
        return self.correct / self.total if self.total else 0.0


class AlwaysTaken:
    def predict(self, pc: int) -> bool:
        return True

    def update(self, pc: int, taken: bool) -> None:
        pass


class Bimodal2Bit:
    def __init__(self, entries: int = 64):
        if entries <= 0 or entries & (entries - 1):
            raise ValueError("entries must be a positive power of two")
        self.counters = [1] * entries
        self.mask = entries - 1

    def _index(self, pc: int) -> int:
        return (pc >> 2) & self.mask

    def predict(self, pc: int) -> bool:
        return self.counters[self._index(pc)] >= 2

    def update(self, pc: int, taken: bool) -> None:
        idx = self._index(pc)
        self.counters[idx] = min(3, self.counters[idx] + 1) if taken else max(0, self.counters[idx] - 1)


class Gshare:
    def __init__(self, history_bits: int = 6):
        if not 1 <= history_bits <= 16:
            raise ValueError("history_bits must be in 1..16")
        self.mask = (1 << history_bits) - 1
        self.history = 0
        self.counters = [1] * (1 << history_bits)

    def _index(self, pc: int) -> int:
        return ((pc >> 2) ^ self.history) & self.mask

    def predict(self, pc: int) -> bool:
        return self.counters[self._index(pc)] >= 2

    def update(self, pc: int, taken: bool) -> None:
        idx = self._index(pc)
        self.counters[idx] = min(3, self.counters[idx] + 1) if taken else max(0, self.counters[idx] - 1)
        self.history = ((self.history << 1) | int(taken)) & self.mask


def evaluate(predictor, trace: Iterable[tuple[int, bool]]) -> PredictionStats:
    stats = PredictionStats()
    for pc, taken in trace:
        stats.correct += predictor.predict(pc) == taken
        stats.total += 1
        predictor.update(pc, taken)
    return stats

