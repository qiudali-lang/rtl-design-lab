`timescale 1ns/1ps
`default_nettype none

module tb_mux2;

    reg a;
    reg b;
    reg sel;
    wire y;

    mux2 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        a   = 1'b1;
        b   = 1'b0;
        sel = 1'b0;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: a=%b b=%b sel=%b y=%b, expected 1", a, b, sel, y);
            $finish;
        end
        a   = 1'b1;
        b   = 1'b0;
        sel = 1'b1;
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: a=%b b=%b sel=%b y=%b, expected 0", a, b, sel, y);
            $finish;
        end
        a   = 1'b0;
        b   = 1'b1;
        sel = 1'b0;
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: a=%b b=%b sel=%b y=%b, expected 0", a, b, sel, y);
            $finish;
        end
        a   = 1'b0;
        b   = 1'b1;
        sel = 1'b1;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: a=%b b=%b sel=%b y=%b, expected 1", a, b, sel, y);
            $finish;
        end
        a   = 1'b0;
        b   = 1'b0;
        sel = 1'b0;
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: a=%b b=%b sel=%b y=%b, expected 0", a, b, sel, y);
            $finish;
        end
        a   = 1'b0;
        b   = 1'b0;
        sel = 1'b1;
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: a=%b b=%b sel=%b y=%b, expected 0", a, b, sel, y);
            $finish;
        end
        a   = 1'b1;
        b   = 1'b1;
        sel = 1'b0;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: a=%b b=%b sel=%b y=%b, expected 1", a, b, sel, y);
            $finish;
        end
        a   = 1'b1;
        b   = 1'b1;
        sel = 1'b1;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: a=%b b=%b sel=%b y=%b, expected 1", a, b, sel, y);
            $finish;
        end
        $display("PASS: mux2 all tests passed");
        $finish;
    end
        
endmodule

`default_nettype wire
