`timescale 1ns/1ps

module pcie_rx_2lane (
    input  logic       lane0_clk,
    input  logic       lane1_clk,
    input  logic       core_clk,
    input  logic       rst_n,
    input  logic       lane0_valid,
    output logic       lane0_ready,
    input  logic [8:0] lane0_symbol,
    input  logic       lane1_valid,
    output logic       lane1_ready,
    input  logic [8:0] lane1_symbol,
    output logic       link_locked,
    output logic       out_valid,
    input  logic       out_ready,
    output logic [7:0] out_lane0,
    output logic [7:0] out_lane1
);
    localparam logic [8:0] COM = {1'b1, 8'hBC};
    localparam logic [8:0] SKP = {1'b1, 8'h1C};

    logic fifo0_valid, fifo1_valid;
    logic fifo0_ready, fifo1_ready;
    logic [8:0] fifo0_data, fifo1_data;
    logic seen_com0, seen_com1;

    async_symbol_fifo fifo0 (
        .wr_clk(lane0_clk), .wr_rst_n(rst_n),
        .wr_valid(lane0_valid), .wr_ready(lane0_ready), .wr_data(lane0_symbol),
        .rd_clk(core_clk), .rd_rst_n(rst_n),
        .rd_valid(fifo0_valid), .rd_ready(fifo0_ready), .rd_data(fifo0_data)
    );
    async_symbol_fifo fifo1 (
        .wr_clk(lane1_clk), .wr_rst_n(rst_n),
        .wr_valid(lane1_valid), .wr_ready(lane1_ready), .wr_data(lane1_symbol),
        .rd_clk(core_clk), .rd_rst_n(rst_n),
        .rd_valid(fifo1_valid), .rd_ready(fifo1_ready), .rd_data(fifo1_data)
    );

    always @* begin
        fifo0_ready = 1'b0;
        fifo1_ready = 1'b0;
        out_valid = 1'b0;
        out_lane0 = fifo0_data[7:0];
        out_lane1 = fifo1_data[7:0];

        if (!link_locked) begin
            if (!seen_com0 && fifo0_valid)
                fifo0_ready = 1'b1;
            if (!seen_com1 && fifo1_valid)
                fifo1_ready = 1'b1;
        end else if (fifo0_valid && fifo1_valid) begin
            if (fifo0_data == SKP && fifo1_data == SKP) begin
                fifo0_ready = 1'b1;
                fifo1_ready = 1'b1;
            end else if (fifo0_data == SKP) begin
                fifo0_ready = 1'b1;
            end else if (fifo1_data == SKP) begin
                fifo1_ready = 1'b1;
            end else begin
                out_valid = 1'b1;
                fifo0_ready = out_ready;
                fifo1_ready = out_ready;
            end
        end
    end

    always_ff @(posedge core_clk or negedge rst_n) begin
        if (!rst_n) begin
            seen_com0 <= 1'b0;
            seen_com1 <= 1'b0;
            link_locked <= 1'b0;
        end else begin
            if (!seen_com0 && fifo0_valid && fifo0_ready && fifo0_data == COM)
                seen_com0 <= 1'b1;
            if (!seen_com1 && fifo1_valid && fifo1_ready && fifo1_data == COM)
                seen_com1 <= 1'b1;
            if ((seen_com0 || (fifo0_valid && fifo0_ready && fifo0_data == COM)) &&
                (seen_com1 || (fifo1_valid && fifo1_ready && fifo1_data == COM)))
                link_locked <= 1'b1;
        end
    end
endmodule
