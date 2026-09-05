module div_axi_if (
  input  logic       s_axi_clk,
  input  logic       s_axi_resetn,
  // AXI4-Lite interface
  // Read address channel
  input  logic [3:0] s_axi_araddr,
  input  logic [2:0] s_axi_arprot,
  input  logic       s_axi_arvalid,
  output logic       s_axi_arready,
  // Write address channel
  input  logic [3:0] s_axi_awaddr,
  input  logic [2:0] s_axi_awprot,
  input  logic       s_axi_awvalid,
  output logic       s_axi_awready,
  // Write data channel
  input  logic [31:0] s_axi_wdata,
  input  logic [3:0] s_axi_wstrb,
  input  logic       s_axi_wvalid,
  output logic       s_axi_wready,
  // Read data channel
  output logic [31:0] s_axi_rdata,
  output logic [1:0] s_axi_rresp,
  output logic       s_axi_rvalid,
  input  logic       s_axi_rready,
  // Write response channel
  output logic [1:0] s_axi_bresp,
  output logic       s_axi_bvalid,
  input  logic       s_axi_bready
);

  reg [7:0]  x_in;
  reg [7:0]  y_in;
  reg        start;
  reg        ack;
  wire [7:0] quo;
  wire [7:0] rem;
  wire       done;

  // Add your declarations and code below
  localparam logic [3:0] ADDR_X_START = 4'h0;
  localparam logic [3:0] ADDR_Y_REM   = 4'h4;
  localparam logic [3:0] ADDR_START   = 4'h8;
  localparam logic [3:0] ADDR_ACK     = 4'hC;

  logic [3:0]  awaddr_q;
  logic [31:0] wdata_q;
  logic [3:0]  wstrb_q;
  logic        aw_seen;
  logic        w_seen;
  logic        do_write;

  assign s_axi_awready = !aw_seen && !s_axi_bvalid;
  assign s_axi_wready  = !w_seen && !s_axi_bvalid;
  assign s_axi_bresp   = 2'b00;
  assign do_write = aw_seen && w_seen && !s_axi_bvalid;

  always_comb begin
    unique case (s_axi_araddr)
      ADDR_X_START: s_axi_rdata = {24'h0, quo};
      ADDR_Y_REM:   s_axi_rdata = {24'h0, rem};
      ADDR_START:   s_axi_rdata = {31'h0, done};
      default:      s_axi_rdata = 32'h0;
    endcase
  end

  assign s_axi_arready = !s_axi_rvalid;
  assign s_axi_rresp   = 2'b00;

  always_ff @(posedge s_axi_clk) begin
    if (!s_axi_resetn) begin
      x_in <= 8'h00;
      y_in <= 8'h00;
      start <= 1'b0;
      ack <= 1'b0;
      awaddr_q <= 4'h0;
      wdata_q <= 32'h0;
      wstrb_q <= 4'h0;
      aw_seen <= 1'b0;
      w_seen <= 1'b0;
      s_axi_bvalid <= 1'b0;
      s_axi_rvalid <= 1'b0;
    end else begin
      start <= 1'b0;
      ack <= 1'b0;

      if (s_axi_awready && s_axi_awvalid) begin
        awaddr_q <= s_axi_awaddr;
        aw_seen <= 1'b1;
      end

      if (s_axi_wready && s_axi_wvalid) begin
        wdata_q <= s_axi_wdata;
        wstrb_q <= s_axi_wstrb;
        w_seen <= 1'b1;
      end

      if (do_write) begin
        if (wstrb_q[0]) begin
          unique case (awaddr_q)
            ADDR_X_START: x_in <= wdata_q[7:0];
            ADDR_Y_REM:   y_in <= wdata_q[7:0];
            ADDR_START:   start <= wdata_q[0];
            ADDR_ACK:     ack <= wdata_q[0];
            default:      ;
          endcase
        end
        s_axi_bvalid <= 1'b1;
        aw_seen <= 1'b0;
        w_seen <= 1'b0;
      end else if (s_axi_bvalid && s_axi_bready) begin
        s_axi_bvalid <= 1'b0;
      end

      if (s_axi_arready && s_axi_arvalid) begin
        s_axi_rvalid <= 1'b1;
      end else if (s_axi_rvalid && s_axi_rready) begin
        s_axi_rvalid <= 1'b0;
      end
    end
  end

  // DO NOT CHANGE THE INSTANTIATION BELOW.

  // Internal signals for division operation
  div div_inst (
    .clk(s_axi_clk),
    .rstn(s_axi_resetn),
    .start(start),
    .ack(ack),
    .x_in(x_in),
    .y_in(y_in),
    .quo(quo),
    .rem(rem),
    .done(done)
  );
endmodule
