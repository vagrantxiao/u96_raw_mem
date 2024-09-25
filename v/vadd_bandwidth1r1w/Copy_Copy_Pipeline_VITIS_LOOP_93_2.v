// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Copy_Copy_Pipeline_VITIS_LOOP_93_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        mem_write_addr_s_din,
        mem_write_addr_s_full_n,
        mem_write_addr_s_write,
        mem_write_data_din,
        mem_write_data_full_n,
        mem_write_data_write,
        n,
        write_r,
        tobool15_not,
        or_ln116_1,
        tobool17_not,
        read_r,
        mask_57,
        random,
        mem_read_data_s_dout,
        mem_read_data_s_empty_n,
        mem_read_data_s_read,
        mem_read_addr_offset_load,
        mem_read_addr_s_din,
        mem_read_addr_s_full_n,
        mem_read_addr_s_write,
        mem_write_addr_offset_load,
        mem_write_resp_s_dout,
        mem_write_resp_s_empty_n,
        mem_write_resp_s_read
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [63:0] mem_write_addr_s_din;
input   mem_write_addr_s_full_n;
output   mem_write_addr_s_write;
output  [512:0] mem_write_data_din;
input   mem_write_data_full_n;
output   mem_write_data_write;
input  [63:0] n;
input  [0:0] write_r;
input  [0:0] tobool15_not;
input  [0:0] or_ln116_1;
input  [0:0] tobool17_not;
input  [0:0] read_r;
input  [15:0] mask_57;
input  [0:0] random;
input  [512:0] mem_read_data_s_dout;
input   mem_read_data_s_empty_n;
output   mem_read_data_s_read;
input  [63:0] mem_read_addr_offset_load;
output  [63:0] mem_read_addr_s_din;
input   mem_read_addr_s_full_n;
output   mem_read_addr_s_write;
input  [63:0] mem_write_addr_offset_load;
input  [8:0] mem_write_resp_s_dout;
input   mem_write_resp_s_empty_n;
output   mem_write_resp_s_read;

