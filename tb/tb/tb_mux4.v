`timescale 1ns/1ps
`default_nettype none

module tb_mux4;

    reg a;
    reg b;
    reg c;
    reg d;
    reg [1:0] sel;
    wire y;

    mux4 dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("sim/mux4/mux4.vcd");
        $dumpvars(0, tb_mux4);

        // Positive cases: selected input is 1, so y should be 1.
        a = 1'b1;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
        sel = 2'b00;
        #10;

        if (y !== 1'b1) begin
            $display("FAIL: sel=00, expected y=a=1, got y=%b", y);
            $finish;
        end
        a = 1'b0;
        b = 1'b1;
        c = 1'b0;
        d = 1'b0;
        sel = 2'b01;
        #10;

        if (y !== 1'b1) begin
            $display("FAIL: sel=01, expected y=b=1, got y=%b", y);
            $finish;
        end
        a = 1'b0;
        b = 1'b0;
        c = 1'b1;
        d = 1'b0;
        sel = 2'b10;
        #10;

        if (y !== 1'b1) begin
            $display("FAIL: sel=10, expected y=c=1, got y=%b", y);
            $finish;
        end
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        d = 1'b1;
        sel = 2'b11;
        #10;

        if (y !== 1'b1) begin
            $display("FAIL: sel=11, expected y=d=1, got y=%b", y);
            $finish;
        end

        // Negative cases: selected input is 0, even if other inputs are 1.
        a = 1'b0;
        b = 1'b1;
        c = 1'b1;
        d = 1'b1;
        sel = 2'b00;
        #10;

        if (y !== 1'b0) begin
            $display("FAIL: sel=00, expected y=a=0, got y=%b", y);
            $finish;
        end
        a = 1'b1;
        b = 1'b0;
        c = 1'b1;
        d = 1'b1;
        sel = 2'b01;
        #10;

        if (y !== 1'b0) begin
            $display("FAIL: sel=01, expected y=b=0, got y=%b", y);
            $finish;
        end
        a = 1'b1;
        b = 1'b1;
        c = 1'b0;
        d = 1'b1;
        sel = 2'b10;
        #10;

        if (y !== 1'b0) begin
            $display("FAIL: sel=10, expected y=c=0, got y=%b", y);
            $finish;
        end
        a = 1'b1;
        b = 1'b1;
        c = 1'b1;
        d = 1'b0;
        sel = 2'b11;
        #10;

        if (y !== 1'b0) begin
            $display("FAIL: sel=11, expected y=d=0, got y=%b", y);
            $finish;
        end
        $display("PASS");
        $finish;
    end

endmodule

`default_nettype wire
