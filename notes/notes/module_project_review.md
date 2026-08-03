# Module And Project Review Notes

This document collects review notes after each completed module or project. Use it for spaced review, interview preparation, and tracking common RTL mistakes.

## mux2: 2-to-1 Multiplexer

Date: 2026-07-09

### Hardware Principle

`mux2` is a 2-to-1 combinational multiplexer. It selects one of two input signals according to a select signal.

Behavior:

```text
sel = 0 -> y = a
sel = 1 -> y = b
```

Truth table:

```text
a b sel | y
--------+---
0 0  0  | 0
0 0  1  | 0
0 1  0  | 0
0 1  1  | 1
1 0  0  | 1
1 0  1  | 0
1 1  0  | 1
1 1  1  | 1
```

### Interface

Current 1-bit version:

```verilog
module mux2 (
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire y
);
```

### RTL Implementation Points

Use continuous assignment because `mux2` is pure combinational logic:

```verilog
assign y = sel ? b : a;
```

Meaning of ternary operator:

```text
condition ? value_when_true : value_when_false
```

So:

```text
sel ? b : a
```

means:

```text
if sel is 1, choose b; otherwise choose a.
```

### Coding-Style Notes

- This module is combinational, so no clock or reset is needed.
- `assign` is appropriate for simple combinational wiring.
- `output wire y` matches continuous assignment style.
- ``default_nettype none`` helps catch signal-name typos by preventing implicit wires.
- Keep spacing readable: `assign y = sel ? b : a;`.

### Verification Plan

Because `a`, `b`, and `sel` are all 1-bit signals, exhaustive testing is easy.

Required tests:

```text
all 8 combinations of a, b, sel
```

Self-checking strategy:

1. Drive `a`, `b`, and `sel`.
2. Wait `#10`.
3. Check `y` with `!==`.
4. Print `FAIL` and stop immediately if mismatch occurs.
5. Print `PASS` only after all cases pass.

Why use `!==` instead of `!=`:

- `!==` catches `X` and `Z` mismatches.
- This is better for RTL simulation because unknown values often reveal real bugs.

### Waveform Inspection Points

Signals to observe:

```text
a
b
sel
y
```

Debug rule:

```text
sel = 0 -> y follows a
sel = 1 -> y follows b
```

For the finished testbench, simulation reaches `80 ns` because there are 8 test cases and each waits `#10`.

### Common Mistakes

Mistake 1:

```verilog
assign if (sel)
    y = b;
else
    y = a;
```

Why wrong:

- `assign` must assign an expression.
- `if/else` is a procedural statement and must be inside an `always @(*)` block.

Correct continuous-assignment style:

```verilog
assign y = sel ? b : a;
```

Alternative procedural style:

```verilog
always @(*) begin
    if (sel)
        y = b;
    else
        y = a;
end
```

If using procedural style, `y` must be declared as `reg` in Verilog.

Mistake 2:

- Putting stimulus after `$finish`.

Why wrong:

- `$finish` ends the simulation immediately.
- Any test case written after `$finish` will never run.

Correct structure:

```verilog
initial begin
    // case 1
    // case 2
    // ...
    $display("PASS");
    $finish;
end
```

### Interview Questions And Answers

Question: What is a 2-to-1 mux?

Strong answer:

```text
A 2-to-1 mux is combinational logic that selects one of two inputs based on a select signal. When sel is 0, the output follows input a; when sel is 1, the output follows input b.
```

Question: How would you implement mux2 in Verilog?

Strong answer:

```text
For a simple combinational mux, I would use a continuous assignment with the ternary operator: assign y = sel ? b : a. This directly maps to combinational selection logic.
```

Question: Is a mux combinational or sequential logic?

Strong answer:

```text
A mux is combinational logic. Its output depends only on the current values of its inputs and select signal, not on clock edges or stored state.
```

Question: How do you verify a 1-bit mux2?

Strong answer:

```text
Since all inputs are 1-bit, I can exhaustively test all 8 combinations of a, b, and sel. The testbench should be self-checking and compare y against the expected selected input.
```

Question: What should you check in the waveform?

Strong answer:

```text
I would check that y follows a whenever sel is 0 and follows b whenever sel is 1. I would also confirm that the testbench actually covers all input combinations.
```

### Follow-Up Exercise

Convert `mux2` into a parameterized N-bit mux:

```text
parameter WIDTH = 8
input  wire [WIDTH-1:0] a
input  wire [WIDTH-1:0] b
output wire [WIDTH-1:0] y
```

Then update the testbench to test multi-bit values such as `8'hA5`, `8'h3C`, `8'h00`, and `8'hFF`.

## mux4 Review

Date: 2026-08-03

Status: completed.

Artifacts:

- RTL: `rtl/mux4.v`
- Testbench: `tb/tb_mux4.v`
- Simulation output: `sim/mux4/tb_mux4.vvp`
- Waveform: `sim/mux4/mux4.vcd`

### Hardware Principle

A 4-to-1 mux is combinational selection logic. It has four data inputs and one 2-bit select input.

Behavior:

```text
sel = 2'b00 -> y = a
sel = 2'b01 -> y = b
sel = 2'b10 -> y = c
sel = 2'b11 -> y = d
```

The output does not store state. It changes whenever the selected input or `sel` changes.

### Interface And Behavior

Interface:

