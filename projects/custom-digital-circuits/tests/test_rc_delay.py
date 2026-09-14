import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from rc_delay import Stage, elmore_delay


class DelayTests(unittest.TestCase):
    def test_single_stage(self):
        self.assertAlmostEqual(elmore_delay([Stage(1_000, 2e-15)]), 2e-12)

    def test_added_load_increases_delay(self):
        short = [Stage(1_000, 2e-15)]
        long = short + [Stage(1_000, 3e-15)]
        self.assertGreater(elmore_delay(long), elmore_delay(short))

    def test_rejects_nonphysical_values(self):
        with self.assertRaises(ValueError):
            Stage(0, 1e-15)


if __name__ == "__main__":
    unittest.main()

