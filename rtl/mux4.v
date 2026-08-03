`timescale 1ns/1ps
`default_nettype none

module mux4 (
    input  wire a,
    input  wire b,
    input  wire c,
    input  wire d,
    input  wire [1:0] sel,
    output reg y
);
    always @(*) begin
        case (sel)
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            default: y = d;
        endcase
    end

endmodule

`default_nettype wire
