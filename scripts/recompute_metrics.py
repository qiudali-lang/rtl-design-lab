"""Recompute reported metrics from public summary data. Does not run gem5 or EDA tools."""
from pathlib import Path
import json

ROOT=Path(__file__).resolve().parents[1]
def main():
    rows=json.loads((ROOT/'projects/architecture-evaluation/evidence/cache_results.json').read_text(encoding='utf-8'))
    baseline=rows[0]['sim_seconds']
    for r in rows:
        assert r['sim_seconds']>0 and r['sim_instructions']>0
        mips=r['sim_instructions']/r['sim_seconds']/1e6
        if abs(mips-r['sim_mips'])>1e-9: raise ValueError('Stored metric differs from input data')
        print(f"{r['configuration']}: {mips:.3f} simulated MIPS, {baseline/r['sim_seconds']:.3f}x vs DDR3 no-cache")
    print(f"RCA delay reduction: {(1-236.1/311.0)*100:.3f}%")
    print(f"Comparator area reduction: {(1-(1.89*65.10)/(1.89*97.14))*100:.3f}%")
    print(f"Reported geometric-mean MIPS gain (rounded inputs): {(2229/1690-1)*100:.3f}%")
    print('Arithmetic checks only; raw simulations and physical-design flows were not rerun.')
if __name__=='__main__': main()
