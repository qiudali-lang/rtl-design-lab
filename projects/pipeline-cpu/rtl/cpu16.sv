`timescale 1ns/1ps

module cpu16 (
    input  logic clk,
    input  logic rst_n,
    output logic halted
);
    localparam logic [3:0] OP_NOP  = 4'h0;
    localparam logic [3:0] OP_ADD  = 4'h1;
    localparam logic [3:0] OP_SUB  = 4'h2;
    localparam logic [3:0] OP_AND  = 4'h3;
    localparam logic [3:0] OP_OR   = 4'h4;
    localparam logic [3:0] OP_XOR  = 4'h5;
    localparam logic [3:0] OP_ADDI = 4'h6;
    localparam logic [3:0] OP_MOVI = 4'h7;
    localparam logic [3:0] OP_LD   = 4'hA;
    localparam logic [3:0] OP_ST   = 4'hB;
    localparam logic [3:0] OP_BEQZ = 4'hC;
    localparam logic [3:0] OP_HALT = 4'hF;

    logic [15:0] regs [0:15];
    logic [15:0] imem [0:255];
    logic [15:0] dmem [0:255];
    logic [7:0] pc;

    logic ifid_valid;
    logic [7:0] ifid_pc;
    logic [15:0] ifid_instr;

    logic idex_valid;
    logic [7:0] idex_pc;
    logic [3:0] idex_op, idex_rd, idex_rs1, idex_rs2;
    logic [15:0] idex_v1, idex_v2;
    logic signed [15:0] idex_imm;

    logic exmem_valid, exmem_reg_write, exmem_mem_read, exmem_mem_write, exmem_halt;
    logic [3:0] exmem_rd;
    logic [15:0] exmem_alu, exmem_store_data;

    logic memwb_valid, memwb_reg_write, memwb_halt;
    logic [3:0] memwb_rd;
    logic [15:0] memwb_value;

    logic [3:0] dec_op, dec_rd, dec_rs1, dec_rs2;
    logic dec_use_rs1, dec_use_rs2, dec_reg_write, dec_mem_read, dec_mem_write, dec_halt;
    logic signed [15:0] dec_imm;
    logic [15:0] dec_v1, dec_v2;
    logic load_stall;
    logic [15:0] ex_v1, ex_v2, ex_result;
    logic branch_taken;
    logic [7:0] branch_target;
    integer i;

    always @* begin
        dec_op = ifid_instr[15:12];
        dec_rd = ifid_instr[11:8];
        dec_rs1 = ifid_instr[7:4];
        dec_rs2 = ifid_instr[3:0];
        dec_use_rs1 = 1'b0;
        dec_use_rs2 = 1'b0;
        dec_reg_write = 1'b0;
        dec_mem_read = 1'b0;
        dec_mem_write = 1'b0;
        dec_halt = 1'b0;
        dec_imm = '0;
        case (dec_op)
            OP_ADD, OP_SUB, OP_AND, OP_OR, OP_XOR: begin
                dec_use_rs1 = 1'b1; dec_use_rs2 = 1'b1; dec_reg_write = 1'b1;
            end
            OP_ADDI: begin
                dec_use_rs1 = 1'b1; dec_reg_write = 1'b1;
                dec_imm = {{12{ifid_instr[3]}}, ifid_instr[3:0]};
            end
            OP_MOVI: begin
                dec_reg_write = 1'b1; dec_imm = {8'b0, ifid_instr[7:0]};
            end
            OP_LD: begin
                dec_use_rs1 = 1'b1; dec_reg_write = 1'b1; dec_mem_read = 1'b1;
                dec_imm = {{12{ifid_instr[3]}}, ifid_instr[3:0]};
            end
            OP_ST: begin
                dec_rs2 = ifid_instr[11:8]; dec_rd = 4'b0;
                dec_use_rs1 = 1'b1; dec_use_rs2 = 1'b1; dec_mem_write = 1'b1;
                dec_imm = {{12{ifid_instr[3]}}, ifid_instr[3:0]};
            end
            OP_BEQZ: begin
                dec_rs1 = ifid_instr[11:8]; dec_rd = 4'b0;
                dec_use_rs1 = 1'b1; dec_imm = {{8{ifid_instr[7]}}, ifid_instr[7:0]};
            end
            OP_HALT: begin
                dec_rd = 4'b0; dec_halt = 1'b1;
            end
            default: begin
                dec_rd = 4'b0;
            end
        endcase
        dec_v1 = (dec_rs1 == 0) ? 16'b0 : regs[dec_rs1];
        dec_v2 = (dec_rs2 == 0) ? 16'b0 : regs[dec_rs2];
        if (memwb_valid && memwb_reg_write && memwb_rd != 0 && memwb_rd == dec_rs1)
            dec_v1 = memwb_value;
        if (memwb_valid && memwb_reg_write && memwb_rd != 0 && memwb_rd == dec_rs2)
            dec_v2 = memwb_value;
    end

    assign load_stall = ifid_valid && idex_valid && idex_op == OP_LD && idex_rd != 0 &&
                        ((dec_use_rs1 && dec_rs1 == idex_rd) || (dec_use_rs2 && dec_rs2 == idex_rd));

    always @* begin
        ex_v1 = idex_v1;
        ex_v2 = idex_v2;
        if (memwb_valid && memwb_reg_write && memwb_rd != 0 && memwb_rd == idex_rs1)
            ex_v1 = memwb_value;
        if (memwb_valid && memwb_reg_write && memwb_rd != 0 && memwb_rd == idex_rs2)
            ex_v2 = memwb_value;
        if (exmem_valid && exmem_reg_write && !exmem_mem_read && exmem_rd != 0 && exmem_rd == idex_rs1)
            ex_v1 = exmem_alu;
        if (exmem_valid && exmem_reg_write && !exmem_mem_read && exmem_rd != 0 && exmem_rd == idex_rs2)
            ex_v2 = exmem_alu;

        ex_result = 16'b0;
        branch_taken = 1'b0;
        branch_target = idex_pc + 1'b1 + idex_imm[7:0];
        case (idex_op)
            OP_ADD:  ex_result = ex_v1 + ex_v2;
            OP_SUB:  ex_result = ex_v1 - ex_v2;
            OP_AND:  ex_result = ex_v1 & ex_v2;
            OP_OR:   ex_result = ex_v1 | ex_v2;
            OP_XOR:  ex_result = ex_v1 ^ ex_v2;
            OP_ADDI: ex_result = ex_v1 + idex_imm;
            OP_MOVI: ex_result = idex_imm;
            OP_LD, OP_ST: ex_result = ex_v1 + idex_imm;
            OP_BEQZ: branch_taken = idex_valid && ex_v1 == 0;
            default: ex_result = 16'b0;
        endcase
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            halted <= 1'b0;
            pc <= 0;
            ifid_valid <= 1'b0;
            idex_valid <= 1'b0;
            exmem_valid <= 1'b0;
            memwb_valid <= 1'b0;
            for (i = 0; i < 16; i = i + 1)
                regs[i] <= 0;
            for (i = 0; i < 256; i = i + 1)
                dmem[i] <= 0;
        end else if (!halted) begin
            if (memwb_valid && memwb_reg_write && memwb_rd != 0)
                regs[memwb_rd] <= memwb_value;
            if (memwb_valid && memwb_halt)
                halted <= 1'b1;
            regs[0] <= 0;

            memwb_valid <= exmem_valid;
            memwb_reg_write <= exmem_reg_write;
            memwb_rd <= exmem_rd;
            memwb_halt <= exmem_halt;
            memwb_value <= exmem_mem_read ? dmem[exmem_alu[7:0]] : exmem_alu;
            if (exmem_valid && exmem_mem_write)
                dmem[exmem_alu[7:0]] <= exmem_store_data;

            exmem_valid <= idex_valid;
            exmem_rd <= idex_rd;
            exmem_alu <= ex_result;
            exmem_store_data <= ex_v2;
            exmem_reg_write <= idex_valid && (idex_op == OP_ADD || idex_op == OP_SUB ||
                               idex_op == OP_AND || idex_op == OP_OR || idex_op == OP_XOR ||
                               idex_op == OP_ADDI || idex_op == OP_MOVI || idex_op == OP_LD);
            exmem_mem_read <= idex_valid && idex_op == OP_LD;
            exmem_mem_write <= idex_valid && idex_op == OP_ST;
            exmem_halt <= idex_valid && idex_op == OP_HALT;

            if (load_stall) begin
                idex_valid <= 1'b0;
            end else begin
                idex_valid <= ifid_valid;
                idex_pc <= ifid_pc;
                idex_op <= dec_op;
                idex_rd <= dec_rd;
                idex_rs1 <= dec_rs1;
                idex_rs2 <= dec_rs2;
                idex_v1 <= dec_v1;
                idex_v2 <= dec_v2;
                idex_imm <= dec_imm;
                ifid_valid <= 1'b1;
                ifid_pc <= pc;
                ifid_instr <= imem[pc];
                pc <= pc + 1'b1;
            end

            if (branch_taken) begin
                pc <= branch_target;
                ifid_valid <= 1'b0;
                idex_valid <= 1'b0;
            end
        end
    end
endmodule
