// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Mmap2Stream_Mmap2Stream_Pipeline_VITIS_LOOP_32_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_mmap_AWVALID,
        m_axi_mmap_AWREADY,
        m_axi_mmap_AWADDR,
        m_axi_mmap_AWID,
        m_axi_mmap_AWLEN,
        m_axi_mmap_AWSIZE,
        m_axi_mmap_AWBURST,
        m_axi_mmap_AWLOCK,
        m_axi_mmap_AWCACHE,
        m_axi_mmap_AWPROT,
        m_axi_mmap_AWQOS,
        m_axi_mmap_AWREGION,
        m_axi_mmap_AWUSER,
        m_axi_mmap_WVALID,
        m_axi_mmap_WREADY,
        m_axi_mmap_WDATA,
        m_axi_mmap_WSTRB,
        m_axi_mmap_WLAST,
        m_axi_mmap_WID,
        m_axi_mmap_WUSER,
        m_axi_mmap_ARVALID,
        m_axi_mmap_ARREADY,
        m_axi_mmap_ARADDR,
        m_axi_mmap_ARID,
        m_axi_mmap_ARLEN,
        m_axi_mmap_ARSIZE,
        m_axi_mmap_ARBURST,
        m_axi_mmap_ARLOCK,
        m_axi_mmap_ARCACHE,
        m_axi_mmap_ARPROT,
        m_axi_mmap_ARQOS,
        m_axi_mmap_ARREGION,
        m_axi_mmap_ARUSER,
        m_axi_mmap_RVALID,
        m_axi_mmap_RREADY,
        m_axi_mmap_RDATA,
        m_axi_mmap_RLAST,
        m_axi_mmap_RID,
        m_axi_mmap_RFIFONUM,
        m_axi_mmap_RUSER,
        m_axi_mmap_RRESP,
        m_axi_mmap_BVALID,
        m_axi_mmap_BREADY,
        m_axi_mmap_BRESP,
        m_axi_mmap_BID,
        m_axi_mmap_BUSER,
        stream_din,
        stream_full_n,
        stream_write,
        sext_ln32,
        n
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_mmap_AWVALID;
input   m_axi_mmap_AWREADY;
output  [63:0] m_axi_mmap_AWADDR;
output  [0:0] m_axi_mmap_AWID;
output  [31:0] m_axi_mmap_AWLEN;
output  [2:0] m_axi_mmap_AWSIZE;
output  [1:0] m_axi_mmap_AWBURST;
output  [1:0] m_axi_mmap_AWLOCK;
output  [3:0] m_axi_mmap_AWCACHE;
output  [2:0] m_axi_mmap_AWPROT;
output  [3:0] m_axi_mmap_AWQOS;
output  [3:0] m_axi_mmap_AWREGION;
output  [0:0] m_axi_mmap_AWUSER;
output   m_axi_mmap_WVALID;
input   m_axi_mmap_WREADY;
output  [511:0] m_axi_mmap_WDATA;
output  [63:0] m_axi_mmap_WSTRB;
output   m_axi_mmap_WLAST;
output  [0:0] m_axi_mmap_WID;
output  [0:0] m_axi_mmap_WUSER;
output   m_axi_mmap_ARVALID;
input   m_axi_mmap_ARREADY;
output  [63:0] m_axi_mmap_ARADDR;
output  [0:0] m_axi_mmap_ARID;
output  [31:0] m_axi_mmap_ARLEN;
output  [2:0] m_axi_mmap_ARSIZE;
output  [1:0] m_axi_mmap_ARBURST;
output  [1:0] m_axi_mmap_ARLOCK;
output  [3:0] m_axi_mmap_ARCACHE;
output  [2:0] m_axi_mmap_ARPROT;
output  [3:0] m_axi_mmap_ARQOS;
output  [3:0] m_axi_mmap_ARREGION;
output  [0:0] m_axi_mmap_ARUSER;
input   m_axi_mmap_RVALID;
output   m_axi_mmap_RREADY;
input  [511:0] m_axi_mmap_RDATA;
input   m_axi_mmap_RLAST;
input  [0:0] m_axi_mmap_RID;
input  [8:0] m_axi_mmap_RFIFONUM;
input  [0:0] m_axi_mmap_RUSER;
input  [1:0] m_axi_mmap_RRESP;
input   m_axi_mmap_BVALID;
output   m_axi_mmap_BREADY;
input  [1:0] m_axi_mmap_BRESP;
input  [0:0] m_axi_mmap_BID;
input  [0:0] m_axi_mmap_BUSER;
output  [512:0] stream_din;
input   stream_full_n;
output   stream_write;
input  [57:0] sext_ln32;
input  [63:0] n;

