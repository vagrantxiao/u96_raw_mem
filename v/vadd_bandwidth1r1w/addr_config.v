`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO = "addr_config_addr_config,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu50-fsvh2104-2-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=246,HLS_SYN_LUT=424,HLS_VERSION=2022_2}" *)


module addr_config
(
  s_axi_control_AWVALID,
  s_axi_control_AWREADY,
  s_axi_control_AWADDR,
  s_axi_control_WVALID,
  s_axi_control_WREADY,
  s_axi_control_WDATA,
  s_axi_control_WSTRB,
  s_axi_control_ARVALID,
  s_axi_control_ARREADY,
  s_axi_control_ARADDR,
  s_axi_control_RVALID,
  s_axi_control_RREADY,
  s_axi_control_RDATA,
  s_axi_control_RRESP,
  s_axi_control_BVALID,
  s_axi_control_BREADY,
  s_axi_control_BRESP,
  ap_clk,
  ap_rst_n,
  interrupt,
  m_axi_rmem0_ARADDR,
  m_axi_rmem0_ARBURST,
  m_axi_rmem0_ARCACHE,
  m_axi_rmem0_ARID,
  m_axi_rmem0_ARLEN,
  m_axi_rmem0_ARLOCK,
  m_axi_rmem0_ARPROT,
  m_axi_rmem0_ARQOS,
  m_axi_rmem0_ARREADY,
  m_axi_rmem0_ARSIZE,
  m_axi_rmem0_ARVALID,
  m_axi_rmem0_AWADDR,
  m_axi_rmem0_AWBURST,
  m_axi_rmem0_AWCACHE,
  m_axi_rmem0_AWID,
  m_axi_rmem0_AWLEN,
  m_axi_rmem0_AWLOCK,
  m_axi_rmem0_AWPROT,
  m_axi_rmem0_AWQOS,
  m_axi_rmem0_AWREADY,
  m_axi_rmem0_AWSIZE,
  m_axi_rmem0_AWVALID,
  m_axi_rmem0_BID,
  m_axi_rmem0_BREADY,
  m_axi_rmem0_BRESP,
  m_axi_rmem0_BVALID,
  m_axi_rmem0_RDATA,
  m_axi_rmem0_RID,
  m_axi_rmem0_RLAST,
  m_axi_rmem0_RREADY,
  m_axi_rmem0_RRESP,
  m_axi_rmem0_RVALID,
  m_axi_rmem0_WDATA,
  m_axi_rmem0_WLAST,
  m_axi_rmem0_WREADY,
  m_axi_rmem0_WSTRB,
  m_axi_rmem0_WVALID,
  m_axi_rmem1_ARADDR,
  m_axi_rmem1_ARBURST,
  m_axi_rmem1_ARCACHE,
  m_axi_rmem1_ARID,
  m_axi_rmem1_ARLEN,
  m_axi_rmem1_ARLOCK,
  m_axi_rmem1_ARPROT,
  m_axi_rmem1_ARQOS,
  m_axi_rmem1_ARREADY,
  m_axi_rmem1_ARSIZE,
  m_axi_rmem1_ARVALID,
  m_axi_rmem1_AWADDR,
  m_axi_rmem1_AWBURST,
  m_axi_rmem1_AWCACHE,
  m_axi_rmem1_AWID,
  m_axi_rmem1_AWLEN,
  m_axi_rmem1_AWLOCK,
  m_axi_rmem1_AWPROT,
  m_axi_rmem1_AWQOS,
  m_axi_rmem1_AWREADY,
  m_axi_rmem1_AWSIZE,
  m_axi_rmem1_AWVALID,
  m_axi_rmem1_BID,
  m_axi_rmem1_BREADY,
  m_axi_rmem1_BRESP,
  m_axi_rmem1_BVALID,
  m_axi_rmem1_RDATA,
  m_axi_rmem1_RID,
  m_axi_rmem1_RLAST,
  m_axi_rmem1_RREADY,
  m_axi_rmem1_RRESP,
  m_axi_rmem1_RVALID,
  m_axi_rmem1_WDATA,
  m_axi_rmem1_WLAST,
  m_axi_rmem1_WREADY,
  m_axi_rmem1_WSTRB,
  m_axi_rmem1_WVALID
);

  parameter C_S_AXI_CONTROL_DATA_WIDTH = 32;
  parameter C_S_AXI_CONTROL_ADDR_WIDTH = 6;
  parameter C_S_AXI_DATA_WIDTH = 32;
  parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 32 / 8;
  parameter C_S_AXI_WSTRB_WIDTH = 32 / 8;
  (* RS_HS = "s_axi_control_AW.valid" *)input s_axi_control_AWVALID;
  (* RS_HS = "s_axi_control_AW.ready" *)output s_axi_control_AWREADY;
  (* RS_HS = "s_axi_control_AW.data" *)input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_AWADDR;
  (* RS_HS = "s_axi_control_W.valid" *)input s_axi_control_WVALID;
  (* RS_HS = "s_axi_control_W.ready" *)output s_axi_control_WREADY;
  (* RS_HS = "s_axi_control_W.data" *)input [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_WDATA;
  (* RS_HS = "s_axi_control_W.data" *)input [C_S_AXI_CONTROL_WSTRB_WIDTH-1:0] s_axi_control_WSTRB;
  (* RS_HS = "s_axi_control_AR.valid" *)input s_axi_control_ARVALID;
  (* RS_HS = "s_axi_control_AR.ready" *)output s_axi_control_ARREADY;
  (* RS_HS = "s_axi_control_AR.data" *)input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_ARADDR;
  (* RS_HS = "s_axi_control_R.valid" *)output s_axi_control_RVALID;
  (* RS_HS = "s_axi_control_R.ready" *)input s_axi_control_RREADY;
  (* RS_HS = "s_axi_control_R.data" *)output [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_RDATA;
  (* RS_HS = "s_axi_control_R.data" *)output [1:0] s_axi_control_RRESP;
  (* RS_HS = "s_axi_control_B.valid" *)output s_axi_control_BVALID;
  (* RS_HS = "s_axi_control_B.ready" *)input s_axi_control_BREADY;
  (* RS_HS = "s_axi_control_B.data" *)output [1:0] s_axi_control_BRESP;
  (* RS_CLK *)input ap_clk;
  (* RS_RST = "ff" *)input ap_rst_n;
  (* RS_FF = "interrupt" *)output interrupt;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [63:0] m_axi_rmem0_ARADDR;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [1:0] m_axi_rmem0_ARBURST;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [3:0] m_axi_rmem0_ARCACHE;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [1:0] m_axi_rmem0_ARID;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [7:0] m_axi_rmem0_ARLEN;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output m_axi_rmem0_ARLOCK;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [2:0] m_axi_rmem0_ARPROT;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [3:0] m_axi_rmem0_ARQOS;
  (* RS_HS = "m_axi_rmem0_AR.ready" *)input m_axi_rmem0_ARREADY;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [2:0] m_axi_rmem0_ARSIZE;
  (* RS_HS = "m_axi_rmem0_AR.valid" *)output m_axi_rmem0_ARVALID;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [63:0] m_axi_rmem0_AWADDR;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [1:0] m_axi_rmem0_AWBURST;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [3:0] m_axi_rmem0_AWCACHE;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [1:0] m_axi_rmem0_AWID;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [7:0] m_axi_rmem0_AWLEN;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output m_axi_rmem0_AWLOCK;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [2:0] m_axi_rmem0_AWPROT;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [3:0] m_axi_rmem0_AWQOS;
  (* RS_HS = "m_axi_rmem0_AW.ready" *)input m_axi_rmem0_AWREADY;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [2:0] m_axi_rmem0_AWSIZE;
  (* RS_HS = "m_axi_rmem0_AW.valid" *)output m_axi_rmem0_AWVALID;
  (* RS_HS = "m_axi_rmem0_B.data" *)input [1:0] m_axi_rmem0_BID;
  (* RS_HS = "m_axi_rmem0_B.ready" *)output m_axi_rmem0_BREADY;
  (* RS_HS = "m_axi_rmem0_B.data" *)input [1:0] m_axi_rmem0_BRESP;
  (* RS_HS = "m_axi_rmem0_B.valid" *)input m_axi_rmem0_BVALID;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [511:0] m_axi_rmem0_RDATA;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [1:0] m_axi_rmem0_RID;
  (* RS_HS = "m_axi_rmem0_R.data" *)input m_axi_rmem0_RLAST;
  (* RS_HS = "m_axi_rmem0_R.ready" *)output m_axi_rmem0_RREADY;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [1:0] m_axi_rmem0_RRESP;
  (* RS_HS = "m_axi_rmem0_R.valid" *)input m_axi_rmem0_RVALID;
  (* RS_HS = "m_axi_rmem0_W.data" *)output [511:0] m_axi_rmem0_WDATA;
  (* RS_HS = "m_axi_rmem0_W.data" *)output m_axi_rmem0_WLAST;
  (* RS_HS = "m_axi_rmem0_W.ready" *)input m_axi_rmem0_WREADY;
  (* RS_HS = "m_axi_rmem0_W.data" *)output [63:0] m_axi_rmem0_WSTRB;
  (* RS_HS = "m_axi_rmem0_W.valid" *)output m_axi_rmem0_WVALID;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [63:0] m_axi_rmem1_ARADDR;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [1:0] m_axi_rmem1_ARBURST;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [3:0] m_axi_rmem1_ARCACHE;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [1:0] m_axi_rmem1_ARID;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [7:0] m_axi_rmem1_ARLEN;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output m_axi_rmem1_ARLOCK;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [2:0] m_axi_rmem1_ARPROT;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [3:0] m_axi_rmem1_ARQOS;
  (* RS_HS = "m_axi_rmem1_AR.ready" *)input m_axi_rmem1_ARREADY;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [2:0] m_axi_rmem1_ARSIZE;
  (* RS_HS = "m_axi_rmem1_AR.valid" *)output m_axi_rmem1_ARVALID;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [63:0] m_axi_rmem1_AWADDR;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [1:0] m_axi_rmem1_AWBURST;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [3:0] m_axi_rmem1_AWCACHE;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [1:0] m_axi_rmem1_AWID;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [7:0] m_axi_rmem1_AWLEN;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output m_axi_rmem1_AWLOCK;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [2:0] m_axi_rmem1_AWPROT;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [3:0] m_axi_rmem1_AWQOS;
  (* RS_HS = "m_axi_rmem1_AW.ready" *)input m_axi_rmem1_AWREADY;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [2:0] m_axi_rmem1_AWSIZE;
  (* RS_HS = "m_axi_rmem1_AW.valid" *)output m_axi_rmem1_AWVALID;
  (* RS_HS = "m_axi_rmem1_B.data" *)input [1:0] m_axi_rmem1_BID;
  (* RS_HS = "m_axi_rmem1_B.ready" *)output m_axi_rmem1_BREADY;
  (* RS_HS = "m_axi_rmem1_B.data" *)input [1:0] m_axi_rmem1_BRESP;
  (* RS_HS = "m_axi_rmem1_B.valid" *)input m_axi_rmem1_BVALID;
  (* RS_HS = "m_axi_rmem1_R.data" *)input [511:0] m_axi_rmem1_RDATA;
  (* RS_HS = "m_axi_rmem1_R.data" *)input [1:0] m_axi_rmem1_RID;
  (* RS_HS = "m_axi_rmem1_R.data" *)input m_axi_rmem1_RLAST;
  (* RS_HS = "m_axi_rmem1_R.ready" *)output m_axi_rmem1_RREADY;
  (* RS_HS = "m_axi_rmem1_R.data" *)input [1:0] m_axi_rmem1_RRESP;
  (* RS_HS = "m_axi_rmem1_R.valid" *)input m_axi_rmem1_RVALID;
  (* RS_HS = "m_axi_rmem1_W.data" *)output [511:0] m_axi_rmem1_WDATA;
  (* RS_HS = "m_axi_rmem1_W.data" *)output m_axi_rmem1_WLAST;
  (* RS_HS = "m_axi_rmem1_W.ready" *)input m_axi_rmem1_WREADY;
  (* RS_HS = "m_axi_rmem1_W.data" *)output [63:0] m_axi_rmem1_WSTRB;
  (* RS_HS = "m_axi_rmem1_W.valid" *)output m_axi_rmem1_WVALID;
  wire ap_start;
  wire [63:0] rmem0;
  wire [63:0] rmem1;
  wire [63:0] n;
  wire [512:0] qr0_addr_config__dout;
  wire qr0_addr_config__empty_n;
  wire qr0_addr_config__read;
  wire [512:0] qr0_addr_config__din;
  wire qr0_addr_config__full_n;
  wire qr0_addr_config__write;
  wire [512:0] qr1_addr_config__dout;
  wire qr1_addr_config__empty_n;
  wire qr1_addr_config__read;
  wire [512:0] qr1_addr_config__din;
  wire qr1_addr_config__full_n;
  wire qr1_addr_config__write;
  wire [512:0] qw0_addr_config__dout;
  wire qw0_addr_config__empty_n;
  wire qw0_addr_config__read;
  wire [512:0] qw0_addr_config__din;
  wire qw0_addr_config__full_n;
  wire qw0_addr_config__write;
  wire [512:0] qw1_addr_config__dout;
  wire qw1_addr_config__empty_n;
  wire qw1_addr_config__read;
  wire [512:0] qw1_addr_config__din;
  wire qw1_addr_config__full_n;
  wire qw1_addr_config__write;
  wire [63:0] m_axi_rmem0___Mmap2Stream_0___mmap_ARADDR;
  wire [1:0] m_axi_rmem0___Mmap2Stream_0___mmap_ARBURST;
  wire [3:0] m_axi_rmem0___Mmap2Stream_0___mmap_ARCACHE;
  wire [0:0] m_axi_rmem0___Mmap2Stream_0___mmap_ARID;
  wire [7:0] m_axi_rmem0___Mmap2Stream_0___mmap_ARLEN;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_ARLOCK;
  wire [2:0] m_axi_rmem0___Mmap2Stream_0___mmap_ARPROT;
  wire [3:0] m_axi_rmem0___Mmap2Stream_0___mmap_ARQOS;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_ARREADY;
  wire [2:0] m_axi_rmem0___Mmap2Stream_0___mmap_ARSIZE;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_ARVALID;
  wire [63:0] m_axi_rmem0___Mmap2Stream_0___mmap_AWADDR;
  wire [1:0] m_axi_rmem0___Mmap2Stream_0___mmap_AWBURST;
  wire [3:0] m_axi_rmem0___Mmap2Stream_0___mmap_AWCACHE;
  wire [0:0] m_axi_rmem0___Mmap2Stream_0___mmap_AWID;
  wire [7:0] m_axi_rmem0___Mmap2Stream_0___mmap_AWLEN;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_AWLOCK;
  wire [2:0] m_axi_rmem0___Mmap2Stream_0___mmap_AWPROT;
  wire [3:0] m_axi_rmem0___Mmap2Stream_0___mmap_AWQOS;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_AWREADY;
  wire [2:0] m_axi_rmem0___Mmap2Stream_0___mmap_AWSIZE;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_AWVALID;
  wire [0:0] m_axi_rmem0___Mmap2Stream_0___mmap_BID;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_BREADY;
  wire [1:0] m_axi_rmem0___Mmap2Stream_0___mmap_BRESP;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_BVALID;
  wire [511:0] m_axi_rmem0___Mmap2Stream_0___mmap_RDATA;
  wire [0:0] m_axi_rmem0___Mmap2Stream_0___mmap_RID;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_RLAST;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_RREADY;
  wire [1:0] m_axi_rmem0___Mmap2Stream_0___mmap_RRESP;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_RVALID;
  wire [511:0] m_axi_rmem0___Mmap2Stream_0___mmap_WDATA;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_WLAST;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_WREADY;
  wire [63:0] m_axi_rmem0___Mmap2Stream_0___mmap_WSTRB;
  wire m_axi_rmem0___Mmap2Stream_0___mmap_WVALID;
  wire [63:0] m_axi_rmem0___Stream2Mmap_0___mmap_ARADDR;
  wire [1:0] m_axi_rmem0___Stream2Mmap_0___mmap_ARBURST;
  wire [3:0] m_axi_rmem0___Stream2Mmap_0___mmap_ARCACHE;
  wire [0:0] m_axi_rmem0___Stream2Mmap_0___mmap_ARID;
  wire [7:0] m_axi_rmem0___Stream2Mmap_0___mmap_ARLEN;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_ARLOCK;
  wire [2:0] m_axi_rmem0___Stream2Mmap_0___mmap_ARPROT;
  wire [3:0] m_axi_rmem0___Stream2Mmap_0___mmap_ARQOS;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_ARREADY;
  wire [2:0] m_axi_rmem0___Stream2Mmap_0___mmap_ARSIZE;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_ARVALID;
  wire [63:0] m_axi_rmem0___Stream2Mmap_0___mmap_AWADDR;
  wire [1:0] m_axi_rmem0___Stream2Mmap_0___mmap_AWBURST;
  wire [3:0] m_axi_rmem0___Stream2Mmap_0___mmap_AWCACHE;
  wire [0:0] m_axi_rmem0___Stream2Mmap_0___mmap_AWID;
  wire [7:0] m_axi_rmem0___Stream2Mmap_0___mmap_AWLEN;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_AWLOCK;
  wire [2:0] m_axi_rmem0___Stream2Mmap_0___mmap_AWPROT;
  wire [3:0] m_axi_rmem0___Stream2Mmap_0___mmap_AWQOS;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_AWREADY;
  wire [2:0] m_axi_rmem0___Stream2Mmap_0___mmap_AWSIZE;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_AWVALID;
  wire [0:0] m_axi_rmem0___Stream2Mmap_0___mmap_BID;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_BREADY;
  wire [1:0] m_axi_rmem0___Stream2Mmap_0___mmap_BRESP;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_BVALID;
  wire [511:0] m_axi_rmem0___Stream2Mmap_0___mmap_RDATA;
  wire [0:0] m_axi_rmem0___Stream2Mmap_0___mmap_RID;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_RLAST;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_RREADY;
  wire [1:0] m_axi_rmem0___Stream2Mmap_0___mmap_RRESP;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_RVALID;
  wire [511:0] m_axi_rmem0___Stream2Mmap_0___mmap_WDATA;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_WLAST;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_WREADY;
  wire [63:0] m_axi_rmem0___Stream2Mmap_0___mmap_WSTRB;
  wire m_axi_rmem0___Stream2Mmap_0___mmap_WVALID;
  wire [63:0] m_axi_rmem1___Mmap2Stream_1___mmap_ARADDR;
  wire [1:0] m_axi_rmem1___Mmap2Stream_1___mmap_ARBURST;
  wire [3:0] m_axi_rmem1___Mmap2Stream_1___mmap_ARCACHE;
  wire [0:0] m_axi_rmem1___Mmap2Stream_1___mmap_ARID;
  wire [7:0] m_axi_rmem1___Mmap2Stream_1___mmap_ARLEN;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_ARLOCK;
  wire [2:0] m_axi_rmem1___Mmap2Stream_1___mmap_ARPROT;
  wire [3:0] m_axi_rmem1___Mmap2Stream_1___mmap_ARQOS;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_ARREADY;
  wire [2:0] m_axi_rmem1___Mmap2Stream_1___mmap_ARSIZE;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_ARVALID;
  wire [63:0] m_axi_rmem1___Mmap2Stream_1___mmap_AWADDR;
  wire [1:0] m_axi_rmem1___Mmap2Stream_1___mmap_AWBURST;
  wire [3:0] m_axi_rmem1___Mmap2Stream_1___mmap_AWCACHE;
  wire [0:0] m_axi_rmem1___Mmap2Stream_1___mmap_AWID;
  wire [7:0] m_axi_rmem1___Mmap2Stream_1___mmap_AWLEN;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_AWLOCK;
  wire [2:0] m_axi_rmem1___Mmap2Stream_1___mmap_AWPROT;
  wire [3:0] m_axi_rmem1___Mmap2Stream_1___mmap_AWQOS;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_AWREADY;
  wire [2:0] m_axi_rmem1___Mmap2Stream_1___mmap_AWSIZE;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_AWVALID;
  wire [0:0] m_axi_rmem1___Mmap2Stream_1___mmap_BID;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_BREADY;
  wire [1:0] m_axi_rmem1___Mmap2Stream_1___mmap_BRESP;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_BVALID;
  wire [511:0] m_axi_rmem1___Mmap2Stream_1___mmap_RDATA;
  wire [0:0] m_axi_rmem1___Mmap2Stream_1___mmap_RID;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_RLAST;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_RREADY;
  wire [1:0] m_axi_rmem1___Mmap2Stream_1___mmap_RRESP;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_RVALID;
  wire [511:0] m_axi_rmem1___Mmap2Stream_1___mmap_WDATA;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_WLAST;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_WREADY;
  wire [63:0] m_axi_rmem1___Mmap2Stream_1___mmap_WSTRB;
  wire m_axi_rmem1___Mmap2Stream_1___mmap_WVALID;
  wire [63:0] m_axi_rmem1___Stream2Mmap_1___mmap_ARADDR;
  wire [1:0] m_axi_rmem1___Stream2Mmap_1___mmap_ARBURST;
  wire [3:0] m_axi_rmem1___Stream2Mmap_1___mmap_ARCACHE;
  wire [0:0] m_axi_rmem1___Stream2Mmap_1___mmap_ARID;
  wire [7:0] m_axi_rmem1___Stream2Mmap_1___mmap_ARLEN;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_ARLOCK;
  wire [2:0] m_axi_rmem1___Stream2Mmap_1___mmap_ARPROT;
  wire [3:0] m_axi_rmem1___Stream2Mmap_1___mmap_ARQOS;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_ARREADY;
  wire [2:0] m_axi_rmem1___Stream2Mmap_1___mmap_ARSIZE;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_ARVALID;
  wire [63:0] m_axi_rmem1___Stream2Mmap_1___mmap_AWADDR;
  wire [1:0] m_axi_rmem1___Stream2Mmap_1___mmap_AWBURST;
  wire [3:0] m_axi_rmem1___Stream2Mmap_1___mmap_AWCACHE;
  wire [0:0] m_axi_rmem1___Stream2Mmap_1___mmap_AWID;
  wire [7:0] m_axi_rmem1___Stream2Mmap_1___mmap_AWLEN;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_AWLOCK;
  wire [2:0] m_axi_rmem1___Stream2Mmap_1___mmap_AWPROT;
  wire [3:0] m_axi_rmem1___Stream2Mmap_1___mmap_AWQOS;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_AWREADY;
  wire [2:0] m_axi_rmem1___Stream2Mmap_1___mmap_AWSIZE;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_AWVALID;
  wire [0:0] m_axi_rmem1___Stream2Mmap_1___mmap_BID;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_BREADY;
  wire [1:0] m_axi_rmem1___Stream2Mmap_1___mmap_BRESP;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_BVALID;
  wire [511:0] m_axi_rmem1___Stream2Mmap_1___mmap_RDATA;
  wire [0:0] m_axi_rmem1___Stream2Mmap_1___mmap_RID;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_RLAST;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_RREADY;
  wire [1:0] m_axi_rmem1___Stream2Mmap_1___mmap_RRESP;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_RVALID;
  wire [511:0] m_axi_rmem1___Stream2Mmap_1___mmap_WDATA;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_WLAST;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_WREADY;
  wire [63:0] m_axi_rmem1___Stream2Mmap_1___mmap_WSTRB;
  wire m_axi_rmem1___Stream2Mmap_1___mmap_WVALID;
  wire [63:0] Mmap2Stream_0___n__q0;
  wire [63:0] Mmap2Stream_0___rmem0__q0;
  wire Mmap2Stream_0__ap_start;
  wire Mmap2Stream_0__ap_ready;
  wire Mmap2Stream_0__ap_done;
  wire Mmap2Stream_0__ap_idle;
  wire [63:0] Mmap2Stream_1___n__q0;
  wire [63:0] Mmap2Stream_1___rmem1__q0;
  wire Mmap2Stream_1__ap_start;
  wire Mmap2Stream_1__ap_ready;
  wire Mmap2Stream_1__ap_done;
  wire Mmap2Stream_1__ap_idle;
  wire [63:0] Stream2Mmap_0___n__q0;
  wire [63:0] Stream2Mmap_0___rmem0__q0;
  wire Stream2Mmap_0__ap_start;
  wire Stream2Mmap_0__ap_ready;
  wire Stream2Mmap_0__ap_done;
  wire Stream2Mmap_0__ap_idle;
  wire [63:0] Stream2Mmap_1___n__q0;
  wire [63:0] Stream2Mmap_1___rmem1__q0;
  wire Stream2Mmap_1__ap_start;
  wire Stream2Mmap_1__ap_ready;
  wire Stream2Mmap_1__ap_done;
  wire Stream2Mmap_1__ap_idle;
  wire [63:0] yshift_0___n__q0;
  wire yshift_0__ap_start;
  wire yshift_0__ap_ready;
  wire yshift_0__ap_done;
  wire yshift_0__ap_idle;
  wire [63:0] yshift_1___n__q0;
  wire yshift_1__ap_start;
  wire yshift_1__ap_ready;
  wire yshift_1__ap_done;
  wire yshift_1__ap_idle;
  wire ap_rst_n_inv;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;

  addr_config_control_s_axi
  #(
    .C_S_AXI_ADDR_WIDTH(C_S_AXI_CONTROL_ADDR_WIDTH),
    .C_S_AXI_DATA_WIDTH(C_S_AXI_CONTROL_DATA_WIDTH)
  )
  control_s_axi_U
  (
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .rmem0(rmem0),
    .rmem1(rmem1),
    .n(n),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  qr0_addr_config
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(qr0_addr_config__dout),
    .if_empty_n(qr0_addr_config__empty_n),
    .if_read(qr0_addr_config__read),
    .if_read_ce(1'b1),
    .if_din(qr0_addr_config__din),
    .if_full_n(qr0_addr_config__full_n),
    .if_write(qr0_addr_config__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  qr1_addr_config
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(qr1_addr_config__dout),
    .if_empty_n(qr1_addr_config__empty_n),
    .if_read(qr1_addr_config__read),
    .if_read_ce(1'b1),
    .if_din(qr1_addr_config__din),
    .if_full_n(qr1_addr_config__full_n),
    .if_write(qr1_addr_config__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  qw0_addr_config
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(qw0_addr_config__dout),
    .if_empty_n(qw0_addr_config__empty_n),
    .if_read(qw0_addr_config__read),
    .if_read_ce(1'b1),
    .if_din(qw0_addr_config__din),
    .if_full_n(qw0_addr_config__full_n),
    .if_write(qw0_addr_config__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  qw1_addr_config
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(qw1_addr_config__dout),
    .if_empty_n(qw1_addr_config__empty_n),
    .if_read(qw1_addr_config__read),
    .if_read_ce(1'b1),
    .if_din(qw1_addr_config__din),
    .if_full_n(qw1_addr_config__full_n),
    .if_write(qw1_addr_config__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) axi_crossbar_2x1
  #(
    .DATA_WIDTH(512),
    .ADDR_WIDTH(64),
    .S_ID_WIDTH(1),
    .M_ID_WIDTH(2),
    .M00_ADDR_WIDTH(64),
    .M00_ISSUE(16),
    .S00_THREADS(1),
    .S01_THREADS(1)
  )
  axi_crossbar_2x1__rmem0
  (
    .clk(ap_clk),
    .rst(ap_rst_n_inv),
    .m00_axi_araddr(m_axi_rmem0_ARADDR),
    .m00_axi_arburst(m_axi_rmem0_ARBURST),
    .m00_axi_arcache(m_axi_rmem0_ARCACHE),
    .m00_axi_arid(m_axi_rmem0_ARID),
    .m00_axi_arlen(m_axi_rmem0_ARLEN),
    .m00_axi_arlock(m_axi_rmem0_ARLOCK),
    .m00_axi_arprot(m_axi_rmem0_ARPROT),
    .m00_axi_arqos(m_axi_rmem0_ARQOS),
    .m00_axi_arready(m_axi_rmem0_ARREADY),
    .m00_axi_arsize(m_axi_rmem0_ARSIZE),
    .m00_axi_arvalid(m_axi_rmem0_ARVALID),
    .m00_axi_awaddr(m_axi_rmem0_AWADDR),
    .m00_axi_awburst(m_axi_rmem0_AWBURST),
    .m00_axi_awcache(m_axi_rmem0_AWCACHE),
    .m00_axi_awid(m_axi_rmem0_AWID),
    .m00_axi_awlen(m_axi_rmem0_AWLEN),
    .m00_axi_awlock(m_axi_rmem0_AWLOCK),
    .m00_axi_awprot(m_axi_rmem0_AWPROT),
    .m00_axi_awqos(m_axi_rmem0_AWQOS),
    .m00_axi_awready(m_axi_rmem0_AWREADY),
    .m00_axi_awsize(m_axi_rmem0_AWSIZE),
    .m00_axi_awvalid(m_axi_rmem0_AWVALID),
    .m00_axi_bid(m_axi_rmem0_BID),
    .m00_axi_bready(m_axi_rmem0_BREADY),
    .m00_axi_bresp(m_axi_rmem0_BRESP),
    .m00_axi_bvalid(m_axi_rmem0_BVALID),
    .m00_axi_rdata(m_axi_rmem0_RDATA),
    .m00_axi_rid(m_axi_rmem0_RID),
    .m00_axi_rlast(m_axi_rmem0_RLAST),
    .m00_axi_rready(m_axi_rmem0_RREADY),
    .m00_axi_rresp(m_axi_rmem0_RRESP),
    .m00_axi_rvalid(m_axi_rmem0_RVALID),
    .m00_axi_wdata(m_axi_rmem0_WDATA),
    .m00_axi_wlast(m_axi_rmem0_WLAST),
    .m00_axi_wready(m_axi_rmem0_WREADY),
    .m00_axi_wstrb(m_axi_rmem0_WSTRB),
    .m00_axi_wvalid(m_axi_rmem0_WVALID),
    .s00_axi_araddr(m_axi_rmem0___Mmap2Stream_0___mmap_ARADDR),
    .s00_axi_arburst(m_axi_rmem0___Mmap2Stream_0___mmap_ARBURST),
    .s00_axi_arcache(m_axi_rmem0___Mmap2Stream_0___mmap_ARCACHE),
    .s00_axi_arid(m_axi_rmem0___Mmap2Stream_0___mmap_ARID),
    .s00_axi_arlen(m_axi_rmem0___Mmap2Stream_0___mmap_ARLEN),
    .s00_axi_arlock(m_axi_rmem0___Mmap2Stream_0___mmap_ARLOCK),
    .s00_axi_arprot(m_axi_rmem0___Mmap2Stream_0___mmap_ARPROT),
    .s00_axi_arqos(m_axi_rmem0___Mmap2Stream_0___mmap_ARQOS),
    .s00_axi_arready(m_axi_rmem0___Mmap2Stream_0___mmap_ARREADY),
    .s00_axi_arsize(m_axi_rmem0___Mmap2Stream_0___mmap_ARSIZE),
    .s00_axi_arvalid(m_axi_rmem0___Mmap2Stream_0___mmap_ARVALID),
    .s00_axi_awaddr(m_axi_rmem0___Mmap2Stream_0___mmap_AWADDR),
    .s00_axi_awburst(m_axi_rmem0___Mmap2Stream_0___mmap_AWBURST),
    .s00_axi_awcache(m_axi_rmem0___Mmap2Stream_0___mmap_AWCACHE),
    .s00_axi_awid(m_axi_rmem0___Mmap2Stream_0___mmap_AWID),
    .s00_axi_awlen(m_axi_rmem0___Mmap2Stream_0___mmap_AWLEN),
    .s00_axi_awlock(m_axi_rmem0___Mmap2Stream_0___mmap_AWLOCK),
    .s00_axi_awprot(m_axi_rmem0___Mmap2Stream_0___mmap_AWPROT),
    .s00_axi_awqos(m_axi_rmem0___Mmap2Stream_0___mmap_AWQOS),
    .s00_axi_awready(m_axi_rmem0___Mmap2Stream_0___mmap_AWREADY),
    .s00_axi_awsize(m_axi_rmem0___Mmap2Stream_0___mmap_AWSIZE),
    .s00_axi_awvalid(m_axi_rmem0___Mmap2Stream_0___mmap_AWVALID),
    .s00_axi_bid(m_axi_rmem0___Mmap2Stream_0___mmap_BID),
    .s00_axi_bready(m_axi_rmem0___Mmap2Stream_0___mmap_BREADY),
    .s00_axi_bresp(m_axi_rmem0___Mmap2Stream_0___mmap_BRESP),
    .s00_axi_bvalid(m_axi_rmem0___Mmap2Stream_0___mmap_BVALID),
    .s00_axi_rdata(m_axi_rmem0___Mmap2Stream_0___mmap_RDATA),
    .s00_axi_rid(m_axi_rmem0___Mmap2Stream_0___mmap_RID),
    .s00_axi_rlast(m_axi_rmem0___Mmap2Stream_0___mmap_RLAST),
    .s00_axi_rready(m_axi_rmem0___Mmap2Stream_0___mmap_RREADY),
    .s00_axi_rresp(m_axi_rmem0___Mmap2Stream_0___mmap_RRESP),
    .s00_axi_rvalid(m_axi_rmem0___Mmap2Stream_0___mmap_RVALID),
    .s00_axi_wdata(m_axi_rmem0___Mmap2Stream_0___mmap_WDATA),
    .s00_axi_wlast(m_axi_rmem0___Mmap2Stream_0___mmap_WLAST),
    .s00_axi_wready(m_axi_rmem0___Mmap2Stream_0___mmap_WREADY),
    .s00_axi_wstrb(m_axi_rmem0___Mmap2Stream_0___mmap_WSTRB),
    .s00_axi_wvalid(m_axi_rmem0___Mmap2Stream_0___mmap_WVALID),
    .s01_axi_araddr(m_axi_rmem0___Stream2Mmap_0___mmap_ARADDR),
    .s01_axi_arburst(m_axi_rmem0___Stream2Mmap_0___mmap_ARBURST),
    .s01_axi_arcache(m_axi_rmem0___Stream2Mmap_0___mmap_ARCACHE),
    .s01_axi_arid(m_axi_rmem0___Stream2Mmap_0___mmap_ARID),
    .s01_axi_arlen(m_axi_rmem0___Stream2Mmap_0___mmap_ARLEN),
    .s01_axi_arlock(m_axi_rmem0___Stream2Mmap_0___mmap_ARLOCK),
    .s01_axi_arprot(m_axi_rmem0___Stream2Mmap_0___mmap_ARPROT),
    .s01_axi_arqos(m_axi_rmem0___Stream2Mmap_0___mmap_ARQOS),
    .s01_axi_arready(m_axi_rmem0___Stream2Mmap_0___mmap_ARREADY),
    .s01_axi_arsize(m_axi_rmem0___Stream2Mmap_0___mmap_ARSIZE),
    .s01_axi_arvalid(m_axi_rmem0___Stream2Mmap_0___mmap_ARVALID),
    .s01_axi_awaddr(m_axi_rmem0___Stream2Mmap_0___mmap_AWADDR),
    .s01_axi_awburst(m_axi_rmem0___Stream2Mmap_0___mmap_AWBURST),
    .s01_axi_awcache(m_axi_rmem0___Stream2Mmap_0___mmap_AWCACHE),
    .s01_axi_awid(m_axi_rmem0___Stream2Mmap_0___mmap_AWID),
    .s01_axi_awlen(m_axi_rmem0___Stream2Mmap_0___mmap_AWLEN),
    .s01_axi_awlock(m_axi_rmem0___Stream2Mmap_0___mmap_AWLOCK),
    .s01_axi_awprot(m_axi_rmem0___Stream2Mmap_0___mmap_AWPROT),
    .s01_axi_awqos(m_axi_rmem0___Stream2Mmap_0___mmap_AWQOS),
    .s01_axi_awready(m_axi_rmem0___Stream2Mmap_0___mmap_AWREADY),
    .s01_axi_awsize(m_axi_rmem0___Stream2Mmap_0___mmap_AWSIZE),
    .s01_axi_awvalid(m_axi_rmem0___Stream2Mmap_0___mmap_AWVALID),
    .s01_axi_bid(m_axi_rmem0___Stream2Mmap_0___mmap_BID),
    .s01_axi_bready(m_axi_rmem0___Stream2Mmap_0___mmap_BREADY),
    .s01_axi_bresp(m_axi_rmem0___Stream2Mmap_0___mmap_BRESP),
    .s01_axi_bvalid(m_axi_rmem0___Stream2Mmap_0___mmap_BVALID),
    .s01_axi_rdata(m_axi_rmem0___Stream2Mmap_0___mmap_RDATA),
    .s01_axi_rid(m_axi_rmem0___Stream2Mmap_0___mmap_RID),
    .s01_axi_rlast(m_axi_rmem0___Stream2Mmap_0___mmap_RLAST),
    .s01_axi_rready(m_axi_rmem0___Stream2Mmap_0___mmap_RREADY),
    .s01_axi_rresp(m_axi_rmem0___Stream2Mmap_0___mmap_RRESP),
    .s01_axi_rvalid(m_axi_rmem0___Stream2Mmap_0___mmap_RVALID),
    .s01_axi_wdata(m_axi_rmem0___Stream2Mmap_0___mmap_WDATA),
    .s01_axi_wlast(m_axi_rmem0___Stream2Mmap_0___mmap_WLAST),
    .s01_axi_wready(m_axi_rmem0___Stream2Mmap_0___mmap_WREADY),
    .s01_axi_wstrb(m_axi_rmem0___Stream2Mmap_0___mmap_WSTRB),
    .s01_axi_wvalid(m_axi_rmem0___Stream2Mmap_0___mmap_WVALID)
  );


  (* keep_hierarchy = "yes" *) axi_crossbar_2x1
  #(
    .DATA_WIDTH(512),
    .ADDR_WIDTH(64),
    .S_ID_WIDTH(1),
    .M_ID_WIDTH(2),
    .M00_ADDR_WIDTH(64),
    .M00_ISSUE(16),
    .S00_THREADS(1),
    .S01_THREADS(1)
  )
  axi_crossbar_2x1__rmem1
  (
    .clk(ap_clk),
    .rst(ap_rst_n_inv),
    .m00_axi_araddr(m_axi_rmem1_ARADDR),
    .m00_axi_arburst(m_axi_rmem1_ARBURST),
    .m00_axi_arcache(m_axi_rmem1_ARCACHE),
    .m00_axi_arid(m_axi_rmem1_ARID),
    .m00_axi_arlen(m_axi_rmem1_ARLEN),
    .m00_axi_arlock(m_axi_rmem1_ARLOCK),
    .m00_axi_arprot(m_axi_rmem1_ARPROT),
    .m00_axi_arqos(m_axi_rmem1_ARQOS),
    .m00_axi_arready(m_axi_rmem1_ARREADY),
    .m00_axi_arsize(m_axi_rmem1_ARSIZE),
    .m00_axi_arvalid(m_axi_rmem1_ARVALID),
    .m00_axi_awaddr(m_axi_rmem1_AWADDR),
    .m00_axi_awburst(m_axi_rmem1_AWBURST),
    .m00_axi_awcache(m_axi_rmem1_AWCACHE),
    .m00_axi_awid(m_axi_rmem1_AWID),
    .m00_axi_awlen(m_axi_rmem1_AWLEN),
    .m00_axi_awlock(m_axi_rmem1_AWLOCK),
    .m00_axi_awprot(m_axi_rmem1_AWPROT),
    .m00_axi_awqos(m_axi_rmem1_AWQOS),
    .m00_axi_awready(m_axi_rmem1_AWREADY),
    .m00_axi_awsize(m_axi_rmem1_AWSIZE),
    .m00_axi_awvalid(m_axi_rmem1_AWVALID),
    .m00_axi_bid(m_axi_rmem1_BID),
    .m00_axi_bready(m_axi_rmem1_BREADY),
    .m00_axi_bresp(m_axi_rmem1_BRESP),
    .m00_axi_bvalid(m_axi_rmem1_BVALID),
    .m00_axi_rdata(m_axi_rmem1_RDATA),
    .m00_axi_rid(m_axi_rmem1_RID),
    .m00_axi_rlast(m_axi_rmem1_RLAST),
    .m00_axi_rready(m_axi_rmem1_RREADY),
    .m00_axi_rresp(m_axi_rmem1_RRESP),
    .m00_axi_rvalid(m_axi_rmem1_RVALID),
    .m00_axi_wdata(m_axi_rmem1_WDATA),
    .m00_axi_wlast(m_axi_rmem1_WLAST),
    .m00_axi_wready(m_axi_rmem1_WREADY),
    .m00_axi_wstrb(m_axi_rmem1_WSTRB),
    .m00_axi_wvalid(m_axi_rmem1_WVALID),
    .s00_axi_araddr(m_axi_rmem1___Mmap2Stream_1___mmap_ARADDR),
    .s00_axi_arburst(m_axi_rmem1___Mmap2Stream_1___mmap_ARBURST),
    .s00_axi_arcache(m_axi_rmem1___Mmap2Stream_1___mmap_ARCACHE),
    .s00_axi_arid(m_axi_rmem1___Mmap2Stream_1___mmap_ARID),
    .s00_axi_arlen(m_axi_rmem1___Mmap2Stream_1___mmap_ARLEN),
    .s00_axi_arlock(m_axi_rmem1___Mmap2Stream_1___mmap_ARLOCK),
    .s00_axi_arprot(m_axi_rmem1___Mmap2Stream_1___mmap_ARPROT),
    .s00_axi_arqos(m_axi_rmem1___Mmap2Stream_1___mmap_ARQOS),
    .s00_axi_arready(m_axi_rmem1___Mmap2Stream_1___mmap_ARREADY),
    .s00_axi_arsize(m_axi_rmem1___Mmap2Stream_1___mmap_ARSIZE),
    .s00_axi_arvalid(m_axi_rmem1___Mmap2Stream_1___mmap_ARVALID),
    .s00_axi_awaddr(m_axi_rmem1___Mmap2Stream_1___mmap_AWADDR),
    .s00_axi_awburst(m_axi_rmem1___Mmap2Stream_1___mmap_AWBURST),
    .s00_axi_awcache(m_axi_rmem1___Mmap2Stream_1___mmap_AWCACHE),
    .s00_axi_awid(m_axi_rmem1___Mmap2Stream_1___mmap_AWID),
    .s00_axi_awlen(m_axi_rmem1___Mmap2Stream_1___mmap_AWLEN),
    .s00_axi_awlock(m_axi_rmem1___Mmap2Stream_1___mmap_AWLOCK),
    .s00_axi_awprot(m_axi_rmem1___Mmap2Stream_1___mmap_AWPROT),
    .s00_axi_awqos(m_axi_rmem1___Mmap2Stream_1___mmap_AWQOS),
    .s00_axi_awready(m_axi_rmem1___Mmap2Stream_1___mmap_AWREADY),
    .s00_axi_awsize(m_axi_rmem1___Mmap2Stream_1___mmap_AWSIZE),
    .s00_axi_awvalid(m_axi_rmem1___Mmap2Stream_1___mmap_AWVALID),
    .s00_axi_bid(m_axi_rmem1___Mmap2Stream_1___mmap_BID),
    .s00_axi_bready(m_axi_rmem1___Mmap2Stream_1___mmap_BREADY),
    .s00_axi_bresp(m_axi_rmem1___Mmap2Stream_1___mmap_BRESP),
    .s00_axi_bvalid(m_axi_rmem1___Mmap2Stream_1___mmap_BVALID),
    .s00_axi_rdata(m_axi_rmem1___Mmap2Stream_1___mmap_RDATA),
    .s00_axi_rid(m_axi_rmem1___Mmap2Stream_1___mmap_RID),
    .s00_axi_rlast(m_axi_rmem1___Mmap2Stream_1___mmap_RLAST),
    .s00_axi_rready(m_axi_rmem1___Mmap2Stream_1___mmap_RREADY),
    .s00_axi_rresp(m_axi_rmem1___Mmap2Stream_1___mmap_RRESP),
    .s00_axi_rvalid(m_axi_rmem1___Mmap2Stream_1___mmap_RVALID),
    .s00_axi_wdata(m_axi_rmem1___Mmap2Stream_1___mmap_WDATA),
    .s00_axi_wlast(m_axi_rmem1___Mmap2Stream_1___mmap_WLAST),
    .s00_axi_wready(m_axi_rmem1___Mmap2Stream_1___mmap_WREADY),
    .s00_axi_wstrb(m_axi_rmem1___Mmap2Stream_1___mmap_WSTRB),
    .s00_axi_wvalid(m_axi_rmem1___Mmap2Stream_1___mmap_WVALID),
    .s01_axi_araddr(m_axi_rmem1___Stream2Mmap_1___mmap_ARADDR),
    .s01_axi_arburst(m_axi_rmem1___Stream2Mmap_1___mmap_ARBURST),
    .s01_axi_arcache(m_axi_rmem1___Stream2Mmap_1___mmap_ARCACHE),
    .s01_axi_arid(m_axi_rmem1___Stream2Mmap_1___mmap_ARID),
    .s01_axi_arlen(m_axi_rmem1___Stream2Mmap_1___mmap_ARLEN),
    .s01_axi_arlock(m_axi_rmem1___Stream2Mmap_1___mmap_ARLOCK),
    .s01_axi_arprot(m_axi_rmem1___Stream2Mmap_1___mmap_ARPROT),
    .s01_axi_arqos(m_axi_rmem1___Stream2Mmap_1___mmap_ARQOS),
    .s01_axi_arready(m_axi_rmem1___Stream2Mmap_1___mmap_ARREADY),
    .s01_axi_arsize(m_axi_rmem1___Stream2Mmap_1___mmap_ARSIZE),
    .s01_axi_arvalid(m_axi_rmem1___Stream2Mmap_1___mmap_ARVALID),
    .s01_axi_awaddr(m_axi_rmem1___Stream2Mmap_1___mmap_AWADDR),
    .s01_axi_awburst(m_axi_rmem1___Stream2Mmap_1___mmap_AWBURST),
    .s01_axi_awcache(m_axi_rmem1___Stream2Mmap_1___mmap_AWCACHE),
    .s01_axi_awid(m_axi_rmem1___Stream2Mmap_1___mmap_AWID),
    .s01_axi_awlen(m_axi_rmem1___Stream2Mmap_1___mmap_AWLEN),
    .s01_axi_awlock(m_axi_rmem1___Stream2Mmap_1___mmap_AWLOCK),
    .s01_axi_awprot(m_axi_rmem1___Stream2Mmap_1___mmap_AWPROT),
    .s01_axi_awqos(m_axi_rmem1___Stream2Mmap_1___mmap_AWQOS),
    .s01_axi_awready(m_axi_rmem1___Stream2Mmap_1___mmap_AWREADY),
    .s01_axi_awsize(m_axi_rmem1___Stream2Mmap_1___mmap_AWSIZE),
    .s01_axi_awvalid(m_axi_rmem1___Stream2Mmap_1___mmap_AWVALID),
    .s01_axi_bid(m_axi_rmem1___Stream2Mmap_1___mmap_BID),
    .s01_axi_bready(m_axi_rmem1___Stream2Mmap_1___mmap_BREADY),
    .s01_axi_bresp(m_axi_rmem1___Stream2Mmap_1___mmap_BRESP),
    .s01_axi_bvalid(m_axi_rmem1___Stream2Mmap_1___mmap_BVALID),
    .s01_axi_rdata(m_axi_rmem1___Stream2Mmap_1___mmap_RDATA),
    .s01_axi_rid(m_axi_rmem1___Stream2Mmap_1___mmap_RID),
    .s01_axi_rlast(m_axi_rmem1___Stream2Mmap_1___mmap_RLAST),
    .s01_axi_rready(m_axi_rmem1___Stream2Mmap_1___mmap_RREADY),
    .s01_axi_rresp(m_axi_rmem1___Stream2Mmap_1___mmap_RRESP),
    .s01_axi_rvalid(m_axi_rmem1___Stream2Mmap_1___mmap_RVALID),
    .s01_axi_wdata(m_axi_rmem1___Stream2Mmap_1___mmap_WDATA),
    .s01_axi_wlast(m_axi_rmem1___Stream2Mmap_1___mmap_WLAST),
    .s01_axi_wready(m_axi_rmem1___Stream2Mmap_1___mmap_WREADY),
    .s01_axi_wstrb(m_axi_rmem1___Stream2Mmap_1___mmap_WSTRB),
    .s01_axi_wvalid(m_axi_rmem1___Stream2Mmap_1___mmap_WVALID)
  );


  (* keep_hierarchy = "yes" *) Mmap2Stream
  Mmap2Stream_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Mmap2Stream_0__ap_start),
    .ap_done(Mmap2Stream_0__ap_done),
    .ap_idle(Mmap2Stream_0__ap_idle),
    .ap_ready(Mmap2Stream_0__ap_ready),
    .n(Mmap2Stream_0___n__q0),
    .stream_din(qr0_addr_config__din),
    .stream_full_n(qr0_addr_config__full_n),
    .stream_write(qr0_addr_config__write),
    .m_axi_mmap_ARADDR(m_axi_rmem0___Mmap2Stream_0___mmap_ARADDR),
    .m_axi_mmap_ARBURST(m_axi_rmem0___Mmap2Stream_0___mmap_ARBURST),
    .m_axi_mmap_ARID(m_axi_rmem0___Mmap2Stream_0___mmap_ARID),
    .m_axi_mmap_ARLEN(m_axi_rmem0___Mmap2Stream_0___mmap_ARLEN),
    .m_axi_mmap_ARREADY(m_axi_rmem0___Mmap2Stream_0___mmap_ARREADY),
    .m_axi_mmap_ARSIZE(m_axi_rmem0___Mmap2Stream_0___mmap_ARSIZE),
    .m_axi_mmap_ARVALID(m_axi_rmem0___Mmap2Stream_0___mmap_ARVALID),
    .m_axi_mmap_AWADDR(m_axi_rmem0___Mmap2Stream_0___mmap_AWADDR),
    .m_axi_mmap_AWBURST(m_axi_rmem0___Mmap2Stream_0___mmap_AWBURST),
    .m_axi_mmap_AWID(m_axi_rmem0___Mmap2Stream_0___mmap_AWID),
    .m_axi_mmap_AWLEN(m_axi_rmem0___Mmap2Stream_0___mmap_AWLEN),
    .m_axi_mmap_AWREADY(m_axi_rmem0___Mmap2Stream_0___mmap_AWREADY),
    .m_axi_mmap_AWSIZE(m_axi_rmem0___Mmap2Stream_0___mmap_AWSIZE),
    .m_axi_mmap_AWVALID(m_axi_rmem0___Mmap2Stream_0___mmap_AWVALID),
    .m_axi_mmap_BID(m_axi_rmem0___Mmap2Stream_0___mmap_BID),
    .m_axi_mmap_BREADY(m_axi_rmem0___Mmap2Stream_0___mmap_BREADY),
    .m_axi_mmap_BRESP(m_axi_rmem0___Mmap2Stream_0___mmap_BRESP),
    .m_axi_mmap_BVALID(m_axi_rmem0___Mmap2Stream_0___mmap_BVALID),
    .m_axi_mmap_RDATA(m_axi_rmem0___Mmap2Stream_0___mmap_RDATA),
    .m_axi_mmap_RID(m_axi_rmem0___Mmap2Stream_0___mmap_RID),
    .m_axi_mmap_RLAST(m_axi_rmem0___Mmap2Stream_0___mmap_RLAST),
    .m_axi_mmap_RREADY(m_axi_rmem0___Mmap2Stream_0___mmap_RREADY),
    .m_axi_mmap_RRESP(m_axi_rmem0___Mmap2Stream_0___mmap_RRESP),
    .m_axi_mmap_RVALID(m_axi_rmem0___Mmap2Stream_0___mmap_RVALID),
    .m_axi_mmap_WDATA(m_axi_rmem0___Mmap2Stream_0___mmap_WDATA),
    .m_axi_mmap_WLAST(m_axi_rmem0___Mmap2Stream_0___mmap_WLAST),
    .m_axi_mmap_WREADY(m_axi_rmem0___Mmap2Stream_0___mmap_WREADY),
    .m_axi_mmap_WSTRB(m_axi_rmem0___Mmap2Stream_0___mmap_WSTRB),
    .m_axi_mmap_WVALID(m_axi_rmem0___Mmap2Stream_0___mmap_WVALID),
    .m_axi_mmap_ARLOCK(m_axi_rmem0___Mmap2Stream_0___mmap_ARLOCK),
    .m_axi_mmap_ARPROT(m_axi_rmem0___Mmap2Stream_0___mmap_ARPROT),
    .m_axi_mmap_ARQOS(m_axi_rmem0___Mmap2Stream_0___mmap_ARQOS),
    .m_axi_mmap_ARCACHE(m_axi_rmem0___Mmap2Stream_0___mmap_ARCACHE),
    .m_axi_mmap_AWCACHE(m_axi_rmem0___Mmap2Stream_0___mmap_AWCACHE),
    .m_axi_mmap_AWLOCK(m_axi_rmem0___Mmap2Stream_0___mmap_AWLOCK),
    .m_axi_mmap_AWPROT(m_axi_rmem0___Mmap2Stream_0___mmap_AWPROT),
    .m_axi_mmap_AWQOS(m_axi_rmem0___Mmap2Stream_0___mmap_AWQOS),
    .mmap_offset(Mmap2Stream_0___rmem0__q0)
  );


  (* keep_hierarchy = "yes" *) Mmap2Stream
  Mmap2Stream_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Mmap2Stream_1__ap_start),
    .ap_done(Mmap2Stream_1__ap_done),
    .ap_idle(Mmap2Stream_1__ap_idle),
    .ap_ready(Mmap2Stream_1__ap_ready),
    .n(Mmap2Stream_1___n__q0),
    .stream_din(qr1_addr_config__din),
    .stream_full_n(qr1_addr_config__full_n),
    .stream_write(qr1_addr_config__write),
    .m_axi_mmap_ARADDR(m_axi_rmem1___Mmap2Stream_1___mmap_ARADDR),
    .m_axi_mmap_ARBURST(m_axi_rmem1___Mmap2Stream_1___mmap_ARBURST),
    .m_axi_mmap_ARID(m_axi_rmem1___Mmap2Stream_1___mmap_ARID),
    .m_axi_mmap_ARLEN(m_axi_rmem1___Mmap2Stream_1___mmap_ARLEN),
    .m_axi_mmap_ARREADY(m_axi_rmem1___Mmap2Stream_1___mmap_ARREADY),
    .m_axi_mmap_ARSIZE(m_axi_rmem1___Mmap2Stream_1___mmap_ARSIZE),
    .m_axi_mmap_ARVALID(m_axi_rmem1___Mmap2Stream_1___mmap_ARVALID),
    .m_axi_mmap_AWADDR(m_axi_rmem1___Mmap2Stream_1___mmap_AWADDR),
    .m_axi_mmap_AWBURST(m_axi_rmem1___Mmap2Stream_1___mmap_AWBURST),
    .m_axi_mmap_AWID(m_axi_rmem1___Mmap2Stream_1___mmap_AWID),
    .m_axi_mmap_AWLEN(m_axi_rmem1___Mmap2Stream_1___mmap_AWLEN),
    .m_axi_mmap_AWREADY(m_axi_rmem1___Mmap2Stream_1___mmap_AWREADY),
    .m_axi_mmap_AWSIZE(m_axi_rmem1___Mmap2Stream_1___mmap_AWSIZE),
    .m_axi_mmap_AWVALID(m_axi_rmem1___Mmap2Stream_1___mmap_AWVALID),
    .m_axi_mmap_BID(m_axi_rmem1___Mmap2Stream_1___mmap_BID),
    .m_axi_mmap_BREADY(m_axi_rmem1___Mmap2Stream_1___mmap_BREADY),
    .m_axi_mmap_BRESP(m_axi_rmem1___Mmap2Stream_1___mmap_BRESP),
    .m_axi_mmap_BVALID(m_axi_rmem1___Mmap2Stream_1___mmap_BVALID),
    .m_axi_mmap_RDATA(m_axi_rmem1___Mmap2Stream_1___mmap_RDATA),
    .m_axi_mmap_RID(m_axi_rmem1___Mmap2Stream_1___mmap_RID),
    .m_axi_mmap_RLAST(m_axi_rmem1___Mmap2Stream_1___mmap_RLAST),
    .m_axi_mmap_RREADY(m_axi_rmem1___Mmap2Stream_1___mmap_RREADY),
    .m_axi_mmap_RRESP(m_axi_rmem1___Mmap2Stream_1___mmap_RRESP),
    .m_axi_mmap_RVALID(m_axi_rmem1___Mmap2Stream_1___mmap_RVALID),
    .m_axi_mmap_WDATA(m_axi_rmem1___Mmap2Stream_1___mmap_WDATA),
    .m_axi_mmap_WLAST(m_axi_rmem1___Mmap2Stream_1___mmap_WLAST),
    .m_axi_mmap_WREADY(m_axi_rmem1___Mmap2Stream_1___mmap_WREADY),
    .m_axi_mmap_WSTRB(m_axi_rmem1___Mmap2Stream_1___mmap_WSTRB),
    .m_axi_mmap_WVALID(m_axi_rmem1___Mmap2Stream_1___mmap_WVALID),
    .m_axi_mmap_ARLOCK(m_axi_rmem1___Mmap2Stream_1___mmap_ARLOCK),
    .m_axi_mmap_ARPROT(m_axi_rmem1___Mmap2Stream_1___mmap_ARPROT),
    .m_axi_mmap_ARQOS(m_axi_rmem1___Mmap2Stream_1___mmap_ARQOS),
    .m_axi_mmap_ARCACHE(m_axi_rmem1___Mmap2Stream_1___mmap_ARCACHE),
    .m_axi_mmap_AWCACHE(m_axi_rmem1___Mmap2Stream_1___mmap_AWCACHE),
    .m_axi_mmap_AWLOCK(m_axi_rmem1___Mmap2Stream_1___mmap_AWLOCK),
    .m_axi_mmap_AWPROT(m_axi_rmem1___Mmap2Stream_1___mmap_AWPROT),
    .m_axi_mmap_AWQOS(m_axi_rmem1___Mmap2Stream_1___mmap_AWQOS),
    .mmap_offset(Mmap2Stream_1___rmem1__q0)
  );


  (* keep_hierarchy = "yes" *) Stream2Mmap
  Stream2Mmap_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Stream2Mmap_0__ap_start),
    .ap_done(Stream2Mmap_0__ap_done),
    .ap_idle(Stream2Mmap_0__ap_idle),
    .ap_ready(Stream2Mmap_0__ap_ready),
    .n(Stream2Mmap_0___n__q0),
    .stream_s_dout(qw0_addr_config__dout),
    .stream_peek_dout(qw0_addr_config__dout),
    .stream_s_empty_n(qw0_addr_config__empty_n),
    .stream_peek_empty_n(qw0_addr_config__empty_n),
    .stream_s_read(qw0_addr_config__read),
    .stream_peek_read(),
    .m_axi_mmap_ARADDR(m_axi_rmem0___Stream2Mmap_0___mmap_ARADDR),
    .m_axi_mmap_ARBURST(m_axi_rmem0___Stream2Mmap_0___mmap_ARBURST),
    .m_axi_mmap_ARID(m_axi_rmem0___Stream2Mmap_0___mmap_ARID),
    .m_axi_mmap_ARLEN(m_axi_rmem0___Stream2Mmap_0___mmap_ARLEN),
    .m_axi_mmap_ARREADY(m_axi_rmem0___Stream2Mmap_0___mmap_ARREADY),
    .m_axi_mmap_ARSIZE(m_axi_rmem0___Stream2Mmap_0___mmap_ARSIZE),
    .m_axi_mmap_ARVALID(m_axi_rmem0___Stream2Mmap_0___mmap_ARVALID),
    .m_axi_mmap_AWADDR(m_axi_rmem0___Stream2Mmap_0___mmap_AWADDR),
    .m_axi_mmap_AWBURST(m_axi_rmem0___Stream2Mmap_0___mmap_AWBURST),
    .m_axi_mmap_AWID(m_axi_rmem0___Stream2Mmap_0___mmap_AWID),
    .m_axi_mmap_AWLEN(m_axi_rmem0___Stream2Mmap_0___mmap_AWLEN),
    .m_axi_mmap_AWREADY(m_axi_rmem0___Stream2Mmap_0___mmap_AWREADY),
    .m_axi_mmap_AWSIZE(m_axi_rmem0___Stream2Mmap_0___mmap_AWSIZE),
    .m_axi_mmap_AWVALID(m_axi_rmem0___Stream2Mmap_0___mmap_AWVALID),
    .m_axi_mmap_BID(m_axi_rmem0___Stream2Mmap_0___mmap_BID),
    .m_axi_mmap_BREADY(m_axi_rmem0___Stream2Mmap_0___mmap_BREADY),
    .m_axi_mmap_BRESP(m_axi_rmem0___Stream2Mmap_0___mmap_BRESP),
    .m_axi_mmap_BVALID(m_axi_rmem0___Stream2Mmap_0___mmap_BVALID),
    .m_axi_mmap_RDATA(m_axi_rmem0___Stream2Mmap_0___mmap_RDATA),
    .m_axi_mmap_RID(m_axi_rmem0___Stream2Mmap_0___mmap_RID),
    .m_axi_mmap_RLAST(m_axi_rmem0___Stream2Mmap_0___mmap_RLAST),
    .m_axi_mmap_RREADY(m_axi_rmem0___Stream2Mmap_0___mmap_RREADY),
    .m_axi_mmap_RRESP(m_axi_rmem0___Stream2Mmap_0___mmap_RRESP),
    .m_axi_mmap_RVALID(m_axi_rmem0___Stream2Mmap_0___mmap_RVALID),
    .m_axi_mmap_WDATA(m_axi_rmem0___Stream2Mmap_0___mmap_WDATA),
    .m_axi_mmap_WLAST(m_axi_rmem0___Stream2Mmap_0___mmap_WLAST),
    .m_axi_mmap_WREADY(m_axi_rmem0___Stream2Mmap_0___mmap_WREADY),
    .m_axi_mmap_WSTRB(m_axi_rmem0___Stream2Mmap_0___mmap_WSTRB),
    .m_axi_mmap_WVALID(m_axi_rmem0___Stream2Mmap_0___mmap_WVALID),
    .m_axi_mmap_ARLOCK(m_axi_rmem0___Stream2Mmap_0___mmap_ARLOCK),
    .m_axi_mmap_ARPROT(m_axi_rmem0___Stream2Mmap_0___mmap_ARPROT),
    .m_axi_mmap_ARQOS(m_axi_rmem0___Stream2Mmap_0___mmap_ARQOS),
    .m_axi_mmap_ARCACHE(m_axi_rmem0___Stream2Mmap_0___mmap_ARCACHE),
    .m_axi_mmap_AWCACHE(m_axi_rmem0___Stream2Mmap_0___mmap_AWCACHE),
    .m_axi_mmap_AWLOCK(m_axi_rmem0___Stream2Mmap_0___mmap_AWLOCK),
    .m_axi_mmap_AWPROT(m_axi_rmem0___Stream2Mmap_0___mmap_AWPROT),
    .m_axi_mmap_AWQOS(m_axi_rmem0___Stream2Mmap_0___mmap_AWQOS),
    .mmap_offset(Stream2Mmap_0___rmem0__q0)
  );


  (* keep_hierarchy = "yes" *) Stream2Mmap
  Stream2Mmap_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Stream2Mmap_1__ap_start),
    .ap_done(Stream2Mmap_1__ap_done),
    .ap_idle(Stream2Mmap_1__ap_idle),
    .ap_ready(Stream2Mmap_1__ap_ready),
    .n(Stream2Mmap_1___n__q0),
    .stream_s_dout(qw1_addr_config__dout),
    .stream_peek_dout(qw1_addr_config__dout),
    .stream_s_empty_n(qw1_addr_config__empty_n),
    .stream_peek_empty_n(qw1_addr_config__empty_n),
    .stream_s_read(qw1_addr_config__read),
    .stream_peek_read(),
    .m_axi_mmap_ARADDR(m_axi_rmem1___Stream2Mmap_1___mmap_ARADDR),
    .m_axi_mmap_ARBURST(m_axi_rmem1___Stream2Mmap_1___mmap_ARBURST),
    .m_axi_mmap_ARID(m_axi_rmem1___Stream2Mmap_1___mmap_ARID),
    .m_axi_mmap_ARLEN(m_axi_rmem1___Stream2Mmap_1___mmap_ARLEN),
    .m_axi_mmap_ARREADY(m_axi_rmem1___Stream2Mmap_1___mmap_ARREADY),
    .m_axi_mmap_ARSIZE(m_axi_rmem1___Stream2Mmap_1___mmap_ARSIZE),
    .m_axi_mmap_ARVALID(m_axi_rmem1___Stream2Mmap_1___mmap_ARVALID),
    .m_axi_mmap_AWADDR(m_axi_rmem1___Stream2Mmap_1___mmap_AWADDR),
    .m_axi_mmap_AWBURST(m_axi_rmem1___Stream2Mmap_1___mmap_AWBURST),
    .m_axi_mmap_AWID(m_axi_rmem1___Stream2Mmap_1___mmap_AWID),
    .m_axi_mmap_AWLEN(m_axi_rmem1___Stream2Mmap_1___mmap_AWLEN),
    .m_axi_mmap_AWREADY(m_axi_rmem1___Stream2Mmap_1___mmap_AWREADY),
    .m_axi_mmap_AWSIZE(m_axi_rmem1___Stream2Mmap_1___mmap_AWSIZE),
    .m_axi_mmap_AWVALID(m_axi_rmem1___Stream2Mmap_1___mmap_AWVALID),
    .m_axi_mmap_BID(m_axi_rmem1___Stream2Mmap_1___mmap_BID),
    .m_axi_mmap_BREADY(m_axi_rmem1___Stream2Mmap_1___mmap_BREADY),
    .m_axi_mmap_BRESP(m_axi_rmem1___Stream2Mmap_1___mmap_BRESP),
    .m_axi_mmap_BVALID(m_axi_rmem1___Stream2Mmap_1___mmap_BVALID),
    .m_axi_mmap_RDATA(m_axi_rmem1___Stream2Mmap_1___mmap_RDATA),
    .m_axi_mmap_RID(m_axi_rmem1___Stream2Mmap_1___mmap_RID),
    .m_axi_mmap_RLAST(m_axi_rmem1___Stream2Mmap_1___mmap_RLAST),
    .m_axi_mmap_RREADY(m_axi_rmem1___Stream2Mmap_1___mmap_RREADY),
    .m_axi_mmap_RRESP(m_axi_rmem1___Stream2Mmap_1___mmap_RRESP),
    .m_axi_mmap_RVALID(m_axi_rmem1___Stream2Mmap_1___mmap_RVALID),
    .m_axi_mmap_WDATA(m_axi_rmem1___Stream2Mmap_1___mmap_WDATA),
    .m_axi_mmap_WLAST(m_axi_rmem1___Stream2Mmap_1___mmap_WLAST),
    .m_axi_mmap_WREADY(m_axi_rmem1___Stream2Mmap_1___mmap_WREADY),
    .m_axi_mmap_WSTRB(m_axi_rmem1___Stream2Mmap_1___mmap_WSTRB),
    .m_axi_mmap_WVALID(m_axi_rmem1___Stream2Mmap_1___mmap_WVALID),
    .m_axi_mmap_ARLOCK(m_axi_rmem1___Stream2Mmap_1___mmap_ARLOCK),
    .m_axi_mmap_ARPROT(m_axi_rmem1___Stream2Mmap_1___mmap_ARPROT),
    .m_axi_mmap_ARQOS(m_axi_rmem1___Stream2Mmap_1___mmap_ARQOS),
    .m_axi_mmap_ARCACHE(m_axi_rmem1___Stream2Mmap_1___mmap_ARCACHE),
    .m_axi_mmap_AWCACHE(m_axi_rmem1___Stream2Mmap_1___mmap_AWCACHE),
    .m_axi_mmap_AWLOCK(m_axi_rmem1___Stream2Mmap_1___mmap_AWLOCK),
    .m_axi_mmap_AWPROT(m_axi_rmem1___Stream2Mmap_1___mmap_AWPROT),
    .m_axi_mmap_AWQOS(m_axi_rmem1___Stream2Mmap_1___mmap_AWQOS),
    .mmap_offset(Stream2Mmap_1___rmem1__q0)
  );


  (* keep_hierarchy = "yes" *) yshift
  yshift_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(yshift_0__ap_start),
    .ap_done(yshift_0__ap_done),
    .ap_idle(yshift_0__ap_idle),
    .ap_ready(yshift_0__ap_ready),
    .n(yshift_0___n__q0),
    .a_s_dout(qr0_addr_config__dout),
    .a_peek_dout(qr0_addr_config__dout),
    .a_s_empty_n(qr0_addr_config__empty_n),
    .a_peek_empty_n(qr0_addr_config__empty_n),
    .a_s_read(qr0_addr_config__read),
    .a_peek_read(),
    .b_din(qw0_addr_config__din),
    .b_full_n(qw0_addr_config__full_n),
    .b_write(qw0_addr_config__write)
  );


  (* keep_hierarchy = "yes" *) yshift
  yshift_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(yshift_1__ap_start),
    .ap_done(yshift_1__ap_done),
    .ap_idle(yshift_1__ap_idle),
    .ap_ready(yshift_1__ap_ready),
    .n(yshift_1___n__q0),
    .a_s_dout(qr1_addr_config__dout),
    .a_peek_dout(qr1_addr_config__dout),
    .a_s_empty_n(qr1_addr_config__empty_n),
    .a_peek_empty_n(qr1_addr_config__empty_n),
    .a_s_read(qr1_addr_config__read),
    .a_peek_read(),
    .b_din(qw1_addr_config__din),
    .b_full_n(qw1_addr_config__full_n),
    .b_write(qw1_addr_config__write)
  );


  (* keep_hierarchy = "yes" *) addr_config_fsm
  __tapa_fsm_unit
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .n(n),
    .rmem0(rmem0),
    .rmem1(rmem1),
    .Mmap2Stream_0___n__q0(Mmap2Stream_0___n__q0),
    .Mmap2Stream_0___rmem0__q0(Mmap2Stream_0___rmem0__q0),
    .Mmap2Stream_0__ap_start(Mmap2Stream_0__ap_start),
    .Mmap2Stream_0__ap_ready(Mmap2Stream_0__ap_ready),
    .Mmap2Stream_0__ap_done(Mmap2Stream_0__ap_done),
    .Mmap2Stream_0__ap_idle(Mmap2Stream_0__ap_idle),
    .Mmap2Stream_1___n__q0(Mmap2Stream_1___n__q0),
    .Mmap2Stream_1___rmem1__q0(Mmap2Stream_1___rmem1__q0),
    .Mmap2Stream_1__ap_start(Mmap2Stream_1__ap_start),
    .Mmap2Stream_1__ap_ready(Mmap2Stream_1__ap_ready),
    .Mmap2Stream_1__ap_done(Mmap2Stream_1__ap_done),
    .Mmap2Stream_1__ap_idle(Mmap2Stream_1__ap_idle),
    .Stream2Mmap_0___n__q0(Stream2Mmap_0___n__q0),
    .Stream2Mmap_0___rmem0__q0(Stream2Mmap_0___rmem0__q0),
    .Stream2Mmap_0__ap_start(Stream2Mmap_0__ap_start),
    .Stream2Mmap_0__ap_ready(Stream2Mmap_0__ap_ready),
    .Stream2Mmap_0__ap_done(Stream2Mmap_0__ap_done),
    .Stream2Mmap_0__ap_idle(Stream2Mmap_0__ap_idle),
    .Stream2Mmap_1___n__q0(Stream2Mmap_1___n__q0),
    .Stream2Mmap_1___rmem1__q0(Stream2Mmap_1___rmem1__q0),
    .Stream2Mmap_1__ap_start(Stream2Mmap_1__ap_start),
    .Stream2Mmap_1__ap_ready(Stream2Mmap_1__ap_ready),
    .Stream2Mmap_1__ap_done(Stream2Mmap_1__ap_done),
    .Stream2Mmap_1__ap_idle(Stream2Mmap_1__ap_idle),
    .yshift_0___n__q0(yshift_0___n__q0),
    .yshift_0__ap_start(yshift_0__ap_start),
    .yshift_0__ap_ready(yshift_0__ap_ready),
    .yshift_0__ap_done(yshift_0__ap_done),
    .yshift_0__ap_idle(yshift_0__ap_idle),
    .yshift_1___n__q0(yshift_1___n__q0),
    .yshift_1__ap_start(yshift_1__ap_start),
    .yshift_1__ap_ready(yshift_1__ap_ready),
    .yshift_1__ap_done(yshift_1__ap_done),
    .yshift_1__ap_idle(yshift_1__ap_idle)
  );

  assign ap_rst_n_inv = (~ap_rst_n);

endmodule

