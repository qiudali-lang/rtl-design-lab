`timescale 1ns/1ps
// Directed public regression, procedural checks for Icarus portability.
module tb_axi_public;
  reg s_axi_clk=0, s_axi_resetn=0;
  reg [3:0] s_axi_araddr=0, s_axi_awaddr=0;
  reg [2:0] s_axi_arprot=0, s_axi_awprot=0;
  reg s_axi_arvalid=0, s_axi_awvalid=0, s_axi_wvalid=0;
  reg s_axi_rready=0, s_axi_bready=0;
  reg [31:0] s_axi_wdata=0;
  reg [3:0] s_axi_wstrb=0;
  wire s_axi_arready,s_axi_awready,s_axi_wready,s_axi_rvalid,s_axi_bvalid;
  wire [31:0] s_axi_rdata;
  wire [1:0] s_axi_rresp,s_axi_bresp;
  integer mode,k,polls;
  reg [31:0] rd, held;
  always #5 s_axi_clk=~s_axi_clk;
  div_axi_if dut(.*);

  task automatic aw(input [3:0] addr);
    begin
      @(negedge s_axi_clk); s_axi_awaddr=addr; s_axi_awvalid=1;
      @(posedge s_axi_clk); while(!s_axi_awready) @(posedge s_axi_clk);
      @(negedge s_axi_clk); s_axi_awvalid=0;
    end
  endtask
  task automatic wd(input [31:0] data,input [3:0] strobe);
    begin
      @(negedge s_axi_clk); s_axi_wdata=data; s_axi_wstrb=strobe; s_axi_wvalid=1;
      @(posedge s_axi_clk); while(!s_axi_wready) @(posedge s_axi_clk);
      @(negedge s_axi_clk); s_axi_wvalid=0;
    end
  endtask
  task automatic wr(input [3:0] addr,input [31:0] data,input [3:0] strobe,input integer order);
    begin
      if(order==0) begin aw(addr); repeat(2) @(negedge s_axi_clk); wd(data,strobe); end
      else if(order==1) begin wd(data,strobe); repeat(2) @(negedge s_axi_clk); aw(addr); end
      else begin fork aw(addr); wd(data,strobe); join end
      wait(s_axi_bvalid);
      repeat(3) begin
        @(negedge s_axi_clk);
        if(!s_axi_bvalid || s_axi_bresp!==0) $fatal(1,"BRESP_HOLD_FAIL");
        if(s_axi_awready || s_axi_wready) $fatal(1,"OUTSTANDING_WRITE_GATE_FAIL");
      end
      s_axi_bready=1;
      @(negedge s_axi_clk); s_axi_bready=0;
      if(s_axi_bvalid) $fatal(1,"BRESP_RETIRE_FAIL");
    end
  endtask
  task automatic rr(input [3:0] addr,output [31:0] data);
    begin
      @(negedge s_axi_clk); s_axi_araddr=addr; s_axi_arvalid=1;
      @(posedge s_axi_clk); while(!s_axi_arready) @(posedge s_axi_clk);
      @(negedge s_axi_clk); s_axi_arvalid=0;
      if(!s_axi_rvalid || s_axi_rresp!==0) $fatal(1,"RRESP_FAIL");
      data=s_axi_rdata;
      s_axi_rready=1;
      @(negedge s_axi_clk); s_axi_rready=0;
      if(s_axi_rvalid) $fatal(1,"RRESP_RETIRE_FAIL");
    end
  endtask

  initial begin
    if($test$plusargs("vcd")) begin $dumpfile("axi_public.vcd"); $dumpvars(0,tb_axi_public); end
    repeat(3) @(negedge s_axi_clk); s_axi_resetn=1;
    if(s_axi_rvalid || s_axi_bvalid) $fatal(1,"RESET_RESPONSE_FAIL");
    for(mode=0;mode<3;mode=mode+1) begin
      wr(0,23+mode,1,mode);
      wr(4,5,1,mode);
      wr(0,99,0,mode); // zero byte strobe must preserve X
      wr(8,1,1,mode);
      polls=0; rd=0;
      while(rd==0 && polls<270) begin rr(8,rd); polls=polls+1; end
      if(rd!==1) $fatal(1,"COMPLETION_TIMEOUT");
      rr(0,rd); if(rd !== ((23+mode)/5)) $fatal(1,"QUOTIENT_FAIL");
      rr(4,rd); if(rd !== ((23+mode)%5)) $fatal(1,"REMAINDER_FAIL");
      wr(12,1,1,mode);
      rr(8,rd); if(rd!==0) $fatal(1,"ACK_STATUS_FAIL");
    end
    // Hold a read of done=0 while the core progresses to done=1.
    wr(0,255,1,2); wr(4,1,1,2); wr(8,1,1,2);
    @(negedge s_axi_clk); s_axi_araddr=8; s_axi_arvalid=1;
    @(posedge s_axi_clk); while(!s_axi_arready) @(posedge s_axi_clk);
    @(negedge s_axi_clk); s_axi_arvalid=0; held=s_axi_rdata;
    if(held!==0) $fatal(1,"READ_SNAPSHOT_SETUP_FAIL");
    for(k=0;k<270;k=k+1) begin
      s_axi_araddr=(k%2==0)?0:8;
      @(negedge s_axi_clk);
      if(!s_axi_rvalid || s_axi_rdata!==held || s_axi_rresp!==0)
        $fatal(1,"RDATA_STABILITY_FAIL cycle=%0d held=%0d actual=%0d",k,held,s_axi_rdata);
      if(s_axi_arready) $fatal(1,"OUTSTANDING_READ_GATE_FAIL");
    end
    s_axi_rready=1;
    @(negedge s_axi_clk); s_axi_rready=0;
    rr(8,rd); if(rd!==1) $fatal(1,"NEW_READ_NOT_UPDATED");
    rr(0,rd); if(rd!==255) $fatal(1,"MAX_QUOTIENT_FAIL");
    rr(4,rd); if(rd!==0) $fatal(1,"MAX_REMAINDER_FAIL");
    rr(12,rd); if(rd!==0) $fatal(1,"DEFAULT_READ_FAIL");
    // Abort outstanding R and unpaired AW with reset.
    @(negedge s_axi_clk); s_axi_araddr=8; s_axi_arvalid=1;
    @(negedge s_axi_clk); s_axi_arvalid=0;
    aw(0);
    s_axi_resetn=0;
    repeat(2) @(negedge s_axi_clk);
    if(s_axi_rvalid || s_axi_bvalid || !s_axi_awready || !s_axi_wready) $fatal(1,"RESET_PENDING_FAIL");
    s_axi_resetn=1;
    wr(0,9,1,2); wr(4,2,1,2); wr(8,1,1,2);
    polls=0; rd=0;
    while(rd==0 && polls<270) begin rr(8,rd); polls=polls+1; end
    if(rd!==1) $fatal(1,"POST_RESET_TIMEOUT");
    rr(0,rd); if(rd!==4) $fatal(1,"POST_RESET_QUOTIENT_FAIL");
    rr(4,rd); if(rd!==1) $fatal(1,"POST_RESET_REMAINDER_FAIL");
    $display("PASS AXI orders=3 write_backpressure=pass read_snapshot=pass arithmetic=pass wstrb=pass reset=pass");
    $finish;
  end
  initial begin #1000000; $fatal(1,"GLOBAL_TIMEOUT"); end
endmodule
