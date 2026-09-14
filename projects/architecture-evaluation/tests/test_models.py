import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

from branch_predictor import Bimodal2Bit, Gshare, evaluate
from cache_model import SetAssociativeCache


class PredictorTests(unittest.TestCase):
    def test_bimodal_learns_taken_branch(self):
        stats = evaluate(Bimodal2Bit(8), [(0x100, True)] * 16)
        self.assertGreaterEqual(stats.correct, 15)

    def test_gshare_is_deterministic(self):
        trace = [(0x100 + (i % 4) * 4, bool(i & 1)) for i in range(100)]
        self.assertEqual(evaluate(Gshare(4), trace), evaluate(Gshare(4), trace))


class CacheTests(unittest.TestCase):
    def test_repeated_line_hits(self):
        stats = SetAssociativeCache(64, 16, 1).run([0, 4, 8, 12])
        self.assertEqual((stats.hits, stats.misses), (3, 1))

    def test_lru_eviction(self):
        cache = SetAssociativeCache(32, 16, 2)
        cache.run([0, 16, 0, 32, 16])
        self.assertEqual((cache.stats.hits, cache.stats.misses), (1, 4))


if __name__ == "__main__":
    unittest.main()

