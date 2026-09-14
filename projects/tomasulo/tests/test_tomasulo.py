import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from tomasulo import Instruction, TomasuloCore


class TomasuloTests(unittest.TestCase):
    def test_dependency_and_in_order_commit(self):
        core = TomasuloCore(registers=[2, 3, 5, 7, 0, 0, 0, 0])
        core.run([
            Instruction("MUL", 4, 0, 1),
            Instruction("ADD", 5, 2, 3),
            Instruction("ADD", 6, 4, 5),
        ])
        self.assertEqual(core.regs[4:7], [6, 12, 18])
        self.assertEqual(core.commit_log, [1, 2, 3])
        self.assertLess(core.broadcast_log.index(2), core.broadcast_log.index(1))

    def test_waw_rename_keeps_youngest_mapping(self):
        core = TomasuloCore(registers=[2, 4, 0, 0, 0, 0, 0, 0])
        core.run([
            Instruction("MUL", 2, 0, 1),
            Instruction("ADD", 2, 0, 0),
            Instruction("ADD", 3, 2, 1),
        ])
        self.assertEqual(core.regs[2], 4)
        self.assertEqual(core.regs[3], 8)

    def test_structural_backpressure(self):
        core = TomasuloCore(rob_size=1, rs_size=1)
        self.assertTrue(core.issue(Instruction("MUL", 1, 0, 0)))
        self.assertFalse(core.issue(Instruction("ADD", 2, 0, 0)))


if __name__ == "__main__":
    unittest.main()

