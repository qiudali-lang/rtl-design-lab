"""Run newly added tests against original project RTL or the separate follow-up fix."""
from pathlib import Path
import argparse, json, os, shutil, subprocess, tempfile

ROOT = Path(__file__).resolve().parents[1]
P = ROOT/'projects/axi-lite-divider'
def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--variant', choices=['original','read-response-fix'], default='original', help='Original completed project by default; the fix is later follow-up work')
    ap.add_argument('--interface', type=Path, help='Alternate interface RTL, e.g. original pre-fix source')
    ap.add_argument('--interface-only', action='store_true')
    ap.add_argument('--core-only', action='store_true')
    ap.add_argument('--output-dir', type=Path, help='Keep logs and the AXI VCD here')
    args=ap.parse_args()
    if args.interface_only and args.core_only: ap.error('Choose only one test selection')
    for tool in ('iverilog','vvp'):
        if not shutil.which(tool): raise SystemExit(f'Missing {tool}; install Icarus Verilog and add it to PATH.')
    env=os.environ.copy()
    # OSS CAD Suite on Windows also needs its sibling lib directory for DLLs.
    bin_dir=Path(shutil.which('vvp')).resolve().parent
    lib_dir=bin_dir.parent/'lib'
    if os.name=='nt' and lib_dir.is_dir():
        env['PATH']=os.pathsep.join([str(bin_dir),str(lib_dir),env.get('PATH','')])
    tmp=tempfile.TemporaryDirectory(prefix='rtl-portfolio-')
    out=(args.output_dir or Path(tmp.name)).resolve(); out.mkdir(parents=True, exist_ok=True)
    interface = args.interface or (P/'rtl/div_axi_if.sv' if args.variant=='original' else P/'follow-up/read-response-fix/div_axi_if.sv')
    targets=[]
    if not args.interface_only:
        targets.append(('tb_divider_exhaustive',[P/'rtl/divider.sv',P/'tb/tb_divider_exhaustive.sv']))
    if not args.core_only:
        targets.append(('tb_axi_public',[interface,P/'rtl/divider.sv',P/'tb/tb_axi_public.sv']))
    print(f'Testing variant={args.variant}; tests were added during portfolio preparation.',flush=True)
    results=[]
    for top, sources in targets:
        image=out/(top+'.vvp')
        build=subprocess.run(['iverilog','-g2012','-s',top,'-o',str(image),*[str(p.resolve()) for p in sources]],capture_output=True,text=True,timeout=60,env=env)
        (out/(top+'_compile.log')).write_text(build.stdout+build.stderr,encoding='utf-8')
        if build.returncode: raise SystemExit(build.stdout+build.stderr)
        cmd=['vvp',str(image)]
        if top=='tb_axi_public' and args.output_dir: cmd+=['+vcd']
        run=subprocess.run(cmd,cwd=out,capture_output=True,text=True,timeout=60,env=env)
        (out/(top+'.log')).write_text(run.stdout+run.stderr,encoding='utf-8')
        print(run.stdout.strip())
        if run.returncode or 'PASS ' not in run.stdout:
            results.append({'test':top,'result':'FAIL','exit_code':run.returncode,'summary':[s for s in run.stdout.splitlines() if 'FAIL' in s]})
            (out/'results.json').write_text(json.dumps(results,indent=2)+'\n',encoding='utf-8')
            raise SystemExit(run.stderr or f'Simulation failed or missing PASS marker (exit {run.returncode})')
        results.append({'test':top,'result':'PASS','summary':[s for s in run.stdout.splitlines() if s.startswith('PASS ')]})
    (out/'results.json').write_text(json.dumps(results,indent=2)+'\n',encoding='utf-8')
    print('All selected public regressions passed.')
if __name__=='__main__': main()
