`timescale 1ns/1ps

module div_axi_if_tb;
  logic        s_axi_clk;
  logic        s_axi_resetn;
  logic [3:0]  s_axi_araddr;
  logic [2:0]  s_axi_arprot;
  logic        s_axi_arvalid;
  logic        s_axi_arready;
  logic [3:0]  s_axi_awaddr;
  logic [2:0]  s_axi_awprot;
  logic        s_axi_awvalid;
  logic        s_axi_awready;
  logic [31:0] s_axi_wdata;
  logic [3:0]  s_axi_wstrb;
  logic        s_axi_wvalid;
  logic        s_axi_wready;
  logic [31:0] s_axi_rdata;
  logic [1:0]  s_axi_rresp;
  logic        s_axi_rvalid;
  logic        s_axi_rready;
  logic [1:0]  s_axi_bresp;
  logic        s_axi_bvalid;
  logic        s_axi_bready;

  div_axi_if dut (
    .s_axi_clk(s_axi_clk),
    .s_axi_resetn(s_axi_resetn),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arprot(s_axi_arprot),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready)
  );

  logic seen_aw;
  logic seen_w;
  logic seen_ar;

  // File Logging Variables
  int file_handle;
  bit test_failed = 1'b0;

  initial begin
    s_axi_clk = 1'b0;
    forever #5 s_axi_clk = ~s_axi_clk;
  end

  always_ff @(posedge s_axi_clk) begin
    if (!s_axi_resetn) begin
      seen_aw <= 1'b0;
      seen_w  <= 1'b0;
      seen_ar <= 1'b0;
    end else begin
      if (s_axi_awvalid && s_axi_awready) seen_aw <= 1'b1;
      if (s_axi_wvalid && s_axi_wready) seen_w <= 1'b1;
      if (s_axi_arvalid && s_axi_arready) seen_ar <= 1'b1;
      if (s_axi_bvalid && s_axi_bready) begin
        seen_aw <= 1'b0;
        seen_w  <= 1'b0;
      end
      if (s_axi_rvalid && s_axi_rready) seen_ar <= 1'b0;
    end
  end

  // Helper macro/function to log failures cleanly from any assertion
  task automatic log_failure(input string msg);
    test_failed = 1'b1;
    if (file_handle) begin
      $fdisplay(file_handle, "Error: %s at time %0t", msg, $time);
    end
    $error(msg); // Optional: Keeps simulation console logs informative
  endtask

  property p_resp_okay;
    @(posedge s_axi_clk) disable iff (!s_axi_resetn)
      (s_axi_bvalid |-> (s_axi_bresp == 2'b00)) and
      (s_axi_rvalid |-> (s_axi_rresp == 2'b00));
  endproperty
  assert property (p_resp_okay) else log_failure("p_resp_okay failed");

  property p_bvalid_requires_aw_w;
    @(posedge s_axi_clk) disable iff (!s_axi_resetn)
      $rose(s_axi_bvalid) |-> (seen_aw && seen_w);
  endproperty
  assert property (p_bvalid_requires_aw_w) else log_failure("p_bvalid_requires_aw_w failed");

  property p_bvalid_holds_until_bready;
    @(posedge s_axi_clk) disable iff (!s_axi_resetn)
      (s_axi_bvalid && !s_axi_bready) |=> s_axi_bvalid;
  endproperty
  assert property (p_bvalid_holds_until_bready) else log_failure("p_bvalid_holds_until_bready failed");

  property p_rvalid_requires_ar;
    @(posedge s_axi_clk) disable iff (!s_axi_resetn)
      $rose(s_axi_rvalid) |-> seen_ar;
  endproperty
  assert property (p_rvalid_requires_ar) else log_failure("p_rvalid_requires_ar failed");

  property p_rvalid_holds_until_rready;
    @(posedge s_axi_clk) disable iff (!s_axi_resetn)
      (s_axi_rvalid && !s_axi_rready) |=> s_axi_rvalid;
  endproperty
  assert property (p_rvalid_holds_until_rready) else log_failure("p_rvalid_holds_until_rready failed");

  property p_no_new_ar_while_rvalid;
    @(posedge s_axi_clk) disable iff (!s_axi_resetn)
      s_axi_rvalid |-> !s_axi_arready;
  endproperty
  assert property (p_no_new_ar_while_rvalid) else log_failure("p_no_new_ar_while_rvalid failed");

  task automatic drive_reset;
    begin
      s_axi_resetn = 1'b0;
      s_axi_araddr = '0;
      s_axi_arprot = '0;
      s_axi_arvalid = 1'b0;
      s_axi_awaddr = '0;
      s_axi_awprot = '0;
      s_axi_awvalid = 1'b0;
      s_axi_wdata = '0;
      s_axi_wstrb = '0;
      s_axi_wvalid = 1'b0;
      s_axi_rready = 1'b0;
      s_axi_bready = 1'b0;
      repeat (4) @(posedge s_axi_clk);
      s_axi_resetn = 1'b1;
      @(posedge s_axi_clk);
    end
  endtask

  task automatic axi_write(
    input logic [3:0] addr,
    input logic [31:0] data,
    input logic [3:0] strb,
    input bit aw_first
  );
    begin
      if (aw_first) begin
        s_axi_awaddr = addr;
        s_axi_awvalid = 1'b1;
        while (!(s_axi_awvalid && s_axi_awready)) @(posedge s_axi_clk);
        @(posedge s_axi_clk);
        s_axi_awvalid = 1'b0;

        s_axi_wdata = data;
        s_axi_wstrb = strb;
        s_axi_wvalid = 1'b1;
        while (!(s_axi_wvalid && s_axi_wready)) @(posedge s_axi_clk);
        @(posedge s_axi_clk);
        s_axi_wvalid = 1'b0;
      end else begin
        s_axi_wdata = data;
        s_axi_wstrb = strb;
        s_axi_wvalid = 1'b1;
        while (!(s_axi_wvalid && s_axi_wready)) @(posedge s_axi_clk);
        @(posedge s_axi_clk);
        s_axi_wvalid = 1'b0;

        s_axi_awaddr = addr;
        s_axi_awvalid = 1'b1;
        while (!(s_axi_awvalid && s_axi_awready)) @(posedge s_axi_clk);
        @(posedge s_axi_clk);
        s_axi_awvalid = 1'b0;
      end

      while (!s_axi_bvalid) @(posedge s_axi_clk);
      s_axi_bready = 1'b1;
      @(posedge s_axi_clk);
      s_axi_bready = 1'b0;
    end
  endtask

  task automatic axi_read(
    input logic [3:0] addr,
    output logic [31:0] data
  );
    begin
      s_axi_araddr = addr;
      s_axi_arvalid = 1'b1;
      while (!(s_axi_arvalid && s_axi_arready)) @(posedge s_axi_clk);
      @(posedge s_axi_clk);
      s_axi_arvalid = 1'b0;

      while (!s_axi_rvalid) @(posedge s_axi_clk);
      data = s_axi_rdata;
      s_axi_rready = 1'b1;
      @(posedge s_axi_clk);
      s_axi_rready = 1'b0;
    end
  endtask

  task automatic read_with_backpressure(input logic [3:0] addr);
    begin
      s_axi_araddr = addr;
      s_axi_arvalid = 1'b1;
      while (!(s_axi_arvalid && s_axi_arready)) @(posedge s_axi_clk);
      @(posedge s_axi_clk);
      s_axi_arvalid = 1'b0;

      while (!s_axi_rvalid) @(posedge s_axi_clk);
      repeat (3) begin
        s_axi_rready = 1'b0;
        @(posedge s_axi_clk);
      end
      s_axi_rready = 1'b1;
      @(posedge s_axi_clk);
      s_axi_rready = 1'b0;
    end
  endtask

  task automatic write_with_b_backpressure(input logic [3:0] addr, input logic [31:0] data);
    begin
      s_axi_awaddr = addr;
      s_axi_awvalid = 1'b1;
      while (!(s_axi_awvalid && s_axi_awready)) @(posedge s_axi_clk);
      @(posedge s_axi_clk);
      s_axi_awvalid = 1'b0;

      s_axi_wdata = data;
      s_axi_wstrb = 4'b0001;
      s_axi_wvalid = 1'b1;
      while (!(s_axi_wvalid && s_axi_wready)) @(posedge s_axi_clk);
      @(posedge s_axi_clk);
      s_axi_wvalid = 1'b0;

      while (!s_axi_bvalid) @(posedge s_axi_clk);
      repeat (3) begin
        s_axi_bready = 1'b0;
        @(posedge s_axi_clk);
      end
      s_axi_bready = 1'b1;
      @(posedge s_axi_clk);
      s_axi_bready = 1'b0;
    end
  endtask

  logic [31:0] rd;
  int i;
  initial begin
    // Open results file for writing
    file_handle = $fopen("axi-div-results.txt", "w");
    if (!file_handle) begin
      $display("FATAL: Could not open axi-div-results.txt for writing.");
      $finish;
    end

    drive_reset();

    assert (s_axi_awready == 1'b1 && s_axi_wready == 1'b1 && s_axi_bvalid == 1'b0)
      else log_failure("Write-channel reset state is invalid");

    assert (s_axi_arready == 1'b1 && s_axi_rvalid == 1'b0)
      else log_failure("Read-channel reset state is invalid");

    axi_write(4'h0, 32'h0000_0024, 4'b0001, 1'b1);
    axi_write(4'h4, 32'h0000_0005, 4'b0001, 1'b0);
    axi_write(4'h8, 32'h0000_0001, 4'b0001, 1'b1);

    rd = 32'h0;
    for (i = 0; i < 20; i++) begin
      axi_read(4'h8, rd);
      if (rd[0]) break;
    end
    assert (rd[0]) else log_failure("Done bit did not assert after start write");

    axi_read(4'h0, rd);
    axi_read(4'h4, rd);

    axi_write(4'hC, 32'h0000_0001, 4'b0001, 1'b1);
    axi_read(4'h8, rd);
    assert (rd[0] == 1'b0) else log_failure("Done bit should clear after ack");

    read_with_backpressure(4'h0);
    write_with_b_backpressure(4'h0, 32'h0000_0011);

    // Final evaluation before wrap up
    if (!test_failed) begin
      $fdisplay(file_handle, "pass");
      $display("PASS: AXI slave interface tests completed");
    end else begin
      $display("FAIL: Simulation completed with errors logged to axi-div-results.txt");
    end

    #20;
    $fclose(file_handle);
    $finish;
  end
endmodule

// Divider stub used to keep this testbench focused on AXI behavior.
module div (
  input  logic       clk,
  input  logic       rstn,
  input  logic       start,
  input  logic       ack,
  input  logic [7:0] x_in,
  input  logic [7:0] y_in,
  output logic [7:0] quo,
  output logic [7:0] rem,
  output logic       done
);
  logic [1:0] busy;
  logic [7:0] next_quo;
  logic [7:0] next_rem;

  always_ff @(posedge clk) begin
    if (!rstn) begin
      busy <= 2'b00;
      done <= 1'b0;
      quo <= 8'h00;
      rem <= 8'h00;
      next_quo <= 8'h00;
      next_rem <= 8'h00;
    end else begin
      if (ack) done <= 1'b0;

      if (start) begin
        busy <= 2'd2;
        done <= 1'b0;
        if (y_in == 8'h00) begin
          next_quo <= 8'hFF;
          next_rem <= x_in;
        end else begin
          next_quo <= x_in / y_in;
          next_rem <= x_in % y_in;
        end
      end else if (busy != 0) begin
        busy <= busy - 1'b1;
        if (busy == 1) begin
          quo <= next_quo;
          rem <= next_rem;
          done <= 1'b1;
        end
      end
    end
  end
endmodule