reg ap_idle;
reg mem_write_addr_s_write;
reg mem_write_data_write;
reg mem_read_data_s_read;
reg mem_read_addr_s_write;
reg mem_write_resp_s_read;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] select_ln94_fu_393_p3;
wire   [0:0] or_ln116_fu_611_p2;
wire   [0:0] and_ln116_1_fu_626_p2;
reg   [0:0] ap_phi_mux_can_write_phi_fu_330_p4;
reg    ap_predicate_op104_write_state2;
reg    ap_predicate_op122_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    mem_write_addr_s_blk_n;
wire    ap_block_pp0_stage0;
reg    mem_write_data_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] write_read_reg_1082;
wire   [0:0] ap_phi_reg_pp0_iter1_can_write_reg_327;
wire   [0:0] tmp_nbwritereq_fu_270_p3;
reg   [63:0] i_wr_resp_fu_174;
wire   [63:0] i_wr_resp_2_fu_979_p2;
wire   [0:0] tmp_8_nbreadreq_fu_313_p3;
wire    ap_loop_init;
reg   [63:0] i_wr_req_fu_178;
wire   [63:0] i_wr_req_2_fu_877_p2;
reg   [63:0] i_rd_req_fu_182;
wire   [63:0] i_rd_req_2_fu_485_p2;
wire   [0:0] and_ln105_1_fu_465_p2;
wire   [0:0] tmp_2_nbwrite_fu_286_p3;
reg   [15:0] p_Val2_s_fu_186;
wire   [15:0] lfsr_rd_V_fu_547_p3;
reg   [15:0] p_Val2_1_fu_190;
wire   [15:0] lfsr_wr_V_fu_939_p3;
reg   [63:0] i_rd_resp_fu_194;
wire   [63:0] i_rd_resp_2_fu_595_p2;
wire   [0:0] and_ln111_1_fu_581_p2;
reg   [511:0] elem_0_fu_198;
wire   [511:0] trunc_ln79_fu_591_p1;
reg   [511:0] ap_sig_allocacmp_elem_0_load;
wire   [0:0] can_read_nbreadreq_fu_262_p3;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln94_fu_383_p2;
wire   [0:0] icmp_ln94_1_fu_388_p2;
wire   [15:0] ret_V_fu_411_p2;
wire   [57:0] zext_ln99_fu_416_p1;
wire   [57:0] trunc_ln89_1_fu_404_p1;
wire   [15:0] ret_V_1_fu_427_p2;
wire   [57:0] zext_ln100_fu_432_p1;
wire   [57:0] trunc_ln89_fu_400_p1;
wire   [63:0] add_ln105_fu_443_p2;
wire   [0:0] icmp_ln105_1_fu_455_p2;
wire   [0:0] and_ln105_fu_460_p2;
wire   [0:0] icmp_ln105_fu_449_p2;
wire   [57:0] read_addr_fu_420_p3;
wire   [63:0] shl_ln_fu_471_p3;
wire   [0:0] tmp_3_fu_491_p3;
wire   [1:0] tmp_4_fu_499_p4;
wire   [0:0] trunc_ln1497_fu_509_p1;
wire   [5:0] ret_V_4_fu_513_p6;
wire   [15:0] zext_ln1497_fu_527_p1;
reg   [0:0] p_Repl2_s_fu_531_p2;
wire   [14:0] lshr_ln_fu_537_p4;
wire   [0:0] and_ln111_fu_576_p2;
wire   [0:0] or_ln111_fu_571_p2;
wire   [0:0] xor_ln111_fu_565_p2;
wire   [0:0] and_ln116_fu_621_p2;
wire   [0:0] icmp_ln116_fu_616_p2;
wire   [57:0] write_addr_fu_436_p3;
wire   [63:0] shl_ln1_fu_638_p3;
wire   [30:0] tmp_19_fu_796_p4;
wire   [30:0] tmp_18_fu_786_p4;
wire   [30:0] tmp_17_fu_776_p4;
wire   [30:0] tmp_16_fu_766_p4;
wire   [30:0] tmp_15_fu_756_p4;
wire   [30:0] tmp_14_fu_746_p4;
wire   [30:0] tmp_13_fu_736_p4;
wire   [30:0] tmp_12_fu_726_p4;
wire   [30:0] tmp_11_fu_716_p4;
wire   [30:0] tmp_10_fu_706_p4;
wire   [30:0] tmp_6_fu_696_p4;
wire   [30:0] tmp_5_fu_686_p4;
wire   [30:0] tmp_s_fu_676_p4;
wire   [30:0] tmp_9_fu_666_p4;
wire   [30:0] tmp_7_fu_656_p4;
wire   [30:0] trunc_ln174_fu_652_p1;
wire   [0:0] tmp_20_fu_883_p3;
wire   [1:0] tmp_21_fu_891_p4;
wire   [0:0] trunc_ln1497_1_fu_901_p1;
wire   [5:0] ret_V_5_fu_905_p6;
wire   [15:0] zext_ln1497_1_fu_919_p1;
reg   [0:0] p_Repl2_1_fu_923_p2;
wire   [14:0] lshr_ln661_1_fu_929_p4;
wire   [7:0] elem_val_fu_961_p1;
wire   [8:0] zext_ln124_fu_965_p1;
wire   [8:0] add_ln124_fu_969_p2;
wire   [63:0] zext_ln124_1_fu_975_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_679;
reg    ap_condition_682;
reg    ap_condition_685;
reg    ap_condition_690;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

