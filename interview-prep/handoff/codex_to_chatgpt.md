# Codex → ChatGPT 当前交接

2026-11-02。用户新要求：“我有没有本地ide软件，我想自己编译”。当前只等**本人在VS Code运行FIFO编译任务并反馈终端结果**，不再同时追问口述。R001-ORAL-02原题挂起保留，尚未答，不判失败。

## 已实际完成的本地配置

- 核实已安装VS Code、Icarus iverilog/vvp、GTKWave和Vivado 2024.1。当前采用VS Code编辑、Icarus编译/仿真、GTKWave看VCD。
- 当前练习目录新增.vscode/tasks.json三个任务、run_local.py、本地编译与仿真操作.md。仅本题局部配置，不改DUT/全局PATH/全局编辑器设置。
- Ctrl+Shift+B默认任务“FIFO: 编译DUT”；“终端→运行任务”另有自检仿真和打开波形。各次运行单独存local_runs时间戳目录，保留源码/TB快照、实际命令、日志、退出码；原验证03不覆盖。
- Codex已调用新helper验证编译/自检均PASS；actor=assistant_setup_check，不是用户亲自运行。VS Code CLI打开命令返回0，IDE里的实际按钮操作尚未验证；GTKWave版本命令exit0有dbus提示，GUI任务未由Codex检查。
- 当前源码相比验证03只有缩进/空行变化；设置前后哈希相同，DUT未被Codex改动。新helper检查记录见`local://legacy/06_RTL手撕题_原题与训练记录/RTL-04/20261102_V2独立诊断/local_runs/tool_setup_result.json`；操作说明见同题本地编译与仿真操作.md。

## 保留的训练证据

标准FIFO修订后既有自检PASS：8组/1153周期/6915检查。前两次编译FAIL、概念与语法辅助、Codex编写TB和代跑命令事实保留。R001口述01行为独立正确，口述02时序原因尚待；状态REVIEW，非首次无提示独立通过。BASE-06/09已测子技能也为REVIEW，明天复测为计划；BASE-09其余FSM内容未测。

当前工具设置不增加考试题/成绩/掌握或学习时长。每天最多150分钟，按实际薄弱点安排；当前先让用户自己操作一次编译，不并行发新项目题/新RTL实现。

## 同步

最近已核验push：d4decf708b91f96a58cccf2e0713be2a7810e825。本批工具操作入口与口述01摘要按已授权流程审查后同步，实际承载hash通过Git历史取得。私有原答/绝对路径/课程原件不发布；原projects/RTL/TB/README/PROVENANCE不改。
