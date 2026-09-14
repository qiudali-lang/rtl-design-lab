import os
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
BUILD = ROOT / "build"
BUILD.mkdir(exist_ok=True)
iverilog = shutil.which("iverilog")
vvp = shutil.which("vvp")
if not iverilog or not vvp:
    raise SystemExit("iverilog and vvp must be available in PATH")
env = os.environ.copy()
bin_dir = Path(vvp).resolve().parent
lib_dir = bin_dir.parent / "lib"
if os.name == "nt" and lib_dir.is_dir():
    env["PATH"] = os.pathsep.join([str(bin_dir), str(lib_dir), env.get("PATH", "")])

image = BUILD / "pcie_rx.vvp"
subprocess.run([
    iverilog, "-g2012", "-Wall", "-o", str(image),
    str(ROOT / "rtl" / "async_symbol_fifo.sv"),
    str(ROOT / "rtl" / "pcie_rx_2lane.sv"),
    str(ROOT / "tb" / "tb_pcie_rx_2lane.sv"),
], check=True)
subprocess.run(["vvp", str(image)], check=True, env=env)