Copy_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_rd_req_fu_182 <= 64'd0;
        end else if ((1'b1 == ap_condition_679)) begin
            i_rd_req_fu_182 <= i_rd_req_2_fu_485_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_rd_resp_fu_194 <= 64'd0;
        end else if ((1'b1 == ap_condition_682)) begin
            i_rd_resp_fu_194 <= i_rd_resp_2_fu_595_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_wr_req_fu_178 <= 64'd0;
        end else if ((1'b1 == ap_condition_685)) begin
            i_wr_req_fu_178 <= i_wr_req_2_fu_877_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_wr_resp_fu_174 <= 64'd0;
        end else if ((1'b1 == ap_condition_690)) begin
            i_wr_resp_fu_174 <= i_wr_resp_2_fu_979_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            p_Val2_1_fu_190 <= 16'd48879;
        end else if ((1'b1 == ap_condition_685)) begin
            p_Val2_1_fu_190 <= lfsr_wr_V_fu_939_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            p_Val2_s_fu_186 <= 16'd48879;
        end else if ((1'b1 == ap_condition_679)) begin
            p_Val2_s_fu_186 <= lfsr_rd_V_fu_547_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'd1 == and_ln111_1_fu_581_p2) & (select_ln94_fu_393_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        elem_0_fu_198 <= trunc_ln79_fu_591_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (select_ln94_fu_393_p3 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((select_ln94_fu_393_p3 == 1'd1)) begin
        if ((tmp_nbwritereq_fu_270_p3 == 1'd0)) begin
            ap_phi_mux_can_write_phi_fu_330_p4 = 1'd0;
        end else if ((tmp_nbwritereq_fu_270_p3 == 1'd1)) begin
            ap_phi_mux_can_write_phi_fu_330_p4 = mem_write_data_full_n;
        end else begin
            ap_phi_mux_can_write_phi_fu_330_p4 = ap_phi_reg_pp0_iter1_can_write_reg_327;
        end
    end else begin
        ap_phi_mux_can_write_phi_fu_330_p4 = ap_phi_reg_pp0_iter1_can_write_reg_327;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'd1 == and_ln111_1_fu_581_p2) & (select_ln94_fu_393_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_elem_0_load = trunc_ln79_fu_591_p1;
    end else begin
        ap_sig_allocacmp_elem_0_load = elem_0_fu_198;
    end
end

always @ (*) begin
    if (((mem_read_addr_s_full_n == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'd1 == and_ln105_1_fu_465_p2) & (select_ln94_fu_393_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mem_read_addr_s_write = 1'b1;
    end else begin
        mem_read_addr_s_write = 1'b0;
    end
end

always @ (*) begin
    if (((mem_read_data_s_empty_n == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'd1 == and_ln111_1_fu_581_p2) & (select_ln94_fu_393_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mem_read_data_s_read = 1'b1;
    end else begin
        mem_read_data_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op104_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mem_write_addr_s_blk_n = mem_write_addr_s_full_n;
    end else begin
        mem_write_addr_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op104_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mem_write_addr_s_write = 1'b1;
    end else begin
        mem_write_addr_s_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op122_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mem_write_data_blk_n = mem_write_data_full_n;
    end else begin
        mem_write_data_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op122_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mem_write_data_write = 1'b1;
    end else begin
        mem_write_data_write = 1'b0;
    end
end

always @ (*) begin
    if (((mem_write_resp_s_empty_n == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (select_ln94_fu_393_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_8_nbreadreq_fu_313_p3 == 1'd1) & (write_read_reg_1082 == 1'd1))) begin
        mem_write_resp_s_read = 1'b1;
    end else begin
        mem_write_resp_s_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln105_fu_443_p2 = (i_rd_resp_fu_194 + 64'd50);

assign add_ln124_fu_969_p2 = (zext_ln124_fu_965_p1 + 9'd1);

assign and_ln105_1_fu_465_p2 = (icmp_ln105_fu_449_p2 & and_ln105_fu_460_p2);

assign and_ln105_fu_460_p2 = (read_r & icmp_ln105_1_fu_455_p2);

assign and_ln111_1_fu_581_p2 = (or_ln111_fu_571_p2 & and_ln111_fu_576_p2);

assign and_ln111_fu_576_p2 = (read_r & can_read_nbreadreq_fu_262_p3);

assign and_ln116_1_fu_626_p2 = (icmp_ln116_fu_616_p2 & and_ln116_fu_621_p2);

assign and_ln116_fu_621_p2 = (tobool15_not & ap_phi_mux_can_write_phi_fu_330_p4);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op122_write_state2 == 1'b1) & (mem_write_data_full_n == 1'b0)) | ((ap_predicate_op104_write_state2 == 1'b1) & (mem_write_addr_s_full_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op122_write_state2 == 1'b1) & (mem_write_data_full_n == 1'b0)) | ((ap_predicate_op104_write_state2 == 1'b1) & (mem_write_addr_s_full_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op122_write_state2 == 1'b1) & (mem_write_data_full_n == 1'b0)) | ((ap_predicate_op104_write_state2 == 1'b1) & (mem_write_addr_s_full_n == 1'b0))));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op122_write_state2 == 1'b1) & (mem_write_data_full_n == 1'b0)) | ((ap_predicate_op104_write_state2 == 1'b1) & (mem_write_addr_s_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_679 = ((1'd1 == and_ln105_1_fu_465_p2) & (select_ln94_fu_393_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_2_nbwrite_fu_286_p3 == 1'd1));
end

always @ (*) begin
    ap_condition_682 = ((1'd1 == and_ln111_1_fu_581_p2) & (select_ln94_fu_393_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_685 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_phi_mux_can_write_phi_fu_330_p4 == 1'd1) & (or_ln116_fu_611_p2 == 1'd0) & (select_ln94_fu_393_p3 == 1'd1)) | ((or_ln116_fu_611_p2 == 1'd1) & (1'd1 == and_ln116_1_fu_626_p2) & (select_ln94_fu_393_p3 == 1'd1))));
end

always @ (*) begin
    ap_condition_690 = ((select_ln94_fu_393_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_8_nbreadreq_fu_313_p3 == 1'd1) & (write_read_reg_1082 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_phi_reg_pp0_iter1_can_write_reg_327 = 'bx;

always @ (*) begin
    ap_predicate_op104_write_state2 = (((ap_phi_mux_can_write_phi_fu_330_p4 == 1'd1) & (or_ln116_fu_611_p2 == 1'd0) & (select_ln94_fu_393_p3 == 1'd1)) | ((or_ln116_fu_611_p2 == 1'd1) & (1'd1 == and_ln116_1_fu_626_p2) & (select_ln94_fu_393_p3 == 1'd1)));
end

always @ (*) begin
    ap_predicate_op122_write_state2 = (((ap_phi_mux_can_write_phi_fu_330_p4 == 1'd1) & (or_ln116_fu_611_p2 == 1'd0) & (select_ln94_fu_393_p3 == 1'd1)) | ((or_ln116_fu_611_p2 == 1'd1) & (1'd1 == and_ln116_1_fu_626_p2) & (select_ln94_fu_393_p3 == 1'd1)));
end

assign can_read_nbreadreq_fu_262_p3 = mem_read_data_s_empty_n;

assign elem_val_fu_961_p1 = mem_write_resp_s_dout[7:0];

assign i_rd_req_2_fu_485_p2 = (i_rd_req_fu_182 + 64'd1);

assign i_rd_resp_2_fu_595_p2 = (i_rd_resp_fu_194 + 64'd1);

assign i_wr_req_2_fu_877_p2 = (i_wr_req_fu_178 + 64'd1);

assign i_wr_resp_2_fu_979_p2 = (i_wr_resp_fu_174 + zext_ln124_1_fu_975_p1);

assign icmp_ln105_1_fu_455_p2 = ((i_rd_req_fu_182 < n) ? 1'b1 : 1'b0);

assign icmp_ln105_fu_449_p2 = ((i_rd_req_fu_182 < add_ln105_fu_443_p2) ? 1'b1 : 1'b0);

assign icmp_ln116_fu_616_p2 = ((i_wr_req_fu_178 < n) ? 1'b1 : 1'b0);

assign icmp_ln94_1_fu_388_p2 = ((i_rd_resp_fu_194 < n) ? 1'b1 : 1'b0);

assign icmp_ln94_fu_383_p2 = ((i_wr_resp_fu_174 < n) ? 1'b1 : 1'b0);

assign lfsr_rd_V_fu_547_p3 = {{p_Repl2_s_fu_531_p2}, {lshr_ln_fu_537_p4}};

assign lfsr_wr_V_fu_939_p3 = {{p_Repl2_1_fu_923_p2}, {lshr_ln661_1_fu_929_p4}};

assign lshr_ln661_1_fu_929_p4 = {{p_Val2_1_fu_190[15:1]}};

assign lshr_ln_fu_537_p4 = {{p_Val2_s_fu_186[15:1]}};

assign mem_read_addr_s_din = (mem_read_addr_offset_load + shl_ln_fu_471_p3);

assign mem_write_addr_s_din = (mem_write_addr_offset_load + shl_ln1_fu_638_p3);

assign mem_write_data_din = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{1'd0}, {tmp_19_fu_796_p4}}}, {1'd0}}}, {tmp_18_fu_786_p4}}}, {1'd0}}}, {tmp_17_fu_776_p4}}}, {1'd0}}}, {tmp_16_fu_766_p4}}}, {1'd0}}}, {tmp_15_fu_756_p4}}}, {1'd0}}}, {tmp_14_fu_746_p4}}}, {1'd0}}}, {tmp_13_fu_736_p4}}}, {1'd0}}}, {tmp_12_fu_726_p4}}}, {1'd0}}}, {tmp_11_fu_716_p4}}}, {1'd0}}}, {tmp_10_fu_706_p4}}}, {1'd0}}}, {tmp_6_fu_696_p4}}}, {1'd0}}}, {tmp_5_fu_686_p4}}}, {1'd0}}}, {tmp_s_fu_676_p4}}}, {1'd0}}}, {tmp_9_fu_666_p4}}}, {1'd0}}}, {tmp_7_fu_656_p4}}}, {1'd0}}}, {trunc_ln174_fu_652_p1}}}, {1'd0}};

assign or_ln111_fu_571_p2 = (tobool17_not | ap_phi_mux_can_write_phi_fu_330_p4);

assign or_ln116_fu_611_p2 = (xor_ln111_fu_565_p2 | or_ln116_1);

always @ (*) begin
    p_Repl2_1_fu_923_p2 = ^(zext_ln1497_1_fu_919_p1);
end

always @ (*) begin
    p_Repl2_s_fu_531_p2 = ^(zext_ln1497_fu_527_p1);
end

assign read_addr_fu_420_p3 = ((random[0:0] == 1'b1) ? zext_ln99_fu_416_p1 : trunc_ln89_1_fu_404_p1);

assign ret_V_1_fu_427_p2 = (p_Val2_1_fu_190 & mask_57);

assign ret_V_4_fu_513_p6 = {{{{{tmp_3_fu_491_p3}, {1'd0}}, {tmp_4_fu_499_p4}}, {1'd0}}, {trunc_ln1497_fu_509_p1}};

assign ret_V_5_fu_905_p6 = {{{{{tmp_20_fu_883_p3}, {1'd0}}, {tmp_21_fu_891_p4}}, {1'd0}}, {trunc_ln1497_1_fu_901_p1}};

assign ret_V_fu_411_p2 = (p_Val2_s_fu_186 & mask_57);

assign select_ln94_fu_393_p3 = ((write_r[0:0] == 1'b1) ? icmp_ln94_fu_383_p2 : icmp_ln94_1_fu_388_p2);

assign shl_ln1_fu_638_p3 = {{write_addr_fu_436_p3}, {6'd0}};

assign shl_ln_fu_471_p3 = {{read_addr_fu_420_p3}, {6'd0}};

assign tmp_10_fu_706_p4 = {{ap_sig_allocacmp_elem_0_load[222:192]}};

assign tmp_11_fu_716_p4 = {{ap_sig_allocacmp_elem_0_load[254:224]}};

assign tmp_12_fu_726_p4 = {{ap_sig_allocacmp_elem_0_load[286:256]}};

assign tmp_13_fu_736_p4 = {{ap_sig_allocacmp_elem_0_load[318:288]}};

assign tmp_14_fu_746_p4 = {{ap_sig_allocacmp_elem_0_load[350:320]}};

assign tmp_15_fu_756_p4 = {{ap_sig_allocacmp_elem_0_load[382:352]}};

assign tmp_16_fu_766_p4 = {{ap_sig_allocacmp_elem_0_load[414:384]}};

assign tmp_17_fu_776_p4 = {{ap_sig_allocacmp_elem_0_load[446:416]}};

assign tmp_18_fu_786_p4 = {{ap_sig_allocacmp_elem_0_load[478:448]}};

assign tmp_19_fu_796_p4 = {{ap_sig_allocacmp_elem_0_load[510:480]}};

assign tmp_20_fu_883_p3 = p_Val2_1_fu_190[32'd5];

assign tmp_21_fu_891_p4 = {{p_Val2_1_fu_190[3:2]}};

assign tmp_2_nbwrite_fu_286_p3 = mem_read_addr_s_full_n;

assign tmp_3_fu_491_p3 = p_Val2_s_fu_186[32'd5];

assign tmp_4_fu_499_p4 = {{p_Val2_s_fu_186[3:2]}};

assign tmp_5_fu_686_p4 = {{ap_sig_allocacmp_elem_0_load[158:128]}};

assign tmp_6_fu_696_p4 = {{ap_sig_allocacmp_elem_0_load[190:160]}};

assign tmp_7_fu_656_p4 = {{ap_sig_allocacmp_elem_0_load[62:32]}};

assign tmp_8_nbreadreq_fu_313_p3 = mem_write_resp_s_empty_n;

assign tmp_9_fu_666_p4 = {{ap_sig_allocacmp_elem_0_load[94:64]}};

assign tmp_nbwritereq_fu_270_p3 = mem_write_addr_s_full_n;

assign tmp_s_fu_676_p4 = {{ap_sig_allocacmp_elem_0_load[126:96]}};

assign trunc_ln1497_1_fu_901_p1 = p_Val2_1_fu_190[0:0];

assign trunc_ln1497_fu_509_p1 = p_Val2_s_fu_186[0:0];

assign trunc_ln174_fu_652_p1 = ap_sig_allocacmp_elem_0_load[30:0];

assign trunc_ln79_fu_591_p1 = mem_read_data_s_dout[511:0];

assign trunc_ln89_1_fu_404_p1 = i_rd_req_fu_182[57:0];

assign trunc_ln89_fu_400_p1 = i_wr_req_fu_178[57:0];

assign write_addr_fu_436_p3 = ((random[0:0] == 1'b1) ? zext_ln100_fu_432_p1 : trunc_ln89_fu_400_p1);

assign write_read_reg_1082 = write_r;

assign xor_ln111_fu_565_p2 = (can_read_nbreadreq_fu_262_p3 ^ 1'd1);

assign zext_ln100_fu_432_p1 = ret_V_1_fu_427_p2;

assign zext_ln124_1_fu_975_p1 = add_ln124_fu_969_p2;

assign zext_ln124_fu_965_p1 = elem_val_fu_961_p1;

assign zext_ln1497_1_fu_919_p1 = ret_V_5_fu_905_p6;

assign zext_ln1497_fu_527_p1 = ret_V_4_fu_513_p6;

assign zext_ln99_fu_416_p1 = ret_V_fu_411_p2;

endmodule //Copy_Copy_Pipeline_VITIS_LOOP_93_2
