# ID和目录映射（不另建答案库）

旧项目/基础问答继续使用PIPE-/TOM-/AXI-/PCIE-/GEM5-/PIN-/CACHE-/CMOS-/BASE-原ID，Kxx仅为分类字段。W40保留原笔试ID；M17-Q保留复盘原子ID；OLDQ为旧手册标题定位别名。新轮状态唯一保存在training/mastery.yaml。

|类别|含义|
|---|---|
|K01|Verilog/SystemVerilog|
|K02|数字电路|
|K03|RTL与微架构|
|K04|CDC/RDC|
|K05|STA/综合/DFT|
|K06|AXI/SoC|
|K07|PCIe/SerDes|
|K08|CPU体系结构|
|K09|Memory/Cache|
|K10|CMOS/VLSI|
|K11|验证与Debug|

|建议RTL别名|主题|旧ID/关联|
|---|---|---|
|R001|同步FIFO|RTL-04；只作导航，不覆盖旧ID|
|R002|异步FIFO|RTL-22,RTL-02；只作导航，不覆盖旧ID|
|R003|RR Arbiter|RTL-19-RR,RTL-19；只作导航，不覆盖旧ID|
|R004|skid/elastic valid-ready buffer|RTL-20,RTL-11,RTL-12；只作导航，不覆盖旧ID|
|R005|AXI-Lite Slave|无完整同名旧题；旧库无同名完整独立Slave题；使用P01规格入口，Phase2再定独立教学合同，不伪造面经原题|
|R006|Stall/Flush|RTL-24；只作导航，不覆盖旧ID|
|R007|Forwarding/HDU|RTL-24；与R006共享旧母题，不另计母题|
|R008|UART|RTL-42；只作导航，不覆盖旧ID|
|R009|乘/除法器|RTL-41；公开原除法核心是项目证据，不等于独立手撕已完成|
|R010|FSM/计数器|RTL-01,RTL-03,RTL-17,RTL-26,RTL-29,RTL-30,RTL-31,RTL-36；只作导航，不覆盖旧ID|

## 目录职责

- 旧00、09 → 本地来源/事件原件；inventory只保存索引。
- 旧02 → 继续是答案权威，不再创建knowledge第二份正文。
- 旧03、04、05 → 项目审计与Cheatsheet权威，不重建project-review全文。
- 旧06 → 已练代码/首稿/TB/日志/波形；不另建平行rtl-practice。Phase2的新练习也先复用旧题目录。
- 旧07 → 仍仅明确要求时生成RTL专项速查，绝不混进项目Cheatsheet。
- 旧08、10 → 保留历史分级/答题/路线；V2新轮状态优先。
- 新training → 只保存新轮测评/任务/进度，链接原答案/证据，不复制它们。
- 新handoff → 跨助手摘要；只有已commit且push的文件才对远端可见。

本机解析见local/source_resolver.json（git忽略）。其他机器缺少本地原件时标LOCAL_ONLY_UNAVAILABLE，不凭公开重实现补造课程事实。
