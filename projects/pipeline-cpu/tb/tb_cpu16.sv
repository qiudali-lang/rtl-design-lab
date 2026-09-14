`timescale 1ns/1ps

module tb_cpu16;
    logic clk = 0;
    logic rst_n = 0;
    logic halted;
    integer cycles = 0;
    integer i;

    always #5 clk = ~clk;
    cpu16 dut (.*);

    initial begin
        for (i = 0; i < 256; i = i + 1)
            dut.imem[i] = 16'h0000;
        dut.imem[0]  = 16'h7105; // MOVI R1, 5
        dut.imem[1]  = 16'h7203; // MOVI R2, 3
        dut.imem[2]  = 16'h1312; // ADD  R3, R1, R2
        dut.imem[3]  = 16'h2432; // SUB  R4, R3, R2
        dut.imem[4]  = 16'hB402; // ST   R4, [R0+2]
        dut.imem[5]  = 16'hA502; // LD   R5, [R0+2]
        dut.imem[6]  = 16'h1651; // ADD  R6, R5, R1 (load-use)
        dut.imem[7]  = 16'hC001; // BEQZ R0, +1
        dut.imem[8]  = 16'h77EE; // MOVI R7, EE (must be flushed)
        dut.imem[9]  = 16'h6761; // ADDI R7, R6, 1
        dut.imem[10] = 16'hF000; // HALT
        repeat (3) @(posedge clk);
        rst_n = 1;
        wait (halted);
        @(posedge clk);
        if (dut.regs[1] !== 16'd5)  $fatal(1, "R1 mismatch");
        if (dut.regs[2] !== 16'd3)  $fatal(1, "R2 mismatch");
        if (dut.regs[3] !== 16'd8)  $fatal(1, "R3 mismatch");
        if (dut.regs[4] !== 16'd5)  $fatal(1, "R4 mismatch");
        if (dut.dmem[2] !== 16'd5)  $fatal(1, "memory mismatch");
        if (dut.regs[5] !== 16'd5)  $fatal(1, "R5 mismatch");
        if (dut.regs[6] !== 16'd10) $fatal(1, "R6 mismatch");
        if (dut.regs[7] !== 16'd11) $fatal(1, "R7/branch mismatch value=%h", dut.regs[7]);
        $display("PASS cpu16 cycles=%0d R7=%0d", cycles, dut.regs[7]);
        $finish;
    end

    always @(posedge clk) begin
        if (rst_n && !halted)
            cycles <= cycles + 1;
        if (cycles > 100)
            $fatal(1, "timeout");
    end
endmodule