reg ap_idle;
reg m_axi_mmap_RREADY;
reg stream_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] icmp_ln32_reg_141;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state4_pp0_stage0_iter3;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln32_fu_94_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    mmap_blk_n_R;
wire    ap_block_pp0_stage0;
reg    stream_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [511:0] mmap_addr_read_reg_145;
reg    ap_condition_exit_pp0_iter2_stage0;
reg   [63:0] i_fu_54;
wire   [63:0] i_2_fu_99_p2;
wire    ap_loop_init;
reg    ap_block_pp0_stage0_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

Mmap2Stream_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter2_stage0)) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_54 <= 64'd0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln32_fu_94_p2 == 1'd0))) begin
            i_fu_54 <= i_2_fu_99_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
        icmp_ln32_reg_141 <= icmp_ln32_fu_94_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln32_reg_141 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mmap_addr_read_reg_145 <= m_axi_mmap_RDATA;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln32_fu_94_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln32_reg_141 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter2_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter2_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln32_reg_141 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_mmap_RREADY = 1'b1;
    end else begin
        m_axi_mmap_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln32_reg_141 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        mmap_blk_n_R = m_axi_mmap_RVALID;
    end else begin
        mmap_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        stream_blk_n = stream_full_n;
    end else begin
        stream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        stream_write = 1'b1;
    end else begin
        stream_write = 1'b0;
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

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((icmp_ln32_reg_141 == 1'd0) & (m_axi_mmap_RVALID == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((stream_full_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((icmp_ln32_reg_141 == 1'd0) & (m_axi_mmap_RVALID == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((stream_full_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((icmp_ln32_reg_141 == 1'd0) & (m_axi_mmap_RVALID == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((stream_full_n == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((icmp_ln32_reg_141 == 1'd0) & (m_axi_mmap_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state4_pp0_stage0_iter3 = (stream_full_n == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign i_2_fu_99_p2 = (i_fu_54 + 64'd1);

assign icmp_ln32_fu_94_p2 = ((i_fu_54 == n) ? 1'b1 : 1'b0);

assign m_axi_mmap_ARADDR = 64'd0;

assign m_axi_mmap_ARBURST = 2'd0;

assign m_axi_mmap_ARCACHE = 4'd0;

assign m_axi_mmap_ARID = 1'd0;

assign m_axi_mmap_ARLEN = 32'd0;

assign m_axi_mmap_ARLOCK = 2'd0;

assign m_axi_mmap_ARPROT = 3'd0;

assign m_axi_mmap_ARQOS = 4'd0;

assign m_axi_mmap_ARREGION = 4'd0;

assign m_axi_mmap_ARSIZE = 3'd0;

assign m_axi_mmap_ARUSER = 1'd0;

assign m_axi_mmap_ARVALID = 1'b0;

assign m_axi_mmap_AWADDR = 64'd0;

assign m_axi_mmap_AWBURST = 2'd0;

assign m_axi_mmap_AWCACHE = 4'd0;

assign m_axi_mmap_AWID = 1'd0;

assign m_axi_mmap_AWLEN = 32'd0;

assign m_axi_mmap_AWLOCK = 2'd0;

assign m_axi_mmap_AWPROT = 3'd0;

assign m_axi_mmap_AWQOS = 4'd0;

assign m_axi_mmap_AWREGION = 4'd0;

assign m_axi_mmap_AWSIZE = 3'd0;

assign m_axi_mmap_AWUSER = 1'd0;

assign m_axi_mmap_AWVALID = 1'b0;

assign m_axi_mmap_BREADY = 1'b0;

assign m_axi_mmap_WDATA = 512'd0;

assign m_axi_mmap_WID = 1'd0;

assign m_axi_mmap_WLAST = 1'b0;

assign m_axi_mmap_WSTRB = 64'd0;

assign m_axi_mmap_WUSER = 1'd0;

assign m_axi_mmap_WVALID = 1'b0;

assign stream_din = {{1'd0}, {mmap_addr_read_reg_145}};

endmodule //Mmap2Stream_Mmap2Stream_Pipeline_VITIS_LOOP_32_1
