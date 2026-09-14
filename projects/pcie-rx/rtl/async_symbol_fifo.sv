`timescale 1ns/1ps

module async_symbol_fifo #(
    parameter int DATA_WIDTH = 9,
    parameter int ADDR_WIDTH = 3
) (
    input  logic                  wr_clk,
    input  logic                  wr_rst_n,
    input  logic                  wr_valid,
    output logic                  wr_ready,
    input  logic [DATA_WIDTH-1:0] wr_data,
    input  logic                  rd_clk,
    input  logic                  rd_rst_n,
    output logic                  rd_valid,
    input  logic                  rd_ready,
    output logic [DATA_WIDTH-1:0] rd_data
);
    localparam int DEPTH = 1 << ADDR_WIDTH;
    localparam int PTR_WIDTH = ADDR_WIDTH + 1;

    logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    logic [PTR_WIDTH-1:0] wr_bin, wr_gray, rd_bin, rd_gray;
    logic [PTR_WIDTH-1:0] rd_gray_w1, rd_gray_w2;
    logic [PTR_WIDTH-1:0] wr_gray_r1, wr_gray_r2;
    logic [PTR_WIDTH-1:0] wr_bin_next, wr_gray_next;
    logic full;

    assign wr_bin_next = wr_bin + (wr_valid && wr_ready);
    assign wr_gray_next = (wr_bin_next >> 1) ^ wr_bin_next;
    assign full = wr_gray_next == {~rd_gray_w2[PTR_WIDTH-1:PTR_WIDTH-2], rd_gray_w2[PTR_WIDTH-3:0]};
    assign wr_ready = !full;
    assign rd_valid = rd_gray != wr_gray_r2;
    assign rd_data = mem[rd_bin[ADDR_WIDTH-1:0]];

    always_ff @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) begin
            wr_bin <= '0;
            wr_gray <= '0;
            rd_gray_w1 <= '0;
            rd_gray_w2 <= '0;
        end else begin
            rd_gray_w1 <= rd_gray;
            rd_gray_w2 <= rd_gray_w1;
            if (wr_valid && wr_ready) begin
                mem[wr_bin[ADDR_WIDTH-1:0]] <= wr_data;
                wr_bin <= wr_bin_next;
                wr_gray <= wr_gray_next;
            end
        end
    end

    always_ff @(posedge rd_clk or negedge rd_rst_n) begin
        logic [PTR_WIDTH-1:0] rd_bin_next;
        if (!rd_rst_n) begin
            rd_bin <= '0;
            rd_gray <= '0;
            wr_gray_r1 <= '0;
            wr_gray_r2 <= '0;
        end else begin
            wr_gray_r1 <= wr_gray;
            wr_gray_r2 <= wr_gray_r1;
            if (rd_valid && rd_ready) begin
                rd_bin_next = rd_bin + 1'b1;
                rd_bin <= rd_bin_next;
                rd_gray <= (rd_bin_next >> 1) ^ rd_bin_next;
            end
        end
    end
endmodule
