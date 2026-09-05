# Verification & read-response bug fix

## 原始项目与后续回归

原始完成版保存在 `rtl/`；新增测试和 `follow-up/` 修复不计为原课程成果。2026 年 9 月使用 Icarus Verilog 14.0 development build 运行；测试代码随仓库公开，运行入口为 `scripts/run_axi_tests.py`。下表的接口通过项对应 `--variant read-response-fix`，算术测试使用未修改的真实除法器。

| 测试对象 | 方法 | 实际结果 |
| --- | --- | --- |
| 真实除法器 | 枚举 256 个被除数 × 255 个非零除数，与整数 `/` 和 `%` 比较 | 65,280 组通过 |
| DONE / ack | 每个算术用例额外保持 DONE 两拍，检查结果保持和 ack 退出 | 通过 |
| AXI 写通道 | AW 先到、W 先到、同时到达；延迟 BREADY | 三种顺序通过 |
| WSTRB | 操作数写入后再用全零 strobe 写不同值 | 原操作数保持，通过 |
| AXI 真实结果 | 用寄存器访问启动真实 divider，检查商/余数与 done/ack | 定向用例通过 |
| 读反压 | 读 done=0 后保持 RREADY=0 共 270 拍，改变 ARADDR，等待内部 done 变为 1 | 同一响应保持 0；下一次读取看到 1 |
| 复位 | 未消费 R 响应与仅收到 AW 的状态下复位，再启动运算 | 通过 |
| 除数为 0 | 观察 270 拍并复位恢复 | 观察到不完成；记录为未支持行为 |

结果与版本分别记录在 [public_regression.json](evidence/public_regression.json)。原版的读反压测试失败；修复版通过。枚举通过只针对本表所述算术域，不表示 AXI 所有事务组合、协议覆盖或形式证明完成。

## Bug → reproduction → fix → regression

**问题：**旧接口用当前 ARADDR 对内部商、余数、done 做组合选择。地址握手后，主设备可改变 ARADDR；内部计算也可能继续更新，而从设备尚未得到 RREADY。原实现因此不能保证该响应数据保持。

**复现：**将同一份公开接口测试指向原版 RTL，得到 `RDATA_STABILITY_FAIL cycle=0 held=0 actual=5`；进程以非零状态退出。旧版路径只用于本地对照，没有将课程目录或个人路径写入公开结果。

**修复：**在 AR 握手拍锁存地址所选数据，复位清零 RDATA，在后续等待拍不改写它；保持既有 RVALID/RREADY 控制。修复单独保存在 `follow-up/read-response-fix/`，本地课程工程和公开 `rtl/` 原版均保持原逻辑。

**回归：**新版本相同测试通过，并在内部 done 后续变化时仍保持原读响应。此测试同时验证“地址变化”和“被读状态变化”两类触发条件。

## 历史 SVA TB 的范围

[原接口 TB](tb/legacy_interface_sva_tb.sv)包含 6 条并发断言与 4 条立即断言，检查响应、请求条件、复位和控制状态。它内含简化运算模型，主要用于接口行为验证；本次新增测试使用真实 `divider.sv`。

原 SVA TB 需要支持相应 SVA 语法的仿真器，不能据 Icarus 的过程式测试通过宣称该 SVA TB 已重跑。原始 SVA TB 本次未重跑。

## 后续验证范围

- busy 时重发 start、运算中更改操作数和 ack 的完整行为定义。
- 更丰富的读写并发、WSTRB 组合、各阶段复位与错误地址策略。
- 约束随机、功能覆盖率模型及形式属性。
- 对公开修订版重新执行综合、实现和时序检查。

当前没有 UVM 环境，也未声明代码覆盖率或功能覆盖率 100%。
