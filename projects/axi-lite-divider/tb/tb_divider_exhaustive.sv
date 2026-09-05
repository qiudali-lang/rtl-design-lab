`timescale 1ns/1ps
// Portfolio regression added September 2026; real divider, not the legacy stub.
module tb_divider_exhaustive;
  reg clk=0, rstn=0, start=0, ack=0;
  reg [7:0] x_in=0, y_in=1;
  wire [7:0] quo, rem;
  wire done;
  integer x,y,n,cycles;
  always #5 clk=~clk;
  div dut(.*);
  initial begin
    repeat(3) @(negedge clk);
    rstn=1;
    n=0;
    for(x=0;x<256;x=x+1) begin
      for(y=1;y<256;y=y+1) begin
        @(negedge clk); x_in=x; y_in=y;
        @(negedge clk); start=1;
        @(negedge clk); start=0;
        cycles=0;
        while(!done && cycles<260) begin @(negedge clk); cycles=cycles+1; end
        if(!done || quo !== (x/y) || rem !== (x%y))
          $fatal(1,"DIV_FAIL x=%0d y=%0d q=%0d r=%0d",x,y,quo,rem);
        repeat(2) begin
          @(negedge clk);
          if(!done || quo !== (x/y) || rem !== (x%y)) $fatal(1,"DONE_HOLD_FAIL");
        end
        ack=1;
        @(negedge clk); ack=0;
        if(done) $fatal(1,"ACK_FAIL");
        n=n+1;
      end
    end
    // Document existing zero-divisor behavior without declaring it supported.
    @(negedge clk); x_in=7; y_in=0;
    @(negedge clk); start=1;
    @(negedge clk); start=0;
    repeat(270) @(negedge clk);
    if(done) $fatal(1,"ZERO_DIVISOR_BEHAVIOR_CHANGED_REVIEW_SPEC");
    rstn=0;
    repeat(2) @(negedge clk);
    if(done) $fatal(1,"RESET_FAIL");
    $display("PASS arithmetic_pairs=%0d zero_divisor=nonterminating_observed reset=pass",n);
    $finish;
  end
  initial begin #20000000; $fatal(1,"GLOBAL_TIMEOUT"); end
endmodule
