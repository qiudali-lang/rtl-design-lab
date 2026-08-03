`default_nettype none

module mux2 (
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire y
);
assign y = sel ? b : a;

endmodule

`default_nettype wire
