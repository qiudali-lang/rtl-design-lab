# V2.0 资料盘点（元数据索引）

盘点日期：2026-11-01，America/Los_Angeles。共享仓库基线：`c9cade730dd6d1bd238fa12184aa53a2f5e32fc6`。

只重新检查已授权本地资料的可访问性/哈希及既存索引，不声称重新读完所有正文、PDF、视频或源码。`TEXT_READABLE`表示可读取文本，不代表本轮完整技术审查；`PRESENT_BINARY_NOT_REREAD`只证明文件存在。公开网页本轮仅导入已存元数据，没有重新联网核验正文。

`local://legacy/`指向旧 interview-prep；`local://workspace/`指向旧工作区；`local://source/ID`通过被git忽略的 `local/source_resolver.json`解析。公共仓库只保存索引与脱敏状态，不复制课程原件、私人原答、录音或原稿全文。

|Source ID|名称/类别|位置|本轮可读性|纳入状态|重复/来源边界|
|---|---|---|---|---|---|
|S-KNOWLEDGE|旧项目/基础问答权威库 / 既有权威索引|local://legacy/02_综合高频题库/统一题库_权威数据_V0.4.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_METADATA_ONLY|
|S-RTL|旧RTL专项权威库 / 既有权威索引|local://legacy/06_RTL手撕题_原题与训练记录/RTL专项题库_权威数据_V0.3.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_METADATA_ONLY|
|S-HISI|华为海思来源台账 / 既有权威索引|local://legacy/00_资料与面经索引/华为海思_正文来源台账_V0.2.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_METADATA_ONLY|
|S-W40|笔试40题索引 / 既有权威索引|local://legacy/00_资料与面经索引/用户笔试40题/题目索引与核验状态.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_METADATA_ONLY|
|S-EVENTS|历史面试事件数据库 / 既有权威索引|local://legacy/09_模拟面试与真实面试复盘/历史面经数据库.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_METADATA_ONLY|
|S-STATE|旧动态训练状态 / 既有权威索引|local://legacy/10_日计划与进度/当前训练状态.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_METADATA_ONLY|
|S-PROGRESS|旧进度与错题 / 既有权威索引|local://legacy/08_错题本与掌握进度/当前进度与错题_V0.4.md|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_METADATA_ONLY|
|S-URLS|旧面经URL去重索引 / 既有权威索引|local://legacy/00_资料与面经索引/面经原帖去重索引_V0.2.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_METADATA_ONLY|
|S-LEGACY-RES-BASE|用户指定基线 / 用户指定基线|local://source/S-LEGACY-RES-BASE|MISSING|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-RES-C1|设计简历候选 / 设计简历候选|local://source/S-LEGACY-RES-C1|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-RES-C2|设计简历候选 / 设计简历候选|local://source/S-LEGACY-RES-C2|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-TRACK|训练流水账 / 训练流水账|local://workspace/outputs/CPU面试准备_训练记录.txt|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-MASTER|旧综合索引 / 旧综合索引|local://workspace/outputs/面经与模拟复盘_设计准备总清单.txt|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-DAILY|面经采集台账 / 面经采集台账|local://workspace/outputs/面经每日更新.txt|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-HISI|公开面经汇总 / 公开面经汇总|local://workspace/outputs/华为海思数字IC设计_面经汇总与全面准备清单.md|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-MOCK02|模拟复盘 / 模拟复盘|local://source/S-LEGACY-MOCK02|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-MOCK17|结构化模拟复盘 / 结构化模拟复盘|local://workspace/outputs/模拟面试_20261017/复盘数据.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-VIDEO17|模拟录像 / 模拟录像|local://source/S-LEGACY-VIDEO17|MISSING|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-USER20|用户提供既往面试摘要 / 用户提供既往面试摘要|local://workspace/outputs/用户补充_上次面试20题_20261018.txt|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-OLD8|源码/报告核查 / 源码/报告核查|local://source/S-LEGACY-OLD8|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-OLDMAP|转述/课程映射 / 转述/课程映射|local://source/S-LEGACY-OLDMAP|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-OLDQ|旧复习手册 / 旧复习手册|local://source/S-LEGACY-OLDQ|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-APP31|历史投递/岗位快照 / 历史投递/岗位快照|local://source/S-LEGACY-APP31|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-VERIFY|历史验证岗安排 / 历史验证岗安排|local://workspace/outputs/清微智能_周日验证岗准备与起点.txt|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PL-RTL|流水线原工程 / 流水线原工程|local://source/S-LEGACY-PL-RTL|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PL-COMP|流水线原工程 / 流水线原工程|local://source/S-LEGACY-PL-COMP|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PL-TB|流水线原工程 / 流水线原工程|local://source/S-LEGACY-PL-TB|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PL-LOG|流水线原工程 / 流水线原工程|local://source/S-LEGACY-PL-LOG|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PL-RF|流水线原工程 / 流水线原工程|local://source/S-LEGACY-PL-RF|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-IF|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-IF|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-CORE|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-CORE|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-TB|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-TB|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-SW|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-SW|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-MAIN|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-MAIN|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-PASS|AXI/SoC原工程 / AXI/SoC原工程|local://source/S-LEGACY-AX-PASS|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-TIME|AXI/SoC原工程 / AXI/SoC原工程|local://source/S-LEGACY-AX-TIME|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-TO-ISS|Tomasulo原工程 / Tomasulo原工程|local://source/S-LEGACY-TO-ISS|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-TO-DIS|Tomasulo原工程 / Tomasulo原工程|local://source/S-LEGACY-TO-DIS|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-TO-CFC|Tomasulo原工程 / Tomasulo原工程|local://source/S-LEGACY-TO-CFC|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-LANE|PCIe原工程 / PCIe原工程|local://source/S-LEGACY-PC-LANE|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-RX|PCIe原工程 / PCIe原工程|local://source/S-LEGACY-PC-RX|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-EB|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-PC-EB|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-DS|PCIe原工程 / PCIe原工程|local://source/S-LEGACY-PC-DS|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-DEC|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-PC-DEC|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-BUF|PCIe原工程 / PCIe原工程|local://source/S-LEGACY-PC-BUF|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-TOP|PCIe原工程 / PCIe原工程|local://source/S-LEGACY-PC-TOP|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-TB|PCIe原工程 / PCIe原工程|local://source/S-LEGACY-PC-TB|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-QA|已核查项目问答 / 已核查项目问答|local://workspace/outputs/PCIe项目面试问答/题目索引.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-EE-RCA|原电路报告 / 原电路报告|local://source/S-LEGACY-EE-RCA|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-EE-CMP|原比较器报告 / 原比较器报告|local://source/S-LEGACY-EE-CMP|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-EE-CHECK|比较器图/报告复核 / 比较器图/报告复核|local://workspace/outputs/source_review/ee577a_comparator_20261018/核查记录.txt|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-ARCH-OLD|旧架构证据索引 / 旧架构证据索引|local://source/S-LEGACY-ARCH-OLD|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-CODE1|本人练习修订版 / 本人练习修订版|local://workspace/outputs/rtl_practice/01_mod10_counter.sv|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-CODE2|本人练习修订版 / 本人练习修订版|local://workspace/outputs/rtl_practice/02_fifo_wptr8.sv|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-CODE3|本人练习修订版 / 本人练习修订版|local://workspace/outputs/rtl_practice/03_seq1011.sv|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-CODE3-R|实际运行状态 / 实际运行状态|local://workspace/outputs/rtl_practice/03_seq1011_result.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-PACK|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-PACK|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-PACK-SRC|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-PACK-SRC|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-GEN-SRC|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-GEN-SRC|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-SOC|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-SOC|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX-BSP|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-AX-BSP|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-ENC|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-PC-ENC|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-ROM|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-PC-ROM|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-ENCM|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-PC-ENCM|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-ENCP|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-PC-ENCP|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-DECM|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-PC-DECM|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-PC-DECP|本轮读取的真实项目文件 / 本轮读取的真实项目文件|local://source/S-LEGACY-PC-DECP|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-ARM-AXI|一手技术参考；不是个人实现证据 / 一手技术参考；不是个人实现证据|https://documentation-service.arm.com/static/5f915b62f86e16515cdc3b1c|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / PRIMARY_REFERENCE_NOT_PERSONAL_EVIDENCE|
|S-LEGACY-ARM-AHB|一手技术参考；不是个人实现证据 / 一手技术参考；不是个人实现证据|https://documentation-service.arm.com/static/6141bf0d674a052ae36ca811|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / PRIMARY_REFERENCE_NOT_PERSONAL_EVIDENCE|
|S-LEGACY-ARM-TIMEOUT|一手技术参考；不是个人实现证据 / 一手技术参考；不是个人实现证据|https://community.arm.com/forums/f/architectures-and-processors-forum/7879/use-of-wvalid-signal-in-axi/173260|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / PRIMARY_REFERENCE_NOT_PERSONAL_EVIDENCE|
|S-LEGACY-AMD-8B10B|一手技术参考；不是个人实现证据 / 一手技术参考；不是个人实现证据|https://docs.amd.com/api/khub/documents/EszknF1grvYWytRf4Up9UA/content|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / PRIMARY_REFERENCE_NOT_PERSONAL_EVIDENCE|
|S-LEGACY-REAL-20261018-01|真实面试亲历回忆；非逐字录音 / 真实面试亲历回忆；非逐字录音|local://legacy/09_模拟面试与真实面试复盘/2026-10-18_数字IC面试_公司待核实/原始回忆.md|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-POST-RESUME-20261018|同场面试补充及长期恢复状态 / 同场面试补充及长期恢复状态|local://legacy/09_模拟面试与真实面试复盘/2026-10-18_数字IC面试_公司待核实/面试复盘补充_V0.3.md|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX19-TB|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-AX19-TB|TEXT_READABLE|INDEXED|S-LEGACY-AX-TB / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-AX19-SVA|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-AX19-SVA|TEXT_READABLE|INDEXED|S-LEGACY-AX-TB / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-T19-ROB|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-T19-ROB|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-T19-CFC|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-T19-CFC|TEXT_READABLE|INDEXED|S-LEGACY-TO-CFC / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-T19-DIS|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-T19-DIS|TEXT_READABLE|INDEXED|S-LEGACY-TO-DIS / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-T19-IQ|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-T19-IQ|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-T19-CDB|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-T19-CDB|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-T19-LSQ|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-T19-LSQ|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-T19-SAB|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-T19-SAB|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-T19-LOAD|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-T19-LOAD|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-T19-BPB|本场静态源码核查 / 本场静态源码核查|local://source/S-LEGACY-T19-BPB|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-REAL-20261019-PDF|用户提供真实面试整理PDF / 用户提供真实面试整理PDF|local://legacy/09_模拟面试与真实面试复盘/2026-10-19_数字IC面试_AXI_Tomasulo_公司待核实/原始面试整理.pdf|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-STANFORD-SRT|课程原理主来源 / 课程原理主来源|https://web.stanford.edu/class/ee486/doc/lecture12.pdf|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / PRIMARY_REFERENCE_NOT_PERSONAL_EVIDENCE|
|S-LEGACY-OLDREFRTL|旧教学RTL（15模块，非用户独立成果） / 补充来源|local://source/S-LEGACY-OLDREFRTL|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-OLDREFTB|旧教学RTL测试平台 / 补充来源|local://source/S-LEGACY-OLDREFTB|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LEGACY-OLDREFLOG|旧教学测试日志，非本轮回归 / 补充来源|local://source/S-LEGACY-OLDREFLOG|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LATE-AUDIT|架构/电路后补证据核查 / 补充来源|local://workspace/outputs/source_review/last_two_projects_20261019/本轮核查摘要.json|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-USER-V2|本轮用户V2.0直接指令 / 补充来源|local://source/S-USER-V2|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-DESKTOP-RTL|桌面已练代码归档 / 补充来源|local://source/S-DESKTOP-RTL|DIRECTORY_INDEX_ONLY|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-WORD-BASE|学长原稿增补版（第三方内容与个人经历分开） / 补充来源|local://source/S-WORD-BASE|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-WORD-ORIGINAL|学长面试准备原稿 / 补充来源|local://source/S-WORD-ORIGINAL|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-WORD-PCIE|更正后的PCIe准备原稿 / 补充来源|local://source/S-WORD-PCIE|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LATE-01|原实验报告/配置（已索引） / 补充来源|local://source/S-LATE-01|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LATE-02|原实验报告/配置（已索引） / 补充来源|local://source/S-LATE-02|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LATE-03|原实验报告/配置（已索引） / 补充来源|local://source/S-LATE-03|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LATE-04|原实验报告/配置（已索引） / 补充来源|local://source/S-LATE-04|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LATE-05|原实验报告/配置（已索引） / 补充来源|local://source/S-LATE-05|PRESENT_BINARY_NOT_REREAD|INDEXED|S-LEGACY-EE-RCA / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LATE-06|原实验报告/配置（已索引） / 补充来源|local://source/S-LATE-06|PRESENT_BINARY_NOT_REREAD|INDEXED|S-LEGACY-EE-CMP / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-LATE-07|原实验报告/配置（已索引） / 补充来源|local://source/S-LATE-07|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_NO_RAW_EXPORT|
|S-M17-01|本次原录像 / 模拟复盘已有证据指针|local://source/S-M17-01|MISSING|INDEXED|S-LEGACY-VIDEO17 / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-02|本次完整转写 / 模拟复盘已有证据指针|local://workspace/work/mock_20261017/transcript_medium.txt|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-03|重点段复转 / 模拟复盘已有证据指针|local://workspace/work/mock_20261017/key_pipeline_tomasulo_metrics.txt|TEXT_READABLE|INDEXED|— / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-04|EE457真实流水线RTL / 模拟复盘已有证据指针|local://source/S-M17-04|TEXT_READABLE|INDEXED|S-LEGACY-PL-RTL / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-05|除法核心 / 模拟复盘已有证据指针|local://source/S-M17-05|TEXT_READABLE|INDEXED|S-LEGACY-AX-CORE / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-06|AXI接口 / 模拟复盘已有证据指针|local://source/S-M17-06|TEXT_READABLE|INDEXED|S-LEGACY-AX-IF / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-07|PCIe接收链 / 模拟复盘已有证据指针|local://source/S-M17-07|TEXT_READABLE|INDEXED|S-LEGACY-PC-LANE / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-08|比较器核查记录 / 模拟复盘已有证据指针|local://workspace/outputs/source_review/ee577a_comparator_20261018/核查记录.txt|TEXT_READABLE|INDEXED|S-LEGACY-EE-CHECK / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-09|SRAM课程规格 / 模拟复盘已有证据指针|local://source/S-M17-09|PRESENT_BINARY_NOT_REREAD|INDEXED|— / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-10|SRAM报告 / 模拟复盘已有证据指针|local://source/S-M17-10|PRESENT_BINARY_NOT_REREAD|INDEXED|S-LATE-07 / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-11|AMD UG474 Carry Logic Applications / 模拟复盘已有证据指针|https://docs.amd.com/r/en-US/ug474_7Series_CLB/Carry-Logic-Applications|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-12|AMD UG474 LUT / 模拟复盘已有证据指针|https://docs.amd.com/r/en-US/ug474_7Series_CLB/Look-Up-Table|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-13|MIT 6.004存储层次 / 模拟复盘已有证据指针|https://ocw.mit.edu/courses/6-004-computation-structures-spring-2017/pages/c14/c14s1|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-14|gem5 LPDDR2接口文档 / 模拟复盘已有证据指针|https://www.gem5.org/documentation/general_docs/stdlib_api/gem5.components.memory.dram_interfaces.lpddr2.html|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|S-M17-15|2026-10-02旧模拟复盘 / 模拟复盘已有证据指针|local://source/S-M17-15|TEXT_READABLE|INDEXED|S-LEGACY-MOCK02 / LOCAL_PRIVATE_OR_PUBLIC_REFERENCE|
|H-X1|华为海思数字IC线下速通面经（9.28） / 公开面经元数据|https://www.xiaohongshu.com/explore/6ac28180000000001402d96e|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / mixed_personal_advice|
|H-X2|海思数字IC设计面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/68fb5e190000000005002a85|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-X3|华为海思数字IC面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/6a198749000000000702d05f|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-X4|华为海思数字芯片面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/68fb28000000000007038fc3|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_mixed_role|
|H-X5|数字IC秋招面试终章——华为海思面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/68f740a40000000003035b0b|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-X6|华为海思数字IC线下面试 / 公开面经元数据|https://www.xiaohongshu.com/explore/68f1145c0000000007031eec|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-X7|华为数字电路面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/6ab3ee39000000000202a4cf|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-X8|华为海思暑期实习面经：数字芯片 / 公开面经元数据|https://www.xiaohongshu.com/explore/6824c6b5000000000303ff78|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_process|
|H-X9|9.23线下 / 公开面经元数据|https://www.xiaohongshu.com/explore/6aba0a6b000000001303eeb5|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-X10|已成为🌸IC候选人，今年华清池水有点烫 / 公开面经元数据|https://www.xiaohongshu.com/explore/6ad33efc0000000015007e96|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / mixed_personal_advice|
|H-D15|2h速通🌸 / 公开面经元数据|https://www.xiaohongshu.com/explore/6ad049bc00000000180072ad|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_mixed_role|
|H-D16A|数字IC面经 / 90min速通🌸 / 公开面经元数据|https://www.xiaohongshu.com/explore/6ad06fa2000000001403b066|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_mixed_role|
|H-D16B|华为图灵数字芯片tl与面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/6a1e4f9900000000060331b1|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-D17|1015华清池男宾一位～ / 公开面经元数据|https://www.xiaohongshu.com/explore/6ad1c4a80000000015015887|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-D19|华为海思面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/6ad3a170000000000b005994|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_process|
|H-N1|海思暑期实习面经 / 公开面经元数据|https://www.nowcoder.com/feed/main/detail/b3f629ab5eb34ea38778805a01e5e1fe|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-N2|西安海思实习开奖 / 公开面经元数据|https://www.nowcoder.com/feed/main/detail/41e15aadfefa44c6b2f98a00df613e96|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-N3|秋招——数字IC/FPGA面经（海思段） / 公开面经元数据|https://blog.nowcoder.net/n/7dcee028cbd04972b1da5f78ab373ce8|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H-AUX1|华为海思数字ic实习面试手撕代码 / 公开面经元数据|https://www.xiaohongshu.com/explore/67fb4f10000000001c010138|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / reported_images|
|H-AUX2|华为海思数字IC/验证岗一二面及主管面面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/6a965a97000000000d026ca7|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / knowledge_summary|
|H-AUX3|21 华为数字ic面 / 公开面经元数据|https://www.xiaohongshu.com/explore/68d5831c0000000012030145|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / limited_text|
|H20-X01|华为海思数字IC线下面试通关攻略（详解版） / 公开面经元数据|https://www.xiaohongshu.com/explore/6abf45a8000000000b005e9a|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / mixed_personal_advice|
|H20-X02|🌸海思线下三面芯片设计面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/68ccf81a000000000b03cd84|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H20-X03|华为面经｜数字芯片 / 公开面经元数据|https://www.xiaohongshu.com/explore/68ee1ae40000000004022500|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H20-X04|华为海思 秋招最后一舞 / 公开面经元数据|https://www.xiaohongshu.com/explore/6ad1f7d10000000018018cc2|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_process|
|H20-X05|华为海思面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/6904411b0000000007038138|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H20-X06|华为面试通过啦 / 公开面经元数据|https://www.xiaohongshu.com/explore/68f86cbe000000000302c9f7|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_theme_only|
|H20-X07|🔜💰秋招面经：华为海思技术一/二面 / 公开面经元数据|https://www.xiaohongshu.com/explore/68d22496000000000e031b8c|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / reported_collection|
|H20-X08|海思图灵达芬奇数字IC实习开奖 / 公开面经元数据|https://www.xiaohongshu.com/explore/6a0faddd00000000370354ae|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H20-X09|10.15 华为线下面 / 公开面经元数据|https://www.xiaohongshu.com/explore/6ad45d05000000002803bf78|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H20-X10|25秋招笔记/私企篇02/海思-数字芯片面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/67c4934a000000002901d816|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_process|
|H20-X11|华为海思面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/68fcbdc2000000000301bc19|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H20-N01|〖面经〗第九期 华为海思 面经（已主管面） / 公开面经元数据|https://www.nowcoder.com/discuss/353159149238296576|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / reported_reprint|
|H20-N02|华为海思-数字芯片设计工程师-面经 / 公开面经元数据|https://www.nowcoder.com/discuss/408576449295253504|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H20-N03|2022届数字芯片设计实习面经（海思 海康） / 公开面经元数据|https://www.nowcoder.com/discuss/353157959201005568|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_process|
|H20-C01|2021年数字IC面经---华为 / 公开面经元数据|https://blog.nowcoder.net/n/17bdd320c5564be8a44321ea103e0fb6|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / reported_collection|
|H23-X01|27届9本2硕华为海思面经 / 公开面经元数据|https://www.xiaohongshu.com/explore/6ad9b4af000000002b01fdfc|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_mixed_role|
|H25-X01|10.24海思丝滑入池 / 公开面经元数据|https://www.xiaohongshu.com/explore/6add90cc000000002c0259e8|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H26-X01|紧绷的心终于死了（华为凉经） / 公开面经元数据|https://www.xiaohongshu.com/explore/6adc29ea000000003101d685|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|H30-X01|三小时速通华子，符合114525 / 公开面经元数据|https://www.xiaohongshu.com/explore/6ad1a56e0000000015010a92|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / personal_technical|
|S-URL-017|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/68f085c6000000000301b290|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-018|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6aca47ef000000001c01f768|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-019|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6aca56750000000014003463|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-020|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6ab4c5eb0000000014038166|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-021|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6a69c18b000000001400400c|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-022|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6ac4d5e0000000000a01f6be|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-023|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6acdf9a6000000001203e738|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-024|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-025|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6a7c41a10000000033033c29|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-026|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6a7c3ae40000000025004ed3|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-027|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6aa14f850000000012024727|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-029|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6aca54f00000000014002c7e|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-032|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6ad1cd9b000000001802f0b3|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-033|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://xhslink.cn/o/LHCFsODv5J|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-035|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6aace666000000000d02467e|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-036|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6ad39134000000001403a29d|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-037|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6ad39e2d000000001400342e|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-038|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6ac703ea000000001203c448|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-057|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6adcce13000000002a02a011|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-URL-058|其他既存URL来源（正文分类待复核） / 旧URL去重索引|https://www.xiaohongshu.com/explore/6adf5bbd000000001500f72d|METADATA_ONLY_NOT_FETCHED_THIS_RUN|INDEXED|— / TO_REVIEW_NOT_CONFIRMED_INTERVIEW|
|S-ORIGINAL-P01|AXI4-Lite Divider + MicroBlaze SoC原资料目录 / 原项目目录|local://source/S-ORIGINAL-P01|DIRECTORY_INDEX_ONLY|INDEXED|— / LOCAL_PRIVATE_COURSE_OR_COLLABORATIVE|
|S-PUBLIC-P01|AXI4-Lite Divider + MicroBlaze SoC公开作品集页面 / 公开说明与重实现|repo://projects/axi-lite-divider/README.md|TEXT_READABLE|INDEXED|— / PUBLIC_PROVENANCE_APPLIES|
|S-ORIGINAL-P02|PCIe RX / 8b10b / Elastic Buffer / Deskew原资料目录 / 原项目目录|local://source/S-ORIGINAL-P02|DIRECTORY_INDEX_ONLY|INDEXED|— / LOCAL_PRIVATE_COURSE_OR_COLLABORATIVE|
|S-PUBLIC-P02|PCIe RX / 8b10b / Elastic Buffer / Deskew公开作品集页面 / 公开说明与重实现|repo://projects/pcie-rx/README.md|TEXT_READABLE|INDEXED|— / PUBLIC_PROVENANCE_APPLIES|
|S-ORIGINAL-P03|自定义五级流水线 CPU原资料目录 / 原项目目录|local://source/S-ORIGINAL-P03|DIRECTORY_INDEX_ONLY|INDEXED|— / LOCAL_PRIVATE_COURSE_OR_COLLABORATIVE|
|S-PUBLIC-P03|自定义五级流水线 CPU公开作品集页面 / 公开说明与重实现|repo://projects/pipeline-cpu/README.md|TEXT_READABLE|INDEXED|— / PUBLIC_PROVENANCE_APPLIES|
|S-ORIGINAL-P04|Tomasulo / ROB / Checkpoint原资料目录 / 原项目目录|local://source/S-ORIGINAL-P04|DIRECTORY_INDEX_ONLY|INDEXED|— / LOCAL_PRIVATE_COURSE_OR_COLLABORATIVE|
|S-PUBLIC-P04|Tomasulo / ROB / Checkpoint公开作品集页面 / 公开说明与重实现|repo://projects/tomasulo/README.md|TEXT_READABLE|INDEXED|— / PUBLIC_PROVENANCE_APPLIES|
|S-ORIGINAL-P05|gem5 RISC-V / x86 + Pin分支预测原资料目录 / 原项目目录|local://source/S-ORIGINAL-P05|DIRECTORY_INDEX_ONLY|INDEXED|— / LOCAL_PRIVATE_COURSE_OR_COLLABORATIVE|
|S-PUBLIC-P05|gem5 RISC-V / x86 + Pin分支预测公开作品集页面 / 公开说明与重实现|repo://projects/architecture-evaluation/README.md|TEXT_READABLE|INDEXED|— / PUBLIC_PROVENANCE_APPLIES|
|S-ORIGINAL-P06|45nm Full-custom / SRAM原资料目录 / 原项目目录|local://source/S-ORIGINAL-P06|DIRECTORY_INDEX_ONLY|INDEXED|— / LOCAL_PRIVATE_COURSE_OR_COLLABORATIVE|
|S-PUBLIC-P06|45nm Full-custom / SRAM公开作品集页面 / 公开说明与重实现|repo://projects/custom-digital-circuits/README.md|TEXT_READABLE|INDEXED|— / PUBLIC_PROVENANCE_APPLIES|

## 去重与出处

- 已索引华为/海思来源 **40** 条；旧URL索引 **59** 行；二者合并规范URL后 **60** 条。后者包含其他公司、转述及待复核项，不能称全部海思亲历面经。
- 已有台账的“34亲历相关/混合＋6辅助、3篇明确图灵”是旧分类统计；细分类以 catalog.json 为准。本轮没有重读网页，不宣称40场相同岗位面试。
- 本地既存 `656` 文件与公共仓库 `48` 跟踪文件联合按SHA256查得 `88` 组非空内容重复。逐文件清单只在 `local/phase0_file_manifest.json`，不把截图/生成物当新题目。
- 同路径多来源ID保留出处关联；同内容不同路径不删除。不同问法或相似主题只标TO_REVIEW，不自动合并。
- 来源分类、可见发帖日期、面试日期和原采集日期保存在 catalog.json；未知日期保持null，不补造年份。
