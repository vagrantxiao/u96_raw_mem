// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Stream2Mmap_Stream2Mmap,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu50-fsvh2104-2-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.430900,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=5217,HLS_SYN_LUT=8304,HLS_VERSION=2022_2}" *)

module Stream2Mmap (
        ap_clk,
        ap_rst_n,
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
        m_axi_mmap_RUSER,
        m_axi_mmap_RRESP,
        m_axi_mmap_BVALID,
        m_axi_mmap_BREADY,
        m_axi_mmap_BRESP,
        m_axi_mmap_BID,
        m_axi_mmap_BUSER,
        stream_s_dout,
        stream_s_empty_n,
        stream_s_read,
        stream_peek_dout,
        stream_peek_empty_n,
        stream_peek_read,
        mmap_offset,
        n
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;
parameter    C_M_AXI_MMAP_ID_WIDTH = 1;
parameter    C_M_AXI_MMAP_ADDR_WIDTH = 64;
parameter    C_M_AXI_MMAP_DATA_WIDTH = 512;
parameter    C_M_AXI_MMAP_AWUSER_WIDTH = 1;
parameter    C_M_AXI_MMAP_ARUSER_WIDTH = 1;
parameter    C_M_AXI_MMAP_WUSER_WIDTH = 1;
parameter    C_M_AXI_MMAP_RUSER_WIDTH = 1;
parameter    C_M_AXI_MMAP_BUSER_WIDTH = 1;
parameter    C_M_AXI_MMAP_USER_VALUE = 0;
parameter    C_M_AXI_MMAP_PROT_VALUE = 0;
parameter    C_M_AXI_MMAP_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;

parameter C_M_AXI_MMAP_WSTRB_WIDTH = (512 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_mmap_AWVALID;
input   m_axi_mmap_AWREADY;
output  [C_M_AXI_MMAP_ADDR_WIDTH - 1:0] m_axi_mmap_AWADDR;
output  [C_M_AXI_MMAP_ID_WIDTH - 1:0] m_axi_mmap_AWID;
output  [7:0] m_axi_mmap_AWLEN;
output  [2:0] m_axi_mmap_AWSIZE;
output  [1:0] m_axi_mmap_AWBURST;
output  [1:0] m_axi_mmap_AWLOCK;
output  [3:0] m_axi_mmap_AWCACHE;
output  [2:0] m_axi_mmap_AWPROT;
output  [3:0] m_axi_mmap_AWQOS;
output  [3:0] m_axi_mmap_AWREGION;
output  [C_M_AXI_MMAP_AWUSER_WIDTH - 1:0] m_axi_mmap_AWUSER;
output   m_axi_mmap_WVALID;
input   m_axi_mmap_WREADY;
output  [C_M_AXI_MMAP_DATA_WIDTH - 1:0] m_axi_mmap_WDATA;
output  [C_M_AXI_MMAP_WSTRB_WIDTH - 1:0] m_axi_mmap_WSTRB;
output   m_axi_mmap_WLAST;
output  [C_M_AXI_MMAP_ID_WIDTH - 1:0] m_axi_mmap_WID;
output  [C_M_AXI_MMAP_WUSER_WIDTH - 1:0] m_axi_mmap_WUSER;
output   m_axi_mmap_ARVALID;
input   m_axi_mmap_ARREADY;
output  [C_M_AXI_MMAP_ADDR_WIDTH - 1:0] m_axi_mmap_ARADDR;
output  [C_M_AXI_MMAP_ID_WIDTH - 1:0] m_axi_mmap_ARID;
output  [7:0] m_axi_mmap_ARLEN;
output  [2:0] m_axi_mmap_ARSIZE;
output  [1:0] m_axi_mmap_ARBURST;
output  [1:0] m_axi_mmap_ARLOCK;
output  [3:0] m_axi_mmap_ARCACHE;
output  [2:0] m_axi_mmap_ARPROT;
output  [3:0] m_axi_mmap_ARQOS;
output  [3:0] m_axi_mmap_ARREGION;
output  [C_M_AXI_MMAP_ARUSER_WIDTH - 1:0] m_axi_mmap_ARUSER;
input   m_axi_mmap_RVALID;
output   m_axi_mmap_RREADY;
input  [C_M_AXI_MMAP_DATA_WIDTH - 1:0] m_axi_mmap_RDATA;
input   m_axi_mmap_RLAST;
input  [C_M_AXI_MMAP_ID_WIDTH - 1:0] m_axi_mmap_RID;
input  [C_M_AXI_MMAP_RUSER_WIDTH - 1:0] m_axi_mmap_RUSER;
input  [1:0] m_axi_mmap_RRESP;
input   m_axi_mmap_BVALID;
output   m_axi_mmap_BREADY;
input  [1:0] m_axi_mmap_BRESP;
input  [C_M_AXI_MMAP_ID_WIDTH - 1:0] m_axi_mmap_BID;
input  [C_M_AXI_MMAP_BUSER_WIDTH - 1:0] m_axi_mmap_BUSER;
input  [512:0] stream_s_dout;
input   stream_s_empty_n;
output   stream_s_read;
input  [512:0] stream_peek_dout;
input   stream_peek_empty_n;
output   stream_peek_read;
input  [63:0] mmap_offset;
input  [63:0] n;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg stream_s_read;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    mmap_blk_n_AW;
reg    mmap_blk_n_B;
wire    ap_CS_fsm_state8;
wire  signed [57:0] trunc_ln37_1_fu_103_p4;
reg   [57:0] trunc_ln37_1_reg_134;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_start;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_done;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_idle;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_ready;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_stream_s_read;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWVALID;
wire   [63:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWADDR;
wire   [0:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWID;
wire   [31:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWLEN;
wire   [2:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWSIZE;
wire   [1:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWBURST;
wire   [1:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWLOCK;
wire   [3:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWCACHE;
wire   [2:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWPROT;
wire   [3:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWQOS;
wire   [3:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWREGION;
wire   [0:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWUSER;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WVALID;
wire   [511:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WDATA;
wire   [63:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WSTRB;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WLAST;
wire   [0:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WID;
wire   [0:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WUSER;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARVALID;
wire   [63:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARADDR;
wire   [0:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARID;
wire   [31:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARLEN;
wire   [2:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARSIZE;
wire   [1:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARBURST;
wire   [1:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARLOCK;
wire   [3:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARCACHE;
wire   [2:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARPROT;
wire   [3:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARQOS;
wire   [3:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARREGION;
wire   [0:0] grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARUSER;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_RREADY;
wire    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_BREADY;
reg    mmap_AWVALID;
wire    mmap_AWREADY;
reg   [63:0] mmap_AWADDR;
reg   [31:0] mmap_AWLEN;
reg    mmap_WVALID;
wire    mmap_WREADY;
wire    mmap_ARREADY;
wire    mmap_RVALID;
wire   [511:0] mmap_RDATA;
wire   [8:0] mmap_RFIFONUM;
wire    mmap_BVALID;
reg    mmap_BREADY;
reg    grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_start_reg;
reg   [7:0] ap_NS_fsm;
wire    ap_NS_fsm_state2;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire  signed [63:0] sext_ln37_fu_113_p1;
wire   [31:0] trunc_ln37_fu_124_p1;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_start_reg = 1'b0;
end

Stream2Mmap_Stream2Mmap_Pipeline_VITIS_LOOP_37_1 grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_start),
    .ap_done(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_done),
    .ap_idle(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_idle),
    .ap_ready(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_ready),
    .stream_s_dout(stream_s_dout),
    .stream_s_empty_n(stream_s_empty_n),
    .stream_s_read(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_stream_s_read),
    .m_axi_mmap_AWVALID(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWVALID),
    .m_axi_mmap_AWREADY(mmap_AWREADY),
    .m_axi_mmap_AWADDR(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWADDR),
    .m_axi_mmap_AWID(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWID),
    .m_axi_mmap_AWLEN(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWLEN),
    .m_axi_mmap_AWSIZE(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWSIZE),
    .m_axi_mmap_AWBURST(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWBURST),
    .m_axi_mmap_AWLOCK(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWLOCK),
    .m_axi_mmap_AWCACHE(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWCACHE),
    .m_axi_mmap_AWPROT(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWPROT),
    .m_axi_mmap_AWQOS(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWQOS),
    .m_axi_mmap_AWREGION(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWREGION),
    .m_axi_mmap_AWUSER(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWUSER),
    .m_axi_mmap_WVALID(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WVALID),
    .m_axi_mmap_WREADY(mmap_WREADY),
    .m_axi_mmap_WDATA(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WDATA),
    .m_axi_mmap_WSTRB(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WSTRB),
    .m_axi_mmap_WLAST(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WLAST),
    .m_axi_mmap_WID(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WID),
    .m_axi_mmap_WUSER(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WUSER),
    .m_axi_mmap_ARVALID(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARVALID),
    .m_axi_mmap_ARREADY(1'b0),
    .m_axi_mmap_ARADDR(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARADDR),
    .m_axi_mmap_ARID(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARID),
    .m_axi_mmap_ARLEN(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARLEN),
    .m_axi_mmap_ARSIZE(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARSIZE),
    .m_axi_mmap_ARBURST(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARBURST),
    .m_axi_mmap_ARLOCK(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARLOCK),
    .m_axi_mmap_ARCACHE(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARCACHE),
    .m_axi_mmap_ARPROT(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARPROT),
    .m_axi_mmap_ARQOS(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARQOS),
    .m_axi_mmap_ARREGION(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARREGION),
    .m_axi_mmap_ARUSER(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_ARUSER),
    .m_axi_mmap_RVALID(1'b0),
    .m_axi_mmap_RREADY(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_RREADY),
    .m_axi_mmap_RDATA(512'd0),
    .m_axi_mmap_RLAST(1'b0),
    .m_axi_mmap_RID(1'd0),
    .m_axi_mmap_RFIFONUM(9'd0),
    .m_axi_mmap_RUSER(1'd0),
    .m_axi_mmap_RRESP(2'd0),
    .m_axi_mmap_BVALID(mmap_BVALID),
    .m_axi_mmap_BREADY(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_BREADY),
    .m_axi_mmap_BRESP(2'd0),
    .m_axi_mmap_BID(1'd0),
    .m_axi_mmap_BUSER(1'd0),
    .sext_ln37(trunc_ln37_1_reg_134),
    .n(n)
);

Stream2Mmap_mmap_m_axi #(
    .CONSERVATIVE( 1 ),
    .USER_MAXREQS( 5 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_MMAP_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_MMAP_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_MMAP_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_MMAP_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_MMAP_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_MMAP_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_MMAP_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_MMAP_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_MMAP_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_MMAP_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_MMAP_CACHE_VALUE ),
    .USER_RFIFONUM_WIDTH( 9 ),
    .USER_DW( 512 ),
    .USER_AW( 64 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ))
mmap_m_axi_U(
    .AWVALID(m_axi_mmap_AWVALID),
    .AWREADY(m_axi_mmap_AWREADY),
    .AWADDR(m_axi_mmap_AWADDR),
    .AWID(m_axi_mmap_AWID),
    .AWLEN(m_axi_mmap_AWLEN),
    .AWSIZE(m_axi_mmap_AWSIZE),
    .AWBURST(m_axi_mmap_AWBURST),
    .AWLOCK(m_axi_mmap_AWLOCK),
    .AWCACHE(m_axi_mmap_AWCACHE),
    .AWPROT(m_axi_mmap_AWPROT),
    .AWQOS(m_axi_mmap_AWQOS),
    .AWREGION(m_axi_mmap_AWREGION),
    .AWUSER(m_axi_mmap_AWUSER),
    .WVALID(m_axi_mmap_WVALID),
    .WREADY(m_axi_mmap_WREADY),
    .WDATA(m_axi_mmap_WDATA),
    .WSTRB(m_axi_mmap_WSTRB),
    .WLAST(m_axi_mmap_WLAST),
    .WID(m_axi_mmap_WID),
    .WUSER(m_axi_mmap_WUSER),
    .ARVALID(m_axi_mmap_ARVALID),
    .ARREADY(m_axi_mmap_ARREADY),
    .ARADDR(m_axi_mmap_ARADDR),
    .ARID(m_axi_mmap_ARID),
    .ARLEN(m_axi_mmap_ARLEN),
    .ARSIZE(m_axi_mmap_ARSIZE),
    .ARBURST(m_axi_mmap_ARBURST),
    .ARLOCK(m_axi_mmap_ARLOCK),
    .ARCACHE(m_axi_mmap_ARCACHE),
    .ARPROT(m_axi_mmap_ARPROT),
    .ARQOS(m_axi_mmap_ARQOS),
    .ARREGION(m_axi_mmap_ARREGION),
    .ARUSER(m_axi_mmap_ARUSER),
    .RVALID(m_axi_mmap_RVALID),
    .RREADY(m_axi_mmap_RREADY),
    .RDATA(m_axi_mmap_RDATA),
    .RLAST(m_axi_mmap_RLAST),
    .RID(m_axi_mmap_RID),
    .RUSER(m_axi_mmap_RUSER),
    .RRESP(m_axi_mmap_RRESP),
    .BVALID(m_axi_mmap_BVALID),
    .BREADY(m_axi_mmap_BREADY),
    .BRESP(m_axi_mmap_BRESP),
    .BID(m_axi_mmap_BID),
    .BUSER(m_axi_mmap_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(1'b0),
    .I_ARREADY(mmap_ARREADY),
    .I_ARADDR(64'd0),
    .I_ARLEN(32'd0),
    .I_RVALID(mmap_RVALID),
    .I_RREADY(1'b0),
    .I_RDATA(mmap_RDATA),
    .I_RFIFONUM(mmap_RFIFONUM),
    .I_AWVALID(mmap_AWVALID),
    .I_AWREADY(mmap_AWREADY),
    .I_AWADDR(mmap_AWADDR),
    .I_AWLEN(mmap_AWLEN),
    .I_WVALID(mmap_WVALID),
    .I_WREADY(mmap_WREADY),
    .I_WDATA(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WDATA),
    .I_WSTRB(grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WSTRB),
    .I_BVALID(mmap_BVALID),
    .I_BREADY(mmap_BREADY)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_NS_fsm_state2) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_start_reg <= 1'b1;
        end else if ((grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_ready == 1'b1)) begin
            grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        trunc_ln37_1_reg_134 <= {{mmap_offset[63:6]}};
    end
end

always @ (*) begin
    if (((mmap_AWREADY == 1'b0) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((mmap_BVALID == 1'b0)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if (((mmap_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((mmap_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((mmap_AWREADY == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        mmap_AWADDR = sext_ln37_fu_113_p1;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        mmap_AWADDR = grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWADDR;
    end else begin
        mmap_AWADDR = 'bx;
    end
end

always @ (*) begin
    if ((~((mmap_AWREADY == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        mmap_AWLEN = trunc_ln37_fu_124_p1;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        mmap_AWLEN = grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWLEN;
    end else begin
        mmap_AWLEN = 'bx;
    end
end

always @ (*) begin
    if ((~((mmap_AWREADY == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        mmap_AWVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        mmap_AWVALID = grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_AWVALID;
    end else begin
        mmap_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((mmap_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
        mmap_BREADY = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        mmap_BREADY = grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_BREADY;
    end else begin
        mmap_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        mmap_WVALID = grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_m_axi_mmap_WVALID;
    end else begin
        mmap_WVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        mmap_blk_n_AW = m_axi_mmap_AWREADY;
    end else begin
        mmap_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        mmap_blk_n_B = m_axi_mmap_BVALID;
    end else begin
        mmap_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        stream_s_read = grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_stream_s_read;
    end else begin
        stream_s_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((mmap_AWREADY == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if (((mmap_BVALID == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_NS_fsm_state2 = ap_NS_fsm[32'd1];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_start = grp_Stream2Mmap_Pipeline_VITIS_LOOP_37_1_fu_93_ap_start_reg;

assign sext_ln37_fu_113_p1 = trunc_ln37_1_fu_103_p4;

assign stream_peek_read = 1'b0;

assign trunc_ln37_1_fu_103_p4 = {{mmap_offset[63:6]}};

assign trunc_ln37_fu_124_p1 = n[31:0];

endmodule //Stream2Mmap
