# 当前操作：R001-LOCAL-COMPILE01（本人本地编译）

2026-11-02。用户希望用本地IDE自己编译。已核本机VS Code、iverilog/vvp、GTKWave和Vivado；当前练习目录增加.vscode/tasks.json、run_local.py和本地操作说明，不改DUT/全局PATH/全局编辑器设置。

## 当前只做一步

在VS Code用“打开文件夹”打开本题目录，Ctrl+S保存sync_fifo8.sv，再按Ctrl+Shift+B运行默认“FIFO: 编译DUT”。查看终端输出，将结果发来。只编译通过不等于功能自检通过。

之后可用“终端→运行任务→FIFO: 编译并自检仿真”，以及“FIFO: 打开最新波形”。操作说明：`local://legacy/06_RTL手撕题_原题与训练记录/RTL-04/20261102_V2独立诊断/本地编译与仿真操作.md`。

任务对应的编译/仿真命令已由Codex验证PASS，记录actor=assistant_setup_check；不是用户亲自操作的证据。每次运行在本题local_runs生成独立时间戳目录，保留快照/命令/日志/退出码，原验证03结果不覆盖。

用户先前R001-ORAL-02尚未回答，挂起保留：读后full降低且wr_fire随后变高，为何不能补做同一个上升沿写入？当前不并行提问、不代答、未变更掌握分数。
