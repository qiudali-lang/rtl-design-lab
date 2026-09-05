# Digital IC Design & Verification Portfolio

**李仇炟 · Qiuda Li / Lucas**
数字 IC / RTL 设计与功能验证 · USC Electrical Engineering

围绕接口控制、处理器微架构和验证方法整理的工程作品集。包含可运行的 AXI4-Lite RTL、测试与缺陷回归，以及 PCIe、流水线、Tomasulo、体系结构性能评估和数字电路的项目说明。

## 从这里开始

| 项目 | 技术重点 | 可查看的材料 |
| --- | --- | --- |
| [AXI4-Lite 除法 IP 与 SoC 集成](projects/axi-lite-divider/README.md) | AW/W 解耦、寄存器映射、读反压、断言、算术自检 | **RTL + testbench + 可复现回归 + 缺陷修复记录** |
| [PCIe 物理层接收链路](projects/pcie-rx/README.md) | 双 lane、8b/10b、elastic buffer、deskew、CDC | 框图、实现说明、输出比较摘要 |
| [五级流水线处理器](projects/pipeline-cpu/README.md) | RAW、停顿、气泡、旁路与写回 | 数据通路说明、验证策略、寄存器结果摘要 |
| [Tomasulo 动态调度](projects/tomasulo/README.md) | 重命名、ROB、检查点恢复、CDB 时隙 | 模块职责图、八组历史回归摘要 |
| [处理器与存储层次性能评估](projects/architecture-evaluation/README.md) | gem5、Intel Pin、分支预测、Cache | 配置对比、机器可读数据、指标重算脚本 |
| [45 nm 数字电路与 SRAM](projects/custom-digital-circuits/README.md) | 加法器、比较器、DFF、512-bit SRAM | 电路层次、指标条件、DRC/LVS 范围 |

**设计方向：**先看 AXI 的接口状态和读数据保持，再看 PCIe 或处理器项目。
**验证方向：**先看 [AXI 回归与缺陷记录](projects/axi-lite-divider/VERIFICATION.md)，再看其他项目的检查对象、结果和局限。

## 可直接运行

需要 Python 3.10+、Icarus Verilog（`iverilog` / `vvp` 在 PATH 中）：

```sh
python scripts/run_axi_tests.py --variant read-response-fix
python scripts/recompute_metrics.py
```

`rtl/` 保存个人原始完成版。新测试确认原始除法器通过 **65,280 组非零除数输入组合**，并在原始 AXI 接口上复现读反压缺陷。上面的命令选择修复版；若要复现原版问题，执行 `python scripts/run_axi_tests.py --variant original`，会返回非零状态。可用 `--core-only` 单独运行算术测试。

修复是整理作品集时新增的后续工作，单独保存在 `follow-up/`。运行 `python scripts/run_axi_tests.py --variant read-response-fix` 可运行修复版，通过当前定向接口和算术测试。验证对象与未覆盖项见 [验证说明](projects/axi-lite-divider/VERIFICATION.md)。

测试与修复均新增于 2026 年 9 月，不计为原课程提交成果；历史 SoC 资源与时序报告对应原版。修复版没有新的 PPA 报告。

## 材料组织

- `projects/`：与简历对应的项目详情与证据。
- `scripts/`：可运行的回归与数值重算脚本。
- `rtl/`、`tb/`：独立基础 RTL 练习，保留原有 mux2 / mux4。
- [基础练习记录](notes/module_project_review.md)：模块学习、测试与波形复盘。
- [来源与验证状态](docs/PROVENANCE.md)：公开源码范围、课程框架边界、历史结果和本次复测的区别。

课程项目的架构背景与个人实现范围在各页说明。公开材料不包含课程参考答案、教学测试平台、EDA 安装包、PDK、个人联系方式或服务器配置。除 AXI 与原有基础练习外，其余条目以项目说明和结果摘要展示，不冒充完整开源实现。

## Basic RTL exercises

```sh
mkdir -p build
iverilog -g2012 -o build/mux2.vvp rtl/mux2.v tb/tb_mux2.v
vvp build/mux2.vvp
iverilog -g2012 -o build/mux4.vvp rtl/mux4.v tb/tb_mux4.v
vvp build/mux4.vvp
```

Windows PowerShell 可用 `New-Item -ItemType Directory -Force build` 创建输出目录。AXI 回归脚本会自动创建临时目录。
