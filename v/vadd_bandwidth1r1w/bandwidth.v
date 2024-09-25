`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO = "bandwidth_bandwidth,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu50-fsvh2104-2-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=316,HLS_SYN_LUT=552,HLS_VERSION=2022_2}" *)


module bandwidth
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
  m_axi_chan_0_ARADDR,
  m_axi_chan_0_ARBURST,
  m_axi_chan_0_ARCACHE,
  m_axi_chan_0_ARID,
  m_axi_chan_0_ARLEN,
  m_axi_chan_0_ARLOCK,
  m_axi_chan_0_ARPROT,
  m_axi_chan_0_ARQOS,
  m_axi_chan_0_ARREADY,
  m_axi_chan_0_ARSIZE,
  m_axi_chan_0_ARVALID,
  m_axi_chan_0_AWADDR,
  m_axi_chan_0_AWBURST,
  m_axi_chan_0_AWCACHE,
  m_axi_chan_0_AWID,
  m_axi_chan_0_AWLEN,
  m_axi_chan_0_AWLOCK,
  m_axi_chan_0_AWPROT,
  m_axi_chan_0_AWQOS,
  m_axi_chan_0_AWREADY,
  m_axi_chan_0_AWSIZE,
  m_axi_chan_0_AWVALID,
  m_axi_chan_0_BID,
  m_axi_chan_0_BREADY,
  m_axi_chan_0_BRESP,
  m_axi_chan_0_BVALID,
  m_axi_chan_0_RDATA,
  m_axi_chan_0_RID,
  m_axi_chan_0_RLAST,
  m_axi_chan_0_RREADY,
  m_axi_chan_0_RRESP,
  m_axi_chan_0_RVALID,
  m_axi_chan_0_WDATA,
  m_axi_chan_0_WLAST,
  m_axi_chan_0_WREADY,
  m_axi_chan_0_WSTRB,
  m_axi_chan_0_WVALID,
  m_axi_chan_1_ARADDR,
  m_axi_chan_1_ARBURST,
  m_axi_chan_1_ARCACHE,
  m_axi_chan_1_ARID,
  m_axi_chan_1_ARLEN,
  m_axi_chan_1_ARLOCK,
  m_axi_chan_1_ARPROT,
  m_axi_chan_1_ARQOS,
  m_axi_chan_1_ARREADY,
  m_axi_chan_1_ARSIZE,
  m_axi_chan_1_ARVALID,
  m_axi_chan_1_AWADDR,
  m_axi_chan_1_AWBURST,
  m_axi_chan_1_AWCACHE,
  m_axi_chan_1_AWID,
  m_axi_chan_1_AWLEN,
  m_axi_chan_1_AWLOCK,
  m_axi_chan_1_AWPROT,
  m_axi_chan_1_AWQOS,
  m_axi_chan_1_AWREADY,
  m_axi_chan_1_AWSIZE,
  m_axi_chan_1_AWVALID,
  m_axi_chan_1_BID,
  m_axi_chan_1_BREADY,
  m_axi_chan_1_BRESP,
  m_axi_chan_1_BVALID,
  m_axi_chan_1_RDATA,
  m_axi_chan_1_RID,
  m_axi_chan_1_RLAST,
  m_axi_chan_1_RREADY,
  m_axi_chan_1_RRESP,
  m_axi_chan_1_RVALID,
  m_axi_chan_1_WDATA,
  m_axi_chan_1_WLAST,
  m_axi_chan_1_WREADY,
  m_axi_chan_1_WSTRB,
  m_axi_chan_1_WVALID
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
  (* RS_HS = "m_axi_chan_0_AR.data" *)output [63:0] m_axi_chan_0_ARADDR;
  (* RS_HS = "m_axi_chan_0_AR.data" *)output [1:0] m_axi_chan_0_ARBURST;
  (* RS_HS = "m_axi_chan_0_AR.data" *)output [3:0] m_axi_chan_0_ARCACHE;
  (* RS_HS = "m_axi_chan_0_AR.data" *)output [0:0] m_axi_chan_0_ARID;
  (* RS_HS = "m_axi_chan_0_AR.data" *)output [7:0] m_axi_chan_0_ARLEN;
  (* RS_HS = "m_axi_chan_0_AR.data" *)output m_axi_chan_0_ARLOCK;
  (* RS_HS = "m_axi_chan_0_AR.data" *)output [2:0] m_axi_chan_0_ARPROT;
  (* RS_HS = "m_axi_chan_0_AR.data" *)output [3:0] m_axi_chan_0_ARQOS;
  (* RS_HS = "m_axi_chan_0_AR.ready" *)input m_axi_chan_0_ARREADY;
  (* RS_HS = "m_axi_chan_0_AR.data" *)output [2:0] m_axi_chan_0_ARSIZE;
  (* RS_HS = "m_axi_chan_0_AR.valid" *)output m_axi_chan_0_ARVALID;
  (* RS_HS = "m_axi_chan_0_AW.data" *)output [63:0] m_axi_chan_0_AWADDR;
  (* RS_HS = "m_axi_chan_0_AW.data" *)output [1:0] m_axi_chan_0_AWBURST;
  (* RS_HS = "m_axi_chan_0_AW.data" *)output [3:0] m_axi_chan_0_AWCACHE;
  (* RS_HS = "m_axi_chan_0_AW.data" *)output [0:0] m_axi_chan_0_AWID;
  (* RS_HS = "m_axi_chan_0_AW.data" *)output [7:0] m_axi_chan_0_AWLEN;
  (* RS_HS = "m_axi_chan_0_AW.data" *)output m_axi_chan_0_AWLOCK;
  (* RS_HS = "m_axi_chan_0_AW.data" *)output [2:0] m_axi_chan_0_AWPROT;
  (* RS_HS = "m_axi_chan_0_AW.data" *)output [3:0] m_axi_chan_0_AWQOS;
  (* RS_HS = "m_axi_chan_0_AW.ready" *)input m_axi_chan_0_AWREADY;
  (* RS_HS = "m_axi_chan_0_AW.data" *)output [2:0] m_axi_chan_0_AWSIZE;
  (* RS_HS = "m_axi_chan_0_AW.valid" *)output m_axi_chan_0_AWVALID;
  (* RS_HS = "m_axi_chan_0_B.data" *)input [0:0] m_axi_chan_0_BID;
  (* RS_HS = "m_axi_chan_0_B.ready" *)output m_axi_chan_0_BREADY;
  (* RS_HS = "m_axi_chan_0_B.data" *)input [1:0] m_axi_chan_0_BRESP;
  (* RS_HS = "m_axi_chan_0_B.valid" *)input m_axi_chan_0_BVALID;
  (* RS_HS = "m_axi_chan_0_R.data" *)input [511:0] m_axi_chan_0_RDATA;
  (* RS_HS = "m_axi_chan_0_R.data" *)input [0:0] m_axi_chan_0_RID;
  (* RS_HS = "m_axi_chan_0_R.data" *)input m_axi_chan_0_RLAST;
  (* RS_HS = "m_axi_chan_0_R.ready" *)output m_axi_chan_0_RREADY;
  (* RS_HS = "m_axi_chan_0_R.data" *)input [1:0] m_axi_chan_0_RRESP;
  (* RS_HS = "m_axi_chan_0_R.valid" *)input m_axi_chan_0_RVALID;
  (* RS_HS = "m_axi_chan_0_W.data" *)output [511:0] m_axi_chan_0_WDATA;
  (* RS_HS = "m_axi_chan_0_W.data" *)output m_axi_chan_0_WLAST;
  (* RS_HS = "m_axi_chan_0_W.ready" *)input m_axi_chan_0_WREADY;
  (* RS_HS = "m_axi_chan_0_W.data" *)output [63:0] m_axi_chan_0_WSTRB;
  (* RS_HS = "m_axi_chan_0_W.valid" *)output m_axi_chan_0_WVALID;
  (* RS_HS = "m_axi_chan_1_AR.data" *)output [63:0] m_axi_chan_1_ARADDR;
  (* RS_HS = "m_axi_chan_1_AR.data" *)output [1:0] m_axi_chan_1_ARBURST;
  (* RS_HS = "m_axi_chan_1_AR.data" *)output [3:0] m_axi_chan_1_ARCACHE;
  (* RS_HS = "m_axi_chan_1_AR.data" *)output [0:0] m_axi_chan_1_ARID;
  (* RS_HS = "m_axi_chan_1_AR.data" *)output [7:0] m_axi_chan_1_ARLEN;
  (* RS_HS = "m_axi_chan_1_AR.data" *)output m_axi_chan_1_ARLOCK;
  (* RS_HS = "m_axi_chan_1_AR.data" *)output [2:0] m_axi_chan_1_ARPROT;
  (* RS_HS = "m_axi_chan_1_AR.data" *)output [3:0] m_axi_chan_1_ARQOS;
  (* RS_HS = "m_axi_chan_1_AR.ready" *)input m_axi_chan_1_ARREADY;
  (* RS_HS = "m_axi_chan_1_AR.data" *)output [2:0] m_axi_chan_1_ARSIZE;
  (* RS_HS = "m_axi_chan_1_AR.valid" *)output m_axi_chan_1_ARVALID;
  (* RS_HS = "m_axi_chan_1_AW.data" *)output [63:0] m_axi_chan_1_AWADDR;
  (* RS_HS = "m_axi_chan_1_AW.data" *)output [1:0] m_axi_chan_1_AWBURST;
  (* RS_HS = "m_axi_chan_1_AW.data" *)output [3:0] m_axi_chan_1_AWCACHE;
  (* RS_HS = "m_axi_chan_1_AW.data" *)output [0:0] m_axi_chan_1_AWID;
  (* RS_HS = "m_axi_chan_1_AW.data" *)output [7:0] m_axi_chan_1_AWLEN;
  (* RS_HS = "m_axi_chan_1_AW.data" *)output m_axi_chan_1_AWLOCK;
  (* RS_HS = "m_axi_chan_1_AW.data" *)output [2:0] m_axi_chan_1_AWPROT;
  (* RS_HS = "m_axi_chan_1_AW.data" *)output [3:0] m_axi_chan_1_AWQOS;
  (* RS_HS = "m_axi_chan_1_AW.ready" *)input m_axi_chan_1_AWREADY;
  (* RS_HS = "m_axi_chan_1_AW.data" *)output [2:0] m_axi_chan_1_AWSIZE;
  (* RS_HS = "m_axi_chan_1_AW.valid" *)output m_axi_chan_1_AWVALID;
  (* RS_HS = "m_axi_chan_1_B.data" *)input [0:0] m_axi_chan_1_BID;
  (* RS_HS = "m_axi_chan_1_B.ready" *)output m_axi_chan_1_BREADY;
  (* RS_HS = "m_axi_chan_1_B.data" *)input [1:0] m_axi_chan_1_BRESP;
  (* RS_HS = "m_axi_chan_1_B.valid" *)input m_axi_chan_1_BVALID;
  (* RS_HS = "m_axi_chan_1_R.data" *)input [511:0] m_axi_chan_1_RDATA;
  (* RS_HS = "m_axi_chan_1_R.data" *)input [0:0] m_axi_chan_1_RID;
  (* RS_HS = "m_axi_chan_1_R.data" *)input m_axi_chan_1_RLAST;
  (* RS_HS = "m_axi_chan_1_R.ready" *)output m_axi_chan_1_RREADY;
  (* RS_HS = "m_axi_chan_1_R.data" *)input [1:0] m_axi_chan_1_RRESP;
  (* RS_HS = "m_axi_chan_1_R.valid" *)input m_axi_chan_1_RVALID;
  (* RS_HS = "m_axi_chan_1_W.data" *)output [511:0] m_axi_chan_1_WDATA;
  (* RS_HS = "m_axi_chan_1_W.data" *)output m_axi_chan_1_WLAST;
  (* RS_HS = "m_axi_chan_1_W.ready" *)input m_axi_chan_1_WREADY;
  (* RS_HS = "m_axi_chan_1_W.data" *)output [63:0] m_axi_chan_1_WSTRB;
  (* RS_HS = "m_axi_chan_1_W.valid" *)output m_axi_chan_1_WVALID;
  wire ap_start;
  wire [63:0] chan_0;
  wire [63:0] chan_1;
  wire [63:0] n;
  wire [63:0] flags;
  wire [63:0] Copy_0___chan_0__q0;
  wire [63:0] chan_0_read_addr__din;
  wire chan_0_read_addr__full_n;
  wire chan_0_read_addr__write;
  wire [511:0] chan_0_read_data__dout;
  wire chan_0_read_data__empty_n;
  wire chan_0_read_data__read;
  wire [63:0] chan_0_write_addr__din;
  wire chan_0_write_addr__full_n;
  wire chan_0_write_addr__write;
  wire [511:0] chan_0_write_data__din;
  wire chan_0_write_data__full_n;
  wire chan_0_write_data__write;
  wire [7:0] chan_0_write_resp__dout;
  wire chan_0_write_resp__empty_n;
  wire chan_0_write_resp__read;
  wire [63:0] Copy_0___flags__q0;
  wire [63:0] Copy_0___n__q0;
  wire Copy_0__ap_start;
  wire Copy_0__ap_ready;
  wire Copy_0__ap_done;
  wire Copy_0__ap_idle;
  wire [63:0] Copy_1___chan_1__q0;
  wire [63:0] chan_1_read_addr__din;
  wire chan_1_read_addr__full_n;
  wire chan_1_read_addr__write;
  wire [511:0] chan_1_read_data__dout;
  wire chan_1_read_data__empty_n;
  wire chan_1_read_data__read;
  wire [63:0] chan_1_write_addr__din;
  wire chan_1_write_addr__full_n;
  wire chan_1_write_addr__write;
  wire [511:0] chan_1_write_data__din;
  wire chan_1_write_data__full_n;
  wire chan_1_write_data__write;
  wire [7:0] chan_1_write_resp__dout;
  wire chan_1_write_resp__empty_n;
  wire chan_1_write_resp__read;
  wire [63:0] Copy_1___flags__q0;
  wire [63:0] Copy_1___n__q0;
  wire Copy_1__ap_start;
  wire Copy_1__ap_ready;
  wire Copy_1__ap_done;
  wire Copy_1__ap_idle;
  wire ap_rst_n_inv;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;

  bandwidth_control_s_axi
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
    .chan_0(chan_0),
    .chan_1(chan_1),
    .n(n),
    .flags(flags),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
  );


  (* keep_hierarchy = "yes" *) Copy
  Copy_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Copy_0__ap_start),
    .ap_done(Copy_0__ap_done),
    .ap_idle(Copy_0__ap_idle),
    .ap_ready(Copy_0__ap_ready),
    .mem_read_addr_s_din(chan_0_read_addr__din),
    .mem_read_addr_s_full_n(chan_0_read_addr__full_n),
    .mem_read_addr_s_write(chan_0_read_addr__write),
    .mem_read_addr_offset(Copy_0___chan_0__q0),
    .mem_read_data_s_dout({1'b0, chan_0_read_data__dout}),
    .mem_read_data_peek_dout({1'b0, chan_0_read_data__dout}),
    .mem_read_data_s_empty_n(chan_0_read_data__empty_n),
    .mem_read_data_peek_empty_n(chan_0_read_data__empty_n),
    .mem_read_data_s_read(chan_0_read_data__read),
    .mem_read_data_peek_read(),
    .mem_write_addr_s_din(chan_0_write_addr__din),
    .mem_write_addr_s_full_n(chan_0_write_addr__full_n),
    .mem_write_addr_s_write(chan_0_write_addr__write),
    .mem_write_addr_offset(Copy_0___chan_0__q0),
    .mem_write_data_din(chan_0_write_data__din),
    .mem_write_data_full_n(chan_0_write_data__full_n),
    .mem_write_data_write(chan_0_write_data__write),
    .mem_write_resp_s_dout({1'b0, chan_0_write_resp__dout}),
    .mem_write_resp_peek_dout({1'b0, chan_0_write_resp__dout}),
    .mem_write_resp_s_empty_n(chan_0_write_resp__empty_n),
    .mem_write_resp_peek_empty_n(chan_0_write_resp__empty_n),
    .mem_write_resp_s_read(chan_0_write_resp__read),
    .mem_write_resp_peek_read(),
    .flags(Copy_0___flags__q0),
    .n(Copy_0___n__q0)
  );


  (* keep_hierarchy = "yes" *) Copy
  Copy_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Copy_1__ap_start),
    .ap_done(Copy_1__ap_done),
    .ap_idle(Copy_1__ap_idle),
    .ap_ready(Copy_1__ap_ready),
    .mem_read_addr_s_din(chan_1_read_addr__din),
    .mem_read_addr_s_full_n(chan_1_read_addr__full_n),
    .mem_read_addr_s_write(chan_1_read_addr__write),
    .mem_read_addr_offset(Copy_1___chan_1__q0),
    .mem_read_data_s_dout({1'b0, chan_1_read_data__dout}),
    .mem_read_data_peek_dout({1'b0, chan_1_read_data__dout}),
    .mem_read_data_s_empty_n(chan_1_read_data__empty_n),
    .mem_read_data_peek_empty_n(chan_1_read_data__empty_n),
    .mem_read_data_s_read(chan_1_read_data__read),
    .mem_read_data_peek_read(),
    .mem_write_addr_s_din(chan_1_write_addr__din),
    .mem_write_addr_s_full_n(chan_1_write_addr__full_n),
    .mem_write_addr_s_write(chan_1_write_addr__write),
    .mem_write_addr_offset(Copy_1___chan_1__q0),
    .mem_write_data_din(chan_1_write_data__din),
    .mem_write_data_full_n(chan_1_write_data__full_n),
    .mem_write_data_write(chan_1_write_data__write),
    .mem_write_resp_s_dout({1'b0, chan_1_write_resp__dout}),
    .mem_write_resp_peek_dout({1'b0, chan_1_write_resp__dout}),
    .mem_write_resp_s_empty_n(chan_1_write_resp__empty_n),
    .mem_write_resp_peek_empty_n(chan_1_write_resp__empty_n),
    .mem_write_resp_s_read(chan_1_write_resp__read),
    .mem_write_resp_peek_read(),
    .flags(Copy_1___flags__q0),
    .n(Copy_1___n__q0)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  chan_0__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .m_axi_ARADDR(m_axi_chan_0_ARADDR),
    .m_axi_ARBURST(m_axi_chan_0_ARBURST),
    .m_axi_ARCACHE(m_axi_chan_0_ARCACHE),
    .m_axi_ARID(m_axi_chan_0_ARID),
    .m_axi_ARLEN(m_axi_chan_0_ARLEN),
    .m_axi_ARLOCK(m_axi_chan_0_ARLOCK),
    .m_axi_ARPROT(m_axi_chan_0_ARPROT),
    .m_axi_ARQOS(m_axi_chan_0_ARQOS),
    .m_axi_ARREADY(m_axi_chan_0_ARREADY),
    .m_axi_ARSIZE(m_axi_chan_0_ARSIZE),
    .m_axi_ARVALID(m_axi_chan_0_ARVALID),
    .m_axi_AWADDR(m_axi_chan_0_AWADDR),
    .m_axi_AWBURST(m_axi_chan_0_AWBURST),
    .m_axi_AWCACHE(m_axi_chan_0_AWCACHE),
    .m_axi_AWID(m_axi_chan_0_AWID),
    .m_axi_AWLEN(m_axi_chan_0_AWLEN),
    .m_axi_AWLOCK(m_axi_chan_0_AWLOCK),
    .m_axi_AWPROT(m_axi_chan_0_AWPROT),
    .m_axi_AWQOS(m_axi_chan_0_AWQOS),
    .m_axi_AWREADY(m_axi_chan_0_AWREADY),
    .m_axi_AWSIZE(m_axi_chan_0_AWSIZE),
    .m_axi_AWVALID(m_axi_chan_0_AWVALID),
    .m_axi_BID(m_axi_chan_0_BID),
    .m_axi_BREADY(m_axi_chan_0_BREADY),
    .m_axi_BRESP(m_axi_chan_0_BRESP),
    .m_axi_BVALID(m_axi_chan_0_BVALID),
    .m_axi_RDATA(m_axi_chan_0_RDATA),
    .m_axi_RID(m_axi_chan_0_RID),
    .m_axi_RLAST(m_axi_chan_0_RLAST),
    .m_axi_RREADY(m_axi_chan_0_RREADY),
    .m_axi_RRESP(m_axi_chan_0_RRESP),
    .m_axi_RVALID(m_axi_chan_0_RVALID),
    .m_axi_WDATA(m_axi_chan_0_WDATA),
    .m_axi_WLAST(m_axi_chan_0_WLAST),
    .m_axi_WREADY(m_axi_chan_0_WREADY),
    .m_axi_WSTRB(m_axi_chan_0_WSTRB),
    .m_axi_WVALID(m_axi_chan_0_WVALID),
    .read_addr_din(chan_0_read_addr__din),
    .read_addr_full_n(chan_0_read_addr__full_n),
    .read_addr_write(chan_0_read_addr__write),
    .read_data_dout(chan_0_read_data__dout),
    .read_data_empty_n(chan_0_read_data__empty_n),
    .read_data_read(chan_0_read_data__read),
    .write_addr_din(chan_0_write_addr__din),
    .write_addr_full_n(chan_0_write_addr__full_n),
    .write_addr_write(chan_0_write_addr__write),
    .write_data_din(chan_0_write_data__din),
    .write_data_full_n(chan_0_write_data__full_n),
    .write_data_write(chan_0_write_data__write),
    .write_resp_dout(chan_0_write_resp__dout),
    .write_resp_empty_n(chan_0_write_resp__empty_n),
    .write_resp_read(chan_0_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  chan_1__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .m_axi_ARADDR(m_axi_chan_1_ARADDR),
    .m_axi_ARBURST(m_axi_chan_1_ARBURST),
    .m_axi_ARCACHE(m_axi_chan_1_ARCACHE),
    .m_axi_ARID(m_axi_chan_1_ARID),
    .m_axi_ARLEN(m_axi_chan_1_ARLEN),
    .m_axi_ARLOCK(m_axi_chan_1_ARLOCK),
    .m_axi_ARPROT(m_axi_chan_1_ARPROT),
    .m_axi_ARQOS(m_axi_chan_1_ARQOS),
    .m_axi_ARREADY(m_axi_chan_1_ARREADY),
    .m_axi_ARSIZE(m_axi_chan_1_ARSIZE),
    .m_axi_ARVALID(m_axi_chan_1_ARVALID),
    .m_axi_AWADDR(m_axi_chan_1_AWADDR),
    .m_axi_AWBURST(m_axi_chan_1_AWBURST),
    .m_axi_AWCACHE(m_axi_chan_1_AWCACHE),
    .m_axi_AWID(m_axi_chan_1_AWID),
    .m_axi_AWLEN(m_axi_chan_1_AWLEN),
    .m_axi_AWLOCK(m_axi_chan_1_AWLOCK),
    .m_axi_AWPROT(m_axi_chan_1_AWPROT),
    .m_axi_AWQOS(m_axi_chan_1_AWQOS),
    .m_axi_AWREADY(m_axi_chan_1_AWREADY),
    .m_axi_AWSIZE(m_axi_chan_1_AWSIZE),
    .m_axi_AWVALID(m_axi_chan_1_AWVALID),
    .m_axi_BID(m_axi_chan_1_BID),
    .m_axi_BREADY(m_axi_chan_1_BREADY),
    .m_axi_BRESP(m_axi_chan_1_BRESP),
    .m_axi_BVALID(m_axi_chan_1_BVALID),
    .m_axi_RDATA(m_axi_chan_1_RDATA),
    .m_axi_RID(m_axi_chan_1_RID),
    .m_axi_RLAST(m_axi_chan_1_RLAST),
    .m_axi_RREADY(m_axi_chan_1_RREADY),
    .m_axi_RRESP(m_axi_chan_1_RRESP),
    .m_axi_RVALID(m_axi_chan_1_RVALID),
    .m_axi_WDATA(m_axi_chan_1_WDATA),
    .m_axi_WLAST(m_axi_chan_1_WLAST),
    .m_axi_WREADY(m_axi_chan_1_WREADY),
    .m_axi_WSTRB(m_axi_chan_1_WSTRB),
    .m_axi_WVALID(m_axi_chan_1_WVALID),
    .read_addr_din(chan_1_read_addr__din),
    .read_addr_full_n(chan_1_read_addr__full_n),
    .read_addr_write(chan_1_read_addr__write),
    .read_data_dout(chan_1_read_data__dout),
    .read_data_empty_n(chan_1_read_data__empty_n),
    .read_data_read(chan_1_read_data__read),
    .write_addr_din(chan_1_write_addr__din),
    .write_addr_full_n(chan_1_write_addr__full_n),
    .write_addr_write(chan_1_write_addr__write),
    .write_data_din(chan_1_write_data__din),
    .write_data_full_n(chan_1_write_data__full_n),
    .write_data_write(chan_1_write_data__write),
    .write_resp_dout(chan_1_write_resp__dout),
    .write_resp_empty_n(chan_1_write_resp__empty_n),
    .write_resp_read(chan_1_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) bandwidth_fsm
  __tapa_fsm_unit
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .chan_0(chan_0),
    .flags(flags),
    .n(n),
    .chan_1(chan_1),
    .Copy_0___chan_0__q0(Copy_0___chan_0__q0),
    .Copy_0___flags__q0(Copy_0___flags__q0),
    .Copy_0___n__q0(Copy_0___n__q0),
    .Copy_0__ap_start(Copy_0__ap_start),
    .Copy_0__ap_ready(Copy_0__ap_ready),
    .Copy_0__ap_done(Copy_0__ap_done),
    .Copy_0__ap_idle(Copy_0__ap_idle),
    .Copy_1___chan_1__q0(Copy_1___chan_1__q0),
    .Copy_1___flags__q0(Copy_1___flags__q0),
    .Copy_1___n__q0(Copy_1___n__q0),
    .Copy_1__ap_start(Copy_1__ap_start),
    .Copy_1__ap_ready(Copy_1__ap_ready),
    .Copy_1__ap_done(Copy_1__ap_done),
    .Copy_1__ap_idle(Copy_1__ap_idle)
  );

  assign ap_rst_n_inv = (~ap_rst_n);

endmodule

