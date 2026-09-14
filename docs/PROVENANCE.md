# Source scope & evidence index

本作品集在 2026-09-05 UTC（洛杉矶 2026-09-04）整理。项目经历与历史实验发生在此前；公开版本新增的回归与修复单独标注。

## 公开内容

| 内容 | 来源与处理 |
| --- | --- |
| AXI `rtl/div_axi_if.sv` | 个人接口原始完成版，仅统一文本换行；原文件 SHA-256 保存在 manifest 中 |
| AXI `follow-up/read-response-fix/div_axi_if.sv` | 作品集整理时新增的读响应保持修复，与原始成果分开 |
| AXI `divider.sv` | 个人 8-bit 迭代除法器实现，逻辑保持不变 |
| `legacy_interface_sva_tb.sv` | 个人接口定向 TB，保留原有 divider stub；未把它作为真实算术验证证据 |
| 两个 `tb_*` 公共测试与运行脚本 | 本次作品集整理时新增，可在公开 RTL 上直接运行 |
| 其余五个项目页面 | 基于源码、记录及报告重写的历史说明，个人工作置于对应课程/合作框架背景中 |
| PCIe 与流水线公开 RTL | 2026 年 9 月按公开功能规格重新设计的独立作品集实现，不含历史课程源码 |
| Tomasulo 与体系结构模型 | 2026 年 9 月重新实现的 Python 参考模型，不含课程 VHDL、gem5/Pin 源码或合作代码 |
| CMOS/SRAM 公开模型 | technology-neutral SPICE cells 与参数分析；不含 PDK、Cadence OA 数据库或课程模板 |
| JSON 结果摘要 | 重新读取本地现有结果得到的最小数据集，不包含绝对路径或原始报告附件 |
| 原 `rtl/`、`tb/`、`notes/` | 保留已有独立基础练习 |

原始源码指纹见 [AXI source manifest](../projects/axi-lite-divider/evidence/source_manifest.json)。指纹用于区分版本；它不是第三方验证或对未公开数据的独立证明。

## 验证分层

| 项目 | 本次执行 | 不能据此声称 |
| --- | --- | --- |
| AXI | 原版算术枚举通过、原接口反例复现；分开的修复版通过当前新增测试 | 完整 AXI 覆盖、原 SVA TB 重跑、修复版 PPA |
| AXI 历史 PPA | 重新读取原 IP 综合与整机时序报告 | 读数据锁存修改后的资源/时序 |
| PCIe | 历史输出重新比较；独立公开 RTL 的异步 FIFO/COM/SKP/lane-pair 自检通过 | 商用 PCIe 合规、8b/10b decoder 或上板通过 |
| 流水线 | 读取历史寄存器输出；独立公开 CPU 的前递、load-use、存取、分支、HALT 自检通过 | 重跑历史 37 条课程指令或证明全部冒险覆盖 |
| Tomasulo | 读取八份历史 log；独立公开模型的 RAW/WAW/乱序完成/按序提交单元测试通过 | 历史整机独立实现、综合或完整覆盖率 |
| gem5 Cache | 从五个历史 stats 文件重算 MIPS；独立公开预测器和 Cache 模型单元测试通过 | 重跑 gem5、跨工作负载加速保证或周期精确性能 |
| gem5 DSE / Intel Pin | DSE 对照原报告；Pin 使用既有项目摘要 | 本次独立重跑或所有数字均重新核验 |
| 数字电路 | 历史报告比例复算；独立 SPICE cell 与 RC-delay 模型检查通过 | 重新进行 Spectre、DRC/LVS、后仿或 SRAM 签核 |

## 私有原件索引（仅文件名）

- AXI：`div-axi-if.sv`、`divider.sv`、`div_axi_if_tb.sv`；独立 IP utilization report；完整 SoC routed timing summary。
- PCIe：`result_2.txt` / `result_2_golden.txt`、`result_3.txt` / `result_3_golden.txt`。
- 流水线：`RF_Content_Lab7_P3.txt`，最终寄存器记录。
- Tomasulo：八个模块目录的 `Tomasulo_do_file_log.txt`；空的 `TomasuloCompareTestLog.log` 不作为通过依据。
- 体系结构：五种 Cache 配置的 `stats.txt`，以及合作课程项目的配置探索报告。
- 数字电路：`lab1report.pdf` 第 18 页，`Lab2_Qiuda Li.pdf` 第 30、35 页。

## 公开边界

五级流水线历史源文件有明确的禁止公开声明；PCIe/Tomasulo 历史文件混有教师/课程框架和参考模块，无法只凭完成者身份将整个文件归为个人原创。因此仓库仍不发布这些历史原件，只保留重写的设计摘要和结果数据。新增公开代码采用新的接口、结构与测试从零实现，并明确标为独立作品集版本。个人实现贡献不等于对框架、golden、题面与工具生成文件拥有再分发权。

没有上传课件、课程测试平台、参考答案、EDA 二进制、PDK、原始完整 PDF、个人证件、电话、邮箱或服务器配置。此仓库未新增覆盖所有材料的统一开源许可证；已有文件的声明继续适用。
