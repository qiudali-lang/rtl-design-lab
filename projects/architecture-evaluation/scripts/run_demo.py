import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from branch_predictor import AlwaysTaken, Bimodal2Bit, Gshare, evaluate
from cache_model import SetAssociativeCache


def main() -> None:
    branch_trace = [(0x100, outcome) for outcome in [1, 1, 1, 0] * 32]
    branch_results = {}
    for name, predictor in {
        "always_taken": AlwaysTaken(),
        "bimodal_16": Bimodal2Bit(16),
        "gshare_4": Gshare(4),
    }.items():
        stats = evaluate(predictor, branch_trace)
        branch_results[name] = {"correct": stats.correct, "total": stats.total, "accuracy": stats.accuracy}

    address_trace = [address for _ in range(8) for address in range(0, 256, 4)]
    cache_results = {}
    for ways in (1, 2, 4):
        stats = SetAssociativeCache(256, 16, ways).run(address_trace)
        cache_results[f"256B_{ways}way"] = {"hits": stats.hits, "misses": stats.misses, "hit_rate": stats.hit_rate}

    output = {"branch_predictors": branch_results, "caches": cache_results}
    build = ROOT / "build"
    build.mkdir(exist_ok=True)
    (build / "results.json").write_text(json.dumps(output, indent=2), encoding="utf-8")
    print(json.dumps(output, indent=2))


if __name__ == "__main__":
    main()

