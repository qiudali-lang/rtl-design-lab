`timescale 1ns/1ps

module tb_pcie_rx_2lane;
    logic lane0_clk = 0, lane1_clk = 0, core_clk = 0, rst_n = 0;
    logic lane0_valid = 0, lane1_valid = 0;
    logic lane0_ready, lane1_ready;
    logic [8:0] lane0_symbol, lane1_symbol;
    logic link_locked, out_valid;
    logic out_ready = 1;
    logic [7:0] out_lane0, out_lane1;
    integer count = 0;

    always #5 lane0_clk = ~lane0_clk;
    always #6 lane1_clk = ~lane1_clk;
    always #4 core_clk = ~core_clk;

    pcie_rx_2lane dut (.*);

    task automatic send0(input logic [8:0] symbol);
        begin
            @(negedge lane0_clk);
            lane0_symbol = symbol;
            lane0_valid = 1;
            do @(posedge lane0_clk); while (!lane0_ready);
            @(negedge lane0_clk);
            lane0_valid = 0;
        end
    endtask

    task automatic send1(input logic [8:0] symbol);
        begin
            @(negedge lane1_clk);
            lane1_symbol = symbol;
            lane1_valid = 1;
            do @(posedge lane1_clk); while (!lane1_ready);
            @(negedge lane1_clk);
            lane1_valid = 0;
        end
    endtask

    always @(posedge core_clk) begin
        if (rst_n && out_valid && out_ready) begin
            case (count)
                0: if ({out_lane0, out_lane1} !== 16'h1020) $fatal(1, "pair0 mismatch");
                1: if ({out_lane0, out_lane1} !== 16'h1121) $fatal(1, "pair1 mismatch");
                2: if ({out_lane0, out_lane1} !== 16'h1222) $fatal(1, "pair2 mismatch");
                default: $fatal(1, "unexpected output");
            endcase
            count = count + 1;
        end
    end

    initial begin
        lane0_symbol = '0;
        lane1_symbol = '0;
        repeat (4) @(posedge core_clk);
        rst_n = 1;
        fork
            begin
                send0({1'b0, 8'hAA});
                send0({1'b1, 8'hBC});
                send0({1'b0, 8'h10});
                send0({1'b1, 8'h1C});
                send0({1'b0, 8'h11});
                send0({1'b0, 8'h12});
            end
            begin
                send1({1'b0, 8'h55});
                send1({1'b0, 8'h56});
                send1({1'b1, 8'hBC});
                send1({1'b0, 8'h20});
                send1({1'b0, 8'h21});
                send1({1'b0, 8'h22});
            end
        join
        wait (count == 3);
        repeat (4) @(posedge core_clk);
        $display("PASS pcie_rx_2lane pairs=%0d", count);
        $finish;
    end

    initial begin
        #5000;
        $fatal(1, "timeout count=%0d", count);
    end
endmodule

