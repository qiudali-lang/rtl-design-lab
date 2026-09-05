# Microarchitecture & memory hierarchy evaluation

**gem5 · Intel Pin · C++ / Python · simulated performance**

基于课程性能建模平台开展处理器配置、分支预测与存储层次比较。原报告为合作课程项目；这里展示个人参与的建模、配置评估与结果分析，不将 gem5 内核或公共配置框架归为个人实现。

## RISC-V 乱序配置探索

比较流水线宽度、执行单元、Cache 与访存队列在给定面积模型预算内的组合。原报告四项基准的模拟 MIPS 几何平均由约 1,690 提升至 2,229，约提升 31.9%。

这组结果是指定四项基准和面积模型下的配置比较，不是 RTL 综合面积、硅后性能或对任意程序的普遍加速。原报告可支持这一摘要；本次没有重跑四项基准，也不将其作为当前公开代码的性能测试。

## Intel Pin 分支预测

使用 C++ 对 Always Taken、2-bit Global、Bimodal、Correlated 预测器进行比较。简历/既有报告摘要记录：同一约 4725 万次条件分支测试中，Correlated 为 90.45%，Always Taken 为 44.81%。该项本次未重新执行，作为历史项目摘要；需要结合完整输入轨迹、预测器容量与训练条件才能复现。

## x86 matMul 存储层次

固定 x86 TimingSimpleCPU、1 GHz 与 matMul 工作负载，对比五种配置。本次从各自 `stats.txt` 重新提取 `simInsts` 与 `simSeconds`：

| 配置 | 模拟时间 / s | 按当前 stats 重算 MIPS |
| --- | ---: | ---: |
| 无 Cache，DDR3 | 1.398545 | 12.012 |
| L1 | 0.173418 | 96.875 |
| L1 + L2 | 0.107585 | 156.155 |
| L1 + L2 + L3 | 0.107739 | 155.932 |
| 无 Cache，LPDDR2 | 1.553722 | 10.813 |

所有配置的模拟指令数为 16,799,953。L1+L2 相对无 Cache DDR3 约加速 13 倍；本工作负载中加入 L3 没有提升性能。结果不能推导出“L3 一般无用”。

计算采用 `MIPS = simInsts / simSeconds / 1e6`，不是宿主机器运行仿真器的速度。`simSeconds` 为 stats 的已舍入字段，重算数值受其精度限制。当前文件重算约 156.16 MIPS，与简历原报告摘要的 156.14 略有差异；此页明确使用当前 stats 的口径。

[机器可读数据及源文件哈希](evidence/cache_results.json)；运行 `python scripts/recompute_metrics.py` 可复核这五组数据及其他公开数字。该脚本只重算已发表的测量摘要，不运行 gem5，也不代表重现了全部原始实验。

## 从数据到设计判断

```mermaid
flowchart LR
    W[Fixed workload] --> C[Controlled configurations]
    C --> S[simInsts and simSeconds]
    S --> M[Comparable MIPS]
    M --> B[Bottleneck and budget analysis]
```

分析时分别记录输入、配置、计量对象与基线，避免将单项最佳结果拼接为不存在的统一配置。