```verilog
input  wire a
input  wire b
input  wire c
input  wire d
input  wire [1:0] sel
output reg y
```

Because this implementation uses an `always @(*)` procedural block, `y` is declared as `reg` in Verilog. This does not mean hardware storage is inferred. In Verilog, `reg` means the signal can be assigned inside a procedural block.

### RTL Implementation Points

Implementation style:

```verilog
always @(*) begin
    case (sel)
        2'b00: y = a;
        2'b01: y = b;
        2'b10: y = c;
        default: y = d;
    endcase
end
```

Key points:

- `always @(*)` describes combinational logic.
- Blocking assignment `=` is correct for combinational logic.
- `case` maps naturally to multi-way mux selection.
- `default` covers `sel = 2'b11` and avoids an incomplete assignment path.
- No clock or reset is needed because this is not sequential logic.

### Synthesizability And Coding Style Notes

This module is synthesizable.

Style notes:

- Use `always @(*)` for Verilog-2001 combinational logic.
- Use blocking assignment in the combinational block.
- Keep `case` items aligned for readability.
- Include ``default_nettype none`` to catch accidental implicit nets.
- Add ``timescale 1ns/1ps`` consistently in RTL and TB to avoid simulator timing warnings.

Important nuance:

```text
output reg y
```

does not automatically imply a flip-flop. A latch or flip-flop is inferred from incomplete combinational assignment or edge-triggered logic, not from the word `reg` alone.

### Verification Plan

The testbench uses directed self-checking cases.

Positive cases:

```text
selected input = 1 -> y should be 1
```

Negative cases:

```text
selected input = 0, non-selected inputs = 1 -> y should be 0
```

This matters because a weak testbench that only checks selected input equals 1 could accidentally pass a wrong OR-like implementation:

```verilog
y = a | b | c | d;
```

The negative cases prove that the mux is actually selecting one input, not just combining inputs.

Simulation command:

```powershell
$env:PATH = 'D:\Tools\oss-cad-suite\bin;D:\Tools\oss-cad-suite\lib;' + $env:PATH
iverilog -Wall -o sim\mux4\tb_mux4.vvp rtl\mux4.v tb\tb_mux4.v
vvp sim\mux4\tb_mux4.vvp
```

Observed result:

```text
PASS
$finish called at 80000 (1ps)
```

The total simulation time is 80 ns because there are 8 cases and each waits `#10`.

### Waveform Inspection Points

Waveform file:

```text
sim/mux4/mux4.vcd
```

Open with GTKWave:

```powershell
gtkwave sim\mux4\mux4.vcd
```

Signals to inspect:

```text
a
b
c
d
sel[1:0]
y
```

Expected timing:

```text
0-10ns    sel=00, y=a=1
10-20ns   sel=01, y=b=1
20-30ns   sel=10, y=c=1
30-40ns   sel=11, y=d=1
40-50ns   sel=00, y=a=0
50-60ns   sel=01, y=b=0
60-70ns   sel=10, y=c=0
70-80ns   sel=11, y=d=0
```

Debug rule:

```text
For each 10 ns window, find sel first, then check whether y equals the selected input.
```

### Common Mistakes

Mistake 1: Only testing selected input equals 1.

Why it is weak:

- It cannot distinguish a real mux from an OR gate in some test patterns.

Better:

- Add negative cases where the selected input is 0 while non-selected inputs are 1.

Mistake 2: Thinking `output reg y` means a register is synthesized.

Correct understanding:

- In Verilog, `reg` is a procedural assignment type.
- Hardware storage depends on the always block style and assignment coverage.

Mistake 3: Incomplete `case` assignment.

Example risk:

```verilog
case (sel)
    2'b00: y = a;
    2'b01: y = b;
    2'b10: y = c;
endcase
```

If `sel = 2'b11`, `y` is not assigned, so a latch may be inferred.

### Interview Questions And Answers

Question: What is a 4-to-1 mux?

Strong answer:

```text
A 4-to-1 mux is combinational logic that selects one of four inputs based on a 2-bit select signal. For sel 00, 01, 10, and 11, the output follows a, b, c, and d respectively.
```

Question: Why did you use `case` instead of nested `if`?

Strong answer:

```text
Both can describe the same combinational logic, but `case` is clearer for multi-way selection based on an encoded select signal. It directly expresses that each select value maps to one input.
```

Question: Why is `y` declared as `reg`?

Strong answer:

```text
Because this is Verilog procedural assignment inside an always block. `reg` here does not mean a flip-flop. Since the always block is `always @(*)` and every path assigns y, the synthesized hardware is combinational mux logic.
```

Question: How did you verify the mux4?

Strong answer:

```text
I wrote a self-checking directed testbench. It covers all four select values with positive cases where the selected input is 1, and negative cases where the selected input is 0 while other inputs are 1. This ensures the design is actually selecting the correct input rather than accidentally implementing OR-like logic.
```

Question: What do you check in the waveform?

Strong answer:

```text
I check the waveform in 10 ns windows. In each window, I first read sel, then verify that y equals the selected input. For example, when sel is 2'b10, y should follow c regardless of a, b, and d.
```

### Follow-Up Exercises

1. Rewrite `mux4` using continuous assignment with nested ternary operators.
2. Create a parameterized N-bit `mux4`.
3. Create `mux4` by instantiating three `mux2` modules.
4. Add a small task in the testbench to reduce repeated stimulus/check code.
