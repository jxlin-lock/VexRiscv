`timescale 1ns/1ps

module Briey_Wrap (
      // Clocks
  input logic  axi4_mm_clk, 

    // Resets
  input logic  axi4_mm_rst_n,

  /*
    AXI-MM interface - write address channel
  */
  output wire [11:0]               awid,
  output wire [63:0]               awaddr, 
  output wire [9:0]                awlen,
  output wire [2:0]                awsize,
  output wire [1:0]                 awburst,
  output wire [2:0]                awprot,
  output wire [3:0]                awqos,
  output wire [5:0]                awuser,
  output wire                      awvalid,
  output wire [3:0]                awcache,
  output wire [1:0]                awlock,
  output wire [3:0]                awregion,
  output wire [5:0]                awatop,
  input                            awready,
  
  /*
    AXI-MM interface - write data channel
  */
  output wire [511:0]              wdata,
  output wire [(512/8)-1:0]        wstrb,
  output wire                      wlast,
  output wire                      wuser,
  output wire                      wvalid,
 // output logic [7:0]                wid,
  input                            wready,
  
  /*
    AXI-MM interface - write response channel
  */ 
  input wire [11:0]                bid,
  input wire [1:0]                 bresp,
  input wire [3:0]                 buser,
  input wire                       bvalid,
  output wire                      bready,
  
  /*
    AXI-MM interface - read address channel
  */
  output wire [11:0]               arid,
  output wire [63:0]               araddr,
  output wire [9:0]                arlen,
  output wire [2:0]                arsize,
  output wire [1:0]                arburst,
  output wire [2:0]                arprot,
  output wire [3:0]                arqos,
  output wire [4:0]                aruser,
  output wire                      arvalid,
  output wire [3:0]                arcache,
  output wire [1:0]                arlock,
  output wire [3:0]                arregion,
  input                            arready,

  /*
    AXI-MM interface - read response channel
  */ 
   input wire [11:0]                     rid,
   input wire [511:0]                    rdata,
   input wire [1:0]                      rresp,
   input wire                            rlast,
   input wire                            ruser,
   input wire                            rvalid,
   output wire                           rready,


  // Soft reset RISCV core (not reset core's ram)
  // input  wire          core_soft_reset, 
  input  wire          program_load_en, // when high, start load program from host to riscv ram, need to set to low before enable RISCV core
  input  wire          program_load_aw_valid,
  output wire          program_load_aw_ready,
  input  wire [14:0]   program_load_aw_payload_addr,
  input  wire          program_load_w_valid,
  output wire          program_load_w_ready,
  input  wire  [511:0] program_load_w_payload_data,
  input  wire  [63:0]  program_load_w_payload_strb

);

assign awburst = 2'b00;
assign awlock = 2'b00;
assign awcache = 4'b0000;
assign awprot = 3'b000;

assign arburst = 2'b00;
assign arlock = 2'b00;
assign arcache = 4'b0000;
assign arprot = 3'b000;
assign arregion = 4'b0000;

wire [14:0]  riscv_axi_awaddr, riscv_axi_araddr; // change address width to xx bits based on Briey memory size

reg [63:0] physical_address_base = 64'h0; // change base address based on host memory map
assign awaddr = physical_address_base + riscv_axi_awaddr; // byte address
assign araddr = physical_address_base + riscv_axi_araddr; // byte address


    Briey #()
    briey_inst (
        .io_asyncReset (!axi4_mm_rst_n),
        .io_axiClk (axi4_mm_clk),
        .io_vgaClk (axi4_mm_clk),
        .io_jtag_tms (1'b0),
        .io_jtag_tdi (1'b0),
        .io_jtag_tdo (),
        .io_jtag_tck (1'b0),
        
        .io_coreInterrupt (1'b0),

        .io_out_cxl_axi_aw_valid(awvalid),
        .io_out_cxl_axi_aw_ready(awready),
        .io_out_cxl_axi_aw_payload_addr(riscv_axi_awaddr), // RISVcore address range 14bits 
        .io_out_cxl_axi_aw_payload_id(awid),
        .io_out_cxl_axi_aw_payload_len(awlen), // TODO: change len width based on Briey
        .io_out_cxl_axi_aw_payload_size(awsize),
        .io_out_cxl_axi_aw_payload_burst(), // ignored since len is always 0

        .io_out_cxl_axi_w_valid(wvalid),
        .io_out_cxl_axi_w_ready(wready),
        .io_out_cxl_axi_w_payload_data(wdata),
        .io_out_cxl_axi_w_payload_strb(wstrb),
        .io_out_cxl_axi_w_payload_last(wlast),
        .io_out_cxl_axi_b_valid(bvalid),
        .io_out_cxl_axi_b_ready(bready),
        .io_out_cxl_axi_b_payload_id(bid), 
        .io_out_cxl_axi_b_payload_resp(bresp),

        .io_out_cxl_axi_ar_valid(arvalid),
        .io_out_cxl_axi_ar_ready(arready),
        .io_out_cxl_axi_ar_payload_addr(riscv_axi_araddr),
        .io_out_cxl_axi_ar_payload_id(arid), 
        .io_out_cxl_axi_ar_payload_len(arlen), // TODO: change len width based on Briey
        .io_out_cxl_axi_ar_payload_size(arsize),
        .io_out_cxl_axi_ar_payload_burst(), // ignored since len is always 0
        .io_out_cxl_axi_r_valid(rvalid),
        .io_out_cxl_axi_r_ready(rready),
        .io_out_cxl_axi_r_payload_data(rdata),
        .io_out_cxl_axi_r_payload_id(rid),
        .io_out_cxl_axi_r_payload_resp(rresp),
        .io_out_cxl_axi_r_payload_last(rlast),

        // write riscv ram interface (for loading binarys)
        .io_in_ram_io_arw_valid(program_load_aw_valid),
        .io_in_ram_io_arw_ready(program_load_aw_ready),
        .io_in_ram_io_arw_payload_addr(program_load_aw_payload_addr),
        .io_in_ram_io_arw_payload_id(0),
        .io_in_ram_io_arw_payload_len(0),
        .io_in_ram_io_arw_payload_size(3'b110), // 64B aligned transfer
        .io_in_ram_io_arw_payload_burst(2'b01), // INCR
        .io_in_ram_io_arw_payload_write(program_load_aw_valid), // TODO: change this write signal
        .io_in_ram_io_w_valid(program_load_w_valid),
        .io_in_ram_io_w_ready(program_load_w_ready),
        .io_in_ram_io_w_payload_data(program_load_w_payload_data),
        .io_in_ram_io_w_payload_strb(program_load_w_payload_strb),
        .io_in_ram_io_w_payload_last(1'b1),
        .io_in_ram_io_b_ready(1'b1),
        .io_in_ram_io_r_ready(1'b1),
        .io_in_enable_ram_reload(program_load_en)
        // .io_in_ram_reset(program_load_ram_reset) // only hard reset ram
    );



endmodule
