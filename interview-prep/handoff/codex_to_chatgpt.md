# Codex → ChatGPT 当前交接

2026-11-02。当前唯一任务：**R001 / RTL-04-BASE-V2首稿语法修正**。本人已说“写好了”，首稿原样保留，助手未改代码。实际Icarus编译exit8，FAIL；功能仿真NOT_TESTED。先等本人改完保存，不代写完整FIFO。

## 本轮证据与反馈

- 源码SHA256：1a5d352c6dc2d017968723fd17df439774969af751dce170d05579af49fd86f4；原样快照和实际命令/版本/stdout/stderr见`local://legacy/06_RTL手撕题_原题与训练记录/RTL-04/20261102_V2独立诊断/runs/01_first_compile/result.json`。
- 编译直接报端口声明顺序、full/empty处比较表达式语法错误；编译亦警告wr_fire为隐式wire。静态另见wt_ptr/wr_ptr/wrptr、wt_fire/wr_fire命名不统一及defult拼写。
- 已按三类给最小修正提示，用户先debug。存储/指针/计数/独立读写/复位结构已写出，不因语法失败断言功能全错，也不凭静态结构判功能通过。
- 本次此前有一次概念提示，位宽3/3/4口述正确；不是全程无提示首次接触。完整首稿保留，后续修订与测试须另留记录。
- RTL-04及其BASE变式目前LEARNING，指向同一练习；未编译通过/未仿真，不授予MASTERED。391项UNASSESSED、2项REVIEW、2项LEARNING不是395个独立题。

## 已保留与下一步

BASE-06和BASE-09已测子技能为REVIEW，11月3日无提示复测；BASE-09其余FSM内容未测。每天最多150分钟，实际时长尚未计量；不以聊天间隔或工具耗时充数。当前先等FIFO修订，不并行抛项目题或扩展新题。

修正后先重编译，再使用自检TB覆盖复位、顺序、空满阻止、同拍边界和回绕；让用户先debug，不先给完整实现。原题型与教学约束分标；原课程项目、公开重实现与新练习不混，原答/代码/测试不删除。

## 同步边界

最近核验push：d0a1b186f1bc30e1216ce60ada91f2e04d07c0c6。当前首稿Review与实际失败摘要按已授权流程审查后同步；当前承载hash从Git历史取得。私人原答/原始绝对路径和课程原件不发布，本机首稿和完整日志保持local引用；原projects/RTL/TB/README/PROVENANCE不改。项目Cheatsheet不混独立手撕答案。
