# 当前题：K01 / BASE-06

日期：2026-11-01（America/Los_Angeles）。Phase1第一题，先独立回答，不提供答案。下面A、B是两个独立例子。

假设时钟上升沿前 `a=0、b=0、din=1`，三个信号均为1bit，`din`在该边沿附近稳定。

**A**
```systemverilog
always @(posedge clk) begin
    a <= din;
    b <= a;
end
```

**B**
```systemverilog
always @(posedge clk) begin
    a = din;
    b = a;
end
```

这个上升沿的所有赋值更新完成后，A和B中的 `a、b` 分别是多少？请解释判断依据。

状态：题面已准备，随下一条助手消息展示；等待本人独立回答。没有答题记录、提示或评分，BASE-06仍为UNASSESSED。不是独立RTL设计提交，未进行新仿真。
