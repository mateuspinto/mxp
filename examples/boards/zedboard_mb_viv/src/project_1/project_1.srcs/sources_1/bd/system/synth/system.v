//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Tue Aug  7 16:02:02 2018
//Host        : avx running 64-bit Ubuntu 16.04.5 LTS
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module m00_couplers_imp_1JKB383
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [1:0]M_AXI_arid;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [1:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [5:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [5:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output [1:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [1:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [1:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [1:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [1:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_m00_couplers_ARADDR;
  wire [1:0]auto_pc_to_m00_couplers_ARBURST;
  wire [3:0]auto_pc_to_m00_couplers_ARCACHE;
  wire [1:0]auto_pc_to_m00_couplers_ARID;
  wire [3:0]auto_pc_to_m00_couplers_ARLEN;
  wire [1:0]auto_pc_to_m00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_m00_couplers_ARPROT;
  wire [3:0]auto_pc_to_m00_couplers_ARQOS;
  wire auto_pc_to_m00_couplers_ARREADY;
  wire [2:0]auto_pc_to_m00_couplers_ARSIZE;
  wire auto_pc_to_m00_couplers_ARVALID;
  wire [31:0]auto_pc_to_m00_couplers_AWADDR;
  wire [1:0]auto_pc_to_m00_couplers_AWBURST;
  wire [3:0]auto_pc_to_m00_couplers_AWCACHE;
  wire [1:0]auto_pc_to_m00_couplers_AWID;
  wire [3:0]auto_pc_to_m00_couplers_AWLEN;
  wire [1:0]auto_pc_to_m00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_m00_couplers_AWPROT;
  wire [3:0]auto_pc_to_m00_couplers_AWQOS;
  wire auto_pc_to_m00_couplers_AWREADY;
  wire [2:0]auto_pc_to_m00_couplers_AWSIZE;
  wire auto_pc_to_m00_couplers_AWVALID;
  wire [5:0]auto_pc_to_m00_couplers_BID;
  wire auto_pc_to_m00_couplers_BREADY;
  wire [1:0]auto_pc_to_m00_couplers_BRESP;
  wire auto_pc_to_m00_couplers_BVALID;
  wire [31:0]auto_pc_to_m00_couplers_RDATA;
  wire [5:0]auto_pc_to_m00_couplers_RID;
  wire auto_pc_to_m00_couplers_RLAST;
  wire auto_pc_to_m00_couplers_RREADY;
  wire [1:0]auto_pc_to_m00_couplers_RRESP;
  wire auto_pc_to_m00_couplers_RVALID;
  wire [31:0]auto_pc_to_m00_couplers_WDATA;
  wire [1:0]auto_pc_to_m00_couplers_WID;
  wire auto_pc_to_m00_couplers_WLAST;
  wire auto_pc_to_m00_couplers_WREADY;
  wire [3:0]auto_pc_to_m00_couplers_WSTRB;
  wire auto_pc_to_m00_couplers_WVALID;
  wire [31:0]m00_couplers_to_auto_pc_ARADDR;
  wire [1:0]m00_couplers_to_auto_pc_ARBURST;
  wire [3:0]m00_couplers_to_auto_pc_ARCACHE;
  wire [1:0]m00_couplers_to_auto_pc_ARID;
  wire [7:0]m00_couplers_to_auto_pc_ARLEN;
  wire [0:0]m00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m00_couplers_to_auto_pc_ARPROT;
  wire [3:0]m00_couplers_to_auto_pc_ARQOS;
  wire m00_couplers_to_auto_pc_ARREADY;
  wire [3:0]m00_couplers_to_auto_pc_ARREGION;
  wire [2:0]m00_couplers_to_auto_pc_ARSIZE;
  wire m00_couplers_to_auto_pc_ARVALID;
  wire [31:0]m00_couplers_to_auto_pc_AWADDR;
  wire [1:0]m00_couplers_to_auto_pc_AWBURST;
  wire [3:0]m00_couplers_to_auto_pc_AWCACHE;
  wire [1:0]m00_couplers_to_auto_pc_AWID;
  wire [7:0]m00_couplers_to_auto_pc_AWLEN;
  wire [0:0]m00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m00_couplers_to_auto_pc_AWPROT;
  wire [3:0]m00_couplers_to_auto_pc_AWQOS;
  wire m00_couplers_to_auto_pc_AWREADY;
  wire [3:0]m00_couplers_to_auto_pc_AWREGION;
  wire [2:0]m00_couplers_to_auto_pc_AWSIZE;
  wire m00_couplers_to_auto_pc_AWVALID;
  wire [1:0]m00_couplers_to_auto_pc_BID;
  wire m00_couplers_to_auto_pc_BREADY;
  wire [1:0]m00_couplers_to_auto_pc_BRESP;
  wire m00_couplers_to_auto_pc_BVALID;
  wire [31:0]m00_couplers_to_auto_pc_RDATA;
  wire [1:0]m00_couplers_to_auto_pc_RID;
  wire m00_couplers_to_auto_pc_RLAST;
  wire m00_couplers_to_auto_pc_RREADY;
  wire [1:0]m00_couplers_to_auto_pc_RRESP;
  wire m00_couplers_to_auto_pc_RVALID;
  wire [31:0]m00_couplers_to_auto_pc_WDATA;
  wire m00_couplers_to_auto_pc_WLAST;
  wire m00_couplers_to_auto_pc_WREADY;
  wire [3:0]m00_couplers_to_auto_pc_WSTRB;
  wire m00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_m00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_m00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_m00_couplers_ARCACHE;
  assign M_AXI_arid[1:0] = auto_pc_to_m00_couplers_ARID;
  assign M_AXI_arlen[3:0] = auto_pc_to_m00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_pc_to_m00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_m00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_m00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_m00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_m00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_m00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_m00_couplers_AWCACHE;
  assign M_AXI_awid[1:0] = auto_pc_to_m00_couplers_AWID;
  assign M_AXI_awlen[3:0] = auto_pc_to_m00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = auto_pc_to_m00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_m00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_m00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_m00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_m00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m00_couplers_WDATA;
  assign M_AXI_wid[1:0] = auto_pc_to_m00_couplers_WID;
  assign M_AXI_wlast = auto_pc_to_m00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[1:0] = m00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[1:0] = m00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m00_couplers_BID = M_AXI_bid[5:0];
  assign auto_pc_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m00_couplers_RID = M_AXI_rid[5:0];
  assign auto_pc_to_m00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_auto_pc_ARID = S_AXI_arid[1:0];
  assign m00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m00_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_auto_pc_AWID = S_AXI_awid[1:0];
  assign m00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m00_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  system_auto_pc_1 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_m00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_m00_couplers_ARCACHE),
        .m_axi_arid(auto_pc_to_m00_couplers_ARID),
        .m_axi_arlen(auto_pc_to_m00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_m00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_m00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_m00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_m00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_m00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_m00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_m00_couplers_AWCACHE),
        .m_axi_awid(auto_pc_to_m00_couplers_AWID),
        .m_axi_awlen(auto_pc_to_m00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_m00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_m00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_m00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_m00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_m00_couplers_AWVALID),
        .m_axi_bid(auto_pc_to_m00_couplers_BID[1:0]),
        .m_axi_bready(auto_pc_to_m00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m00_couplers_RDATA),
        .m_axi_rid(auto_pc_to_m00_couplers_RID[1:0]),
        .m_axi_rlast(auto_pc_to_m00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_m00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m00_couplers_WDATA),
        .m_axi_wid(auto_pc_to_m00_couplers_WID),
        .m_axi_wlast(auto_pc_to_m00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_m00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m00_couplers_WVALID),
        .s_axi_araddr(m00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(m00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m00_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(m00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m00_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m00_couplers_to_auto_pc_BID),
        .s_axi_bready(m00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m00_couplers_to_auto_pc_RID),
        .s_axi_rlast(m00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m00_couplers_to_auto_pc_WVALID));
endmodule

module m00_couplers_imp_QRRUQG
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire m00_couplers_to_m00_couplers_ARREADY;
  wire m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire m00_couplers_to_m00_couplers_AWREADY;
  wire m00_couplers_to_m00_couplers_AWVALID;
  wire m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid;
endmodule

module m01_couplers_imp_1L6HPS9
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire m01_couplers_to_m01_couplers_ARREADY;
  wire m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire m01_couplers_to_m01_couplers_AWREADY;
  wire m01_couplers_to_m01_couplers_AWVALID;
  wire m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready;
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready;
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready;
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready;
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid;
endmodule

module m02_couplers_imp_1SBZOL7
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_m02_couplers_ARADDR;
  wire [1:0]auto_pc_to_m02_couplers_ARBURST;
  wire [3:0]auto_pc_to_m02_couplers_ARCACHE;
  wire [3:0]auto_pc_to_m02_couplers_ARLEN;
  wire [1:0]auto_pc_to_m02_couplers_ARLOCK;
  wire [2:0]auto_pc_to_m02_couplers_ARPROT;
  wire [3:0]auto_pc_to_m02_couplers_ARQOS;
  wire auto_pc_to_m02_couplers_ARREADY;
  wire [2:0]auto_pc_to_m02_couplers_ARSIZE;
  wire auto_pc_to_m02_couplers_ARVALID;
  wire [31:0]auto_pc_to_m02_couplers_AWADDR;
  wire [1:0]auto_pc_to_m02_couplers_AWBURST;
  wire [3:0]auto_pc_to_m02_couplers_AWCACHE;
  wire [3:0]auto_pc_to_m02_couplers_AWLEN;
  wire [1:0]auto_pc_to_m02_couplers_AWLOCK;
  wire [2:0]auto_pc_to_m02_couplers_AWPROT;
  wire [3:0]auto_pc_to_m02_couplers_AWQOS;
  wire auto_pc_to_m02_couplers_AWREADY;
  wire [2:0]auto_pc_to_m02_couplers_AWSIZE;
  wire auto_pc_to_m02_couplers_AWVALID;
  wire auto_pc_to_m02_couplers_BREADY;
  wire [1:0]auto_pc_to_m02_couplers_BRESP;
  wire auto_pc_to_m02_couplers_BVALID;
  wire [31:0]auto_pc_to_m02_couplers_RDATA;
  wire auto_pc_to_m02_couplers_RLAST;
  wire auto_pc_to_m02_couplers_RREADY;
  wire [1:0]auto_pc_to_m02_couplers_RRESP;
  wire auto_pc_to_m02_couplers_RVALID;
  wire [31:0]auto_pc_to_m02_couplers_WDATA;
  wire auto_pc_to_m02_couplers_WLAST;
  wire auto_pc_to_m02_couplers_WREADY;
  wire [3:0]auto_pc_to_m02_couplers_WSTRB;
  wire auto_pc_to_m02_couplers_WVALID;
  wire [31:0]m02_couplers_to_auto_pc_ARADDR;
  wire [2:0]m02_couplers_to_auto_pc_ARPROT;
  wire m02_couplers_to_auto_pc_ARREADY;
  wire m02_couplers_to_auto_pc_ARVALID;
  wire [31:0]m02_couplers_to_auto_pc_AWADDR;
  wire [2:0]m02_couplers_to_auto_pc_AWPROT;
  wire m02_couplers_to_auto_pc_AWREADY;
  wire m02_couplers_to_auto_pc_AWVALID;
  wire m02_couplers_to_auto_pc_BREADY;
  wire [1:0]m02_couplers_to_auto_pc_BRESP;
  wire m02_couplers_to_auto_pc_BVALID;
  wire [31:0]m02_couplers_to_auto_pc_RDATA;
  wire m02_couplers_to_auto_pc_RREADY;
  wire [1:0]m02_couplers_to_auto_pc_RRESP;
  wire m02_couplers_to_auto_pc_RVALID;
  wire [31:0]m02_couplers_to_auto_pc_WDATA;
  wire m02_couplers_to_auto_pc_WREADY;
  wire [3:0]m02_couplers_to_auto_pc_WSTRB;
  wire m02_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_m02_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_m02_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_m02_couplers_ARCACHE;
  assign M_AXI_arlen[3:0] = auto_pc_to_m02_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_pc_to_m02_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_m02_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_m02_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_m02_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_m02_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_m02_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_m02_couplers_AWCACHE;
  assign M_AXI_awlen[3:0] = auto_pc_to_m02_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = auto_pc_to_m02_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_m02_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_m02_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_m02_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_m02_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m02_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m02_couplers_WDATA;
  assign M_AXI_wlast = auto_pc_to_m02_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m02_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m02_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m02_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_auto_pc_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m02_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m02_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m02_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m02_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m02_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m02_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m02_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m02_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  system_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m02_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_m02_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_m02_couplers_ARCACHE),
        .m_axi_arlen(auto_pc_to_m02_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_m02_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_m02_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_m02_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_m02_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_m02_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_m02_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m02_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_m02_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_m02_couplers_AWCACHE),
        .m_axi_awlen(auto_pc_to_m02_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_m02_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_m02_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_m02_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_m02_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_m02_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_m02_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m02_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m02_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m02_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m02_couplers_RDATA),
        .m_axi_rlast(auto_pc_to_m02_couplers_RLAST),
        .m_axi_rready(auto_pc_to_m02_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m02_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m02_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m02_couplers_WDATA),
        .m_axi_wlast(auto_pc_to_m02_couplers_WLAST),
        .m_axi_wready(auto_pc_to_m02_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m02_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m02_couplers_WVALID),
        .s_axi_araddr(m02_couplers_to_auto_pc_ARADDR),
        .s_axi_arprot(m02_couplers_to_auto_pc_ARPROT),
        .s_axi_arready(m02_couplers_to_auto_pc_ARREADY),
        .s_axi_arvalid(m02_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m02_couplers_to_auto_pc_AWADDR),
        .s_axi_awprot(m02_couplers_to_auto_pc_AWPROT),
        .s_axi_awready(m02_couplers_to_auto_pc_AWREADY),
        .s_axi_awvalid(m02_couplers_to_auto_pc_AWVALID),
        .s_axi_bready(m02_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m02_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m02_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m02_couplers_to_auto_pc_RDATA),
        .s_axi_rready(m02_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m02_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m02_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m02_couplers_to_auto_pc_WDATA),
        .s_axi_wready(m02_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m02_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m02_couplers_to_auto_pc_WVALID));
endmodule

module m03_couplers_imp_KG89T6
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m03_couplers_to_m03_couplers_ARADDR;
  wire m03_couplers_to_m03_couplers_ARREADY;
  wire m03_couplers_to_m03_couplers_ARVALID;
  wire [31:0]m03_couplers_to_m03_couplers_AWADDR;
  wire m03_couplers_to_m03_couplers_AWREADY;
  wire m03_couplers_to_m03_couplers_AWVALID;
  wire m03_couplers_to_m03_couplers_BREADY;
  wire [1:0]m03_couplers_to_m03_couplers_BRESP;
  wire m03_couplers_to_m03_couplers_BVALID;
  wire [31:0]m03_couplers_to_m03_couplers_RDATA;
  wire m03_couplers_to_m03_couplers_RREADY;
  wire [1:0]m03_couplers_to_m03_couplers_RRESP;
  wire m03_couplers_to_m03_couplers_RVALID;
  wire [31:0]m03_couplers_to_m03_couplers_WDATA;
  wire m03_couplers_to_m03_couplers_WREADY;
  wire [3:0]m03_couplers_to_m03_couplers_WSTRB;
  wire m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arvalid = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awvalid = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m03_couplers_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready;
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid;
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready;
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid;
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready;
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid;
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready;
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid;
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready;
  assign m03_couplers_to_m03_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid;
endmodule

module m04_couplers_imp_1E0ZEFZ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m04_couplers_to_m04_couplers_ARADDR;
  wire [2:0]m04_couplers_to_m04_couplers_ARPROT;
  wire m04_couplers_to_m04_couplers_ARREADY;
  wire m04_couplers_to_m04_couplers_ARVALID;
  wire [31:0]m04_couplers_to_m04_couplers_AWADDR;
  wire [2:0]m04_couplers_to_m04_couplers_AWPROT;
  wire m04_couplers_to_m04_couplers_AWREADY;
  wire m04_couplers_to_m04_couplers_AWVALID;
  wire m04_couplers_to_m04_couplers_BREADY;
  wire [1:0]m04_couplers_to_m04_couplers_BRESP;
  wire m04_couplers_to_m04_couplers_BVALID;
  wire [31:0]m04_couplers_to_m04_couplers_RDATA;
  wire m04_couplers_to_m04_couplers_RREADY;
  wire [1:0]m04_couplers_to_m04_couplers_RRESP;
  wire m04_couplers_to_m04_couplers_RVALID;
  wire [31:0]m04_couplers_to_m04_couplers_WDATA;
  wire m04_couplers_to_m04_couplers_WREADY;
  wire [3:0]m04_couplers_to_m04_couplers_WSTRB;
  wire m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m04_couplers_to_m04_couplers_ARPROT;
  assign M_AXI_arvalid = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m04_couplers_to_m04_couplers_AWPROT;
  assign M_AXI_awvalid = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m04_couplers_to_m04_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready;
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid;
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m04_couplers_to_m04_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready;
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid;
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready;
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid;
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready;
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid;
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready;
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_1YZ8LTU
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [1:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [1:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [1:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [1:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [0:0]s00_couplers_to_s00_couplers_ARID;
  wire [7:0]s00_couplers_to_s00_couplers_ARLEN;
  wire s00_couplers_to_s00_couplers_ARLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [3:0]s00_couplers_to_s00_couplers_ARQOS;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [1:0]s00_couplers_to_s00_couplers_AWBURST;
  wire [3:0]s00_couplers_to_s00_couplers_AWCACHE;
  wire [0:0]s00_couplers_to_s00_couplers_AWID;
  wire [7:0]s00_couplers_to_s00_couplers_AWLEN;
  wire s00_couplers_to_s00_couplers_AWLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [3:0]s00_couplers_to_s00_couplers_AWQOS;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire [2:0]s00_couplers_to_s00_couplers_AWSIZE;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire [1:0]s00_couplers_to_s00_couplers_BID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [1:0]s00_couplers_to_s00_couplers_RID;
  wire s00_couplers_to_s00_couplers_RLAST;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire s00_couplers_to_s00_couplers_WLAST;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[0] = s00_couplers_to_s00_couplers_ARID;
  assign M_AXI_arlen[7:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arlock = s00_couplers_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s00_couplers_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_couplers_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_couplers_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[0] = s00_couplers_to_s00_couplers_AWID;
  assign M_AXI_awlen[7:0] = s00_couplers_to_s00_couplers_AWLEN;
  assign M_AXI_awlock = s00_couplers_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s00_couplers_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s00_couplers_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wlast = s00_couplers_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bid[1:0] = s00_couplers_to_s00_couplers_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rid[1:0] = s00_couplers_to_s00_couplers_RID;
  assign S_AXI_rlast = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARID = S_AXI_arid[0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_s00_couplers_ARLOCK = S_AXI_arlock;
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_s00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_s00_couplers_AWID = S_AXI_awid[0];
  assign s00_couplers_to_s00_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_s00_couplers_AWLOCK = S_AXI_awlock;
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BID = M_AXI_bid[1:0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RID = M_AXI_rid[1:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WLAST = S_AXI_wlast;
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_EPGNPQ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [3:0]M_AXI_arlen;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [3:0]M_AXI_awlen;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [63:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [63:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [3:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [3:0]S_AXI_awlen;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [63:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [63:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [7:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [3:0]s00_couplers_to_s00_couplers_ARLEN;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [1:0]s00_couplers_to_s00_couplers_AWBURST;
  wire [3:0]s00_couplers_to_s00_couplers_AWCACHE;
  wire [3:0]s00_couplers_to_s00_couplers_AWLEN;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire [2:0]s00_couplers_to_s00_couplers_AWSIZE;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [63:0]s00_couplers_to_s00_couplers_RDATA;
  wire s00_couplers_to_s00_couplers_RLAST;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [63:0]s00_couplers_to_s00_couplers_WDATA;
  wire s00_couplers_to_s00_couplers_WLAST;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [7:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[3:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_couplers_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_couplers_to_s00_couplers_AWCACHE;
  assign M_AXI_awlen[3:0] = s00_couplers_to_s00_couplers_AWLEN;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = s00_couplers_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[63:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wlast = s00_couplers_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[63:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rlast = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_s00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_s00_couplers_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[63:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[63:0];
  assign s00_couplers_to_s00_couplers_WLAST = S_AXI_wlast;
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[7:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_OEGX55
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule

module s01_couplers_imp_MNM9SJ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [1:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [1:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [1:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [1:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s01_couplers_to_s01_couplers_ARADDR;
  wire [1:0]s01_couplers_to_s01_couplers_ARBURST;
  wire [3:0]s01_couplers_to_s01_couplers_ARCACHE;
  wire [0:0]s01_couplers_to_s01_couplers_ARID;
  wire [7:0]s01_couplers_to_s01_couplers_ARLEN;
  wire s01_couplers_to_s01_couplers_ARLOCK;
  wire [2:0]s01_couplers_to_s01_couplers_ARPROT;
  wire [3:0]s01_couplers_to_s01_couplers_ARQOS;
  wire s01_couplers_to_s01_couplers_ARREADY;
  wire [2:0]s01_couplers_to_s01_couplers_ARSIZE;
  wire s01_couplers_to_s01_couplers_ARVALID;
  wire [31:0]s01_couplers_to_s01_couplers_AWADDR;
  wire [1:0]s01_couplers_to_s01_couplers_AWBURST;
  wire [3:0]s01_couplers_to_s01_couplers_AWCACHE;
  wire [0:0]s01_couplers_to_s01_couplers_AWID;
  wire [7:0]s01_couplers_to_s01_couplers_AWLEN;
  wire s01_couplers_to_s01_couplers_AWLOCK;
  wire [2:0]s01_couplers_to_s01_couplers_AWPROT;
  wire [3:0]s01_couplers_to_s01_couplers_AWQOS;
  wire s01_couplers_to_s01_couplers_AWREADY;
  wire [2:0]s01_couplers_to_s01_couplers_AWSIZE;
  wire s01_couplers_to_s01_couplers_AWVALID;
  wire [1:0]s01_couplers_to_s01_couplers_BID;
  wire s01_couplers_to_s01_couplers_BREADY;
  wire [1:0]s01_couplers_to_s01_couplers_BRESP;
  wire s01_couplers_to_s01_couplers_BVALID;
  wire [31:0]s01_couplers_to_s01_couplers_RDATA;
  wire [1:0]s01_couplers_to_s01_couplers_RID;
  wire s01_couplers_to_s01_couplers_RLAST;
  wire s01_couplers_to_s01_couplers_RREADY;
  wire [1:0]s01_couplers_to_s01_couplers_RRESP;
  wire s01_couplers_to_s01_couplers_RVALID;
  wire [31:0]s01_couplers_to_s01_couplers_WDATA;
  wire s01_couplers_to_s01_couplers_WLAST;
  wire s01_couplers_to_s01_couplers_WREADY;
  wire [3:0]s01_couplers_to_s01_couplers_WSTRB;
  wire s01_couplers_to_s01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s01_couplers_to_s01_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s01_couplers_to_s01_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s01_couplers_to_s01_couplers_ARCACHE;
  assign M_AXI_arid[0] = s01_couplers_to_s01_couplers_ARID;
  assign M_AXI_arlen[7:0] = s01_couplers_to_s01_couplers_ARLEN;
  assign M_AXI_arlock = s01_couplers_to_s01_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s01_couplers_to_s01_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s01_couplers_to_s01_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s01_couplers_to_s01_couplers_ARSIZE;
  assign M_AXI_arvalid = s01_couplers_to_s01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s01_couplers_to_s01_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s01_couplers_to_s01_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s01_couplers_to_s01_couplers_AWCACHE;
  assign M_AXI_awid[0] = s01_couplers_to_s01_couplers_AWID;
  assign M_AXI_awlen[7:0] = s01_couplers_to_s01_couplers_AWLEN;
  assign M_AXI_awlock = s01_couplers_to_s01_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s01_couplers_to_s01_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s01_couplers_to_s01_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s01_couplers_to_s01_couplers_AWSIZE;
  assign M_AXI_awvalid = s01_couplers_to_s01_couplers_AWVALID;
  assign M_AXI_bready = s01_couplers_to_s01_couplers_BREADY;
  assign M_AXI_rready = s01_couplers_to_s01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s01_couplers_to_s01_couplers_WDATA;
  assign M_AXI_wlast = s01_couplers_to_s01_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = s01_couplers_to_s01_couplers_WSTRB;
  assign M_AXI_wvalid = s01_couplers_to_s01_couplers_WVALID;
  assign S_AXI_arready = s01_couplers_to_s01_couplers_ARREADY;
  assign S_AXI_awready = s01_couplers_to_s01_couplers_AWREADY;
  assign S_AXI_bid[1:0] = s01_couplers_to_s01_couplers_BID;
  assign S_AXI_bresp[1:0] = s01_couplers_to_s01_couplers_BRESP;
  assign S_AXI_bvalid = s01_couplers_to_s01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s01_couplers_to_s01_couplers_RDATA;
  assign S_AXI_rid[1:0] = s01_couplers_to_s01_couplers_RID;
  assign S_AXI_rlast = s01_couplers_to_s01_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s01_couplers_to_s01_couplers_RRESP;
  assign S_AXI_rvalid = s01_couplers_to_s01_couplers_RVALID;
  assign S_AXI_wready = s01_couplers_to_s01_couplers_WREADY;
  assign s01_couplers_to_s01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s01_couplers_to_s01_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s01_couplers_to_s01_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s01_couplers_to_s01_couplers_ARID = S_AXI_arid[0];
  assign s01_couplers_to_s01_couplers_ARLEN = S_AXI_arlen[7:0];
  assign s01_couplers_to_s01_couplers_ARLOCK = S_AXI_arlock;
  assign s01_couplers_to_s01_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s01_couplers_to_s01_couplers_ARQOS = S_AXI_arqos[3:0];
  assign s01_couplers_to_s01_couplers_ARREADY = M_AXI_arready;
  assign s01_couplers_to_s01_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s01_couplers_to_s01_couplers_ARVALID = S_AXI_arvalid;
  assign s01_couplers_to_s01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s01_couplers_to_s01_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s01_couplers_to_s01_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s01_couplers_to_s01_couplers_AWID = S_AXI_awid[0];
  assign s01_couplers_to_s01_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s01_couplers_to_s01_couplers_AWLOCK = S_AXI_awlock;
  assign s01_couplers_to_s01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s01_couplers_to_s01_couplers_AWQOS = S_AXI_awqos[3:0];
  assign s01_couplers_to_s01_couplers_AWREADY = M_AXI_awready;
  assign s01_couplers_to_s01_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s01_couplers_to_s01_couplers_AWVALID = S_AXI_awvalid;
  assign s01_couplers_to_s01_couplers_BID = M_AXI_bid[1:0];
  assign s01_couplers_to_s01_couplers_BREADY = S_AXI_bready;
  assign s01_couplers_to_s01_couplers_BRESP = M_AXI_bresp[1:0];
  assign s01_couplers_to_s01_couplers_BVALID = M_AXI_bvalid;
  assign s01_couplers_to_s01_couplers_RDATA = M_AXI_rdata[31:0];
  assign s01_couplers_to_s01_couplers_RID = M_AXI_rid[1:0];
  assign s01_couplers_to_s01_couplers_RLAST = M_AXI_rlast;
  assign s01_couplers_to_s01_couplers_RREADY = S_AXI_rready;
  assign s01_couplers_to_s01_couplers_RRESP = M_AXI_rresp[1:0];
  assign s01_couplers_to_s01_couplers_RVALID = M_AXI_rvalid;
  assign s01_couplers_to_s01_couplers_WDATA = S_AXI_wdata[31:0];
  assign s01_couplers_to_s01_couplers_WLAST = S_AXI_wlast;
  assign s01_couplers_to_s01_couplers_WREADY = M_AXI_wready;
  assign s01_couplers_to_s01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s01_couplers_to_s01_couplers_WVALID = S_AXI_wvalid;
endmodule

module s02_couplers_imp_XF0EZL
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s02_couplers_ARADDR;
  wire [1:0]auto_pc_to_s02_couplers_ARBURST;
  wire [3:0]auto_pc_to_s02_couplers_ARCACHE;
  wire [7:0]auto_pc_to_s02_couplers_ARLEN;
  wire [0:0]auto_pc_to_s02_couplers_ARLOCK;
  wire [2:0]auto_pc_to_s02_couplers_ARPROT;
  wire [3:0]auto_pc_to_s02_couplers_ARQOS;
  wire auto_pc_to_s02_couplers_ARREADY;
  wire [2:0]auto_pc_to_s02_couplers_ARSIZE;
  wire auto_pc_to_s02_couplers_ARVALID;
  wire [31:0]auto_pc_to_s02_couplers_AWADDR;
  wire [1:0]auto_pc_to_s02_couplers_AWBURST;
  wire [3:0]auto_pc_to_s02_couplers_AWCACHE;
  wire [7:0]auto_pc_to_s02_couplers_AWLEN;
  wire [0:0]auto_pc_to_s02_couplers_AWLOCK;
  wire [2:0]auto_pc_to_s02_couplers_AWPROT;
  wire [3:0]auto_pc_to_s02_couplers_AWQOS;
  wire auto_pc_to_s02_couplers_AWREADY;
  wire [2:0]auto_pc_to_s02_couplers_AWSIZE;
  wire auto_pc_to_s02_couplers_AWVALID;
  wire auto_pc_to_s02_couplers_BREADY;
  wire [1:0]auto_pc_to_s02_couplers_BRESP;
  wire auto_pc_to_s02_couplers_BVALID;
  wire [31:0]auto_pc_to_s02_couplers_RDATA;
  wire auto_pc_to_s02_couplers_RLAST;
  wire auto_pc_to_s02_couplers_RREADY;
  wire [1:0]auto_pc_to_s02_couplers_RRESP;
  wire auto_pc_to_s02_couplers_RVALID;
  wire [31:0]auto_pc_to_s02_couplers_WDATA;
  wire auto_pc_to_s02_couplers_WLAST;
  wire auto_pc_to_s02_couplers_WREADY;
  wire [3:0]auto_pc_to_s02_couplers_WSTRB;
  wire auto_pc_to_s02_couplers_WVALID;
  wire [31:0]s02_couplers_to_auto_pc_ARADDR;
  wire [2:0]s02_couplers_to_auto_pc_ARPROT;
  wire s02_couplers_to_auto_pc_ARREADY;
  wire s02_couplers_to_auto_pc_ARVALID;
  wire [31:0]s02_couplers_to_auto_pc_AWADDR;
  wire [2:0]s02_couplers_to_auto_pc_AWPROT;
  wire s02_couplers_to_auto_pc_AWREADY;
  wire s02_couplers_to_auto_pc_AWVALID;
  wire s02_couplers_to_auto_pc_BREADY;
  wire [1:0]s02_couplers_to_auto_pc_BRESP;
  wire s02_couplers_to_auto_pc_BVALID;
  wire [31:0]s02_couplers_to_auto_pc_RDATA;
  wire s02_couplers_to_auto_pc_RREADY;
  wire [1:0]s02_couplers_to_auto_pc_RRESP;
  wire s02_couplers_to_auto_pc_RVALID;
  wire [31:0]s02_couplers_to_auto_pc_WDATA;
  wire s02_couplers_to_auto_pc_WREADY;
  wire [3:0]s02_couplers_to_auto_pc_WSTRB;
  wire s02_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s02_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_s02_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_s02_couplers_ARCACHE;
  assign M_AXI_arlen[7:0] = auto_pc_to_s02_couplers_ARLEN;
  assign M_AXI_arlock[0] = auto_pc_to_s02_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_s02_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_s02_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_s02_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_s02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s02_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_s02_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_s02_couplers_AWCACHE;
  assign M_AXI_awlen[7:0] = auto_pc_to_s02_couplers_AWLEN;
  assign M_AXI_awlock[0] = auto_pc_to_s02_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_s02_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_s02_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_s02_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_s02_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s02_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s02_couplers_WDATA;
  assign M_AXI_wlast = auto_pc_to_s02_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s02_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s02_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s02_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s02_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bresp[1:0] = s02_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s02_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s02_couplers_to_auto_pc_RDATA;
  assign S_AXI_rresp[1:0] = s02_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s02_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s02_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s02_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s02_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s02_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s02_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s02_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s02_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_s02_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s02_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s02_couplers_WREADY = M_AXI_wready;
  assign s02_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s02_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s02_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s02_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s02_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s02_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s02_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s02_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s02_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s02_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s02_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  system_auto_pc_2 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s02_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_s02_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_s02_couplers_ARCACHE),
        .m_axi_arlen(auto_pc_to_s02_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_s02_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_s02_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_s02_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_s02_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_s02_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_s02_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s02_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_s02_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_s02_couplers_AWCACHE),
        .m_axi_awlen(auto_pc_to_s02_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_s02_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_s02_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_s02_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_s02_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_s02_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_s02_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s02_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s02_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s02_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s02_couplers_RDATA),
        .m_axi_rlast(auto_pc_to_s02_couplers_RLAST),
        .m_axi_rready(auto_pc_to_s02_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s02_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s02_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s02_couplers_WDATA),
        .m_axi_wlast(auto_pc_to_s02_couplers_WLAST),
        .m_axi_wready(auto_pc_to_s02_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s02_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s02_couplers_WVALID),
        .s_axi_araddr(s02_couplers_to_auto_pc_ARADDR),
        .s_axi_arprot(s02_couplers_to_auto_pc_ARPROT),
        .s_axi_arready(s02_couplers_to_auto_pc_ARREADY),
        .s_axi_arvalid(s02_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s02_couplers_to_auto_pc_AWADDR),
        .s_axi_awprot(s02_couplers_to_auto_pc_AWPROT),
        .s_axi_awready(s02_couplers_to_auto_pc_AWREADY),
        .s_axi_awvalid(s02_couplers_to_auto_pc_AWVALID),
        .s_axi_bready(s02_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s02_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s02_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s02_couplers_to_auto_pc_RDATA),
        .s_axi_rready(s02_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s02_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s02_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s02_couplers_to_auto_pc_WDATA),
        .s_axi_wready(s02_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s02_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s02_couplers_to_auto_pc_WVALID));
endmodule

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=31,numReposBlks=17,numNonXlnxBlks=2,numHierBlks=14,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;

  wire [31:0]S00_AXI_1_ARADDR;
  wire [2:0]S00_AXI_1_ARPROT;
  wire S00_AXI_1_ARREADY;
  wire S00_AXI_1_ARVALID;
  wire [31:0]S00_AXI_1_AWADDR;
  wire [2:0]S00_AXI_1_AWPROT;
  wire S00_AXI_1_AWREADY;
  wire S00_AXI_1_AWVALID;
  wire S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire S00_AXI_1_WVALID;
  wire [31:0]S02_AXI_1_ARADDR;
  wire [2:0]S02_AXI_1_ARPROT;
  wire S02_AXI_1_ARREADY;
  wire S02_AXI_1_ARVALID;
  wire [31:0]S02_AXI_1_AWADDR;
  wire [2:0]S02_AXI_1_AWPROT;
  wire S02_AXI_1_AWREADY;
  wire S02_AXI_1_AWVALID;
  wire S02_AXI_1_BREADY;
  wire [1:0]S02_AXI_1_BRESP;
  wire S02_AXI_1_BVALID;
  wire [31:0]S02_AXI_1_RDATA;
  wire S02_AXI_1_RREADY;
  wire [1:0]S02_AXI_1_RRESP;
  wire S02_AXI_1_RVALID;
  wire [31:0]S02_AXI_1_WDATA;
  wire S02_AXI_1_WREADY;
  wire [3:0]S02_AXI_1_WSTRB;
  wire S02_AXI_1_WVALID;
  wire [31:0]axi4lite_0_M00_AXI_ARADDR;
  wire axi4lite_0_M00_AXI_ARREADY;
  wire axi4lite_0_M00_AXI_ARVALID;
  wire [31:0]axi4lite_0_M00_AXI_AWADDR;
  wire axi4lite_0_M00_AXI_AWREADY;
  wire axi4lite_0_M00_AXI_AWVALID;
  wire axi4lite_0_M00_AXI_BREADY;
  wire [1:0]axi4lite_0_M00_AXI_BRESP;
  wire axi4lite_0_M00_AXI_BVALID;
  wire [31:0]axi4lite_0_M00_AXI_RDATA;
  wire axi4lite_0_M00_AXI_RREADY;
  wire [1:0]axi4lite_0_M00_AXI_RRESP;
  wire axi4lite_0_M00_AXI_RVALID;
  wire [31:0]axi4lite_0_M00_AXI_WDATA;
  wire axi4lite_0_M00_AXI_WREADY;
  wire [3:0]axi4lite_0_M00_AXI_WSTRB;
  wire axi4lite_0_M00_AXI_WVALID;
  wire [31:0]axi4lite_0_M01_AXI_ARADDR;
  wire axi4lite_0_M01_AXI_ARREADY;
  wire axi4lite_0_M01_AXI_ARVALID;
  wire [31:0]axi4lite_0_M01_AXI_AWADDR;
  wire axi4lite_0_M01_AXI_AWREADY;
  wire axi4lite_0_M01_AXI_AWVALID;
  wire axi4lite_0_M01_AXI_BREADY;
  wire [1:0]axi4lite_0_M01_AXI_BRESP;
  wire axi4lite_0_M01_AXI_BVALID;
  wire [31:0]axi4lite_0_M01_AXI_RDATA;
  wire axi4lite_0_M01_AXI_RREADY;
  wire [1:0]axi4lite_0_M01_AXI_RRESP;
  wire axi4lite_0_M01_AXI_RVALID;
  wire [31:0]axi4lite_0_M01_AXI_WDATA;
  wire axi4lite_0_M01_AXI_WREADY;
  wire [3:0]axi4lite_0_M01_AXI_WSTRB;
  wire axi4lite_0_M01_AXI_WVALID;
  wire [31:0]axi4lite_0_M02_AXI_ARADDR;
  wire [1:0]axi4lite_0_M02_AXI_ARBURST;
  wire [3:0]axi4lite_0_M02_AXI_ARCACHE;
  wire [3:0]axi4lite_0_M02_AXI_ARLEN;
  wire [1:0]axi4lite_0_M02_AXI_ARLOCK;
  wire [2:0]axi4lite_0_M02_AXI_ARPROT;
  wire [3:0]axi4lite_0_M02_AXI_ARQOS;
  wire axi4lite_0_M02_AXI_ARREADY;
  wire [2:0]axi4lite_0_M02_AXI_ARSIZE;
  wire axi4lite_0_M02_AXI_ARVALID;
  wire [31:0]axi4lite_0_M02_AXI_AWADDR;
  wire [1:0]axi4lite_0_M02_AXI_AWBURST;
  wire [3:0]axi4lite_0_M02_AXI_AWCACHE;
  wire [3:0]axi4lite_0_M02_AXI_AWLEN;
  wire [1:0]axi4lite_0_M02_AXI_AWLOCK;
  wire [2:0]axi4lite_0_M02_AXI_AWPROT;
  wire [3:0]axi4lite_0_M02_AXI_AWQOS;
  wire axi4lite_0_M02_AXI_AWREADY;
  wire [2:0]axi4lite_0_M02_AXI_AWSIZE;
  wire axi4lite_0_M02_AXI_AWVALID;
  wire axi4lite_0_M02_AXI_BREADY;
  wire [1:0]axi4lite_0_M02_AXI_BRESP;
  wire axi4lite_0_M02_AXI_BVALID;
  wire [31:0]axi4lite_0_M02_AXI_RDATA;
  wire axi4lite_0_M02_AXI_RLAST;
  wire axi4lite_0_M02_AXI_RREADY;
  wire [1:0]axi4lite_0_M02_AXI_RRESP;
  wire axi4lite_0_M02_AXI_RVALID;
  wire [31:0]axi4lite_0_M02_AXI_WDATA;
  wire axi4lite_0_M02_AXI_WLAST;
  wire axi4lite_0_M02_AXI_WREADY;
  wire [3:0]axi4lite_0_M02_AXI_WSTRB;
  wire axi4lite_0_M02_AXI_WVALID;
  wire [31:0]axi4lite_0_M03_AXI_ARADDR;
  wire axi4lite_0_M03_AXI_ARREADY;
  wire axi4lite_0_M03_AXI_ARVALID;
  wire [31:0]axi4lite_0_M03_AXI_AWADDR;
  wire axi4lite_0_M03_AXI_AWREADY;
  wire axi4lite_0_M03_AXI_AWVALID;
  wire axi4lite_0_M03_AXI_BREADY;
  wire [1:0]axi4lite_0_M03_AXI_BRESP;
  wire axi4lite_0_M03_AXI_BVALID;
  wire [31:0]axi4lite_0_M03_AXI_RDATA;
  wire axi4lite_0_M03_AXI_RREADY;
  wire [1:0]axi4lite_0_M03_AXI_RRESP;
  wire axi4lite_0_M03_AXI_RVALID;
  wire [31:0]axi4lite_0_M03_AXI_WDATA;
  wire axi4lite_0_M03_AXI_WREADY;
  wire [3:0]axi4lite_0_M03_AXI_WSTRB;
  wire axi4lite_0_M03_AXI_WVALID;
  wire [31:0]axi4lite_0_M04_AXI_ARADDR;
  wire [2:0]axi4lite_0_M04_AXI_ARPROT;
  wire axi4lite_0_M04_AXI_ARREADY;
  wire axi4lite_0_M04_AXI_ARVALID;
  wire [31:0]axi4lite_0_M04_AXI_AWADDR;
  wire [2:0]axi4lite_0_M04_AXI_AWPROT;
  wire axi4lite_0_M04_AXI_AWREADY;
  wire axi4lite_0_M04_AXI_AWVALID;
  wire axi4lite_0_M04_AXI_BREADY;
  wire [1:0]axi4lite_0_M04_AXI_BRESP;
  wire axi4lite_0_M04_AXI_BVALID;
  wire [31:0]axi4lite_0_M04_AXI_RDATA;
  wire axi4lite_0_M04_AXI_RREADY;
  wire [1:0]axi4lite_0_M04_AXI_RRESP;
  wire axi4lite_0_M04_AXI_RVALID;
  wire [31:0]axi4lite_0_M04_AXI_WDATA;
  wire axi4lite_0_M04_AXI_WREADY;
  wire [3:0]axi4lite_0_M04_AXI_WSTRB;
  wire axi4lite_0_M04_AXI_WVALID;
  wire [31:0]axi_hp_2_M00_AXI_ARADDR;
  wire [1:0]axi_hp_2_M00_AXI_ARBURST;
  wire [3:0]axi_hp_2_M00_AXI_ARCACHE;
  wire [3:0]axi_hp_2_M00_AXI_ARLEN;
  wire [2:0]axi_hp_2_M00_AXI_ARPROT;
  wire axi_hp_2_M00_AXI_ARREADY;
  wire [2:0]axi_hp_2_M00_AXI_ARSIZE;
  wire axi_hp_2_M00_AXI_ARVALID;
  wire [31:0]axi_hp_2_M00_AXI_AWADDR;
  wire [1:0]axi_hp_2_M00_AXI_AWBURST;
  wire [3:0]axi_hp_2_M00_AXI_AWCACHE;
  wire [3:0]axi_hp_2_M00_AXI_AWLEN;
  wire [2:0]axi_hp_2_M00_AXI_AWPROT;
  wire axi_hp_2_M00_AXI_AWREADY;
  wire [2:0]axi_hp_2_M00_AXI_AWSIZE;
  wire axi_hp_2_M00_AXI_AWVALID;
  wire axi_hp_2_M00_AXI_BREADY;
  wire [1:0]axi_hp_2_M00_AXI_BRESP;
  wire axi_hp_2_M00_AXI_BVALID;
  wire [63:0]axi_hp_2_M00_AXI_RDATA;
  wire axi_hp_2_M00_AXI_RLAST;
  wire axi_hp_2_M00_AXI_RREADY;
  wire [1:0]axi_hp_2_M00_AXI_RRESP;
  wire axi_hp_2_M00_AXI_RVALID;
  wire [63:0]axi_hp_2_M00_AXI_WDATA;
  wire axi_hp_2_M00_AXI_WLAST;
  wire axi_hp_2_M00_AXI_WREADY;
  wire [7:0]axi_hp_2_M00_AXI_WSTRB;
  wire axi_hp_2_M00_AXI_WVALID;
  wire [31:0]axi_mem_intercon_M00_AXI_ARADDR;
  wire [1:0]axi_mem_intercon_M00_AXI_ARBURST;
  wire [3:0]axi_mem_intercon_M00_AXI_ARCACHE;
  wire [1:0]axi_mem_intercon_M00_AXI_ARID;
  wire [3:0]axi_mem_intercon_M00_AXI_ARLEN;
  wire [1:0]axi_mem_intercon_M00_AXI_ARLOCK;
  wire [2:0]axi_mem_intercon_M00_AXI_ARPROT;
  wire [3:0]axi_mem_intercon_M00_AXI_ARQOS;
  wire axi_mem_intercon_M00_AXI_ARREADY;
  wire [2:0]axi_mem_intercon_M00_AXI_ARSIZE;
  wire axi_mem_intercon_M00_AXI_ARVALID;
  wire [31:0]axi_mem_intercon_M00_AXI_AWADDR;
  wire [1:0]axi_mem_intercon_M00_AXI_AWBURST;
  wire [3:0]axi_mem_intercon_M00_AXI_AWCACHE;
  wire [1:0]axi_mem_intercon_M00_AXI_AWID;
  wire [3:0]axi_mem_intercon_M00_AXI_AWLEN;
  wire [1:0]axi_mem_intercon_M00_AXI_AWLOCK;
  wire [2:0]axi_mem_intercon_M00_AXI_AWPROT;
  wire [3:0]axi_mem_intercon_M00_AXI_AWQOS;
  wire axi_mem_intercon_M00_AXI_AWREADY;
  wire [2:0]axi_mem_intercon_M00_AXI_AWSIZE;
  wire axi_mem_intercon_M00_AXI_AWVALID;
  wire [5:0]axi_mem_intercon_M00_AXI_BID;
  wire axi_mem_intercon_M00_AXI_BREADY;
  wire [1:0]axi_mem_intercon_M00_AXI_BRESP;
  wire axi_mem_intercon_M00_AXI_BVALID;
  wire [31:0]axi_mem_intercon_M00_AXI_RDATA;
  wire [5:0]axi_mem_intercon_M00_AXI_RID;
  wire axi_mem_intercon_M00_AXI_RLAST;
  wire axi_mem_intercon_M00_AXI_RREADY;
  wire [1:0]axi_mem_intercon_M00_AXI_RRESP;
  wire axi_mem_intercon_M00_AXI_RVALID;
  wire [31:0]axi_mem_intercon_M00_AXI_WDATA;
  wire [1:0]axi_mem_intercon_M00_AXI_WID;
  wire axi_mem_intercon_M00_AXI_WLAST;
  wire axi_mem_intercon_M00_AXI_WREADY;
  wire [3:0]axi_mem_intercon_M00_AXI_WSTRB;
  wire axi_mem_intercon_M00_AXI_WVALID;
  wire clk_wiz_0_clk_out2;
  wire clk_wiz_0_locked;
  wire [0:31]lmb_bram_if_cntlr_0_BRAM_PORT_ADDR;
  wire lmb_bram_if_cntlr_0_BRAM_PORT_CLK;
  wire [0:31]lmb_bram_if_cntlr_0_BRAM_PORT_DIN;
  wire [31:0]lmb_bram_if_cntlr_0_BRAM_PORT_DOUT;
  wire lmb_bram_if_cntlr_0_BRAM_PORT_EN;
  wire lmb_bram_if_cntlr_0_BRAM_PORT_RST;
  wire [0:3]lmb_bram_if_cntlr_0_BRAM_PORT_WE;
  wire [0:31]lmb_bram_if_cntlr_1_BRAM_PORT_ADDR;
  wire lmb_bram_if_cntlr_1_BRAM_PORT_CLK;
  wire [0:31]lmb_bram_if_cntlr_1_BRAM_PORT_DIN;
  wire [31:0]lmb_bram_if_cntlr_1_BRAM_PORT_DOUT;
  wire lmb_bram_if_cntlr_1_BRAM_PORT_EN;
  wire lmb_bram_if_cntlr_1_BRAM_PORT_RST;
  wire [0:3]lmb_bram_if_cntlr_1_BRAM_PORT_WE;
  wire mdm_0_Debug_SYS_Rst;
  wire mdm_0_MBDEBUG_0_CAPTURE;
  wire mdm_0_MBDEBUG_0_CLK;
  wire mdm_0_MBDEBUG_0_DISABLE;
  wire [0:7]mdm_0_MBDEBUG_0_REG_EN;
  wire mdm_0_MBDEBUG_0_RST;
  wire mdm_0_MBDEBUG_0_SHIFT;
  wire mdm_0_MBDEBUG_0_TDI;
  wire mdm_0_MBDEBUG_0_TDO;
  wire mdm_0_MBDEBUG_0_UPDATE;
  wire [0:31]microblaze_0_DLMB_ABUS;
  wire microblaze_0_DLMB_ADDRSTROBE;
  wire [0:3]microblaze_0_DLMB_BE;
  wire microblaze_0_DLMB_CE;
  wire [0:31]microblaze_0_DLMB_READDBUS;
  wire microblaze_0_DLMB_READSTROBE;
  wire microblaze_0_DLMB_READY;
  wire microblaze_0_DLMB_UE;
  wire microblaze_0_DLMB_WAIT;
  wire [0:31]microblaze_0_DLMB_WRITEDBUS;
  wire microblaze_0_DLMB_WRITESTROBE;
  wire [0:31]microblaze_0_ILMB_ABUS;
  wire microblaze_0_ILMB_ADDRSTROBE;
  wire microblaze_0_ILMB_CE;
  wire [0:31]microblaze_0_ILMB_READDBUS;
  wire microblaze_0_ILMB_READSTROBE;
  wire microblaze_0_ILMB_READY;
  wire microblaze_0_ILMB_UE;
  wire microblaze_0_ILMB_WAIT;
  wire [31:0]microblaze_0_M0_AXIS_TDATA;
  wire microblaze_0_M0_AXIS_TLAST;
  wire microblaze_0_M0_AXIS_TREADY;
  wire microblaze_0_M0_AXIS_TVALID;
  wire [31:0]microblaze_0_M_AXI_DC_ARADDR;
  wire [1:0]microblaze_0_M_AXI_DC_ARBURST;
  wire [3:0]microblaze_0_M_AXI_DC_ARCACHE;
  wire [0:0]microblaze_0_M_AXI_DC_ARID;
  wire [7:0]microblaze_0_M_AXI_DC_ARLEN;
  wire microblaze_0_M_AXI_DC_ARLOCK;
  wire [2:0]microblaze_0_M_AXI_DC_ARPROT;
  wire [3:0]microblaze_0_M_AXI_DC_ARQOS;
  wire microblaze_0_M_AXI_DC_ARREADY;
  wire [2:0]microblaze_0_M_AXI_DC_ARSIZE;
  wire microblaze_0_M_AXI_DC_ARVALID;
  wire [31:0]microblaze_0_M_AXI_DC_AWADDR;
  wire [1:0]microblaze_0_M_AXI_DC_AWBURST;
  wire [3:0]microblaze_0_M_AXI_DC_AWCACHE;
  wire [0:0]microblaze_0_M_AXI_DC_AWID;
  wire [7:0]microblaze_0_M_AXI_DC_AWLEN;
  wire microblaze_0_M_AXI_DC_AWLOCK;
  wire [2:0]microblaze_0_M_AXI_DC_AWPROT;
  wire [3:0]microblaze_0_M_AXI_DC_AWQOS;
  wire microblaze_0_M_AXI_DC_AWREADY;
  wire [2:0]microblaze_0_M_AXI_DC_AWSIZE;
  wire microblaze_0_M_AXI_DC_AWVALID;
  wire [1:0]microblaze_0_M_AXI_DC_BID;
  wire microblaze_0_M_AXI_DC_BREADY;
  wire [1:0]microblaze_0_M_AXI_DC_BRESP;
  wire microblaze_0_M_AXI_DC_BVALID;
  wire [31:0]microblaze_0_M_AXI_DC_RDATA;
  wire [1:0]microblaze_0_M_AXI_DC_RID;
  wire microblaze_0_M_AXI_DC_RLAST;
  wire microblaze_0_M_AXI_DC_RREADY;
  wire [1:0]microblaze_0_M_AXI_DC_RRESP;
  wire microblaze_0_M_AXI_DC_RVALID;
  wire [31:0]microblaze_0_M_AXI_DC_WDATA;
  wire microblaze_0_M_AXI_DC_WLAST;
  wire microblaze_0_M_AXI_DC_WREADY;
  wire [3:0]microblaze_0_M_AXI_DC_WSTRB;
  wire microblaze_0_M_AXI_DC_WVALID;
  wire [31:0]microblaze_0_M_AXI_IC_ARADDR;
  wire [1:0]microblaze_0_M_AXI_IC_ARBURST;
  wire [3:0]microblaze_0_M_AXI_IC_ARCACHE;
  wire [0:0]microblaze_0_M_AXI_IC_ARID;
  wire [7:0]microblaze_0_M_AXI_IC_ARLEN;
  wire microblaze_0_M_AXI_IC_ARLOCK;
  wire [2:0]microblaze_0_M_AXI_IC_ARPROT;
  wire [3:0]microblaze_0_M_AXI_IC_ARQOS;
  wire microblaze_0_M_AXI_IC_ARREADY;
  wire [2:0]microblaze_0_M_AXI_IC_ARSIZE;
  wire microblaze_0_M_AXI_IC_ARVALID;
  wire [31:0]microblaze_0_M_AXI_IC_AWADDR;
  wire [1:0]microblaze_0_M_AXI_IC_AWBURST;
  wire [3:0]microblaze_0_M_AXI_IC_AWCACHE;
  wire [0:0]microblaze_0_M_AXI_IC_AWID;
  wire [7:0]microblaze_0_M_AXI_IC_AWLEN;
  wire microblaze_0_M_AXI_IC_AWLOCK;
  wire [2:0]microblaze_0_M_AXI_IC_AWPROT;
  wire [3:0]microblaze_0_M_AXI_IC_AWQOS;
  wire microblaze_0_M_AXI_IC_AWREADY;
  wire [2:0]microblaze_0_M_AXI_IC_AWSIZE;
  wire microblaze_0_M_AXI_IC_AWVALID;
  wire [1:0]microblaze_0_M_AXI_IC_BID;
  wire microblaze_0_M_AXI_IC_BREADY;
  wire [1:0]microblaze_0_M_AXI_IC_BRESP;
  wire microblaze_0_M_AXI_IC_BVALID;
  wire [31:0]microblaze_0_M_AXI_IC_RDATA;
  wire [1:0]microblaze_0_M_AXI_IC_RID;
  wire microblaze_0_M_AXI_IC_RLAST;
  wire microblaze_0_M_AXI_IC_RREADY;
  wire [1:0]microblaze_0_M_AXI_IC_RRESP;
  wire microblaze_0_M_AXI_IC_RVALID;
  wire [31:0]microblaze_0_M_AXI_IC_WDATA;
  wire microblaze_0_M_AXI_IC_WLAST;
  wire microblaze_0_M_AXI_IC_WREADY;
  wire [3:0]microblaze_0_M_AXI_IC_WSTRB;
  wire microblaze_0_M_AXI_IC_WVALID;
  wire [0:0]proc_sys_reset_0_bus_struct_reset;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [0:0]rst_processing_system7_0_100M_interconnect_aresetn;
  wire rst_processing_system7_0_100M_mb_reset;
  wire [0:0]rst_processing_system7_0_100M_peripheral_aresetn;
  wire sysclk;
  wire [31:0]vectorblox_mxp_0_M_AXIS_INSTR_TDATA;
  wire vectorblox_mxp_0_M_AXIS_INSTR_TLAST;
  wire vectorblox_mxp_0_M_AXIS_INSTR_TREADY;
  wire vectorblox_mxp_0_M_AXIS_INSTR_TVALID;
  wire [31:0]vectorblox_mxp_0_M_AXI_ARADDR;
  wire [1:0]vectorblox_mxp_0_M_AXI_ARBURST;
  wire [3:0]vectorblox_mxp_0_M_AXI_ARCACHE;
  wire [3:0]vectorblox_mxp_0_M_AXI_ARLEN;
  wire [2:0]vectorblox_mxp_0_M_AXI_ARPROT;
  wire vectorblox_mxp_0_M_AXI_ARREADY;
  wire [2:0]vectorblox_mxp_0_M_AXI_ARSIZE;
  wire vectorblox_mxp_0_M_AXI_ARVALID;
  wire [31:0]vectorblox_mxp_0_M_AXI_AWADDR;
  wire [1:0]vectorblox_mxp_0_M_AXI_AWBURST;
  wire [3:0]vectorblox_mxp_0_M_AXI_AWCACHE;
  wire [3:0]vectorblox_mxp_0_M_AXI_AWLEN;
  wire [2:0]vectorblox_mxp_0_M_AXI_AWPROT;
  wire vectorblox_mxp_0_M_AXI_AWREADY;
  wire [2:0]vectorblox_mxp_0_M_AXI_AWSIZE;
  wire vectorblox_mxp_0_M_AXI_AWVALID;
  wire vectorblox_mxp_0_M_AXI_BREADY;
  wire [1:0]vectorblox_mxp_0_M_AXI_BRESP;
  wire vectorblox_mxp_0_M_AXI_BVALID;
  wire [63:0]vectorblox_mxp_0_M_AXI_RDATA;
  wire vectorblox_mxp_0_M_AXI_RLAST;
  wire vectorblox_mxp_0_M_AXI_RREADY;
  wire [1:0]vectorblox_mxp_0_M_AXI_RRESP;
  wire vectorblox_mxp_0_M_AXI_RVALID;
  wire [63:0]vectorblox_mxp_0_M_AXI_WDATA;
  wire vectorblox_mxp_0_M_AXI_WLAST;
  wire vectorblox_mxp_0_M_AXI_WREADY;
  wire [7:0]vectorblox_mxp_0_M_AXI_WSTRB;
  wire vectorblox_mxp_0_M_AXI_WVALID;

  system_axi4lite_0_0 axi4lite_0
       (.ACLK(sysclk),
        .ARESETN(rst_processing_system7_0_100M_interconnect_aresetn),
        .M00_ACLK(sysclk),
        .M00_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M00_AXI_araddr(axi4lite_0_M00_AXI_ARADDR),
        .M00_AXI_arready(axi4lite_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi4lite_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi4lite_0_M00_AXI_AWADDR),
        .M00_AXI_awready(axi4lite_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi4lite_0_M00_AXI_AWVALID),
        .M00_AXI_bready(axi4lite_0_M00_AXI_BREADY),
        .M00_AXI_bresp(axi4lite_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi4lite_0_M00_AXI_BVALID),
        .M00_AXI_rdata(axi4lite_0_M00_AXI_RDATA),
        .M00_AXI_rready(axi4lite_0_M00_AXI_RREADY),
        .M00_AXI_rresp(axi4lite_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi4lite_0_M00_AXI_RVALID),
        .M00_AXI_wdata(axi4lite_0_M00_AXI_WDATA),
        .M00_AXI_wready(axi4lite_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi4lite_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi4lite_0_M00_AXI_WVALID),
        .M01_ACLK(sysclk),
        .M01_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M01_AXI_araddr(axi4lite_0_M01_AXI_ARADDR),
        .M01_AXI_arready(axi4lite_0_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi4lite_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi4lite_0_M01_AXI_AWADDR),
        .M01_AXI_awready(axi4lite_0_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi4lite_0_M01_AXI_AWVALID),
        .M01_AXI_bready(axi4lite_0_M01_AXI_BREADY),
        .M01_AXI_bresp(axi4lite_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi4lite_0_M01_AXI_BVALID),
        .M01_AXI_rdata(axi4lite_0_M01_AXI_RDATA),
        .M01_AXI_rready(axi4lite_0_M01_AXI_RREADY),
        .M01_AXI_rresp(axi4lite_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi4lite_0_M01_AXI_RVALID),
        .M01_AXI_wdata(axi4lite_0_M01_AXI_WDATA),
        .M01_AXI_wready(axi4lite_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi4lite_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi4lite_0_M01_AXI_WVALID),
        .M02_ACLK(sysclk),
        .M02_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M02_AXI_araddr(axi4lite_0_M02_AXI_ARADDR),
        .M02_AXI_arburst(axi4lite_0_M02_AXI_ARBURST),
        .M02_AXI_arcache(axi4lite_0_M02_AXI_ARCACHE),
        .M02_AXI_arlen(axi4lite_0_M02_AXI_ARLEN),
        .M02_AXI_arlock(axi4lite_0_M02_AXI_ARLOCK),
        .M02_AXI_arprot(axi4lite_0_M02_AXI_ARPROT),
        .M02_AXI_arqos(axi4lite_0_M02_AXI_ARQOS),
        .M02_AXI_arready(axi4lite_0_M02_AXI_ARREADY),
        .M02_AXI_arsize(axi4lite_0_M02_AXI_ARSIZE),
        .M02_AXI_arvalid(axi4lite_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi4lite_0_M02_AXI_AWADDR),
        .M02_AXI_awburst(axi4lite_0_M02_AXI_AWBURST),
        .M02_AXI_awcache(axi4lite_0_M02_AXI_AWCACHE),
        .M02_AXI_awlen(axi4lite_0_M02_AXI_AWLEN),
        .M02_AXI_awlock(axi4lite_0_M02_AXI_AWLOCK),
        .M02_AXI_awprot(axi4lite_0_M02_AXI_AWPROT),
        .M02_AXI_awqos(axi4lite_0_M02_AXI_AWQOS),
        .M02_AXI_awready(axi4lite_0_M02_AXI_AWREADY),
        .M02_AXI_awsize(axi4lite_0_M02_AXI_AWSIZE),
        .M02_AXI_awvalid(axi4lite_0_M02_AXI_AWVALID),
        .M02_AXI_bready(axi4lite_0_M02_AXI_BREADY),
        .M02_AXI_bresp(axi4lite_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi4lite_0_M02_AXI_BVALID),
        .M02_AXI_rdata(axi4lite_0_M02_AXI_RDATA),
        .M02_AXI_rlast(axi4lite_0_M02_AXI_RLAST),
        .M02_AXI_rready(axi4lite_0_M02_AXI_RREADY),
        .M02_AXI_rresp(axi4lite_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi4lite_0_M02_AXI_RVALID),
        .M02_AXI_wdata(axi4lite_0_M02_AXI_WDATA),
        .M02_AXI_wlast(axi4lite_0_M02_AXI_WLAST),
        .M02_AXI_wready(axi4lite_0_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi4lite_0_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi4lite_0_M02_AXI_WVALID),
        .M03_ACLK(sysclk),
        .M03_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M03_AXI_araddr(axi4lite_0_M03_AXI_ARADDR),
        .M03_AXI_arready(axi4lite_0_M03_AXI_ARREADY),
        .M03_AXI_arvalid(axi4lite_0_M03_AXI_ARVALID),
        .M03_AXI_awaddr(axi4lite_0_M03_AXI_AWADDR),
        .M03_AXI_awready(axi4lite_0_M03_AXI_AWREADY),
        .M03_AXI_awvalid(axi4lite_0_M03_AXI_AWVALID),
        .M03_AXI_bready(axi4lite_0_M03_AXI_BREADY),
        .M03_AXI_bresp(axi4lite_0_M03_AXI_BRESP),
        .M03_AXI_bvalid(axi4lite_0_M03_AXI_BVALID),
        .M03_AXI_rdata(axi4lite_0_M03_AXI_RDATA),
        .M03_AXI_rready(axi4lite_0_M03_AXI_RREADY),
        .M03_AXI_rresp(axi4lite_0_M03_AXI_RRESP),
        .M03_AXI_rvalid(axi4lite_0_M03_AXI_RVALID),
        .M03_AXI_wdata(axi4lite_0_M03_AXI_WDATA),
        .M03_AXI_wready(axi4lite_0_M03_AXI_WREADY),
        .M03_AXI_wstrb(axi4lite_0_M03_AXI_WSTRB),
        .M03_AXI_wvalid(axi4lite_0_M03_AXI_WVALID),
        .M04_ACLK(sysclk),
        .M04_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M04_AXI_araddr(axi4lite_0_M04_AXI_ARADDR),
        .M04_AXI_arprot(axi4lite_0_M04_AXI_ARPROT),
        .M04_AXI_arready(axi4lite_0_M04_AXI_ARREADY),
        .M04_AXI_arvalid(axi4lite_0_M04_AXI_ARVALID),
        .M04_AXI_awaddr(axi4lite_0_M04_AXI_AWADDR),
        .M04_AXI_awprot(axi4lite_0_M04_AXI_AWPROT),
        .M04_AXI_awready(axi4lite_0_M04_AXI_AWREADY),
        .M04_AXI_awvalid(axi4lite_0_M04_AXI_AWVALID),
        .M04_AXI_bready(axi4lite_0_M04_AXI_BREADY),
        .M04_AXI_bresp(axi4lite_0_M04_AXI_BRESP),
        .M04_AXI_bvalid(axi4lite_0_M04_AXI_BVALID),
        .M04_AXI_rdata(axi4lite_0_M04_AXI_RDATA),
        .M04_AXI_rready(axi4lite_0_M04_AXI_RREADY),
        .M04_AXI_rresp(axi4lite_0_M04_AXI_RRESP),
        .M04_AXI_rvalid(axi4lite_0_M04_AXI_RVALID),
        .M04_AXI_wdata(axi4lite_0_M04_AXI_WDATA),
        .M04_AXI_wready(axi4lite_0_M04_AXI_WREADY),
        .M04_AXI_wstrb(axi4lite_0_M04_AXI_WSTRB),
        .M04_AXI_wvalid(axi4lite_0_M04_AXI_WVALID),
        .S00_ACLK(sysclk),
        .S00_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .S00_AXI_araddr(S00_AXI_1_ARADDR),
        .S00_AXI_arprot(S00_AXI_1_ARPROT),
        .S00_AXI_arready(S00_AXI_1_ARREADY),
        .S00_AXI_arvalid(S00_AXI_1_ARVALID),
        .S00_AXI_awaddr(S00_AXI_1_AWADDR),
        .S00_AXI_awprot(S00_AXI_1_AWPROT),
        .S00_AXI_awready(S00_AXI_1_AWREADY),
        .S00_AXI_awvalid(S00_AXI_1_AWVALID),
        .S00_AXI_bready(S00_AXI_1_BREADY),
        .S00_AXI_bresp(S00_AXI_1_BRESP),
        .S00_AXI_bvalid(S00_AXI_1_BVALID),
        .S00_AXI_rdata(S00_AXI_1_RDATA),
        .S00_AXI_rready(S00_AXI_1_RREADY),
        .S00_AXI_rresp(S00_AXI_1_RRESP),
        .S00_AXI_rvalid(S00_AXI_1_RVALID),
        .S00_AXI_wdata(S00_AXI_1_WDATA),
        .S00_AXI_wready(S00_AXI_1_WREADY),
        .S00_AXI_wstrb(S00_AXI_1_WSTRB),
        .S00_AXI_wvalid(S00_AXI_1_WVALID));
  system_axi_addr_remap_0_0 axi_addr_remap_0
       (.aclk(sysclk),
        .aresetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .m_axi_araddr(S02_AXI_1_ARADDR),
        .m_axi_arprot(S02_AXI_1_ARPROT),
        .m_axi_arready(S02_AXI_1_ARREADY),
        .m_axi_arvalid(S02_AXI_1_ARVALID),
        .m_axi_awaddr(S02_AXI_1_AWADDR),
        .m_axi_awprot(S02_AXI_1_AWPROT),
        .m_axi_awready(S02_AXI_1_AWREADY),
        .m_axi_awvalid(S02_AXI_1_AWVALID),
        .m_axi_bready(S02_AXI_1_BREADY),
        .m_axi_bresp(S02_AXI_1_BRESP),
        .m_axi_bvalid(S02_AXI_1_BVALID),
        .m_axi_rdata(S02_AXI_1_RDATA),
        .m_axi_rready(S02_AXI_1_RREADY),
        .m_axi_rresp(S02_AXI_1_RRESP),
        .m_axi_rvalid(S02_AXI_1_RVALID),
        .m_axi_wdata(S02_AXI_1_WDATA),
        .m_axi_wready(S02_AXI_1_WREADY),
        .m_axi_wstrb(S02_AXI_1_WSTRB),
        .m_axi_wvalid(S02_AXI_1_WVALID),
        .s_axi_araddr(axi4lite_0_M04_AXI_ARADDR),
        .s_axi_arprot(axi4lite_0_M04_AXI_ARPROT),
        .s_axi_arready(axi4lite_0_M04_AXI_ARREADY),
        .s_axi_arvalid(axi4lite_0_M04_AXI_ARVALID),
        .s_axi_awaddr(axi4lite_0_M04_AXI_AWADDR),
        .s_axi_awprot(axi4lite_0_M04_AXI_AWPROT),
        .s_axi_awready(axi4lite_0_M04_AXI_AWREADY),
        .s_axi_awvalid(axi4lite_0_M04_AXI_AWVALID),
        .s_axi_bready(axi4lite_0_M04_AXI_BREADY),
        .s_axi_bresp(axi4lite_0_M04_AXI_BRESP),
        .s_axi_bvalid(axi4lite_0_M04_AXI_BVALID),
        .s_axi_rdata(axi4lite_0_M04_AXI_RDATA),
        .s_axi_rready(axi4lite_0_M04_AXI_RREADY),
        .s_axi_rresp(axi4lite_0_M04_AXI_RRESP),
        .s_axi_rvalid(axi4lite_0_M04_AXI_RVALID),
        .s_axi_wdata(axi4lite_0_M04_AXI_WDATA),
        .s_axi_wready(axi4lite_0_M04_AXI_WREADY),
        .s_axi_wstrb(axi4lite_0_M04_AXI_WSTRB),
        .s_axi_wvalid(axi4lite_0_M04_AXI_WVALID));
  system_axi_hp_0_0 axi_hp_0
       (.ACLK(sysclk),
        .ARESETN(rst_processing_system7_0_100M_interconnect_aresetn),
        .M00_ACLK(sysclk),
        .M00_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M00_AXI_araddr(axi_mem_intercon_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_mem_intercon_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_mem_intercon_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_mem_intercon_M00_AXI_ARID),
        .M00_AXI_arlen(axi_mem_intercon_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_mem_intercon_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_mem_intercon_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_mem_intercon_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_mem_intercon_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_mem_intercon_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_mem_intercon_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_mem_intercon_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_mem_intercon_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_mem_intercon_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_mem_intercon_M00_AXI_AWID),
        .M00_AXI_awlen(axi_mem_intercon_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_mem_intercon_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_mem_intercon_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_mem_intercon_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_mem_intercon_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_mem_intercon_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_mem_intercon_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_mem_intercon_M00_AXI_BID),
        .M00_AXI_bready(axi_mem_intercon_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_mem_intercon_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_mem_intercon_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_mem_intercon_M00_AXI_RDATA),
        .M00_AXI_rid(axi_mem_intercon_M00_AXI_RID),
        .M00_AXI_rlast(axi_mem_intercon_M00_AXI_RLAST),
        .M00_AXI_rready(axi_mem_intercon_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_mem_intercon_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_mem_intercon_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_mem_intercon_M00_AXI_WDATA),
        .M00_AXI_wid(axi_mem_intercon_M00_AXI_WID),
        .M00_AXI_wlast(axi_mem_intercon_M00_AXI_WLAST),
        .M00_AXI_wready(axi_mem_intercon_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_mem_intercon_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_mem_intercon_M00_AXI_WVALID),
        .S00_ACLK(sysclk),
        .S00_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .S00_AXI_araddr(microblaze_0_M_AXI_DC_ARADDR),
        .S00_AXI_arburst(microblaze_0_M_AXI_DC_ARBURST),
        .S00_AXI_arcache(microblaze_0_M_AXI_DC_ARCACHE),
        .S00_AXI_arid(microblaze_0_M_AXI_DC_ARID),
        .S00_AXI_arlen(microblaze_0_M_AXI_DC_ARLEN),
        .S00_AXI_arlock(microblaze_0_M_AXI_DC_ARLOCK),
        .S00_AXI_arprot(microblaze_0_M_AXI_DC_ARPROT),
        .S00_AXI_arqos(microblaze_0_M_AXI_DC_ARQOS),
        .S00_AXI_arready(microblaze_0_M_AXI_DC_ARREADY),
        .S00_AXI_arsize(microblaze_0_M_AXI_DC_ARSIZE),
        .S00_AXI_arvalid(microblaze_0_M_AXI_DC_ARVALID),
        .S00_AXI_awaddr(microblaze_0_M_AXI_DC_AWADDR),
        .S00_AXI_awburst(microblaze_0_M_AXI_DC_AWBURST),
        .S00_AXI_awcache(microblaze_0_M_AXI_DC_AWCACHE),
        .S00_AXI_awid(microblaze_0_M_AXI_DC_AWID),
        .S00_AXI_awlen(microblaze_0_M_AXI_DC_AWLEN),
        .S00_AXI_awlock(microblaze_0_M_AXI_DC_AWLOCK),
        .S00_AXI_awprot(microblaze_0_M_AXI_DC_AWPROT),
        .S00_AXI_awqos(microblaze_0_M_AXI_DC_AWQOS),
        .S00_AXI_awready(microblaze_0_M_AXI_DC_AWREADY),
        .S00_AXI_awsize(microblaze_0_M_AXI_DC_AWSIZE),
        .S00_AXI_awvalid(microblaze_0_M_AXI_DC_AWVALID),
        .S00_AXI_bid(microblaze_0_M_AXI_DC_BID),
        .S00_AXI_bready(microblaze_0_M_AXI_DC_BREADY),
        .S00_AXI_bresp(microblaze_0_M_AXI_DC_BRESP),
        .S00_AXI_bvalid(microblaze_0_M_AXI_DC_BVALID),
        .S00_AXI_rdata(microblaze_0_M_AXI_DC_RDATA),
        .S00_AXI_rid(microblaze_0_M_AXI_DC_RID),
        .S00_AXI_rlast(microblaze_0_M_AXI_DC_RLAST),
        .S00_AXI_rready(microblaze_0_M_AXI_DC_RREADY),
        .S00_AXI_rresp(microblaze_0_M_AXI_DC_RRESP),
        .S00_AXI_rvalid(microblaze_0_M_AXI_DC_RVALID),
        .S00_AXI_wdata(microblaze_0_M_AXI_DC_WDATA),
        .S00_AXI_wlast(microblaze_0_M_AXI_DC_WLAST),
        .S00_AXI_wready(microblaze_0_M_AXI_DC_WREADY),
        .S00_AXI_wstrb(microblaze_0_M_AXI_DC_WSTRB),
        .S00_AXI_wvalid(microblaze_0_M_AXI_DC_WVALID),
        .S01_ACLK(sysclk),
        .S01_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .S01_AXI_araddr(microblaze_0_M_AXI_IC_ARADDR),
        .S01_AXI_arburst(microblaze_0_M_AXI_IC_ARBURST),
        .S01_AXI_arcache(microblaze_0_M_AXI_IC_ARCACHE),
        .S01_AXI_arid(microblaze_0_M_AXI_IC_ARID),
        .S01_AXI_arlen(microblaze_0_M_AXI_IC_ARLEN),
        .S01_AXI_arlock(microblaze_0_M_AXI_IC_ARLOCK),
        .S01_AXI_arprot(microblaze_0_M_AXI_IC_ARPROT),
        .S01_AXI_arqos(microblaze_0_M_AXI_IC_ARQOS),
        .S01_AXI_arready(microblaze_0_M_AXI_IC_ARREADY),
        .S01_AXI_arsize(microblaze_0_M_AXI_IC_ARSIZE),
        .S01_AXI_arvalid(microblaze_0_M_AXI_IC_ARVALID),
        .S01_AXI_awaddr(microblaze_0_M_AXI_IC_AWADDR),
        .S01_AXI_awburst(microblaze_0_M_AXI_IC_AWBURST),
        .S01_AXI_awcache(microblaze_0_M_AXI_IC_AWCACHE),
        .S01_AXI_awid(microblaze_0_M_AXI_IC_AWID),
        .S01_AXI_awlen(microblaze_0_M_AXI_IC_AWLEN),
        .S01_AXI_awlock(microblaze_0_M_AXI_IC_AWLOCK),
        .S01_AXI_awprot(microblaze_0_M_AXI_IC_AWPROT),
        .S01_AXI_awqos(microblaze_0_M_AXI_IC_AWQOS),
        .S01_AXI_awready(microblaze_0_M_AXI_IC_AWREADY),
        .S01_AXI_awsize(microblaze_0_M_AXI_IC_AWSIZE),
        .S01_AXI_awvalid(microblaze_0_M_AXI_IC_AWVALID),
        .S01_AXI_bid(microblaze_0_M_AXI_IC_BID),
        .S01_AXI_bready(microblaze_0_M_AXI_IC_BREADY),
        .S01_AXI_bresp(microblaze_0_M_AXI_IC_BRESP),
        .S01_AXI_bvalid(microblaze_0_M_AXI_IC_BVALID),
        .S01_AXI_rdata(microblaze_0_M_AXI_IC_RDATA),
        .S01_AXI_rid(microblaze_0_M_AXI_IC_RID),
        .S01_AXI_rlast(microblaze_0_M_AXI_IC_RLAST),
        .S01_AXI_rready(microblaze_0_M_AXI_IC_RREADY),
        .S01_AXI_rresp(microblaze_0_M_AXI_IC_RRESP),
        .S01_AXI_rvalid(microblaze_0_M_AXI_IC_RVALID),
        .S01_AXI_wdata(microblaze_0_M_AXI_IC_WDATA),
        .S01_AXI_wlast(microblaze_0_M_AXI_IC_WLAST),
        .S01_AXI_wready(microblaze_0_M_AXI_IC_WREADY),
        .S01_AXI_wstrb(microblaze_0_M_AXI_IC_WSTRB),
        .S01_AXI_wvalid(microblaze_0_M_AXI_IC_WVALID),
        .S02_ACLK(sysclk),
        .S02_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .S02_AXI_araddr(S02_AXI_1_ARADDR),
        .S02_AXI_arprot(S02_AXI_1_ARPROT),
        .S02_AXI_arready(S02_AXI_1_ARREADY),
        .S02_AXI_arvalid(S02_AXI_1_ARVALID),
        .S02_AXI_awaddr(S02_AXI_1_AWADDR),
        .S02_AXI_awprot(S02_AXI_1_AWPROT),
        .S02_AXI_awready(S02_AXI_1_AWREADY),
        .S02_AXI_awvalid(S02_AXI_1_AWVALID),
        .S02_AXI_bready(S02_AXI_1_BREADY),
        .S02_AXI_bresp(S02_AXI_1_BRESP),
        .S02_AXI_bvalid(S02_AXI_1_BVALID),
        .S02_AXI_rdata(S02_AXI_1_RDATA),
        .S02_AXI_rready(S02_AXI_1_RREADY),
        .S02_AXI_rresp(S02_AXI_1_RRESP),
        .S02_AXI_rvalid(S02_AXI_1_RVALID),
        .S02_AXI_wdata(S02_AXI_1_WDATA),
        .S02_AXI_wready(S02_AXI_1_WREADY),
        .S02_AXI_wstrb(S02_AXI_1_WSTRB),
        .S02_AXI_wvalid(S02_AXI_1_WVALID));
  system_axi_hp_2_0 axi_hp_2
       (.ACLK(sysclk),
        .ARESETN(rst_processing_system7_0_100M_interconnect_aresetn),
        .M00_ACLK(sysclk),
        .M00_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M00_AXI_araddr(axi_hp_2_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_hp_2_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_hp_2_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_hp_2_M00_AXI_ARLEN),
        .M00_AXI_arprot(axi_hp_2_M00_AXI_ARPROT),
        .M00_AXI_arready(axi_hp_2_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_hp_2_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_hp_2_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_hp_2_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_hp_2_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_hp_2_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_hp_2_M00_AXI_AWLEN),
        .M00_AXI_awprot(axi_hp_2_M00_AXI_AWPROT),
        .M00_AXI_awready(axi_hp_2_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_hp_2_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_hp_2_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_hp_2_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_hp_2_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_hp_2_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_hp_2_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_hp_2_M00_AXI_RLAST),
        .M00_AXI_rready(axi_hp_2_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_hp_2_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_hp_2_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_hp_2_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_hp_2_M00_AXI_WLAST),
        .M00_AXI_wready(axi_hp_2_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_hp_2_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_hp_2_M00_AXI_WVALID),
        .S00_ACLK(sysclk),
        .S00_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .S00_AXI_araddr(vectorblox_mxp_0_M_AXI_ARADDR),
        .S00_AXI_arburst(vectorblox_mxp_0_M_AXI_ARBURST),
        .S00_AXI_arcache(vectorblox_mxp_0_M_AXI_ARCACHE),
        .S00_AXI_arlen(vectorblox_mxp_0_M_AXI_ARLEN),
        .S00_AXI_arprot(vectorblox_mxp_0_M_AXI_ARPROT),
        .S00_AXI_arready(vectorblox_mxp_0_M_AXI_ARREADY),
        .S00_AXI_arsize(vectorblox_mxp_0_M_AXI_ARSIZE),
        .S00_AXI_arvalid(vectorblox_mxp_0_M_AXI_ARVALID),
        .S00_AXI_awaddr(vectorblox_mxp_0_M_AXI_AWADDR),
        .S00_AXI_awburst(vectorblox_mxp_0_M_AXI_AWBURST),
        .S00_AXI_awcache(vectorblox_mxp_0_M_AXI_AWCACHE),
        .S00_AXI_awlen(vectorblox_mxp_0_M_AXI_AWLEN),
        .S00_AXI_awprot(vectorblox_mxp_0_M_AXI_AWPROT),
        .S00_AXI_awready(vectorblox_mxp_0_M_AXI_AWREADY),
        .S00_AXI_awsize(vectorblox_mxp_0_M_AXI_AWSIZE),
        .S00_AXI_awvalid(vectorblox_mxp_0_M_AXI_AWVALID),
        .S00_AXI_bready(vectorblox_mxp_0_M_AXI_BREADY),
        .S00_AXI_bresp(vectorblox_mxp_0_M_AXI_BRESP),
        .S00_AXI_bvalid(vectorblox_mxp_0_M_AXI_BVALID),
        .S00_AXI_rdata(vectorblox_mxp_0_M_AXI_RDATA),
        .S00_AXI_rlast(vectorblox_mxp_0_M_AXI_RLAST),
        .S00_AXI_rready(vectorblox_mxp_0_M_AXI_RREADY),
        .S00_AXI_rresp(vectorblox_mxp_0_M_AXI_RRESP),
        .S00_AXI_rvalid(vectorblox_mxp_0_M_AXI_RVALID),
        .S00_AXI_wdata(vectorblox_mxp_0_M_AXI_WDATA),
        .S00_AXI_wlast(vectorblox_mxp_0_M_AXI_WLAST),
        .S00_AXI_wready(vectorblox_mxp_0_M_AXI_WREADY),
        .S00_AXI_wstrb(vectorblox_mxp_0_M_AXI_WSTRB),
        .S00_AXI_wvalid(vectorblox_mxp_0_M_AXI_WVALID));
  system_axi_timer_0_0 axi_timer_0
       (.capturetrig0(1'b0),
        .capturetrig1(1'b0),
        .freeze(1'b0),
        .s_axi_aclk(sysclk),
        .s_axi_araddr(axi4lite_0_M01_AXI_ARADDR[4:0]),
        .s_axi_aresetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .s_axi_arready(axi4lite_0_M01_AXI_ARREADY),
        .s_axi_arvalid(axi4lite_0_M01_AXI_ARVALID),
        .s_axi_awaddr(axi4lite_0_M01_AXI_AWADDR[4:0]),
        .s_axi_awready(axi4lite_0_M01_AXI_AWREADY),
        .s_axi_awvalid(axi4lite_0_M01_AXI_AWVALID),
        .s_axi_bready(axi4lite_0_M01_AXI_BREADY),
        .s_axi_bresp(axi4lite_0_M01_AXI_BRESP),
        .s_axi_bvalid(axi4lite_0_M01_AXI_BVALID),
        .s_axi_rdata(axi4lite_0_M01_AXI_RDATA),
        .s_axi_rready(axi4lite_0_M01_AXI_RREADY),
        .s_axi_rresp(axi4lite_0_M01_AXI_RRESP),
        .s_axi_rvalid(axi4lite_0_M01_AXI_RVALID),
        .s_axi_wdata(axi4lite_0_M01_AXI_WDATA),
        .s_axi_wready(axi4lite_0_M01_AXI_WREADY),
        .s_axi_wstrb(axi4lite_0_M01_AXI_WSTRB),
        .s_axi_wvalid(axi4lite_0_M01_AXI_WVALID));
  system_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(processing_system7_0_FCLK_CLK0),
        .clk_out1(sysclk),
        .clk_out2(clk_wiz_0_clk_out2),
        .locked(clk_wiz_0_locked),
        .resetn(processing_system7_0_FCLK_RESET0_N));
  (* BMM_INFO_ADDRESS_SPACE = "byte  0x20000000 32 > system lmb_bram_if_cntlr_0_bram" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  system_lmb_bram_if_cntlr_0_0 lmb_bram_if_cntlr_0
       (.BRAM_Addr_A(lmb_bram_if_cntlr_0_BRAM_PORT_ADDR),
        .BRAM_Clk_A(lmb_bram_if_cntlr_0_BRAM_PORT_CLK),
        .BRAM_Din_A({lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[31],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[30],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[29],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[28],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[27],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[26],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[25],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[24],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[23],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[22],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[21],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[20],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[19],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[18],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[17],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[16],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[15],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[14],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[13],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[12],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[11],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[10],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[9],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[8],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[7],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[6],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[5],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[4],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[3],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[2],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[1],lmb_bram_if_cntlr_0_BRAM_PORT_DOUT[0]}),
        .BRAM_Dout_A(lmb_bram_if_cntlr_0_BRAM_PORT_DIN),
        .BRAM_EN_A(lmb_bram_if_cntlr_0_BRAM_PORT_EN),
        .BRAM_Rst_A(lmb_bram_if_cntlr_0_BRAM_PORT_RST),
        .BRAM_WEN_A(lmb_bram_if_cntlr_0_BRAM_PORT_WE),
        .LMB_ABus(microblaze_0_DLMB_ABUS),
        .LMB_AddrStrobe(microblaze_0_DLMB_ADDRSTROBE),
        .LMB_BE(microblaze_0_DLMB_BE),
        .LMB_Clk(sysclk),
        .LMB_ReadStrobe(microblaze_0_DLMB_READSTROBE),
        .LMB_Rst(proc_sys_reset_0_bus_struct_reset),
        .LMB_WriteDBus(microblaze_0_DLMB_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_DLMB_WRITESTROBE),
        .Sl_CE(microblaze_0_DLMB_CE),
        .Sl_DBus(microblaze_0_DLMB_READDBUS),
        .Sl_Ready(microblaze_0_DLMB_READY),
        .Sl_UE(microblaze_0_DLMB_UE),
        .Sl_Wait(microblaze_0_DLMB_WAIT));
  system_lmb_bram_if_cntlr_0_bram_0 lmb_bram_if_cntlr_0_bram
       (.addra({lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[0],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[1],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[2],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[3],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[4],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[5],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[6],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[7],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[8],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[9],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[10],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[11],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[12],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[13],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[14],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[15],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[16],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[17],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[18],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[19],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[20],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[21],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[22],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[23],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[24],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[25],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[26],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[27],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[28],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[29],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[30],lmb_bram_if_cntlr_0_BRAM_PORT_ADDR[31]}),
        .addrb({lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[0],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[1],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[2],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[3],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[4],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[5],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[6],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[7],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[8],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[9],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[10],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[11],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[12],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[13],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[14],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[15],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[16],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[17],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[18],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[19],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[20],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[21],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[22],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[23],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[24],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[25],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[26],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[27],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[28],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[29],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[30],lmb_bram_if_cntlr_1_BRAM_PORT_ADDR[31]}),
        .clka(lmb_bram_if_cntlr_0_BRAM_PORT_CLK),
        .clkb(lmb_bram_if_cntlr_1_BRAM_PORT_CLK),
        .dina({lmb_bram_if_cntlr_0_BRAM_PORT_DIN[0],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[1],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[2],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[3],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[4],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[5],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[6],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[7],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[8],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[9],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[10],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[11],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[12],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[13],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[14],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[15],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[16],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[17],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[18],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[19],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[20],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[21],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[22],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[23],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[24],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[25],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[26],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[27],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[28],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[29],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[30],lmb_bram_if_cntlr_0_BRAM_PORT_DIN[31]}),
        .dinb({lmb_bram_if_cntlr_1_BRAM_PORT_DIN[0],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[1],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[2],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[3],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[4],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[5],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[6],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[7],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[8],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[9],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[10],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[11],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[12],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[13],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[14],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[15],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[16],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[17],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[18],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[19],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[20],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[21],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[22],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[23],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[24],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[25],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[26],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[27],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[28],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[29],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[30],lmb_bram_if_cntlr_1_BRAM_PORT_DIN[31]}),
        .douta(lmb_bram_if_cntlr_0_BRAM_PORT_DOUT),
        .doutb(lmb_bram_if_cntlr_1_BRAM_PORT_DOUT),
        .ena(lmb_bram_if_cntlr_0_BRAM_PORT_EN),
        .enb(lmb_bram_if_cntlr_1_BRAM_PORT_EN),
        .rsta(lmb_bram_if_cntlr_0_BRAM_PORT_RST),
        .rstb(lmb_bram_if_cntlr_1_BRAM_PORT_RST),
        .wea({lmb_bram_if_cntlr_0_BRAM_PORT_WE[0],lmb_bram_if_cntlr_0_BRAM_PORT_WE[1],lmb_bram_if_cntlr_0_BRAM_PORT_WE[2],lmb_bram_if_cntlr_0_BRAM_PORT_WE[3]}),
        .web({lmb_bram_if_cntlr_1_BRAM_PORT_WE[0],lmb_bram_if_cntlr_1_BRAM_PORT_WE[1],lmb_bram_if_cntlr_1_BRAM_PORT_WE[2],lmb_bram_if_cntlr_1_BRAM_PORT_WE[3]}));
  system_lmb_bram_if_cntlr_1_0 lmb_bram_if_cntlr_1
       (.BRAM_Addr_A(lmb_bram_if_cntlr_1_BRAM_PORT_ADDR),
        .BRAM_Clk_A(lmb_bram_if_cntlr_1_BRAM_PORT_CLK),
        .BRAM_Din_A({lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[31],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[30],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[29],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[28],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[27],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[26],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[25],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[24],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[23],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[22],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[21],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[20],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[19],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[18],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[17],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[16],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[15],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[14],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[13],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[12],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[11],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[10],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[9],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[8],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[7],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[6],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[5],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[4],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[3],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[2],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[1],lmb_bram_if_cntlr_1_BRAM_PORT_DOUT[0]}),
        .BRAM_Dout_A(lmb_bram_if_cntlr_1_BRAM_PORT_DIN),
        .BRAM_EN_A(lmb_bram_if_cntlr_1_BRAM_PORT_EN),
        .BRAM_Rst_A(lmb_bram_if_cntlr_1_BRAM_PORT_RST),
        .BRAM_WEN_A(lmb_bram_if_cntlr_1_BRAM_PORT_WE),
        .LMB_ABus(microblaze_0_ILMB_ABUS),
        .LMB_AddrStrobe(microblaze_0_ILMB_ADDRSTROBE),
        .LMB_BE({1'b0,1'b0,1'b0,1'b0}),
        .LMB_Clk(sysclk),
        .LMB_ReadStrobe(microblaze_0_ILMB_READSTROBE),
        .LMB_Rst(proc_sys_reset_0_bus_struct_reset),
        .LMB_WriteDBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LMB_WriteStrobe(1'b0),
        .Sl_CE(microblaze_0_ILMB_CE),
        .Sl_DBus(microblaze_0_ILMB_READDBUS),
        .Sl_Ready(microblaze_0_ILMB_READY),
        .Sl_UE(microblaze_0_ILMB_UE),
        .Sl_Wait(microblaze_0_ILMB_WAIT));
  system_mdm_0_0 mdm_0
       (.Dbg_Capture_0(mdm_0_MBDEBUG_0_CAPTURE),
        .Dbg_Clk_0(mdm_0_MBDEBUG_0_CLK),
        .Dbg_Disable_0(mdm_0_MBDEBUG_0_DISABLE),
        .Dbg_Reg_En_0(mdm_0_MBDEBUG_0_REG_EN),
        .Dbg_Rst_0(mdm_0_MBDEBUG_0_RST),
        .Dbg_Shift_0(mdm_0_MBDEBUG_0_SHIFT),
        .Dbg_TDI_0(mdm_0_MBDEBUG_0_TDI),
        .Dbg_TDO_0(mdm_0_MBDEBUG_0_TDO),
        .Dbg_Update_0(mdm_0_MBDEBUG_0_UPDATE),
        .Debug_SYS_Rst(mdm_0_Debug_SYS_Rst),
        .S_AXI_ACLK(sysclk),
        .S_AXI_ARADDR(axi4lite_0_M00_AXI_ARADDR[3:0]),
        .S_AXI_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .S_AXI_ARREADY(axi4lite_0_M00_AXI_ARREADY),
        .S_AXI_ARVALID(axi4lite_0_M00_AXI_ARVALID),
        .S_AXI_AWADDR(axi4lite_0_M00_AXI_AWADDR[3:0]),
        .S_AXI_AWREADY(axi4lite_0_M00_AXI_AWREADY),
        .S_AXI_AWVALID(axi4lite_0_M00_AXI_AWVALID),
        .S_AXI_BREADY(axi4lite_0_M00_AXI_BREADY),
        .S_AXI_BRESP(axi4lite_0_M00_AXI_BRESP),
        .S_AXI_BVALID(axi4lite_0_M00_AXI_BVALID),
        .S_AXI_RDATA(axi4lite_0_M00_AXI_RDATA),
        .S_AXI_RREADY(axi4lite_0_M00_AXI_RREADY),
        .S_AXI_RRESP(axi4lite_0_M00_AXI_RRESP),
        .S_AXI_RVALID(axi4lite_0_M00_AXI_RVALID),
        .S_AXI_WDATA(axi4lite_0_M00_AXI_WDATA),
        .S_AXI_WREADY(axi4lite_0_M00_AXI_WREADY),
        .S_AXI_WSTRB(axi4lite_0_M00_AXI_WSTRB),
        .S_AXI_WVALID(axi4lite_0_M00_AXI_WVALID));
  (* BMM_INFO_PROCESSOR = "microblaze-le > system lmb_bram_if_cntlr_0" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  system_microblaze_0_0 microblaze_0
       (.Byte_Enable(microblaze_0_DLMB_BE),
        .Clk(sysclk),
        .DCE(microblaze_0_DLMB_CE),
        .DReady(microblaze_0_DLMB_READY),
        .DUE(microblaze_0_DLMB_UE),
        .DWait(microblaze_0_DLMB_WAIT),
        .D_AS(microblaze_0_DLMB_ADDRSTROBE),
        .Data_Addr(microblaze_0_DLMB_ABUS),
        .Data_Read(microblaze_0_DLMB_READDBUS),
        .Data_Write(microblaze_0_DLMB_WRITEDBUS),
        .Dbg_Capture(mdm_0_MBDEBUG_0_CAPTURE),
        .Dbg_Clk(mdm_0_MBDEBUG_0_CLK),
        .Dbg_Disable(mdm_0_MBDEBUG_0_DISABLE),
        .Dbg_Reg_En(mdm_0_MBDEBUG_0_REG_EN),
        .Dbg_Shift(mdm_0_MBDEBUG_0_SHIFT),
        .Dbg_TDI(mdm_0_MBDEBUG_0_TDI),
        .Dbg_TDO(mdm_0_MBDEBUG_0_TDO),
        .Dbg_Update(mdm_0_MBDEBUG_0_UPDATE),
        .Debug_Rst(mdm_0_MBDEBUG_0_RST),
        .ICE(microblaze_0_ILMB_CE),
        .IFetch(microblaze_0_ILMB_READSTROBE),
        .IReady(microblaze_0_ILMB_READY),
        .IUE(microblaze_0_ILMB_UE),
        .IWAIT(microblaze_0_ILMB_WAIT),
        .I_AS(microblaze_0_ILMB_ADDRSTROBE),
        .Instr(microblaze_0_ILMB_READDBUS),
        .Instr_Addr(microblaze_0_ILMB_ABUS),
        .Interrupt(1'b0),
        .Interrupt_Address({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M0_AXIS_TDATA(microblaze_0_M0_AXIS_TDATA),
        .M0_AXIS_TLAST(microblaze_0_M0_AXIS_TLAST),
        .M0_AXIS_TREADY(microblaze_0_M0_AXIS_TREADY),
        .M0_AXIS_TVALID(microblaze_0_M0_AXIS_TVALID),
        .M_AXI_DC_ARADDR(microblaze_0_M_AXI_DC_ARADDR),
        .M_AXI_DC_ARBURST(microblaze_0_M_AXI_DC_ARBURST),
        .M_AXI_DC_ARCACHE(microblaze_0_M_AXI_DC_ARCACHE),
        .M_AXI_DC_ARID(microblaze_0_M_AXI_DC_ARID),
        .M_AXI_DC_ARLEN(microblaze_0_M_AXI_DC_ARLEN),
        .M_AXI_DC_ARLOCK(microblaze_0_M_AXI_DC_ARLOCK),
        .M_AXI_DC_ARPROT(microblaze_0_M_AXI_DC_ARPROT),
        .M_AXI_DC_ARQOS(microblaze_0_M_AXI_DC_ARQOS),
        .M_AXI_DC_ARREADY(microblaze_0_M_AXI_DC_ARREADY),
        .M_AXI_DC_ARSIZE(microblaze_0_M_AXI_DC_ARSIZE),
        .M_AXI_DC_ARVALID(microblaze_0_M_AXI_DC_ARVALID),
        .M_AXI_DC_AWADDR(microblaze_0_M_AXI_DC_AWADDR),
        .M_AXI_DC_AWBURST(microblaze_0_M_AXI_DC_AWBURST),
        .M_AXI_DC_AWCACHE(microblaze_0_M_AXI_DC_AWCACHE),
        .M_AXI_DC_AWID(microblaze_0_M_AXI_DC_AWID),
        .M_AXI_DC_AWLEN(microblaze_0_M_AXI_DC_AWLEN),
        .M_AXI_DC_AWLOCK(microblaze_0_M_AXI_DC_AWLOCK),
        .M_AXI_DC_AWPROT(microblaze_0_M_AXI_DC_AWPROT),
        .M_AXI_DC_AWQOS(microblaze_0_M_AXI_DC_AWQOS),
        .M_AXI_DC_AWREADY(microblaze_0_M_AXI_DC_AWREADY),
        .M_AXI_DC_AWSIZE(microblaze_0_M_AXI_DC_AWSIZE),
        .M_AXI_DC_AWVALID(microblaze_0_M_AXI_DC_AWVALID),
        .M_AXI_DC_BID(microblaze_0_M_AXI_DC_BID[0]),
        .M_AXI_DC_BREADY(microblaze_0_M_AXI_DC_BREADY),
        .M_AXI_DC_BRESP(microblaze_0_M_AXI_DC_BRESP),
        .M_AXI_DC_BVALID(microblaze_0_M_AXI_DC_BVALID),
        .M_AXI_DC_RDATA(microblaze_0_M_AXI_DC_RDATA),
        .M_AXI_DC_RID(microblaze_0_M_AXI_DC_RID[0]),
        .M_AXI_DC_RLAST(microblaze_0_M_AXI_DC_RLAST),
        .M_AXI_DC_RREADY(microblaze_0_M_AXI_DC_RREADY),
        .M_AXI_DC_RRESP(microblaze_0_M_AXI_DC_RRESP),
        .M_AXI_DC_RVALID(microblaze_0_M_AXI_DC_RVALID),
        .M_AXI_DC_WDATA(microblaze_0_M_AXI_DC_WDATA),
        .M_AXI_DC_WLAST(microblaze_0_M_AXI_DC_WLAST),
        .M_AXI_DC_WREADY(microblaze_0_M_AXI_DC_WREADY),
        .M_AXI_DC_WSTRB(microblaze_0_M_AXI_DC_WSTRB),
        .M_AXI_DC_WVALID(microblaze_0_M_AXI_DC_WVALID),
        .M_AXI_DP_ARADDR(S00_AXI_1_ARADDR),
        .M_AXI_DP_ARPROT(S00_AXI_1_ARPROT),
        .M_AXI_DP_ARREADY(S00_AXI_1_ARREADY),
        .M_AXI_DP_ARVALID(S00_AXI_1_ARVALID),
        .M_AXI_DP_AWADDR(S00_AXI_1_AWADDR),
        .M_AXI_DP_AWPROT(S00_AXI_1_AWPROT),
        .M_AXI_DP_AWREADY(S00_AXI_1_AWREADY),
        .M_AXI_DP_AWVALID(S00_AXI_1_AWVALID),
        .M_AXI_DP_BREADY(S00_AXI_1_BREADY),
        .M_AXI_DP_BRESP(S00_AXI_1_BRESP),
        .M_AXI_DP_BVALID(S00_AXI_1_BVALID),
        .M_AXI_DP_RDATA(S00_AXI_1_RDATA),
        .M_AXI_DP_RREADY(S00_AXI_1_RREADY),
        .M_AXI_DP_RRESP(S00_AXI_1_RRESP),
        .M_AXI_DP_RVALID(S00_AXI_1_RVALID),
        .M_AXI_DP_WDATA(S00_AXI_1_WDATA),
        .M_AXI_DP_WREADY(S00_AXI_1_WREADY),
        .M_AXI_DP_WSTRB(S00_AXI_1_WSTRB),
        .M_AXI_DP_WVALID(S00_AXI_1_WVALID),
        .M_AXI_IC_ARADDR(microblaze_0_M_AXI_IC_ARADDR),
        .M_AXI_IC_ARBURST(microblaze_0_M_AXI_IC_ARBURST),
        .M_AXI_IC_ARCACHE(microblaze_0_M_AXI_IC_ARCACHE),
        .M_AXI_IC_ARID(microblaze_0_M_AXI_IC_ARID),
        .M_AXI_IC_ARLEN(microblaze_0_M_AXI_IC_ARLEN),
        .M_AXI_IC_ARLOCK(microblaze_0_M_AXI_IC_ARLOCK),
        .M_AXI_IC_ARPROT(microblaze_0_M_AXI_IC_ARPROT),
        .M_AXI_IC_ARQOS(microblaze_0_M_AXI_IC_ARQOS),
        .M_AXI_IC_ARREADY(microblaze_0_M_AXI_IC_ARREADY),
        .M_AXI_IC_ARSIZE(microblaze_0_M_AXI_IC_ARSIZE),
        .M_AXI_IC_ARVALID(microblaze_0_M_AXI_IC_ARVALID),
        .M_AXI_IC_AWADDR(microblaze_0_M_AXI_IC_AWADDR),
        .M_AXI_IC_AWBURST(microblaze_0_M_AXI_IC_AWBURST),
        .M_AXI_IC_AWCACHE(microblaze_0_M_AXI_IC_AWCACHE),
        .M_AXI_IC_AWID(microblaze_0_M_AXI_IC_AWID),
        .M_AXI_IC_AWLEN(microblaze_0_M_AXI_IC_AWLEN),
        .M_AXI_IC_AWLOCK(microblaze_0_M_AXI_IC_AWLOCK),
        .M_AXI_IC_AWPROT(microblaze_0_M_AXI_IC_AWPROT),
        .M_AXI_IC_AWQOS(microblaze_0_M_AXI_IC_AWQOS),
        .M_AXI_IC_AWREADY(microblaze_0_M_AXI_IC_AWREADY),
        .M_AXI_IC_AWSIZE(microblaze_0_M_AXI_IC_AWSIZE),
        .M_AXI_IC_AWVALID(microblaze_0_M_AXI_IC_AWVALID),
        .M_AXI_IC_BID(microblaze_0_M_AXI_IC_BID[0]),
        .M_AXI_IC_BREADY(microblaze_0_M_AXI_IC_BREADY),
        .M_AXI_IC_BRESP(microblaze_0_M_AXI_IC_BRESP),
        .M_AXI_IC_BVALID(microblaze_0_M_AXI_IC_BVALID),
        .M_AXI_IC_RDATA(microblaze_0_M_AXI_IC_RDATA),
        .M_AXI_IC_RID(microblaze_0_M_AXI_IC_RID[0]),
        .M_AXI_IC_RLAST(microblaze_0_M_AXI_IC_RLAST),
        .M_AXI_IC_RREADY(microblaze_0_M_AXI_IC_RREADY),
        .M_AXI_IC_RRESP(microblaze_0_M_AXI_IC_RRESP),
        .M_AXI_IC_RVALID(microblaze_0_M_AXI_IC_RVALID),
        .M_AXI_IC_WDATA(microblaze_0_M_AXI_IC_WDATA),
        .M_AXI_IC_WLAST(microblaze_0_M_AXI_IC_WLAST),
        .M_AXI_IC_WREADY(microblaze_0_M_AXI_IC_WREADY),
        .M_AXI_IC_WSTRB(microblaze_0_M_AXI_IC_WSTRB),
        .M_AXI_IC_WVALID(microblaze_0_M_AXI_IC_WVALID),
        .Read_Strobe(microblaze_0_DLMB_READSTROBE),
        .Reset(rst_processing_system7_0_100M_mb_reset),
        .S0_AXIS_TDATA(vectorblox_mxp_0_M_AXIS_INSTR_TDATA),
        .S0_AXIS_TLAST(vectorblox_mxp_0_M_AXIS_INSTR_TLAST),
        .S0_AXIS_TREADY(vectorblox_mxp_0_M_AXIS_INSTR_TREADY),
        .S0_AXIS_TVALID(vectorblox_mxp_0_M_AXIS_INSTR_TVALID),
        .Write_Strobe(microblaze_0_DLMB_WRITESTROBE));
  system_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .bus_struct_reset(proc_sys_reset_0_bus_struct_reset),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(rst_processing_system7_0_100M_interconnect_aresetn),
        .mb_debug_sys_rst(mdm_0_Debug_SYS_Rst),
        .mb_reset(rst_processing_system7_0_100M_mb_reset),
        .peripheral_aresetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .slowest_sync_clk(sysclk));
  system_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .MIO(FIXED_IO_mio[53:0]),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_GP0_ACLK(sysclk),
        .S_AXI_GP0_ARADDR(axi4lite_0_M02_AXI_ARADDR),
        .S_AXI_GP0_ARBURST(axi4lite_0_M02_AXI_ARBURST),
        .S_AXI_GP0_ARCACHE(axi4lite_0_M02_AXI_ARCACHE),
        .S_AXI_GP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_ARLEN(axi4lite_0_M02_AXI_ARLEN),
        .S_AXI_GP0_ARLOCK(axi4lite_0_M02_AXI_ARLOCK),
        .S_AXI_GP0_ARPROT(axi4lite_0_M02_AXI_ARPROT),
        .S_AXI_GP0_ARQOS(axi4lite_0_M02_AXI_ARQOS),
        .S_AXI_GP0_ARREADY(axi4lite_0_M02_AXI_ARREADY),
        .S_AXI_GP0_ARSIZE(axi4lite_0_M02_AXI_ARSIZE),
        .S_AXI_GP0_ARVALID(axi4lite_0_M02_AXI_ARVALID),
        .S_AXI_GP0_AWADDR(axi4lite_0_M02_AXI_AWADDR),
        .S_AXI_GP0_AWBURST(axi4lite_0_M02_AXI_AWBURST),
        .S_AXI_GP0_AWCACHE(axi4lite_0_M02_AXI_AWCACHE),
        .S_AXI_GP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_AWLEN(axi4lite_0_M02_AXI_AWLEN),
        .S_AXI_GP0_AWLOCK(axi4lite_0_M02_AXI_AWLOCK),
        .S_AXI_GP0_AWPROT(axi4lite_0_M02_AXI_AWPROT),
        .S_AXI_GP0_AWQOS(axi4lite_0_M02_AXI_AWQOS),
        .S_AXI_GP0_AWREADY(axi4lite_0_M02_AXI_AWREADY),
        .S_AXI_GP0_AWSIZE(axi4lite_0_M02_AXI_AWSIZE),
        .S_AXI_GP0_AWVALID(axi4lite_0_M02_AXI_AWVALID),
        .S_AXI_GP0_BREADY(axi4lite_0_M02_AXI_BREADY),
        .S_AXI_GP0_BRESP(axi4lite_0_M02_AXI_BRESP),
        .S_AXI_GP0_BVALID(axi4lite_0_M02_AXI_BVALID),
        .S_AXI_GP0_RDATA(axi4lite_0_M02_AXI_RDATA),
        .S_AXI_GP0_RLAST(axi4lite_0_M02_AXI_RLAST),
        .S_AXI_GP0_RREADY(axi4lite_0_M02_AXI_RREADY),
        .S_AXI_GP0_RRESP(axi4lite_0_M02_AXI_RRESP),
        .S_AXI_GP0_RVALID(axi4lite_0_M02_AXI_RVALID),
        .S_AXI_GP0_WDATA(axi4lite_0_M02_AXI_WDATA),
        .S_AXI_GP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_GP0_WLAST(axi4lite_0_M02_AXI_WLAST),
        .S_AXI_GP0_WREADY(axi4lite_0_M02_AXI_WREADY),
        .S_AXI_GP0_WSTRB(axi4lite_0_M02_AXI_WSTRB),
        .S_AXI_GP0_WVALID(axi4lite_0_M02_AXI_WVALID),
        .S_AXI_HP0_ACLK(sysclk),
        .S_AXI_HP0_ARADDR(axi_mem_intercon_M00_AXI_ARADDR),
        .S_AXI_HP0_ARBURST(axi_mem_intercon_M00_AXI_ARBURST),
        .S_AXI_HP0_ARCACHE(axi_mem_intercon_M00_AXI_ARCACHE),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_M00_AXI_ARID}),
        .S_AXI_HP0_ARLEN(axi_mem_intercon_M00_AXI_ARLEN),
        .S_AXI_HP0_ARLOCK(axi_mem_intercon_M00_AXI_ARLOCK),
        .S_AXI_HP0_ARPROT(axi_mem_intercon_M00_AXI_ARPROT),
        .S_AXI_HP0_ARQOS(axi_mem_intercon_M00_AXI_ARQOS),
        .S_AXI_HP0_ARREADY(axi_mem_intercon_M00_AXI_ARREADY),
        .S_AXI_HP0_ARSIZE(axi_mem_intercon_M00_AXI_ARSIZE),
        .S_AXI_HP0_ARVALID(axi_mem_intercon_M00_AXI_ARVALID),
        .S_AXI_HP0_AWADDR(axi_mem_intercon_M00_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(axi_mem_intercon_M00_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(axi_mem_intercon_M00_AXI_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_M00_AXI_AWID}),
        .S_AXI_HP0_AWLEN(axi_mem_intercon_M00_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK(axi_mem_intercon_M00_AXI_AWLOCK),
        .S_AXI_HP0_AWPROT(axi_mem_intercon_M00_AXI_AWPROT),
        .S_AXI_HP0_AWQOS(axi_mem_intercon_M00_AXI_AWQOS),
        .S_AXI_HP0_AWREADY(axi_mem_intercon_M00_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(axi_mem_intercon_M00_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(axi_mem_intercon_M00_AXI_AWVALID),
        .S_AXI_HP0_BID(axi_mem_intercon_M00_AXI_BID),
        .S_AXI_HP0_BREADY(axi_mem_intercon_M00_AXI_BREADY),
        .S_AXI_HP0_BRESP(axi_mem_intercon_M00_AXI_BRESP),
        .S_AXI_HP0_BVALID(axi_mem_intercon_M00_AXI_BVALID),
        .S_AXI_HP0_RDATA(axi_mem_intercon_M00_AXI_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RID(axi_mem_intercon_M00_AXI_RID),
        .S_AXI_HP0_RLAST(axi_mem_intercon_M00_AXI_RLAST),
        .S_AXI_HP0_RREADY(axi_mem_intercon_M00_AXI_RREADY),
        .S_AXI_HP0_RRESP(axi_mem_intercon_M00_AXI_RRESP),
        .S_AXI_HP0_RVALID(axi_mem_intercon_M00_AXI_RVALID),
        .S_AXI_HP0_WDATA(axi_mem_intercon_M00_AXI_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_M00_AXI_WID}),
        .S_AXI_HP0_WLAST(axi_mem_intercon_M00_AXI_WLAST),
        .S_AXI_HP0_WREADY(axi_mem_intercon_M00_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(axi_mem_intercon_M00_AXI_WSTRB),
        .S_AXI_HP0_WVALID(axi_mem_intercon_M00_AXI_WVALID),
        .S_AXI_HP2_ACLK(sysclk),
        .S_AXI_HP2_ARADDR(axi_hp_2_M00_AXI_ARADDR),
        .S_AXI_HP2_ARBURST(axi_hp_2_M00_AXI_ARBURST),
        .S_AXI_HP2_ARCACHE(axi_hp_2_M00_AXI_ARCACHE),
        .S_AXI_HP2_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARLEN(axi_hp_2_M00_AXI_ARLEN),
        .S_AXI_HP2_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP2_ARPROT(axi_hp_2_M00_AXI_ARPROT),
        .S_AXI_HP2_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARREADY(axi_hp_2_M00_AXI_ARREADY),
        .S_AXI_HP2_ARSIZE(axi_hp_2_M00_AXI_ARSIZE),
        .S_AXI_HP2_ARVALID(axi_hp_2_M00_AXI_ARVALID),
        .S_AXI_HP2_AWADDR(axi_hp_2_M00_AXI_AWADDR),
        .S_AXI_HP2_AWBURST(axi_hp_2_M00_AXI_AWBURST),
        .S_AXI_HP2_AWCACHE(axi_hp_2_M00_AXI_AWCACHE),
        .S_AXI_HP2_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWLEN(axi_hp_2_M00_AXI_AWLEN),
        .S_AXI_HP2_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP2_AWPROT(axi_hp_2_M00_AXI_AWPROT),
        .S_AXI_HP2_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWREADY(axi_hp_2_M00_AXI_AWREADY),
        .S_AXI_HP2_AWSIZE(axi_hp_2_M00_AXI_AWSIZE),
        .S_AXI_HP2_AWVALID(axi_hp_2_M00_AXI_AWVALID),
        .S_AXI_HP2_BREADY(axi_hp_2_M00_AXI_BREADY),
        .S_AXI_HP2_BRESP(axi_hp_2_M00_AXI_BRESP),
        .S_AXI_HP2_BVALID(axi_hp_2_M00_AXI_BVALID),
        .S_AXI_HP2_RDATA(axi_hp_2_M00_AXI_RDATA),
        .S_AXI_HP2_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP2_RLAST(axi_hp_2_M00_AXI_RLAST),
        .S_AXI_HP2_RREADY(axi_hp_2_M00_AXI_RREADY),
        .S_AXI_HP2_RRESP(axi_hp_2_M00_AXI_RRESP),
        .S_AXI_HP2_RVALID(axi_hp_2_M00_AXI_RVALID),
        .S_AXI_HP2_WDATA(axi_hp_2_M00_AXI_WDATA),
        .S_AXI_HP2_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WLAST(axi_hp_2_M00_AXI_WLAST),
        .S_AXI_HP2_WREADY(axi_hp_2_M00_AXI_WREADY),
        .S_AXI_HP2_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP2_WSTRB(axi_hp_2_M00_AXI_WSTRB),
        .S_AXI_HP2_WVALID(axi_hp_2_M00_AXI_WVALID),
        .USB0_VBUS_PWRFAULT(1'b0));
  system_vectorblox_mxp_0_0 vectorblox_mxp_0
       (.aresetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .core_clk(sysclk),
        .core_clk_2x(clk_wiz_0_clk_out2),
        .m_axi_araddr(vectorblox_mxp_0_M_AXI_ARADDR),
        .m_axi_arburst(vectorblox_mxp_0_M_AXI_ARBURST),
        .m_axi_arcache(vectorblox_mxp_0_M_AXI_ARCACHE),
        .m_axi_arlen(vectorblox_mxp_0_M_AXI_ARLEN),
        .m_axi_arprot(vectorblox_mxp_0_M_AXI_ARPROT),
        .m_axi_arready(vectorblox_mxp_0_M_AXI_ARREADY),
        .m_axi_arsize(vectorblox_mxp_0_M_AXI_ARSIZE),
        .m_axi_arvalid(vectorblox_mxp_0_M_AXI_ARVALID),
        .m_axi_awaddr(vectorblox_mxp_0_M_AXI_AWADDR),
        .m_axi_awburst(vectorblox_mxp_0_M_AXI_AWBURST),
        .m_axi_awcache(vectorblox_mxp_0_M_AXI_AWCACHE),
        .m_axi_awlen(vectorblox_mxp_0_M_AXI_AWLEN),
        .m_axi_awprot(vectorblox_mxp_0_M_AXI_AWPROT),
        .m_axi_awready(vectorblox_mxp_0_M_AXI_AWREADY),
        .m_axi_awsize(vectorblox_mxp_0_M_AXI_AWSIZE),
        .m_axi_awvalid(vectorblox_mxp_0_M_AXI_AWVALID),
        .m_axi_bready(vectorblox_mxp_0_M_AXI_BREADY),
        .m_axi_bresp(vectorblox_mxp_0_M_AXI_BRESP),
        .m_axi_bvalid(vectorblox_mxp_0_M_AXI_BVALID),
        .m_axi_rdata(vectorblox_mxp_0_M_AXI_RDATA),
        .m_axi_rlast(vectorblox_mxp_0_M_AXI_RLAST),
        .m_axi_rready(vectorblox_mxp_0_M_AXI_RREADY),
        .m_axi_rresp(vectorblox_mxp_0_M_AXI_RRESP),
        .m_axi_rvalid(vectorblox_mxp_0_M_AXI_RVALID),
        .m_axi_wdata(vectorblox_mxp_0_M_AXI_WDATA),
        .m_axi_wlast(vectorblox_mxp_0_M_AXI_WLAST),
        .m_axi_wready(vectorblox_mxp_0_M_AXI_WREADY),
        .m_axi_wstrb(vectorblox_mxp_0_M_AXI_WSTRB),
        .m_axi_wvalid(vectorblox_mxp_0_M_AXI_WVALID),
        .m_axis_instr_tdata(vectorblox_mxp_0_M_AXIS_INSTR_TDATA),
        .m_axis_instr_tlast(vectorblox_mxp_0_M_AXIS_INSTR_TLAST),
        .m_axis_instr_tready(vectorblox_mxp_0_M_AXIS_INSTR_TREADY),
        .m_axis_instr_tvalid(vectorblox_mxp_0_M_AXIS_INSTR_TVALID),
        .s_axi_araddr(axi4lite_0_M03_AXI_ARADDR),
        .s_axi_arready(axi4lite_0_M03_AXI_ARREADY),
        .s_axi_arvalid(axi4lite_0_M03_AXI_ARVALID),
        .s_axi_awaddr(axi4lite_0_M03_AXI_AWADDR),
        .s_axi_awready(axi4lite_0_M03_AXI_AWREADY),
        .s_axi_awvalid(axi4lite_0_M03_AXI_AWVALID),
        .s_axi_bready(axi4lite_0_M03_AXI_BREADY),
        .s_axi_bresp(axi4lite_0_M03_AXI_BRESP),
        .s_axi_bvalid(axi4lite_0_M03_AXI_BVALID),
        .s_axi_rdata(axi4lite_0_M03_AXI_RDATA),
        .s_axi_rready(axi4lite_0_M03_AXI_RREADY),
        .s_axi_rresp(axi4lite_0_M03_AXI_RRESP),
        .s_axi_rvalid(axi4lite_0_M03_AXI_RVALID),
        .s_axi_wdata(axi4lite_0_M03_AXI_WDATA),
        .s_axi_wready(axi4lite_0_M03_AXI_WREADY),
        .s_axi_wstrb(axi4lite_0_M03_AXI_WSTRB),
        .s_axi_wvalid(axi4lite_0_M03_AXI_WVALID),
        .s_axis_instr_tdata(microblaze_0_M0_AXIS_TDATA),
        .s_axis_instr_tlast(microblaze_0_M0_AXIS_TLAST),
        .s_axis_instr_tready(microblaze_0_M0_AXIS_TREADY),
        .s_axis_instr_tvalid(microblaze_0_M0_AXIS_TVALID));
endmodule

module system_axi4lite_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arburst,
    M02_AXI_arcache,
    M02_AXI_arlen,
    M02_AXI_arlock,
    M02_AXI_arprot,
    M02_AXI_arqos,
    M02_AXI_arready,
    M02_AXI_arsize,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awburst,
    M02_AXI_awcache,
    M02_AXI_awlen,
    M02_AXI_awlock,
    M02_AXI_awprot,
    M02_AXI_awqos,
    M02_AXI_awready,
    M02_AXI_awsize,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rlast,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wlast,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arprot,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awprot,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  output [1:0]M02_AXI_arburst;
  output [3:0]M02_AXI_arcache;
  output [3:0]M02_AXI_arlen;
  output [1:0]M02_AXI_arlock;
  output [2:0]M02_AXI_arprot;
  output [3:0]M02_AXI_arqos;
  input M02_AXI_arready;
  output [2:0]M02_AXI_arsize;
  output M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  output [1:0]M02_AXI_awburst;
  output [3:0]M02_AXI_awcache;
  output [3:0]M02_AXI_awlen;
  output [1:0]M02_AXI_awlock;
  output [2:0]M02_AXI_awprot;
  output [3:0]M02_AXI_awqos;
  input M02_AXI_awready;
  output [2:0]M02_AXI_awsize;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  input M02_AXI_rlast;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  output M02_AXI_wlast;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [31:0]M03_AXI_araddr;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [31:0]M03_AXI_awaddr;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [31:0]M04_AXI_araddr;
  output [2:0]M04_AXI_arprot;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  output [2:0]M04_AXI_awprot;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire M02_ACLK_1;
  wire M02_ARESETN_1;
  wire M03_ACLK_1;
  wire M03_ARESETN_1;
  wire M04_ACLK_1;
  wire M04_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire [31:0]S00_AXI_1_ARADDR;
  wire [2:0]S00_AXI_1_ARPROT;
  wire S00_AXI_1_ARREADY;
  wire S00_AXI_1_ARVALID;
  wire [31:0]S00_AXI_1_AWADDR;
  wire [2:0]S00_AXI_1_AWPROT;
  wire S00_AXI_1_AWREADY;
  wire S00_AXI_1_AWVALID;
  wire S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire S00_AXI_1_WVALID;
  wire axi4lite_0_ACLK_net;
  wire axi4lite_0_ARESETN_net;
  wire [31:0]m00_couplers_to_axi4lite_0_ARADDR;
  wire m00_couplers_to_axi4lite_0_ARREADY;
  wire m00_couplers_to_axi4lite_0_ARVALID;
  wire [31:0]m00_couplers_to_axi4lite_0_AWADDR;
  wire m00_couplers_to_axi4lite_0_AWREADY;
  wire m00_couplers_to_axi4lite_0_AWVALID;
  wire m00_couplers_to_axi4lite_0_BREADY;
  wire [1:0]m00_couplers_to_axi4lite_0_BRESP;
  wire m00_couplers_to_axi4lite_0_BVALID;
  wire [31:0]m00_couplers_to_axi4lite_0_RDATA;
  wire m00_couplers_to_axi4lite_0_RREADY;
  wire [1:0]m00_couplers_to_axi4lite_0_RRESP;
  wire m00_couplers_to_axi4lite_0_RVALID;
  wire [31:0]m00_couplers_to_axi4lite_0_WDATA;
  wire m00_couplers_to_axi4lite_0_WREADY;
  wire [3:0]m00_couplers_to_axi4lite_0_WSTRB;
  wire m00_couplers_to_axi4lite_0_WVALID;
  wire [31:0]m01_couplers_to_axi4lite_0_ARADDR;
  wire m01_couplers_to_axi4lite_0_ARREADY;
  wire m01_couplers_to_axi4lite_0_ARVALID;
  wire [31:0]m01_couplers_to_axi4lite_0_AWADDR;
  wire m01_couplers_to_axi4lite_0_AWREADY;
  wire m01_couplers_to_axi4lite_0_AWVALID;
  wire m01_couplers_to_axi4lite_0_BREADY;
  wire [1:0]m01_couplers_to_axi4lite_0_BRESP;
  wire m01_couplers_to_axi4lite_0_BVALID;
  wire [31:0]m01_couplers_to_axi4lite_0_RDATA;
  wire m01_couplers_to_axi4lite_0_RREADY;
  wire [1:0]m01_couplers_to_axi4lite_0_RRESP;
  wire m01_couplers_to_axi4lite_0_RVALID;
  wire [31:0]m01_couplers_to_axi4lite_0_WDATA;
  wire m01_couplers_to_axi4lite_0_WREADY;
  wire [3:0]m01_couplers_to_axi4lite_0_WSTRB;
  wire m01_couplers_to_axi4lite_0_WVALID;
  wire [31:0]m02_couplers_to_axi4lite_0_ARADDR;
  wire [1:0]m02_couplers_to_axi4lite_0_ARBURST;
  wire [3:0]m02_couplers_to_axi4lite_0_ARCACHE;
  wire [3:0]m02_couplers_to_axi4lite_0_ARLEN;
  wire [1:0]m02_couplers_to_axi4lite_0_ARLOCK;
  wire [2:0]m02_couplers_to_axi4lite_0_ARPROT;
  wire [3:0]m02_couplers_to_axi4lite_0_ARQOS;
  wire m02_couplers_to_axi4lite_0_ARREADY;
  wire [2:0]m02_couplers_to_axi4lite_0_ARSIZE;
  wire m02_couplers_to_axi4lite_0_ARVALID;
  wire [31:0]m02_couplers_to_axi4lite_0_AWADDR;
  wire [1:0]m02_couplers_to_axi4lite_0_AWBURST;
  wire [3:0]m02_couplers_to_axi4lite_0_AWCACHE;
  wire [3:0]m02_couplers_to_axi4lite_0_AWLEN;
  wire [1:0]m02_couplers_to_axi4lite_0_AWLOCK;
  wire [2:0]m02_couplers_to_axi4lite_0_AWPROT;
  wire [3:0]m02_couplers_to_axi4lite_0_AWQOS;
  wire m02_couplers_to_axi4lite_0_AWREADY;
  wire [2:0]m02_couplers_to_axi4lite_0_AWSIZE;
  wire m02_couplers_to_axi4lite_0_AWVALID;
  wire m02_couplers_to_axi4lite_0_BREADY;
  wire [1:0]m02_couplers_to_axi4lite_0_BRESP;
  wire m02_couplers_to_axi4lite_0_BVALID;
  wire [31:0]m02_couplers_to_axi4lite_0_RDATA;
  wire m02_couplers_to_axi4lite_0_RLAST;
  wire m02_couplers_to_axi4lite_0_RREADY;
  wire [1:0]m02_couplers_to_axi4lite_0_RRESP;
  wire m02_couplers_to_axi4lite_0_RVALID;
  wire [31:0]m02_couplers_to_axi4lite_0_WDATA;
  wire m02_couplers_to_axi4lite_0_WLAST;
  wire m02_couplers_to_axi4lite_0_WREADY;
  wire [3:0]m02_couplers_to_axi4lite_0_WSTRB;
  wire m02_couplers_to_axi4lite_0_WVALID;
  wire [31:0]m03_couplers_to_axi4lite_0_ARADDR;
  wire m03_couplers_to_axi4lite_0_ARREADY;
  wire m03_couplers_to_axi4lite_0_ARVALID;
  wire [31:0]m03_couplers_to_axi4lite_0_AWADDR;
  wire m03_couplers_to_axi4lite_0_AWREADY;
  wire m03_couplers_to_axi4lite_0_AWVALID;
  wire m03_couplers_to_axi4lite_0_BREADY;
  wire [1:0]m03_couplers_to_axi4lite_0_BRESP;
  wire m03_couplers_to_axi4lite_0_BVALID;
  wire [31:0]m03_couplers_to_axi4lite_0_RDATA;
  wire m03_couplers_to_axi4lite_0_RREADY;
  wire [1:0]m03_couplers_to_axi4lite_0_RRESP;
  wire m03_couplers_to_axi4lite_0_RVALID;
  wire [31:0]m03_couplers_to_axi4lite_0_WDATA;
  wire m03_couplers_to_axi4lite_0_WREADY;
  wire [3:0]m03_couplers_to_axi4lite_0_WSTRB;
  wire m03_couplers_to_axi4lite_0_WVALID;
  wire [31:0]m04_couplers_to_axi4lite_0_ARADDR;
  wire [2:0]m04_couplers_to_axi4lite_0_ARPROT;
  wire m04_couplers_to_axi4lite_0_ARREADY;
  wire m04_couplers_to_axi4lite_0_ARVALID;
  wire [31:0]m04_couplers_to_axi4lite_0_AWADDR;
  wire [2:0]m04_couplers_to_axi4lite_0_AWPROT;
  wire m04_couplers_to_axi4lite_0_AWREADY;
  wire m04_couplers_to_axi4lite_0_AWVALID;
  wire m04_couplers_to_axi4lite_0_BREADY;
  wire [1:0]m04_couplers_to_axi4lite_0_BRESP;
  wire m04_couplers_to_axi4lite_0_BVALID;
  wire [31:0]m04_couplers_to_axi4lite_0_RDATA;
  wire m04_couplers_to_axi4lite_0_RREADY;
  wire [1:0]m04_couplers_to_axi4lite_0_RRESP;
  wire m04_couplers_to_axi4lite_0_RVALID;
  wire [31:0]m04_couplers_to_axi4lite_0_WDATA;
  wire m04_couplers_to_axi4lite_0_WREADY;
  wire [3:0]m04_couplers_to_axi4lite_0_WSTRB;
  wire m04_couplers_to_axi4lite_0_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]s00_mmu_M_AXI_ARADDR;
  wire [2:0]s00_mmu_M_AXI_ARPROT;
  wire s00_mmu_M_AXI_ARREADY;
  wire s00_mmu_M_AXI_ARVALID;
  wire [31:0]s00_mmu_M_AXI_AWADDR;
  wire [2:0]s00_mmu_M_AXI_AWPROT;
  wire s00_mmu_M_AXI_AWREADY;
  wire s00_mmu_M_AXI_AWVALID;
  wire s00_mmu_M_AXI_BREADY;
  wire [1:0]s00_mmu_M_AXI_BRESP;
  wire s00_mmu_M_AXI_BVALID;
  wire [31:0]s00_mmu_M_AXI_RDATA;
  wire s00_mmu_M_AXI_RREADY;
  wire [1:0]s00_mmu_M_AXI_RRESP;
  wire s00_mmu_M_AXI_RVALID;
  wire [31:0]s00_mmu_M_AXI_WDATA;
  wire s00_mmu_M_AXI_WREADY;
  wire [3:0]s00_mmu_M_AXI_WSTRB;
  wire s00_mmu_M_AXI_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [8:6]xbar_to_m02_couplers_ARPROT;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [8:6]xbar_to_m02_couplers_AWPROT;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire [14:12]xbar_to_m04_couplers_ARPROT;
  wire xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire [14:12]xbar_to_m04_couplers_AWPROT;
  wire xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [14:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [14:0]NLW_xbar_m_axi_awprot_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi4lite_0_ARADDR;
  assign M00_AXI_arvalid = m00_couplers_to_axi4lite_0_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi4lite_0_AWADDR;
  assign M00_AXI_awvalid = m00_couplers_to_axi4lite_0_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi4lite_0_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi4lite_0_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi4lite_0_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi4lite_0_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi4lite_0_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_axi4lite_0_ARADDR;
  assign M01_AXI_arvalid = m01_couplers_to_axi4lite_0_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_axi4lite_0_AWADDR;
  assign M01_AXI_awvalid = m01_couplers_to_axi4lite_0_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_axi4lite_0_BREADY;
  assign M01_AXI_rready = m01_couplers_to_axi4lite_0_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_axi4lite_0_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_axi4lite_0_WSTRB;
  assign M01_AXI_wvalid = m01_couplers_to_axi4lite_0_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN;
  assign M02_AXI_araddr[31:0] = m02_couplers_to_axi4lite_0_ARADDR;
  assign M02_AXI_arburst[1:0] = m02_couplers_to_axi4lite_0_ARBURST;
  assign M02_AXI_arcache[3:0] = m02_couplers_to_axi4lite_0_ARCACHE;
  assign M02_AXI_arlen[3:0] = m02_couplers_to_axi4lite_0_ARLEN;
  assign M02_AXI_arlock[1:0] = m02_couplers_to_axi4lite_0_ARLOCK;
  assign M02_AXI_arprot[2:0] = m02_couplers_to_axi4lite_0_ARPROT;
  assign M02_AXI_arqos[3:0] = m02_couplers_to_axi4lite_0_ARQOS;
  assign M02_AXI_arsize[2:0] = m02_couplers_to_axi4lite_0_ARSIZE;
  assign M02_AXI_arvalid = m02_couplers_to_axi4lite_0_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_axi4lite_0_AWADDR;
  assign M02_AXI_awburst[1:0] = m02_couplers_to_axi4lite_0_AWBURST;
  assign M02_AXI_awcache[3:0] = m02_couplers_to_axi4lite_0_AWCACHE;
  assign M02_AXI_awlen[3:0] = m02_couplers_to_axi4lite_0_AWLEN;
  assign M02_AXI_awlock[1:0] = m02_couplers_to_axi4lite_0_AWLOCK;
  assign M02_AXI_awprot[2:0] = m02_couplers_to_axi4lite_0_AWPROT;
  assign M02_AXI_awqos[3:0] = m02_couplers_to_axi4lite_0_AWQOS;
  assign M02_AXI_awsize[2:0] = m02_couplers_to_axi4lite_0_AWSIZE;
  assign M02_AXI_awvalid = m02_couplers_to_axi4lite_0_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_axi4lite_0_BREADY;
  assign M02_AXI_rready = m02_couplers_to_axi4lite_0_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_axi4lite_0_WDATA;
  assign M02_AXI_wlast = m02_couplers_to_axi4lite_0_WLAST;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_axi4lite_0_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_axi4lite_0_WVALID;
  assign M03_ACLK_1 = M03_ACLK;
  assign M03_ARESETN_1 = M03_ARESETN;
  assign M03_AXI_araddr[31:0] = m03_couplers_to_axi4lite_0_ARADDR;
  assign M03_AXI_arvalid = m03_couplers_to_axi4lite_0_ARVALID;
  assign M03_AXI_awaddr[31:0] = m03_couplers_to_axi4lite_0_AWADDR;
  assign M03_AXI_awvalid = m03_couplers_to_axi4lite_0_AWVALID;
  assign M03_AXI_bready = m03_couplers_to_axi4lite_0_BREADY;
  assign M03_AXI_rready = m03_couplers_to_axi4lite_0_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_axi4lite_0_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_axi4lite_0_WSTRB;
  assign M03_AXI_wvalid = m03_couplers_to_axi4lite_0_WVALID;
  assign M04_ACLK_1 = M04_ACLK;
  assign M04_ARESETN_1 = M04_ARESETN;
  assign M04_AXI_araddr[31:0] = m04_couplers_to_axi4lite_0_ARADDR;
  assign M04_AXI_arprot[2:0] = m04_couplers_to_axi4lite_0_ARPROT;
  assign M04_AXI_arvalid = m04_couplers_to_axi4lite_0_ARVALID;
  assign M04_AXI_awaddr[31:0] = m04_couplers_to_axi4lite_0_AWADDR;
  assign M04_AXI_awprot[2:0] = m04_couplers_to_axi4lite_0_AWPROT;
  assign M04_AXI_awvalid = m04_couplers_to_axi4lite_0_AWVALID;
  assign M04_AXI_bready = m04_couplers_to_axi4lite_0_BREADY;
  assign M04_AXI_rready = m04_couplers_to_axi4lite_0_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_axi4lite_0_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_axi4lite_0_WSTRB;
  assign M04_AXI_wvalid = m04_couplers_to_axi4lite_0_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_1_ARADDR = S00_AXI_araddr[31:0];
  assign S00_AXI_1_ARPROT = S00_AXI_arprot[2:0];
  assign S00_AXI_1_ARVALID = S00_AXI_arvalid;
  assign S00_AXI_1_AWADDR = S00_AXI_awaddr[31:0];
  assign S00_AXI_1_AWPROT = S00_AXI_awprot[2:0];
  assign S00_AXI_1_AWVALID = S00_AXI_awvalid;
  assign S00_AXI_1_BREADY = S00_AXI_bready;
  assign S00_AXI_1_RREADY = S00_AXI_rready;
  assign S00_AXI_1_WDATA = S00_AXI_wdata[31:0];
  assign S00_AXI_1_WSTRB = S00_AXI_wstrb[3:0];
  assign S00_AXI_1_WVALID = S00_AXI_wvalid;
  assign S00_AXI_arready = S00_AXI_1_ARREADY;
  assign S00_AXI_awready = S00_AXI_1_AWREADY;
  assign S00_AXI_bresp[1:0] = S00_AXI_1_BRESP;
  assign S00_AXI_bvalid = S00_AXI_1_BVALID;
  assign S00_AXI_rdata[31:0] = S00_AXI_1_RDATA;
  assign S00_AXI_rresp[1:0] = S00_AXI_1_RRESP;
  assign S00_AXI_rvalid = S00_AXI_1_RVALID;
  assign S00_AXI_wready = S00_AXI_1_WREADY;
  assign axi4lite_0_ACLK_net = ACLK;
  assign axi4lite_0_ARESETN_net = ARESETN;
  assign m00_couplers_to_axi4lite_0_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi4lite_0_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi4lite_0_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi4lite_0_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi4lite_0_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi4lite_0_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi4lite_0_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi4lite_0_WREADY = M00_AXI_wready;
  assign m01_couplers_to_axi4lite_0_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_axi4lite_0_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_axi4lite_0_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_axi4lite_0_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_axi4lite_0_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_axi4lite_0_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_axi4lite_0_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_axi4lite_0_WREADY = M01_AXI_wready;
  assign m02_couplers_to_axi4lite_0_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_axi4lite_0_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_axi4lite_0_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_axi4lite_0_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_axi4lite_0_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_axi4lite_0_RLAST = M02_AXI_rlast;
  assign m02_couplers_to_axi4lite_0_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_axi4lite_0_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_axi4lite_0_WREADY = M02_AXI_wready;
  assign m03_couplers_to_axi4lite_0_ARREADY = M03_AXI_arready;
  assign m03_couplers_to_axi4lite_0_AWREADY = M03_AXI_awready;
  assign m03_couplers_to_axi4lite_0_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_axi4lite_0_BVALID = M03_AXI_bvalid;
  assign m03_couplers_to_axi4lite_0_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_axi4lite_0_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_axi4lite_0_RVALID = M03_AXI_rvalid;
  assign m03_couplers_to_axi4lite_0_WREADY = M03_AXI_wready;
  assign m04_couplers_to_axi4lite_0_ARREADY = M04_AXI_arready;
  assign m04_couplers_to_axi4lite_0_AWREADY = M04_AXI_awready;
  assign m04_couplers_to_axi4lite_0_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_axi4lite_0_BVALID = M04_AXI_bvalid;
  assign m04_couplers_to_axi4lite_0_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_axi4lite_0_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_axi4lite_0_RVALID = M04_AXI_rvalid;
  assign m04_couplers_to_axi4lite_0_WREADY = M04_AXI_wready;
  m00_couplers_imp_QRRUQG m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_axi4lite_0_ARADDR),
        .M_AXI_arready(m00_couplers_to_axi4lite_0_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_axi4lite_0_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi4lite_0_AWADDR),
        .M_AXI_awready(m00_couplers_to_axi4lite_0_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_axi4lite_0_AWVALID),
        .M_AXI_bready(m00_couplers_to_axi4lite_0_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi4lite_0_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi4lite_0_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi4lite_0_RDATA),
        .M_AXI_rready(m00_couplers_to_axi4lite_0_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi4lite_0_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi4lite_0_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi4lite_0_WDATA),
        .M_AXI_wready(m00_couplers_to_axi4lite_0_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi4lite_0_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi4lite_0_WVALID),
        .S_ACLK(axi4lite_0_ACLK_net),
        .S_ARESETN(axi4lite_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1L6HPS9 m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_axi4lite_0_ARADDR),
        .M_AXI_arready(m01_couplers_to_axi4lite_0_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_axi4lite_0_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_axi4lite_0_AWADDR),
        .M_AXI_awready(m01_couplers_to_axi4lite_0_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_axi4lite_0_AWVALID),
        .M_AXI_bready(m01_couplers_to_axi4lite_0_BREADY),
        .M_AXI_bresp(m01_couplers_to_axi4lite_0_BRESP),
        .M_AXI_bvalid(m01_couplers_to_axi4lite_0_BVALID),
        .M_AXI_rdata(m01_couplers_to_axi4lite_0_RDATA),
        .M_AXI_rready(m01_couplers_to_axi4lite_0_RREADY),
        .M_AXI_rresp(m01_couplers_to_axi4lite_0_RRESP),
        .M_AXI_rvalid(m01_couplers_to_axi4lite_0_RVALID),
        .M_AXI_wdata(m01_couplers_to_axi4lite_0_WDATA),
        .M_AXI_wready(m01_couplers_to_axi4lite_0_WREADY),
        .M_AXI_wstrb(m01_couplers_to_axi4lite_0_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_axi4lite_0_WVALID),
        .S_ACLK(axi4lite_0_ACLK_net),
        .S_ARESETN(axi4lite_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1SBZOL7 m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_axi4lite_0_ARADDR),
        .M_AXI_arburst(m02_couplers_to_axi4lite_0_ARBURST),
        .M_AXI_arcache(m02_couplers_to_axi4lite_0_ARCACHE),
        .M_AXI_arlen(m02_couplers_to_axi4lite_0_ARLEN),
        .M_AXI_arlock(m02_couplers_to_axi4lite_0_ARLOCK),
        .M_AXI_arprot(m02_couplers_to_axi4lite_0_ARPROT),
        .M_AXI_arqos(m02_couplers_to_axi4lite_0_ARQOS),
        .M_AXI_arready(m02_couplers_to_axi4lite_0_ARREADY),
        .M_AXI_arsize(m02_couplers_to_axi4lite_0_ARSIZE),
        .M_AXI_arvalid(m02_couplers_to_axi4lite_0_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_axi4lite_0_AWADDR),
        .M_AXI_awburst(m02_couplers_to_axi4lite_0_AWBURST),
        .M_AXI_awcache(m02_couplers_to_axi4lite_0_AWCACHE),
        .M_AXI_awlen(m02_couplers_to_axi4lite_0_AWLEN),
        .M_AXI_awlock(m02_couplers_to_axi4lite_0_AWLOCK),
        .M_AXI_awprot(m02_couplers_to_axi4lite_0_AWPROT),
        .M_AXI_awqos(m02_couplers_to_axi4lite_0_AWQOS),
        .M_AXI_awready(m02_couplers_to_axi4lite_0_AWREADY),
        .M_AXI_awsize(m02_couplers_to_axi4lite_0_AWSIZE),
        .M_AXI_awvalid(m02_couplers_to_axi4lite_0_AWVALID),
        .M_AXI_bready(m02_couplers_to_axi4lite_0_BREADY),
        .M_AXI_bresp(m02_couplers_to_axi4lite_0_BRESP),
        .M_AXI_bvalid(m02_couplers_to_axi4lite_0_BVALID),
        .M_AXI_rdata(m02_couplers_to_axi4lite_0_RDATA),
        .M_AXI_rlast(m02_couplers_to_axi4lite_0_RLAST),
        .M_AXI_rready(m02_couplers_to_axi4lite_0_RREADY),
        .M_AXI_rresp(m02_couplers_to_axi4lite_0_RRESP),
        .M_AXI_rvalid(m02_couplers_to_axi4lite_0_RVALID),
        .M_AXI_wdata(m02_couplers_to_axi4lite_0_WDATA),
        .M_AXI_wlast(m02_couplers_to_axi4lite_0_WLAST),
        .M_AXI_wready(m02_couplers_to_axi4lite_0_WREADY),
        .M_AXI_wstrb(m02_couplers_to_axi4lite_0_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_axi4lite_0_WVALID),
        .S_ACLK(axi4lite_0_ACLK_net),
        .S_ARESETN(axi4lite_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m02_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m02_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_KG89T6 m03_couplers
       (.M_ACLK(M03_ACLK_1),
        .M_ARESETN(M03_ARESETN_1),
        .M_AXI_araddr(m03_couplers_to_axi4lite_0_ARADDR),
        .M_AXI_arready(m03_couplers_to_axi4lite_0_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_axi4lite_0_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_axi4lite_0_AWADDR),
        .M_AXI_awready(m03_couplers_to_axi4lite_0_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_axi4lite_0_AWVALID),
        .M_AXI_bready(m03_couplers_to_axi4lite_0_BREADY),
        .M_AXI_bresp(m03_couplers_to_axi4lite_0_BRESP),
        .M_AXI_bvalid(m03_couplers_to_axi4lite_0_BVALID),
        .M_AXI_rdata(m03_couplers_to_axi4lite_0_RDATA),
        .M_AXI_rready(m03_couplers_to_axi4lite_0_RREADY),
        .M_AXI_rresp(m03_couplers_to_axi4lite_0_RRESP),
        .M_AXI_rvalid(m03_couplers_to_axi4lite_0_RVALID),
        .M_AXI_wdata(m03_couplers_to_axi4lite_0_WDATA),
        .M_AXI_wready(m03_couplers_to_axi4lite_0_WREADY),
        .M_AXI_wstrb(m03_couplers_to_axi4lite_0_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_axi4lite_0_WVALID),
        .S_ACLK(axi4lite_0_ACLK_net),
        .S_ARESETN(axi4lite_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_1E0ZEFZ m04_couplers
       (.M_ACLK(M04_ACLK_1),
        .M_ARESETN(M04_ARESETN_1),
        .M_AXI_araddr(m04_couplers_to_axi4lite_0_ARADDR),
        .M_AXI_arprot(m04_couplers_to_axi4lite_0_ARPROT),
        .M_AXI_arready(m04_couplers_to_axi4lite_0_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_axi4lite_0_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_axi4lite_0_AWADDR),
        .M_AXI_awprot(m04_couplers_to_axi4lite_0_AWPROT),
        .M_AXI_awready(m04_couplers_to_axi4lite_0_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_axi4lite_0_AWVALID),
        .M_AXI_bready(m04_couplers_to_axi4lite_0_BREADY),
        .M_AXI_bresp(m04_couplers_to_axi4lite_0_BRESP),
        .M_AXI_bvalid(m04_couplers_to_axi4lite_0_BVALID),
        .M_AXI_rdata(m04_couplers_to_axi4lite_0_RDATA),
        .M_AXI_rready(m04_couplers_to_axi4lite_0_RREADY),
        .M_AXI_rresp(m04_couplers_to_axi4lite_0_RRESP),
        .M_AXI_rvalid(m04_couplers_to_axi4lite_0_RVALID),
        .M_AXI_wdata(m04_couplers_to_axi4lite_0_WDATA),
        .M_AXI_wready(m04_couplers_to_axi4lite_0_WREADY),
        .M_AXI_wstrb(m04_couplers_to_axi4lite_0_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_axi4lite_0_WVALID),
        .S_ACLK(axi4lite_0_ACLK_net),
        .S_ARESETN(axi4lite_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m04_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m04_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  s00_couplers_imp_OEGX55 s00_couplers
       (.M_ACLK(axi4lite_0_ACLK_net),
        .M_ARESETN(axi4lite_0_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(s00_mmu_M_AXI_ARADDR),
        .S_AXI_arprot(s00_mmu_M_AXI_ARPROT),
        .S_AXI_arready(s00_mmu_M_AXI_ARREADY),
        .S_AXI_arvalid(s00_mmu_M_AXI_ARVALID),
        .S_AXI_awaddr(s00_mmu_M_AXI_AWADDR),
        .S_AXI_awprot(s00_mmu_M_AXI_AWPROT),
        .S_AXI_awready(s00_mmu_M_AXI_AWREADY),
        .S_AXI_awvalid(s00_mmu_M_AXI_AWVALID),
        .S_AXI_bready(s00_mmu_M_AXI_BREADY),
        .S_AXI_bresp(s00_mmu_M_AXI_BRESP),
        .S_AXI_bvalid(s00_mmu_M_AXI_BVALID),
        .S_AXI_rdata(s00_mmu_M_AXI_RDATA),
        .S_AXI_rready(s00_mmu_M_AXI_RREADY),
        .S_AXI_rresp(s00_mmu_M_AXI_RRESP),
        .S_AXI_rvalid(s00_mmu_M_AXI_RVALID),
        .S_AXI_wdata(s00_mmu_M_AXI_WDATA),
        .S_AXI_wready(s00_mmu_M_AXI_WREADY),
        .S_AXI_wstrb(s00_mmu_M_AXI_WSTRB),
        .S_AXI_wvalid(s00_mmu_M_AXI_WVALID));
  system_s00_mmu_0 s00_mmu
       (.aclk(S00_ACLK_1),
        .aresetn(S00_ARESETN_1),
        .m_axi_araddr(s00_mmu_M_AXI_ARADDR),
        .m_axi_arprot(s00_mmu_M_AXI_ARPROT),
        .m_axi_arready(s00_mmu_M_AXI_ARREADY),
        .m_axi_arvalid(s00_mmu_M_AXI_ARVALID),
        .m_axi_awaddr(s00_mmu_M_AXI_AWADDR),
        .m_axi_awprot(s00_mmu_M_AXI_AWPROT),
        .m_axi_awready(s00_mmu_M_AXI_AWREADY),
        .m_axi_awvalid(s00_mmu_M_AXI_AWVALID),
        .m_axi_bready(s00_mmu_M_AXI_BREADY),
        .m_axi_bresp(s00_mmu_M_AXI_BRESP),
        .m_axi_bvalid(s00_mmu_M_AXI_BVALID),
        .m_axi_rdata(s00_mmu_M_AXI_RDATA),
        .m_axi_rready(s00_mmu_M_AXI_RREADY),
        .m_axi_rresp(s00_mmu_M_AXI_RRESP),
        .m_axi_rvalid(s00_mmu_M_AXI_RVALID),
        .m_axi_wdata(s00_mmu_M_AXI_WDATA),
        .m_axi_wready(s00_mmu_M_AXI_WREADY),
        .m_axi_wstrb(s00_mmu_M_AXI_WSTRB),
        .m_axi_wvalid(s00_mmu_M_AXI_WVALID),
        .s_axi_araddr(S00_AXI_1_ARADDR),
        .s_axi_arprot(S00_AXI_1_ARPROT),
        .s_axi_arready(S00_AXI_1_ARREADY),
        .s_axi_arvalid(S00_AXI_1_ARVALID),
        .s_axi_awaddr(S00_AXI_1_AWADDR),
        .s_axi_awprot(S00_AXI_1_AWPROT),
        .s_axi_awready(S00_AXI_1_AWREADY),
        .s_axi_awvalid(S00_AXI_1_AWVALID),
        .s_axi_bready(S00_AXI_1_BREADY),
        .s_axi_bresp(S00_AXI_1_BRESP),
        .s_axi_bvalid(S00_AXI_1_BVALID),
        .s_axi_rdata(S00_AXI_1_RDATA),
        .s_axi_rready(S00_AXI_1_RREADY),
        .s_axi_rresp(S00_AXI_1_RRESP),
        .s_axi_rvalid(S00_AXI_1_RVALID),
        .s_axi_wdata(S00_AXI_1_WDATA),
        .s_axi_wready(S00_AXI_1_WREADY),
        .s_axi_wstrb(S00_AXI_1_WSTRB),
        .s_axi_wvalid(S00_AXI_1_WVALID));
  system_xbar_0 xbar
       (.aclk(axi4lite_0_ACLK_net),
        .aresetn(axi4lite_0_ARESETN_net),
        .m_axi_araddr({xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m04_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[11:9],xbar_to_m02_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[5:0]}),
        .m_axi_arready({xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m04_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[11:9],xbar_to_m02_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[5:0]}),
        .m_axi_awready({xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module system_axi_hp_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wid,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    S01_ACLK,
    S01_ARESETN,
    S01_AXI_araddr,
    S01_AXI_arburst,
    S01_AXI_arcache,
    S01_AXI_arid,
    S01_AXI_arlen,
    S01_AXI_arlock,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arready,
    S01_AXI_arsize,
    S01_AXI_arvalid,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awid,
    S01_AXI_awlen,
    S01_AXI_awlock,
    S01_AXI_awprot,
    S01_AXI_awqos,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awvalid,
    S01_AXI_bid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_rdata,
    S01_AXI_rid,
    S01_AXI_rlast,
    S01_AXI_rready,
    S01_AXI_rresp,
    S01_AXI_rvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid,
    S02_ACLK,
    S02_ARESETN,
    S02_AXI_araddr,
    S02_AXI_arprot,
    S02_AXI_arready,
    S02_AXI_arvalid,
    S02_AXI_awaddr,
    S02_AXI_awprot,
    S02_AXI_awready,
    S02_AXI_awvalid,
    S02_AXI_bready,
    S02_AXI_bresp,
    S02_AXI_bvalid,
    S02_AXI_rdata,
    S02_AXI_rready,
    S02_AXI_rresp,
    S02_AXI_rvalid,
    S02_AXI_wdata,
    S02_AXI_wready,
    S02_AXI_wstrb,
    S02_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [1:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [1:0]M00_AXI_awid;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [5:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [5:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output [1:0]M00_AXI_wid;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [0:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [0:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [1:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;
  input S01_ACLK;
  input S01_ARESETN;
  input [31:0]S01_AXI_araddr;
  input [1:0]S01_AXI_arburst;
  input [3:0]S01_AXI_arcache;
  input [0:0]S01_AXI_arid;
  input [7:0]S01_AXI_arlen;
  input S01_AXI_arlock;
  input [2:0]S01_AXI_arprot;
  input [3:0]S01_AXI_arqos;
  output S01_AXI_arready;
  input [2:0]S01_AXI_arsize;
  input S01_AXI_arvalid;
  input [31:0]S01_AXI_awaddr;
  input [1:0]S01_AXI_awburst;
  input [3:0]S01_AXI_awcache;
  input [0:0]S01_AXI_awid;
  input [7:0]S01_AXI_awlen;
  input S01_AXI_awlock;
  input [2:0]S01_AXI_awprot;
  input [3:0]S01_AXI_awqos;
  output S01_AXI_awready;
  input [2:0]S01_AXI_awsize;
  input S01_AXI_awvalid;
  output [1:0]S01_AXI_bid;
  input S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output S01_AXI_bvalid;
  output [31:0]S01_AXI_rdata;
  output [1:0]S01_AXI_rid;
  output S01_AXI_rlast;
  input S01_AXI_rready;
  output [1:0]S01_AXI_rresp;
  output S01_AXI_rvalid;
  input [31:0]S01_AXI_wdata;
  input S01_AXI_wlast;
  output S01_AXI_wready;
  input [3:0]S01_AXI_wstrb;
  input S01_AXI_wvalid;
  input S02_ACLK;
  input S02_ARESETN;
  input [31:0]S02_AXI_araddr;
  input [2:0]S02_AXI_arprot;
  output S02_AXI_arready;
  input S02_AXI_arvalid;
  input [31:0]S02_AXI_awaddr;
  input [2:0]S02_AXI_awprot;
  output S02_AXI_awready;
  input S02_AXI_awvalid;
  input S02_AXI_bready;
  output [1:0]S02_AXI_bresp;
  output S02_AXI_bvalid;
  output [31:0]S02_AXI_rdata;
  input S02_AXI_rready;
  output [1:0]S02_AXI_rresp;
  output S02_AXI_rvalid;
  input [31:0]S02_AXI_wdata;
  output S02_AXI_wready;
  input [3:0]S02_AXI_wstrb;
  input S02_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire S01_ACLK_1;
  wire S01_ARESETN_1;
  wire S02_ACLK_1;
  wire S02_ARESETN_1;
  wire axi_hp_0_ACLK_net;
  wire axi_hp_0_ARESETN_net;
  wire [31:0]axi_hp_0_to_s00_couplers_ARADDR;
  wire [1:0]axi_hp_0_to_s00_couplers_ARBURST;
  wire [3:0]axi_hp_0_to_s00_couplers_ARCACHE;
  wire [0:0]axi_hp_0_to_s00_couplers_ARID;
  wire [7:0]axi_hp_0_to_s00_couplers_ARLEN;
  wire axi_hp_0_to_s00_couplers_ARLOCK;
  wire [2:0]axi_hp_0_to_s00_couplers_ARPROT;
  wire [3:0]axi_hp_0_to_s00_couplers_ARQOS;
  wire axi_hp_0_to_s00_couplers_ARREADY;
  wire [2:0]axi_hp_0_to_s00_couplers_ARSIZE;
  wire axi_hp_0_to_s00_couplers_ARVALID;
  wire [31:0]axi_hp_0_to_s00_couplers_AWADDR;
  wire [1:0]axi_hp_0_to_s00_couplers_AWBURST;
  wire [3:0]axi_hp_0_to_s00_couplers_AWCACHE;
  wire [0:0]axi_hp_0_to_s00_couplers_AWID;
  wire [7:0]axi_hp_0_to_s00_couplers_AWLEN;
  wire axi_hp_0_to_s00_couplers_AWLOCK;
  wire [2:0]axi_hp_0_to_s00_couplers_AWPROT;
  wire [3:0]axi_hp_0_to_s00_couplers_AWQOS;
  wire axi_hp_0_to_s00_couplers_AWREADY;
  wire [2:0]axi_hp_0_to_s00_couplers_AWSIZE;
  wire axi_hp_0_to_s00_couplers_AWVALID;
  wire [1:0]axi_hp_0_to_s00_couplers_BID;
  wire axi_hp_0_to_s00_couplers_BREADY;
  wire [1:0]axi_hp_0_to_s00_couplers_BRESP;
  wire axi_hp_0_to_s00_couplers_BVALID;
  wire [31:0]axi_hp_0_to_s00_couplers_RDATA;
  wire [1:0]axi_hp_0_to_s00_couplers_RID;
  wire axi_hp_0_to_s00_couplers_RLAST;
  wire axi_hp_0_to_s00_couplers_RREADY;
  wire [1:0]axi_hp_0_to_s00_couplers_RRESP;
  wire axi_hp_0_to_s00_couplers_RVALID;
  wire [31:0]axi_hp_0_to_s00_couplers_WDATA;
  wire axi_hp_0_to_s00_couplers_WLAST;
  wire axi_hp_0_to_s00_couplers_WREADY;
  wire [3:0]axi_hp_0_to_s00_couplers_WSTRB;
  wire axi_hp_0_to_s00_couplers_WVALID;
  wire [31:0]axi_hp_0_to_s01_couplers_ARADDR;
  wire [1:0]axi_hp_0_to_s01_couplers_ARBURST;
  wire [3:0]axi_hp_0_to_s01_couplers_ARCACHE;
  wire [0:0]axi_hp_0_to_s01_couplers_ARID;
  wire [7:0]axi_hp_0_to_s01_couplers_ARLEN;
  wire axi_hp_0_to_s01_couplers_ARLOCK;
  wire [2:0]axi_hp_0_to_s01_couplers_ARPROT;
  wire [3:0]axi_hp_0_to_s01_couplers_ARQOS;
  wire axi_hp_0_to_s01_couplers_ARREADY;
  wire [2:0]axi_hp_0_to_s01_couplers_ARSIZE;
  wire axi_hp_0_to_s01_couplers_ARVALID;
  wire [31:0]axi_hp_0_to_s01_couplers_AWADDR;
  wire [1:0]axi_hp_0_to_s01_couplers_AWBURST;
  wire [3:0]axi_hp_0_to_s01_couplers_AWCACHE;
  wire [0:0]axi_hp_0_to_s01_couplers_AWID;
  wire [7:0]axi_hp_0_to_s01_couplers_AWLEN;
  wire axi_hp_0_to_s01_couplers_AWLOCK;
  wire [2:0]axi_hp_0_to_s01_couplers_AWPROT;
  wire [3:0]axi_hp_0_to_s01_couplers_AWQOS;
  wire axi_hp_0_to_s01_couplers_AWREADY;
  wire [2:0]axi_hp_0_to_s01_couplers_AWSIZE;
  wire axi_hp_0_to_s01_couplers_AWVALID;
  wire [1:0]axi_hp_0_to_s01_couplers_BID;
  wire axi_hp_0_to_s01_couplers_BREADY;
  wire [1:0]axi_hp_0_to_s01_couplers_BRESP;
  wire axi_hp_0_to_s01_couplers_BVALID;
  wire [31:0]axi_hp_0_to_s01_couplers_RDATA;
  wire [1:0]axi_hp_0_to_s01_couplers_RID;
  wire axi_hp_0_to_s01_couplers_RLAST;
  wire axi_hp_0_to_s01_couplers_RREADY;
  wire [1:0]axi_hp_0_to_s01_couplers_RRESP;
  wire axi_hp_0_to_s01_couplers_RVALID;
  wire [31:0]axi_hp_0_to_s01_couplers_WDATA;
  wire axi_hp_0_to_s01_couplers_WLAST;
  wire axi_hp_0_to_s01_couplers_WREADY;
  wire [3:0]axi_hp_0_to_s01_couplers_WSTRB;
  wire axi_hp_0_to_s01_couplers_WVALID;
  wire [31:0]axi_hp_0_to_s02_couplers_ARADDR;
  wire [2:0]axi_hp_0_to_s02_couplers_ARPROT;
  wire axi_hp_0_to_s02_couplers_ARREADY;
  wire axi_hp_0_to_s02_couplers_ARVALID;
  wire [31:0]axi_hp_0_to_s02_couplers_AWADDR;
  wire [2:0]axi_hp_0_to_s02_couplers_AWPROT;
  wire axi_hp_0_to_s02_couplers_AWREADY;
  wire axi_hp_0_to_s02_couplers_AWVALID;
  wire axi_hp_0_to_s02_couplers_BREADY;
  wire [1:0]axi_hp_0_to_s02_couplers_BRESP;
  wire axi_hp_0_to_s02_couplers_BVALID;
  wire [31:0]axi_hp_0_to_s02_couplers_RDATA;
  wire axi_hp_0_to_s02_couplers_RREADY;
  wire [1:0]axi_hp_0_to_s02_couplers_RRESP;
  wire axi_hp_0_to_s02_couplers_RVALID;
  wire [31:0]axi_hp_0_to_s02_couplers_WDATA;
  wire axi_hp_0_to_s02_couplers_WREADY;
  wire [3:0]axi_hp_0_to_s02_couplers_WSTRB;
  wire axi_hp_0_to_s02_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_hp_0_ARADDR;
  wire [1:0]m00_couplers_to_axi_hp_0_ARBURST;
  wire [3:0]m00_couplers_to_axi_hp_0_ARCACHE;
  wire [1:0]m00_couplers_to_axi_hp_0_ARID;
  wire [3:0]m00_couplers_to_axi_hp_0_ARLEN;
  wire [1:0]m00_couplers_to_axi_hp_0_ARLOCK;
  wire [2:0]m00_couplers_to_axi_hp_0_ARPROT;
  wire [3:0]m00_couplers_to_axi_hp_0_ARQOS;
  wire m00_couplers_to_axi_hp_0_ARREADY;
  wire [2:0]m00_couplers_to_axi_hp_0_ARSIZE;
  wire m00_couplers_to_axi_hp_0_ARVALID;
  wire [31:0]m00_couplers_to_axi_hp_0_AWADDR;
  wire [1:0]m00_couplers_to_axi_hp_0_AWBURST;
  wire [3:0]m00_couplers_to_axi_hp_0_AWCACHE;
  wire [1:0]m00_couplers_to_axi_hp_0_AWID;
  wire [3:0]m00_couplers_to_axi_hp_0_AWLEN;
  wire [1:0]m00_couplers_to_axi_hp_0_AWLOCK;
  wire [2:0]m00_couplers_to_axi_hp_0_AWPROT;
  wire [3:0]m00_couplers_to_axi_hp_0_AWQOS;
  wire m00_couplers_to_axi_hp_0_AWREADY;
  wire [2:0]m00_couplers_to_axi_hp_0_AWSIZE;
  wire m00_couplers_to_axi_hp_0_AWVALID;
  wire [5:0]m00_couplers_to_axi_hp_0_BID;
  wire m00_couplers_to_axi_hp_0_BREADY;
  wire [1:0]m00_couplers_to_axi_hp_0_BRESP;
  wire m00_couplers_to_axi_hp_0_BVALID;
  wire [31:0]m00_couplers_to_axi_hp_0_RDATA;
  wire [5:0]m00_couplers_to_axi_hp_0_RID;
  wire m00_couplers_to_axi_hp_0_RLAST;
  wire m00_couplers_to_axi_hp_0_RREADY;
  wire [1:0]m00_couplers_to_axi_hp_0_RRESP;
  wire m00_couplers_to_axi_hp_0_RVALID;
  wire [31:0]m00_couplers_to_axi_hp_0_WDATA;
  wire [1:0]m00_couplers_to_axi_hp_0_WID;
  wire m00_couplers_to_axi_hp_0_WLAST;
  wire m00_couplers_to_axi_hp_0_WREADY;
  wire [3:0]m00_couplers_to_axi_hp_0_WSTRB;
  wire m00_couplers_to_axi_hp_0_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [0:0]s00_couplers_to_xbar_ARID;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [1:0]s00_couplers_to_xbar_AWBURST;
  wire [3:0]s00_couplers_to_xbar_AWCACHE;
  wire [0:0]s00_couplers_to_xbar_AWID;
  wire [7:0]s00_couplers_to_xbar_AWLEN;
  wire s00_couplers_to_xbar_AWLOCK;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [3:0]s00_couplers_to_xbar_AWQOS;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [2:0]s00_couplers_to_xbar_AWSIZE;
  wire s00_couplers_to_xbar_AWVALID;
  wire [1:0]s00_couplers_to_xbar_BID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [1:0]s00_couplers_to_xbar_RID;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire s00_couplers_to_xbar_WLAST;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]s01_couplers_to_xbar_ARADDR;
  wire [1:0]s01_couplers_to_xbar_ARBURST;
  wire [3:0]s01_couplers_to_xbar_ARCACHE;
  wire [0:0]s01_couplers_to_xbar_ARID;
  wire [7:0]s01_couplers_to_xbar_ARLEN;
  wire s01_couplers_to_xbar_ARLOCK;
  wire [2:0]s01_couplers_to_xbar_ARPROT;
  wire [3:0]s01_couplers_to_xbar_ARQOS;
  wire [1:1]s01_couplers_to_xbar_ARREADY;
  wire [2:0]s01_couplers_to_xbar_ARSIZE;
  wire s01_couplers_to_xbar_ARVALID;
  wire [31:0]s01_couplers_to_xbar_AWADDR;
  wire [1:0]s01_couplers_to_xbar_AWBURST;
  wire [3:0]s01_couplers_to_xbar_AWCACHE;
  wire [0:0]s01_couplers_to_xbar_AWID;
  wire [7:0]s01_couplers_to_xbar_AWLEN;
  wire s01_couplers_to_xbar_AWLOCK;
  wire [2:0]s01_couplers_to_xbar_AWPROT;
  wire [3:0]s01_couplers_to_xbar_AWQOS;
  wire [1:1]s01_couplers_to_xbar_AWREADY;
  wire [2:0]s01_couplers_to_xbar_AWSIZE;
  wire s01_couplers_to_xbar_AWVALID;
  wire [3:2]s01_couplers_to_xbar_BID;
  wire s01_couplers_to_xbar_BREADY;
  wire [3:2]s01_couplers_to_xbar_BRESP;
  wire [1:1]s01_couplers_to_xbar_BVALID;
  wire [63:32]s01_couplers_to_xbar_RDATA;
  wire [3:2]s01_couplers_to_xbar_RID;
  wire [1:1]s01_couplers_to_xbar_RLAST;
  wire s01_couplers_to_xbar_RREADY;
  wire [3:2]s01_couplers_to_xbar_RRESP;
  wire [1:1]s01_couplers_to_xbar_RVALID;
  wire [31:0]s01_couplers_to_xbar_WDATA;
  wire s01_couplers_to_xbar_WLAST;
  wire [1:1]s01_couplers_to_xbar_WREADY;
  wire [3:0]s01_couplers_to_xbar_WSTRB;
  wire s01_couplers_to_xbar_WVALID;
  wire [31:0]s02_couplers_to_xbar_ARADDR;
  wire [1:0]s02_couplers_to_xbar_ARBURST;
  wire [3:0]s02_couplers_to_xbar_ARCACHE;
  wire [7:0]s02_couplers_to_xbar_ARLEN;
  wire [0:0]s02_couplers_to_xbar_ARLOCK;
  wire [2:0]s02_couplers_to_xbar_ARPROT;
  wire [3:0]s02_couplers_to_xbar_ARQOS;
  wire [2:2]s02_couplers_to_xbar_ARREADY;
  wire [2:0]s02_couplers_to_xbar_ARSIZE;
  wire s02_couplers_to_xbar_ARVALID;
  wire [31:0]s02_couplers_to_xbar_AWADDR;
  wire [1:0]s02_couplers_to_xbar_AWBURST;
  wire [3:0]s02_couplers_to_xbar_AWCACHE;
  wire [7:0]s02_couplers_to_xbar_AWLEN;
  wire [0:0]s02_couplers_to_xbar_AWLOCK;
  wire [2:0]s02_couplers_to_xbar_AWPROT;
  wire [3:0]s02_couplers_to_xbar_AWQOS;
  wire [2:2]s02_couplers_to_xbar_AWREADY;
  wire [2:0]s02_couplers_to_xbar_AWSIZE;
  wire s02_couplers_to_xbar_AWVALID;
  wire s02_couplers_to_xbar_BREADY;
  wire [5:4]s02_couplers_to_xbar_BRESP;
  wire [2:2]s02_couplers_to_xbar_BVALID;
  wire [95:64]s02_couplers_to_xbar_RDATA;
  wire [2:2]s02_couplers_to_xbar_RLAST;
  wire s02_couplers_to_xbar_RREADY;
  wire [5:4]s02_couplers_to_xbar_RRESP;
  wire [2:2]s02_couplers_to_xbar_RVALID;
  wire [31:0]s02_couplers_to_xbar_WDATA;
  wire s02_couplers_to_xbar_WLAST;
  wire [2:2]s02_couplers_to_xbar_WREADY;
  wire [3:0]s02_couplers_to_xbar_WSTRB;
  wire s02_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [1:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [1:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [1:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [1:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_hp_0_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_couplers_to_axi_hp_0_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_couplers_to_axi_hp_0_ARCACHE;
  assign M00_AXI_arid[1:0] = m00_couplers_to_axi_hp_0_ARID;
  assign M00_AXI_arlen[3:0] = m00_couplers_to_axi_hp_0_ARLEN;
  assign M00_AXI_arlock[1:0] = m00_couplers_to_axi_hp_0_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_hp_0_ARPROT;
  assign M00_AXI_arqos[3:0] = m00_couplers_to_axi_hp_0_ARQOS;
  assign M00_AXI_arsize[2:0] = m00_couplers_to_axi_hp_0_ARSIZE;
  assign M00_AXI_arvalid = m00_couplers_to_axi_hp_0_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_hp_0_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_couplers_to_axi_hp_0_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_couplers_to_axi_hp_0_AWCACHE;
  assign M00_AXI_awid[1:0] = m00_couplers_to_axi_hp_0_AWID;
  assign M00_AXI_awlen[3:0] = m00_couplers_to_axi_hp_0_AWLEN;
  assign M00_AXI_awlock[1:0] = m00_couplers_to_axi_hp_0_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_hp_0_AWPROT;
  assign M00_AXI_awqos[3:0] = m00_couplers_to_axi_hp_0_AWQOS;
  assign M00_AXI_awsize[2:0] = m00_couplers_to_axi_hp_0_AWSIZE;
  assign M00_AXI_awvalid = m00_couplers_to_axi_hp_0_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_hp_0_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_hp_0_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_hp_0_WDATA;
  assign M00_AXI_wid[1:0] = m00_couplers_to_axi_hp_0_WID;
  assign M00_AXI_wlast = m00_couplers_to_axi_hp_0_WLAST;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_hp_0_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_hp_0_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_hp_0_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_hp_0_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[1:0] = axi_hp_0_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_hp_0_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_hp_0_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_hp_0_to_s00_couplers_RDATA;
  assign S00_AXI_rid[1:0] = axi_hp_0_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_hp_0_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_hp_0_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_hp_0_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_hp_0_to_s00_couplers_WREADY;
  assign S01_ACLK_1 = S01_ACLK;
  assign S01_ARESETN_1 = S01_ARESETN;
  assign S01_AXI_arready = axi_hp_0_to_s01_couplers_ARREADY;
  assign S01_AXI_awready = axi_hp_0_to_s01_couplers_AWREADY;
  assign S01_AXI_bid[1:0] = axi_hp_0_to_s01_couplers_BID;
  assign S01_AXI_bresp[1:0] = axi_hp_0_to_s01_couplers_BRESP;
  assign S01_AXI_bvalid = axi_hp_0_to_s01_couplers_BVALID;
  assign S01_AXI_rdata[31:0] = axi_hp_0_to_s01_couplers_RDATA;
  assign S01_AXI_rid[1:0] = axi_hp_0_to_s01_couplers_RID;
  assign S01_AXI_rlast = axi_hp_0_to_s01_couplers_RLAST;
  assign S01_AXI_rresp[1:0] = axi_hp_0_to_s01_couplers_RRESP;
  assign S01_AXI_rvalid = axi_hp_0_to_s01_couplers_RVALID;
  assign S01_AXI_wready = axi_hp_0_to_s01_couplers_WREADY;
  assign S02_ACLK_1 = S02_ACLK;
  assign S02_ARESETN_1 = S02_ARESETN;
  assign S02_AXI_arready = axi_hp_0_to_s02_couplers_ARREADY;
  assign S02_AXI_awready = axi_hp_0_to_s02_couplers_AWREADY;
  assign S02_AXI_bresp[1:0] = axi_hp_0_to_s02_couplers_BRESP;
  assign S02_AXI_bvalid = axi_hp_0_to_s02_couplers_BVALID;
  assign S02_AXI_rdata[31:0] = axi_hp_0_to_s02_couplers_RDATA;
  assign S02_AXI_rresp[1:0] = axi_hp_0_to_s02_couplers_RRESP;
  assign S02_AXI_rvalid = axi_hp_0_to_s02_couplers_RVALID;
  assign S02_AXI_wready = axi_hp_0_to_s02_couplers_WREADY;
  assign axi_hp_0_ACLK_net = ACLK;
  assign axi_hp_0_ARESETN_net = ARESETN;
  assign axi_hp_0_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_hp_0_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_hp_0_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_hp_0_to_s00_couplers_ARID = S00_AXI_arid[0];
  assign axi_hp_0_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_hp_0_to_s00_couplers_ARLOCK = S00_AXI_arlock;
  assign axi_hp_0_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_hp_0_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_hp_0_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_hp_0_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_hp_0_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_hp_0_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_hp_0_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_hp_0_to_s00_couplers_AWID = S00_AXI_awid[0];
  assign axi_hp_0_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign axi_hp_0_to_s00_couplers_AWLOCK = S00_AXI_awlock;
  assign axi_hp_0_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_hp_0_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_hp_0_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_hp_0_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_hp_0_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_hp_0_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_hp_0_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_hp_0_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_hp_0_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_hp_0_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign axi_hp_0_to_s01_couplers_ARADDR = S01_AXI_araddr[31:0];
  assign axi_hp_0_to_s01_couplers_ARBURST = S01_AXI_arburst[1:0];
  assign axi_hp_0_to_s01_couplers_ARCACHE = S01_AXI_arcache[3:0];
  assign axi_hp_0_to_s01_couplers_ARID = S01_AXI_arid[0];
  assign axi_hp_0_to_s01_couplers_ARLEN = S01_AXI_arlen[7:0];
  assign axi_hp_0_to_s01_couplers_ARLOCK = S01_AXI_arlock;
  assign axi_hp_0_to_s01_couplers_ARPROT = S01_AXI_arprot[2:0];
  assign axi_hp_0_to_s01_couplers_ARQOS = S01_AXI_arqos[3:0];
  assign axi_hp_0_to_s01_couplers_ARSIZE = S01_AXI_arsize[2:0];
  assign axi_hp_0_to_s01_couplers_ARVALID = S01_AXI_arvalid;
  assign axi_hp_0_to_s01_couplers_AWADDR = S01_AXI_awaddr[31:0];
  assign axi_hp_0_to_s01_couplers_AWBURST = S01_AXI_awburst[1:0];
  assign axi_hp_0_to_s01_couplers_AWCACHE = S01_AXI_awcache[3:0];
  assign axi_hp_0_to_s01_couplers_AWID = S01_AXI_awid[0];
  assign axi_hp_0_to_s01_couplers_AWLEN = S01_AXI_awlen[7:0];
  assign axi_hp_0_to_s01_couplers_AWLOCK = S01_AXI_awlock;
  assign axi_hp_0_to_s01_couplers_AWPROT = S01_AXI_awprot[2:0];
  assign axi_hp_0_to_s01_couplers_AWQOS = S01_AXI_awqos[3:0];
  assign axi_hp_0_to_s01_couplers_AWSIZE = S01_AXI_awsize[2:0];
  assign axi_hp_0_to_s01_couplers_AWVALID = S01_AXI_awvalid;
  assign axi_hp_0_to_s01_couplers_BREADY = S01_AXI_bready;
  assign axi_hp_0_to_s01_couplers_RREADY = S01_AXI_rready;
  assign axi_hp_0_to_s01_couplers_WDATA = S01_AXI_wdata[31:0];
  assign axi_hp_0_to_s01_couplers_WLAST = S01_AXI_wlast;
  assign axi_hp_0_to_s01_couplers_WSTRB = S01_AXI_wstrb[3:0];
  assign axi_hp_0_to_s01_couplers_WVALID = S01_AXI_wvalid;
  assign axi_hp_0_to_s02_couplers_ARADDR = S02_AXI_araddr[31:0];
  assign axi_hp_0_to_s02_couplers_ARPROT = S02_AXI_arprot[2:0];
  assign axi_hp_0_to_s02_couplers_ARVALID = S02_AXI_arvalid;
  assign axi_hp_0_to_s02_couplers_AWADDR = S02_AXI_awaddr[31:0];
  assign axi_hp_0_to_s02_couplers_AWPROT = S02_AXI_awprot[2:0];
  assign axi_hp_0_to_s02_couplers_AWVALID = S02_AXI_awvalid;
  assign axi_hp_0_to_s02_couplers_BREADY = S02_AXI_bready;
  assign axi_hp_0_to_s02_couplers_RREADY = S02_AXI_rready;
  assign axi_hp_0_to_s02_couplers_WDATA = S02_AXI_wdata[31:0];
  assign axi_hp_0_to_s02_couplers_WSTRB = S02_AXI_wstrb[3:0];
  assign axi_hp_0_to_s02_couplers_WVALID = S02_AXI_wvalid;
  assign m00_couplers_to_axi_hp_0_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_hp_0_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_hp_0_BID = M00_AXI_bid[5:0];
  assign m00_couplers_to_axi_hp_0_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_hp_0_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_hp_0_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_hp_0_RID = M00_AXI_rid[5:0];
  assign m00_couplers_to_axi_hp_0_RLAST = M00_AXI_rlast;
  assign m00_couplers_to_axi_hp_0_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_hp_0_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_hp_0_WREADY = M00_AXI_wready;
  m00_couplers_imp_1JKB383 m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_axi_hp_0_ARADDR),
        .M_AXI_arburst(m00_couplers_to_axi_hp_0_ARBURST),
        .M_AXI_arcache(m00_couplers_to_axi_hp_0_ARCACHE),
        .M_AXI_arid(m00_couplers_to_axi_hp_0_ARID),
        .M_AXI_arlen(m00_couplers_to_axi_hp_0_ARLEN),
        .M_AXI_arlock(m00_couplers_to_axi_hp_0_ARLOCK),
        .M_AXI_arprot(m00_couplers_to_axi_hp_0_ARPROT),
        .M_AXI_arqos(m00_couplers_to_axi_hp_0_ARQOS),
        .M_AXI_arready(m00_couplers_to_axi_hp_0_ARREADY),
        .M_AXI_arsize(m00_couplers_to_axi_hp_0_ARSIZE),
        .M_AXI_arvalid(m00_couplers_to_axi_hp_0_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_hp_0_AWADDR),
        .M_AXI_awburst(m00_couplers_to_axi_hp_0_AWBURST),
        .M_AXI_awcache(m00_couplers_to_axi_hp_0_AWCACHE),
        .M_AXI_awid(m00_couplers_to_axi_hp_0_AWID),
        .M_AXI_awlen(m00_couplers_to_axi_hp_0_AWLEN),
        .M_AXI_awlock(m00_couplers_to_axi_hp_0_AWLOCK),
        .M_AXI_awprot(m00_couplers_to_axi_hp_0_AWPROT),
        .M_AXI_awqos(m00_couplers_to_axi_hp_0_AWQOS),
        .M_AXI_awready(m00_couplers_to_axi_hp_0_AWREADY),
        .M_AXI_awsize(m00_couplers_to_axi_hp_0_AWSIZE),
        .M_AXI_awvalid(m00_couplers_to_axi_hp_0_AWVALID),
        .M_AXI_bid(m00_couplers_to_axi_hp_0_BID),
        .M_AXI_bready(m00_couplers_to_axi_hp_0_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_hp_0_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_hp_0_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_hp_0_RDATA),
        .M_AXI_rid(m00_couplers_to_axi_hp_0_RID),
        .M_AXI_rlast(m00_couplers_to_axi_hp_0_RLAST),
        .M_AXI_rready(m00_couplers_to_axi_hp_0_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_hp_0_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_hp_0_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_hp_0_WDATA),
        .M_AXI_wid(m00_couplers_to_axi_hp_0_WID),
        .M_AXI_wlast(m00_couplers_to_axi_hp_0_WLAST),
        .M_AXI_wready(m00_couplers_to_axi_hp_0_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_hp_0_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_hp_0_WVALID),
        .S_ACLK(axi_hp_0_ACLK_net),
        .S_ARESETN(axi_hp_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  s00_couplers_imp_1YZ8LTU s00_couplers
       (.M_ACLK(axi_hp_0_ACLK_net),
        .M_ARESETN(axi_hp_0_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arid(s00_couplers_to_xbar_ARID),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s00_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s00_couplers_to_xbar_AWCACHE),
        .M_AXI_awid(s00_couplers_to_xbar_AWID),
        .M_AXI_awlen(s00_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s00_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s00_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s00_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bid(s00_couplers_to_xbar_BID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rid(s00_couplers_to_xbar_RID),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s00_couplers_to_xbar_WLAST),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_hp_0_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_hp_0_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_hp_0_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_hp_0_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_hp_0_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_hp_0_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_hp_0_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_hp_0_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_hp_0_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_hp_0_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_hp_0_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_hp_0_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_hp_0_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_hp_0_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_hp_0_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_hp_0_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_hp_0_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_hp_0_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_hp_0_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_hp_0_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_hp_0_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_hp_0_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_hp_0_to_s00_couplers_BID),
        .S_AXI_bready(axi_hp_0_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_hp_0_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_hp_0_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_hp_0_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_hp_0_to_s00_couplers_RID),
        .S_AXI_rlast(axi_hp_0_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_hp_0_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_hp_0_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_hp_0_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_hp_0_to_s00_couplers_WDATA),
        .S_AXI_wlast(axi_hp_0_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_hp_0_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_hp_0_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_hp_0_to_s00_couplers_WVALID));
  s01_couplers_imp_MNM9SJ s01_couplers
       (.M_ACLK(axi_hp_0_ACLK_net),
        .M_ARESETN(axi_hp_0_ARESETN_net),
        .M_AXI_araddr(s01_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s01_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s01_couplers_to_xbar_ARCACHE),
        .M_AXI_arid(s01_couplers_to_xbar_ARID),
        .M_AXI_arlen(s01_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s01_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s01_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s01_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s01_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s01_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s01_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s01_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s01_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s01_couplers_to_xbar_AWCACHE),
        .M_AXI_awid(s01_couplers_to_xbar_AWID),
        .M_AXI_awlen(s01_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s01_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s01_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s01_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s01_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s01_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s01_couplers_to_xbar_AWVALID),
        .M_AXI_bid(s01_couplers_to_xbar_BID),
        .M_AXI_bready(s01_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s01_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s01_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s01_couplers_to_xbar_RDATA),
        .M_AXI_rid(s01_couplers_to_xbar_RID),
        .M_AXI_rlast(s01_couplers_to_xbar_RLAST),
        .M_AXI_rready(s01_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s01_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s01_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s01_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s01_couplers_to_xbar_WLAST),
        .M_AXI_wready(s01_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s01_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s01_couplers_to_xbar_WVALID),
        .S_ACLK(S01_ACLK_1),
        .S_ARESETN(S01_ARESETN_1),
        .S_AXI_araddr(axi_hp_0_to_s01_couplers_ARADDR),
        .S_AXI_arburst(axi_hp_0_to_s01_couplers_ARBURST),
        .S_AXI_arcache(axi_hp_0_to_s01_couplers_ARCACHE),
        .S_AXI_arid(axi_hp_0_to_s01_couplers_ARID),
        .S_AXI_arlen(axi_hp_0_to_s01_couplers_ARLEN),
        .S_AXI_arlock(axi_hp_0_to_s01_couplers_ARLOCK),
        .S_AXI_arprot(axi_hp_0_to_s01_couplers_ARPROT),
        .S_AXI_arqos(axi_hp_0_to_s01_couplers_ARQOS),
        .S_AXI_arready(axi_hp_0_to_s01_couplers_ARREADY),
        .S_AXI_arsize(axi_hp_0_to_s01_couplers_ARSIZE),
        .S_AXI_arvalid(axi_hp_0_to_s01_couplers_ARVALID),
        .S_AXI_awaddr(axi_hp_0_to_s01_couplers_AWADDR),
        .S_AXI_awburst(axi_hp_0_to_s01_couplers_AWBURST),
        .S_AXI_awcache(axi_hp_0_to_s01_couplers_AWCACHE),
        .S_AXI_awid(axi_hp_0_to_s01_couplers_AWID),
        .S_AXI_awlen(axi_hp_0_to_s01_couplers_AWLEN),
        .S_AXI_awlock(axi_hp_0_to_s01_couplers_AWLOCK),
        .S_AXI_awprot(axi_hp_0_to_s01_couplers_AWPROT),
        .S_AXI_awqos(axi_hp_0_to_s01_couplers_AWQOS),
        .S_AXI_awready(axi_hp_0_to_s01_couplers_AWREADY),
        .S_AXI_awsize(axi_hp_0_to_s01_couplers_AWSIZE),
        .S_AXI_awvalid(axi_hp_0_to_s01_couplers_AWVALID),
        .S_AXI_bid(axi_hp_0_to_s01_couplers_BID),
        .S_AXI_bready(axi_hp_0_to_s01_couplers_BREADY),
        .S_AXI_bresp(axi_hp_0_to_s01_couplers_BRESP),
        .S_AXI_bvalid(axi_hp_0_to_s01_couplers_BVALID),
        .S_AXI_rdata(axi_hp_0_to_s01_couplers_RDATA),
        .S_AXI_rid(axi_hp_0_to_s01_couplers_RID),
        .S_AXI_rlast(axi_hp_0_to_s01_couplers_RLAST),
        .S_AXI_rready(axi_hp_0_to_s01_couplers_RREADY),
        .S_AXI_rresp(axi_hp_0_to_s01_couplers_RRESP),
        .S_AXI_rvalid(axi_hp_0_to_s01_couplers_RVALID),
        .S_AXI_wdata(axi_hp_0_to_s01_couplers_WDATA),
        .S_AXI_wlast(axi_hp_0_to_s01_couplers_WLAST),
        .S_AXI_wready(axi_hp_0_to_s01_couplers_WREADY),
        .S_AXI_wstrb(axi_hp_0_to_s01_couplers_WSTRB),
        .S_AXI_wvalid(axi_hp_0_to_s01_couplers_WVALID));
  s02_couplers_imp_XF0EZL s02_couplers
       (.M_ACLK(axi_hp_0_ACLK_net),
        .M_ARESETN(axi_hp_0_ARESETN_net),
        .M_AXI_araddr(s02_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s02_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s02_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s02_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s02_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s02_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s02_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s02_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s02_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s02_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s02_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s02_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s02_couplers_to_xbar_AWCACHE),
        .M_AXI_awlen(s02_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s02_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s02_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s02_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s02_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s02_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s02_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s02_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s02_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s02_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s02_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s02_couplers_to_xbar_RLAST),
        .M_AXI_rready(s02_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s02_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s02_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s02_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s02_couplers_to_xbar_WLAST),
        .M_AXI_wready(s02_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s02_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s02_couplers_to_xbar_WVALID),
        .S_ACLK(S02_ACLK_1),
        .S_ARESETN(S02_ARESETN_1),
        .S_AXI_araddr(axi_hp_0_to_s02_couplers_ARADDR),
        .S_AXI_arprot(axi_hp_0_to_s02_couplers_ARPROT),
        .S_AXI_arready(axi_hp_0_to_s02_couplers_ARREADY),
        .S_AXI_arvalid(axi_hp_0_to_s02_couplers_ARVALID),
        .S_AXI_awaddr(axi_hp_0_to_s02_couplers_AWADDR),
        .S_AXI_awprot(axi_hp_0_to_s02_couplers_AWPROT),
        .S_AXI_awready(axi_hp_0_to_s02_couplers_AWREADY),
        .S_AXI_awvalid(axi_hp_0_to_s02_couplers_AWVALID),
        .S_AXI_bready(axi_hp_0_to_s02_couplers_BREADY),
        .S_AXI_bresp(axi_hp_0_to_s02_couplers_BRESP),
        .S_AXI_bvalid(axi_hp_0_to_s02_couplers_BVALID),
        .S_AXI_rdata(axi_hp_0_to_s02_couplers_RDATA),
        .S_AXI_rready(axi_hp_0_to_s02_couplers_RREADY),
        .S_AXI_rresp(axi_hp_0_to_s02_couplers_RRESP),
        .S_AXI_rvalid(axi_hp_0_to_s02_couplers_RVALID),
        .S_AXI_wdata(axi_hp_0_to_s02_couplers_WDATA),
        .S_AXI_wready(axi_hp_0_to_s02_couplers_WREADY),
        .S_AXI_wstrb(axi_hp_0_to_s02_couplers_WSTRB),
        .S_AXI_wvalid(axi_hp_0_to_s02_couplers_WVALID));
  system_xbar_1 xbar
       (.aclk(axi_hp_0_ACLK_net),
        .aresetn(axi_hp_0_ARESETN_net),
        .m_axi_araddr(xbar_to_m00_couplers_ARADDR),
        .m_axi_arburst(xbar_to_m00_couplers_ARBURST),
        .m_axi_arcache(xbar_to_m00_couplers_ARCACHE),
        .m_axi_arid(xbar_to_m00_couplers_ARID),
        .m_axi_arlen(xbar_to_m00_couplers_ARLEN),
        .m_axi_arlock(xbar_to_m00_couplers_ARLOCK),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arqos(xbar_to_m00_couplers_ARQOS),
        .m_axi_arready(xbar_to_m00_couplers_ARREADY),
        .m_axi_arregion(xbar_to_m00_couplers_ARREGION),
        .m_axi_arsize(xbar_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(xbar_to_m00_couplers_ARVALID),
        .m_axi_awaddr(xbar_to_m00_couplers_AWADDR),
        .m_axi_awburst(xbar_to_m00_couplers_AWBURST),
        .m_axi_awcache(xbar_to_m00_couplers_AWCACHE),
        .m_axi_awid(xbar_to_m00_couplers_AWID),
        .m_axi_awlen(xbar_to_m00_couplers_AWLEN),
        .m_axi_awlock(xbar_to_m00_couplers_AWLOCK),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awqos(xbar_to_m00_couplers_AWQOS),
        .m_axi_awready(xbar_to_m00_couplers_AWREADY),
        .m_axi_awregion(xbar_to_m00_couplers_AWREGION),
        .m_axi_awsize(xbar_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(xbar_to_m00_couplers_AWVALID),
        .m_axi_bid(xbar_to_m00_couplers_BID),
        .m_axi_bready(xbar_to_m00_couplers_BREADY),
        .m_axi_bresp(xbar_to_m00_couplers_BRESP),
        .m_axi_bvalid(xbar_to_m00_couplers_BVALID),
        .m_axi_rdata(xbar_to_m00_couplers_RDATA),
        .m_axi_rid(xbar_to_m00_couplers_RID),
        .m_axi_rlast(xbar_to_m00_couplers_RLAST),
        .m_axi_rready(xbar_to_m00_couplers_RREADY),
        .m_axi_rresp(xbar_to_m00_couplers_RRESP),
        .m_axi_rvalid(xbar_to_m00_couplers_RVALID),
        .m_axi_wdata(xbar_to_m00_couplers_WDATA),
        .m_axi_wlast(xbar_to_m00_couplers_WLAST),
        .m_axi_wready(xbar_to_m00_couplers_WREADY),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wvalid(xbar_to_m00_couplers_WVALID),
        .s_axi_araddr({s02_couplers_to_xbar_ARADDR,s01_couplers_to_xbar_ARADDR,s00_couplers_to_xbar_ARADDR}),
        .s_axi_arburst({s02_couplers_to_xbar_ARBURST,s01_couplers_to_xbar_ARBURST,s00_couplers_to_xbar_ARBURST}),
        .s_axi_arcache({s02_couplers_to_xbar_ARCACHE,s01_couplers_to_xbar_ARCACHE,s00_couplers_to_xbar_ARCACHE}),
        .s_axi_arid({1'b0,1'b0,1'b0,s01_couplers_to_xbar_ARID,1'b0,s00_couplers_to_xbar_ARID}),
        .s_axi_arlen({s02_couplers_to_xbar_ARLEN,s01_couplers_to_xbar_ARLEN,s00_couplers_to_xbar_ARLEN}),
        .s_axi_arlock({s02_couplers_to_xbar_ARLOCK,s01_couplers_to_xbar_ARLOCK,s00_couplers_to_xbar_ARLOCK}),
        .s_axi_arprot({s02_couplers_to_xbar_ARPROT,s01_couplers_to_xbar_ARPROT,s00_couplers_to_xbar_ARPROT}),
        .s_axi_arqos({s02_couplers_to_xbar_ARQOS,s01_couplers_to_xbar_ARQOS,s00_couplers_to_xbar_ARQOS}),
        .s_axi_arready({s02_couplers_to_xbar_ARREADY,s01_couplers_to_xbar_ARREADY,s00_couplers_to_xbar_ARREADY}),
        .s_axi_arsize({s02_couplers_to_xbar_ARSIZE,s01_couplers_to_xbar_ARSIZE,s00_couplers_to_xbar_ARSIZE}),
        .s_axi_arvalid({s02_couplers_to_xbar_ARVALID,s01_couplers_to_xbar_ARVALID,s00_couplers_to_xbar_ARVALID}),
        .s_axi_awaddr({s02_couplers_to_xbar_AWADDR,s01_couplers_to_xbar_AWADDR,s00_couplers_to_xbar_AWADDR}),
        .s_axi_awburst({s02_couplers_to_xbar_AWBURST,s01_couplers_to_xbar_AWBURST,s00_couplers_to_xbar_AWBURST}),
        .s_axi_awcache({s02_couplers_to_xbar_AWCACHE,s01_couplers_to_xbar_AWCACHE,s00_couplers_to_xbar_AWCACHE}),
        .s_axi_awid({1'b0,1'b0,1'b0,s01_couplers_to_xbar_AWID,1'b0,s00_couplers_to_xbar_AWID}),
        .s_axi_awlen({s02_couplers_to_xbar_AWLEN,s01_couplers_to_xbar_AWLEN,s00_couplers_to_xbar_AWLEN}),
        .s_axi_awlock({s02_couplers_to_xbar_AWLOCK,s01_couplers_to_xbar_AWLOCK,s00_couplers_to_xbar_AWLOCK}),
        .s_axi_awprot({s02_couplers_to_xbar_AWPROT,s01_couplers_to_xbar_AWPROT,s00_couplers_to_xbar_AWPROT}),
        .s_axi_awqos({s02_couplers_to_xbar_AWQOS,s01_couplers_to_xbar_AWQOS,s00_couplers_to_xbar_AWQOS}),
        .s_axi_awready({s02_couplers_to_xbar_AWREADY,s01_couplers_to_xbar_AWREADY,s00_couplers_to_xbar_AWREADY}),
        .s_axi_awsize({s02_couplers_to_xbar_AWSIZE,s01_couplers_to_xbar_AWSIZE,s00_couplers_to_xbar_AWSIZE}),
        .s_axi_awvalid({s02_couplers_to_xbar_AWVALID,s01_couplers_to_xbar_AWVALID,s00_couplers_to_xbar_AWVALID}),
        .s_axi_bid({s01_couplers_to_xbar_BID,s00_couplers_to_xbar_BID}),
        .s_axi_bready({s02_couplers_to_xbar_BREADY,s01_couplers_to_xbar_BREADY,s00_couplers_to_xbar_BREADY}),
        .s_axi_bresp({s02_couplers_to_xbar_BRESP,s01_couplers_to_xbar_BRESP,s00_couplers_to_xbar_BRESP}),
        .s_axi_bvalid({s02_couplers_to_xbar_BVALID,s01_couplers_to_xbar_BVALID,s00_couplers_to_xbar_BVALID}),
        .s_axi_rdata({s02_couplers_to_xbar_RDATA,s01_couplers_to_xbar_RDATA,s00_couplers_to_xbar_RDATA}),
        .s_axi_rid({s01_couplers_to_xbar_RID,s00_couplers_to_xbar_RID}),
        .s_axi_rlast({s02_couplers_to_xbar_RLAST,s01_couplers_to_xbar_RLAST,s00_couplers_to_xbar_RLAST}),
        .s_axi_rready({s02_couplers_to_xbar_RREADY,s01_couplers_to_xbar_RREADY,s00_couplers_to_xbar_RREADY}),
        .s_axi_rresp({s02_couplers_to_xbar_RRESP,s01_couplers_to_xbar_RRESP,s00_couplers_to_xbar_RRESP}),
        .s_axi_rvalid({s02_couplers_to_xbar_RVALID,s01_couplers_to_xbar_RVALID,s00_couplers_to_xbar_RVALID}),
        .s_axi_wdata({s02_couplers_to_xbar_WDATA,s01_couplers_to_xbar_WDATA,s00_couplers_to_xbar_WDATA}),
        .s_axi_wlast({s02_couplers_to_xbar_WLAST,s01_couplers_to_xbar_WLAST,s00_couplers_to_xbar_WLAST}),
        .s_axi_wready({s02_couplers_to_xbar_WREADY,s01_couplers_to_xbar_WREADY,s00_couplers_to_xbar_WREADY}),
        .s_axi_wstrb({s02_couplers_to_xbar_WSTRB,s01_couplers_to_xbar_WSTRB,s00_couplers_to_xbar_WSTRB}),
        .s_axi_wvalid({s02_couplers_to_xbar_WVALID,s01_couplers_to_xbar_WVALID,s00_couplers_to_xbar_WVALID}));
endmodule

module system_axi_hp_2_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arlen,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awlen,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awlen,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [3:0]M00_AXI_arlen;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [3:0]M00_AXI_awlen;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [63:0]M00_AXI_rdata;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [63:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [3:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [3:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [63:0]S00_AXI_rdata;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [63:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [7:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_hp_2_ACLK_net;
  wire axi_hp_2_ARESETN_net;
  wire [31:0]axi_hp_2_to_s00_couplers_ARADDR;
  wire [1:0]axi_hp_2_to_s00_couplers_ARBURST;
  wire [3:0]axi_hp_2_to_s00_couplers_ARCACHE;
  wire [3:0]axi_hp_2_to_s00_couplers_ARLEN;
  wire [2:0]axi_hp_2_to_s00_couplers_ARPROT;
  wire axi_hp_2_to_s00_couplers_ARREADY;
  wire [2:0]axi_hp_2_to_s00_couplers_ARSIZE;
  wire axi_hp_2_to_s00_couplers_ARVALID;
  wire [31:0]axi_hp_2_to_s00_couplers_AWADDR;
  wire [1:0]axi_hp_2_to_s00_couplers_AWBURST;
  wire [3:0]axi_hp_2_to_s00_couplers_AWCACHE;
  wire [3:0]axi_hp_2_to_s00_couplers_AWLEN;
  wire [2:0]axi_hp_2_to_s00_couplers_AWPROT;
  wire axi_hp_2_to_s00_couplers_AWREADY;
  wire [2:0]axi_hp_2_to_s00_couplers_AWSIZE;
  wire axi_hp_2_to_s00_couplers_AWVALID;
  wire axi_hp_2_to_s00_couplers_BREADY;
  wire [1:0]axi_hp_2_to_s00_couplers_BRESP;
  wire axi_hp_2_to_s00_couplers_BVALID;
  wire [63:0]axi_hp_2_to_s00_couplers_RDATA;
  wire axi_hp_2_to_s00_couplers_RLAST;
  wire axi_hp_2_to_s00_couplers_RREADY;
  wire [1:0]axi_hp_2_to_s00_couplers_RRESP;
  wire axi_hp_2_to_s00_couplers_RVALID;
  wire [63:0]axi_hp_2_to_s00_couplers_WDATA;
  wire axi_hp_2_to_s00_couplers_WLAST;
  wire axi_hp_2_to_s00_couplers_WREADY;
  wire [7:0]axi_hp_2_to_s00_couplers_WSTRB;
  wire axi_hp_2_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_axi_hp_2_ARADDR;
  wire [1:0]s00_couplers_to_axi_hp_2_ARBURST;
  wire [3:0]s00_couplers_to_axi_hp_2_ARCACHE;
  wire [3:0]s00_couplers_to_axi_hp_2_ARLEN;
  wire [2:0]s00_couplers_to_axi_hp_2_ARPROT;
  wire s00_couplers_to_axi_hp_2_ARREADY;
  wire [2:0]s00_couplers_to_axi_hp_2_ARSIZE;
  wire s00_couplers_to_axi_hp_2_ARVALID;
  wire [31:0]s00_couplers_to_axi_hp_2_AWADDR;
  wire [1:0]s00_couplers_to_axi_hp_2_AWBURST;
  wire [3:0]s00_couplers_to_axi_hp_2_AWCACHE;
  wire [3:0]s00_couplers_to_axi_hp_2_AWLEN;
  wire [2:0]s00_couplers_to_axi_hp_2_AWPROT;
  wire s00_couplers_to_axi_hp_2_AWREADY;
  wire [2:0]s00_couplers_to_axi_hp_2_AWSIZE;
  wire s00_couplers_to_axi_hp_2_AWVALID;
  wire s00_couplers_to_axi_hp_2_BREADY;
  wire [1:0]s00_couplers_to_axi_hp_2_BRESP;
  wire s00_couplers_to_axi_hp_2_BVALID;
  wire [63:0]s00_couplers_to_axi_hp_2_RDATA;
  wire s00_couplers_to_axi_hp_2_RLAST;
  wire s00_couplers_to_axi_hp_2_RREADY;
  wire [1:0]s00_couplers_to_axi_hp_2_RRESP;
  wire s00_couplers_to_axi_hp_2_RVALID;
  wire [63:0]s00_couplers_to_axi_hp_2_WDATA;
  wire s00_couplers_to_axi_hp_2_WLAST;
  wire s00_couplers_to_axi_hp_2_WREADY;
  wire [7:0]s00_couplers_to_axi_hp_2_WSTRB;
  wire s00_couplers_to_axi_hp_2_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_axi_hp_2_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_axi_hp_2_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_axi_hp_2_ARCACHE;
  assign M00_AXI_arlen[3:0] = s00_couplers_to_axi_hp_2_ARLEN;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_axi_hp_2_ARPROT;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_axi_hp_2_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_axi_hp_2_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_axi_hp_2_AWADDR;
  assign M00_AXI_awburst[1:0] = s00_couplers_to_axi_hp_2_AWBURST;
  assign M00_AXI_awcache[3:0] = s00_couplers_to_axi_hp_2_AWCACHE;
  assign M00_AXI_awlen[3:0] = s00_couplers_to_axi_hp_2_AWLEN;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_axi_hp_2_AWPROT;
  assign M00_AXI_awsize[2:0] = s00_couplers_to_axi_hp_2_AWSIZE;
  assign M00_AXI_awvalid = s00_couplers_to_axi_hp_2_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_axi_hp_2_BREADY;
  assign M00_AXI_rready = s00_couplers_to_axi_hp_2_RREADY;
  assign M00_AXI_wdata[63:0] = s00_couplers_to_axi_hp_2_WDATA;
  assign M00_AXI_wlast = s00_couplers_to_axi_hp_2_WLAST;
  assign M00_AXI_wstrb[7:0] = s00_couplers_to_axi_hp_2_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_axi_hp_2_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_hp_2_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_hp_2_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = axi_hp_2_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_hp_2_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[63:0] = axi_hp_2_to_s00_couplers_RDATA;
  assign S00_AXI_rlast = axi_hp_2_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_hp_2_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_hp_2_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_hp_2_to_s00_couplers_WREADY;
  assign axi_hp_2_ACLK_net = M00_ACLK;
  assign axi_hp_2_ARESETN_net = M00_ARESETN;
  assign axi_hp_2_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_hp_2_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_hp_2_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_hp_2_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign axi_hp_2_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_hp_2_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_hp_2_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_hp_2_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_hp_2_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_hp_2_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_hp_2_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign axi_hp_2_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_hp_2_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_hp_2_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_hp_2_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_hp_2_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_hp_2_to_s00_couplers_WDATA = S00_AXI_wdata[63:0];
  assign axi_hp_2_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_hp_2_to_s00_couplers_WSTRB = S00_AXI_wstrb[7:0];
  assign axi_hp_2_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_axi_hp_2_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_axi_hp_2_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_axi_hp_2_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_axi_hp_2_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_axi_hp_2_RDATA = M00_AXI_rdata[63:0];
  assign s00_couplers_to_axi_hp_2_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_axi_hp_2_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_axi_hp_2_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_axi_hp_2_WREADY = M00_AXI_wready;
  s00_couplers_imp_EPGNPQ s00_couplers
       (.M_ACLK(axi_hp_2_ACLK_net),
        .M_ARESETN(axi_hp_2_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_axi_hp_2_ARADDR),
        .M_AXI_arburst(s00_couplers_to_axi_hp_2_ARBURST),
        .M_AXI_arcache(s00_couplers_to_axi_hp_2_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_axi_hp_2_ARLEN),
        .M_AXI_arprot(s00_couplers_to_axi_hp_2_ARPROT),
        .M_AXI_arready(s00_couplers_to_axi_hp_2_ARREADY),
        .M_AXI_arsize(s00_couplers_to_axi_hp_2_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_axi_hp_2_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_axi_hp_2_AWADDR),
        .M_AXI_awburst(s00_couplers_to_axi_hp_2_AWBURST),
        .M_AXI_awcache(s00_couplers_to_axi_hp_2_AWCACHE),
        .M_AXI_awlen(s00_couplers_to_axi_hp_2_AWLEN),
        .M_AXI_awprot(s00_couplers_to_axi_hp_2_AWPROT),
        .M_AXI_awready(s00_couplers_to_axi_hp_2_AWREADY),
        .M_AXI_awsize(s00_couplers_to_axi_hp_2_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_axi_hp_2_AWVALID),
        .M_AXI_bready(s00_couplers_to_axi_hp_2_BREADY),
        .M_AXI_bresp(s00_couplers_to_axi_hp_2_BRESP),
        .M_AXI_bvalid(s00_couplers_to_axi_hp_2_BVALID),
        .M_AXI_rdata(s00_couplers_to_axi_hp_2_RDATA),
        .M_AXI_rlast(s00_couplers_to_axi_hp_2_RLAST),
        .M_AXI_rready(s00_couplers_to_axi_hp_2_RREADY),
        .M_AXI_rresp(s00_couplers_to_axi_hp_2_RRESP),
        .M_AXI_rvalid(s00_couplers_to_axi_hp_2_RVALID),
        .M_AXI_wdata(s00_couplers_to_axi_hp_2_WDATA),
        .M_AXI_wlast(s00_couplers_to_axi_hp_2_WLAST),
        .M_AXI_wready(s00_couplers_to_axi_hp_2_WREADY),
        .M_AXI_wstrb(s00_couplers_to_axi_hp_2_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_axi_hp_2_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_hp_2_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_hp_2_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_hp_2_to_s00_couplers_ARCACHE),
        .S_AXI_arlen(axi_hp_2_to_s00_couplers_ARLEN),
        .S_AXI_arprot(axi_hp_2_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_hp_2_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_hp_2_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_hp_2_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_hp_2_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_hp_2_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_hp_2_to_s00_couplers_AWCACHE),
        .S_AXI_awlen(axi_hp_2_to_s00_couplers_AWLEN),
        .S_AXI_awprot(axi_hp_2_to_s00_couplers_AWPROT),
        .S_AXI_awready(axi_hp_2_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_hp_2_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_hp_2_to_s00_couplers_AWVALID),
        .S_AXI_bready(axi_hp_2_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_hp_2_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_hp_2_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_hp_2_to_s00_couplers_RDATA),
        .S_AXI_rlast(axi_hp_2_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_hp_2_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_hp_2_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_hp_2_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_hp_2_to_s00_couplers_WDATA),
        .S_AXI_wlast(axi_hp_2_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_hp_2_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_hp_2_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_hp_2_to_s00_couplers_WVALID));
endmodule
