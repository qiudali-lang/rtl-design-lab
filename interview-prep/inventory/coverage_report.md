# V2.0 覆盖报告与待确认事项

## 可追溯规模

|对象|本轮读取值|计数依据/不可误读|
|---|---:|---|
|当前项目/基础权威问答|134|S-KNOWLEDGE.questions；唯一旧ID，含真实、预测与扩展|
|用户笔试变式|40|S-W40.questions；提供答案尚未逐题核验，不当海思真题|
|旧手册候选标题|96|S-LEGACY-OLDQ 的Q01–Q96；与权威题库有语义重叠，不能相加称独立题数|
|10月17日模拟复盘原子项|52|S-LEGACY-MOCK17.questions；含讲解/建议，不等于52道原始考题|
|RTL母题/白板条目|43|S-RTL 顶层ID去重|
|强制变式|24|S-RTL.mandatory_variants；不当新增母题/独立面试场数|
|项目审计文档|10|旧03目录现存Markdown，含跨项目补核与逐条覆盖|
|当前权威项目Cheatsheet|8|版本指针中的8单元，不把旧PDF/HTML算新增项目|
|公共项目README|6|共享仓库现有项目说明|
|项目|6|P01–P06；原8复习单元中GEM5/PIN/CACHE归P05|
|既有面经事件记录|6|2场明确真实事件、2个已发生模拟日期、1次进行中模拟、1份日期不明回忆|
|华为/海思来源记录|40|含亲历/流程/混合/转述/整理/受限，不等于40场同岗位技术面|
|公共来源规范URL|60|两个旧来源索引取并集；不计技术规范URL为亲历面经|
|旧证据台账条目|78|S-LEGACY-*；同文件可以有多个证据ID|
|公共仓库原跟踪文件|48|基线git ls-files，6项目README及已有代码/脚本/测试|
|旧工作区资料文件|656|仅原interview-prep/与outputs/；51,687,219字节，不是全硬盘规模|
|测评状态记录|395|含候选/变式/复盘原子/项目，不是“独立知识题数”；全部UNASSESSED|

## 六项目资料映射

原件只建立本地入口；公开重实现的存在/旧测试记录不能证明用户独立掌握，也不替代原课程设计。

|新项目ID|旧单元|公开说明|原资料入口|当前权威项目视图|
|---|---|---|---|---|
|P01|AXI|[README](../../projects/axi-lite-divider/README.md)|S-ORIGINAL-P01|`local://legacy/04_项目完整版_Cheatsheets/AXI_AXI4-Lite除法IP与MicroBlaze_V_SoC_完整版_V0.4.md`|
|P02|PCIE|[README](../../projects/pcie-rx/README.md)|S-ORIGINAL-P02|`local://legacy/04_项目完整版_Cheatsheets/PCIE_PCIe简化双lane接收链_完整版_V0.3.md`|
|P03|PIPE|[README](../../projects/pipeline-cpu/README.md)|S-ORIGINAL-P03|`local://legacy/04_项目完整版_Cheatsheets/PIPE_五级定制教学流水线_完整版_V0.1.md`|
|P04|TOM|[README](../../projects/tomasulo/README.md)|S-ORIGINAL-P04|`local://legacy/04_项目完整版_Cheatsheets/TOM_Tomasulo动态调度与重命名_完整版_V0.2.md`|
|P05|GEM5,PIN,CACHE|[README](../../projects/architecture-evaluation/README.md)|S-ORIGINAL-P05|`local://legacy/04_项目完整版_Cheatsheets/GEM5_gem5_RISC-V设计空间探索_完整版_V0.1.md` ; `local://legacy/04_项目完整版_Cheatsheets/PIN_Intel_Pin分支预测分析_完整版_V0.1.md` ; `local://legacy/04_项目完整版_Cheatsheets/CACHE_x86_gem5_Cache与存储层次实验_完整版_V0.1.md`|
|P06|CMOS|[README](../../projects/custom-digital-circuits/README.md)|S-ORIGINAL-P06|`local://legacy/04_项目完整版_Cheatsheets/CMOS_45nm全定制数字电路与512bit_SRAM_完整版_V0.1.md`|

## 尚未闭合的证据（初始化不等待补齐）

- **REQUEST_FROM_USER / RESUME_BASELINE**：用户指定双点简历路径的现状见缺失表；候选版本保留，不能自动替换。无需现在重传现有文件，只需未来确认版本。
- **REQUEST_FROM_USER / INTERVIEW_COMPANY_LINK**：V2提及Credo、超摩，但本次定向检索没有找到可把它们可靠关联到匿名10月18/19日事件的材料。保留匿名事件，不擅自给公司名/结果。
- **TO_VERIFY / answers**：10月18日13项/5链、10月19日27项/8链的本人当场原答未存；原参考答案不能回填为原答。连续追问关系已在catalog保留。
- **TO_REVIEW / semantic_dedup**：96旧手册候选、40笔试、52复盘原子与134权威问答有交集；本轮保留分母及出处，未完成逐题语义合并，不删除或复制整篇旧答案。
- **TO_VERIFY / code_provenance**：课程框架/本人Task/公开重新实现/后续修复分开。公共Tomasulo是Python模型；公共PCIe是symbol模型，不等于完整PHY/8b10b decoder。
- **TO_VERIFY / verification**：本轮未执行HDL仿真、SVA、gem5、Spectre、综合、布局布线或上板；所有本轮工程测试状态为NOT_TESTED。原AXI读保持问题与公共follow-up修复是两个版本，历史PPA对应原版。
- **TO_REVIEW / oldest_materials**：旧8题核查与15模块教学代码已索引，不再当15份本人独立首稿。更多只出现在聊天但没落盘的内容不可自动读取，不能凭空声称已导入。
- **SYNC**：用户已批准本次同步；实际提交与远端核验见handoff/codex_to_chatgpt.md。本地原件路径不会跨助手共享。

## 本轮缺失路径（不把旧accessible字段当现状）

|Source ID|名称|状态|
|---|---|---|
|S-LEGACY-RES-BASE|用户指定基线|MISSING；精确本地路径见私有resolver|
|S-LEGACY-VIDEO17|模拟录像|MISSING；精确本地路径见私有resolver|
|S-M17-01|本次原录像|MISSING；精确本地路径见私有resolver|

只在明确需要且现有材料无法回答时才请求补充；不重新索取已经可访问的资料。

## 初始分类分布（134条权威问答）

K01: 2 / K02: 4 / K03: 3 / K04: 6 / K05: 7 / K06: 20 / K07: 26 / K08: 41 / K09: 9 / K10: 8 / K11: 8。

分类是初始索引标签，待摸底/逐题Review调整，不代表掌握或海思官方考纲。K01独立语义题较少，但旧手册/40题和RTL中有相关条目；不因此跳过基础诊断。

缺失表共3个来源ID，对应2个独立本地路径（录像被两处引用）。已保存的转写/复盘仍可用，不必为了初始化重新上传。

公开边界补核：40道笔试只公开题ID、主题和关联，不发布未知授权范围的原题正文/选项/答案；原文仍在本地旧索引。
