`timescale 1ns/1ps


module Briey_axil_cfg (
    input logic clk,
    input logic rstn,
    axil_bus_t.slave axil,
    output logic enable,
    output logic [63:0] physical_address_base,
    output logic core_rst,



    output logic program_load_en,
    output logic program_load_aw_valid,
    input  logic program_load_aw_ready,
    output logic [ 14:0]  program_load_aw_payload_addr,
    output logic program_load_w_valid,
    input  logic program_load_w_ready,
    output logic [511:0] program_load_w_payload_data,
    output logic [ 63:0]  program_load_w_payload_strb
  );

	typedef enum {AXIL_IDLE, AXIL_READ, AXIL_WRITE_W, AXIL_WRITE_B} axil_state_t;
	axil_state_t axil_state, axil_next_state;

  logic load_en;
  logic load_aw_valid;
  logic [ 14:0]  load_aw_payload_addr;
  logic load_w_valid;

  logic [5:0] load_w_payload_data_idx;
  logic [511:0] load_w_payload_data;

  always_ff @(posedge clk) begin: axil_state_ff
		if(!rstn) axil_state <= AXIL_IDLE;
		else axil_state <= axil_next_state;
	end

	always_comb begin: axil_next_state_logic
		axil_next_state = axil_state;
		case(axil_state)
				AXIL_IDLE:
					if(axil.awvalid) begin
							axil_next_state = AXIL_WRITE_W;
					end else if(axil.arvalid) begin
							axil_next_state = AXIL_READ;
					end
				AXIL_READ:    if(axil.rready) axil_next_state = AXIL_IDLE;
				AXIL_WRITE_W: if(axil.wvalid) axil_next_state = AXIL_WRITE_B;
				AXIL_WRITE_B: if(axil.bready) axil_next_state = AXIL_IDLE;
		endcase
	end


	always_ff @(posedge clk) begin: read_endpoint
		if(axil_state == AXIL_IDLE) begin
			case(axil.araddr)
				'h00: axil.rdata <= 64'ha0a1a2a3__deadbeef;
        'h10: axil.rdata <= enable;
        'h20: axil.rdata <= physical_address_base;
        'h60: axil.rdata <= load_w_payload_data_idx;
        'h80: axil.rdata <= {load_aw_valid, load_w_valid};
        'ha0: axil.rdata <= load_aw_payload_addr;
				default: axil.rdata <= 64'hdeaddead__deaddead;
			endcase
		end
	end

	logic [31:0] axil_waddr_reg;
	always_ff @(posedge clk) begin: axil_waddr_reg_ff
		if(!rstn) axil_waddr_reg <= 0;
		else if(axil_state == AXIL_IDLE && axil.awvalid) begin
			axil_waddr_reg <= axil.awaddr;
		end
	end

	always_ff @(posedge clk) begin: write_endpoint
		if(!rstn) begin
			enable <= 0;
      physical_address_base <= 0;
      core_rst <= 0;

      load_en <= 0;
      load_w_payload_data_idx <= 0;
      load_w_payload_data <= 0;
      load_aw_valid <= 0;
      load_w_valid <= 0;
      load_aw_payload_addr <= 0;
		end else begin
      if(program_load_aw_ready) load_aw_valid <= 0;
      if(program_load_w_ready ) load_w_valid  <= 0;
			if(axil_state == AXIL_WRITE_W && axil.wvalid) begin
				case(axil_waddr_reg)
					'h10: enable <= axil.wdata[0];
					'h20: physical_address_base <= axil.wdata;
          'h30: core_rst <= 1;
          'h40: core_rst <= 0;
          'h50: load_en <= axil.wdata[0];
          'h60: load_w_payload_data_idx <= axil.wdata[5:0];
          'h70: load_w_payload_data[(load_w_payload_data_idx + 1) * 8 - 1 -: 8] <= axil.wdata[7:0];
          'h80: load_aw_valid <= 1;
          'h90: load_w_valid <= 1;
          'ha0: load_aw_payload_addr <= axil.wdata[14:0];
				endcase
			end
		end
	end

	assign axil.rvalid 	= (axil_state == AXIL_READ);
	assign axil.arready = (axil_state == AXIL_IDLE);
	assign axil.awready = (axil_state == AXIL_IDLE);
	assign axil.wready 	= (axil_state == AXIL_WRITE_W);
	assign axil.bvalid 	= (axil_state == AXIL_WRITE_B);

	assign axil.bresp = 0;
	assign axil.rresp = 0;

  assign program_load_en = load_en;
  assign program_load_aw_valid = load_aw_valid;
  assign program_load_aw_payload_addr = load_aw_payload_addr;
  assign program_load_w_valid = load_w_valid;
  assign program_load_w_payload_data = load_w_payload_data;
  assign program_load_w_payload_strb = 64'hFFFFFFFFFFFFFFFF;
endmodule

module Briey_Wrap (
  // Clocks
  input logic  axi4_mm_clk, 

  // Resets
  input logic  axi4_mm_rst_n,

  axil_bus_t.slave axil,

  /*
    AXI-MM interface - write address channel
  */
  output wire [11:0]               awid,
  output wire [63:0]               awaddr, 
  output wire [9:0]                awlen,
  output wire [2:0]                awsize,
  output wire [1:0]                awburst,
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
   output wire                           rready

);


  // Soft reset RISCV core (not reset core's ram)
  // input  wire          core_soft_reset, 
  logic         program_load_en; // when high; start load program from host to riscv ram; need to set to low before enable RISCV core
  logic         program_load_aw_valid;
  logic         program_load_aw_ready;
  logic [ 14:0] program_load_aw_payload_addr;
  logic         program_load_w_valid;
  logic         program_load_w_ready;
  logic [511:0] program_load_w_payload_data;
  logic  [63:0] program_load_w_payload_strb;


  logic [14:0] riscv_axi_awaddr, riscv_axi_araddr; // change address width to xx bits based on Briey memory size
  logic [63:0] physical_address_base; // change base address based on host memory map
  logic enable, core_rst;

  Briey_axil_cfg Briey_axil_cfg_inst(
    .clk(axi4_mm_clk),
    .rstn(axi4_mm_rst_n),
    .axil(axil),
    .enable(enable),
    .physical_address_base(physical_address_base),
    .core_rst(core_rst),

    .program_load_en(program_load_en),
    .program_load_aw_valid(program_load_aw_valid),
    .program_load_aw_ready(program_load_aw_ready),
    .program_load_aw_payload_addr(program_load_aw_payload_addr),
    .program_load_w_valid(program_load_w_valid),
    .program_load_w_ready(program_load_w_ready),
    .program_load_w_payload_data(program_load_w_payload_data),
    .program_load_w_payload_strb(program_load_w_payload_strb)
  );


  assign awaddr = physical_address_base + riscv_axi_awaddr; // byte address
  assign araddr = physical_address_base + riscv_axi_araddr; // byte address

  logic _awvalid, _wvalid, _bvalid, _arvalid, _rvalid;
  logic _awready, _wready, _bready, _arready, _rready;

  assign awvalid = _awvalid && enable;
  assign wvalid = _wvalid && enable;
  assign _bvalid = bvalid && enable;
  assign arvalid = _arvalid && enable;
  assign _rvalid = rvalid && enable;

  assign _awready = awready && enable;
  assign _wready = wready && enable;
  assign bready = _bready && enable;
  assign _arready = arready && enable;
  assign rready = _rready && enable;

  wire          io_out_reg_axi_aw_valid;
  wire          io_out_reg_axi_aw_ready;
  wire [9:0]    io_out_reg_axi_aw_payload_addr;

  wire          io_out_reg_axi_ar_valid;
  wire          io_out_reg_axi_ar_ready;
  wire [9:0]    io_out_reg_axi_ar_payload_addr;

  wire          io_out_reg_axi_w_valid;
  wire          io_out_reg_axi_w_ready;
  wire [511:0]  io_out_reg_axi_w_payload_data;
  wire [63:0]   io_out_reg_axi_w_payload_strb;

  wire          io_out_reg_axi_b_valid;
  wire          io_out_reg_axi_b_ready;
  wire [1:0]    io_out_reg_axi_b_payload_resp;

  wire          io_out_reg_axi_r_valid;
  wire          io_out_reg_axi_r_ready;
  wire [511:0]  io_out_reg_axi_r_payload_data;
  wire [1:0]    io_out_reg_axi_r_payload_resp;



  Briey briey_inst (
    .io_asyncReset (!axi4_mm_rst_n | core_rst),
    .io_axiClk (axi4_mm_clk),
    .io_vgaClk (axi4_mm_clk),
    .io_jtag_tms (1'b0),
    .io_jtag_tdi (1'b0),
    .io_jtag_tdo (),
    .io_jtag_tck (1'b0),
    
    .io_coreInterrupt (1'b0),


    .io_out_cxl_axi_aw_valid(_awvalid),
    .io_out_cxl_axi_aw_ready(_awready),
    .io_out_cxl_axi_aw_payload_addr(riscv_axi_awaddr), // RISVcore address range 14bits 
    .io_out_cxl_axi_aw_payload_id(awid),
    .io_out_cxl_axi_aw_payload_len(awlen), // TODO: change len width based on Briey
    .io_out_cxl_axi_aw_payload_size(awsize),
    .io_out_cxl_axi_aw_payload_burst(), // ignored since len is always 0

    .io_out_cxl_axi_w_valid(_wvalid),
    .io_out_cxl_axi_w_ready(_wready),
    .io_out_cxl_axi_w_payload_data(wdata),
    .io_out_cxl_axi_w_payload_strb(wstrb),
    .io_out_cxl_axi_w_payload_last(wlast),
    .io_out_cxl_axi_b_valid(_bvalid),
    .io_out_cxl_axi_b_ready(_bready),
    .io_out_cxl_axi_b_payload_id(bid), 
    .io_out_cxl_axi_b_payload_resp(bresp),

    .io_out_cxl_axi_ar_valid(_arvalid),
    .io_out_cxl_axi_ar_ready(_arready),
    .io_out_cxl_axi_ar_payload_addr(riscv_axi_araddr),
    .io_out_cxl_axi_ar_payload_id(arid), 
    .io_out_cxl_axi_ar_payload_len(arlen), // TODO: change len width based on Briey
    .io_out_cxl_axi_ar_payload_size(arsize),
    .io_out_cxl_axi_ar_payload_burst(), // ignored since len is always 0
    .io_out_cxl_axi_r_valid(_rvalid),
    .io_out_cxl_axi_r_ready(_rready),
    .io_out_cxl_axi_r_payload_data(rdata),
    .io_out_cxl_axi_r_payload_id(rid),
    .io_out_cxl_axi_r_payload_resp(rresp),
    .io_out_cxl_axi_r_payload_last(rlast),

    // write riscv ram interface (for loading binarys)
    .io_out_reg_axi_aw_valid(io_out_reg_axi_aw_valid),
    .io_out_reg_axi_aw_ready(io_out_reg_axi_aw_ready),
    .io_out_reg_axi_aw_payload_addr(io_out_reg_axi_aw_payload_addr),
    .io_out_reg_axi_w_valid(io_out_reg_axi_w_valid),
    .io_out_reg_axi_w_ready(io_out_reg_axi_w_ready),
    .io_out_reg_axi_w_payload_data(io_out_reg_axi_w_payload_data),
    .io_out_reg_axi_w_payload_strb(io_out_reg_axi_w_payload_strb),
    .io_out_reg_axi_b_valid(io_out_reg_axi_b_valid),
    .io_out_reg_axi_b_ready(io_out_reg_axi_b_ready),
    .io_out_reg_axi_b_payload_resp(io_out_reg_axi_b_payload_resp),
    .io_out_reg_axi_ar_valid(io_out_reg_axi_ar_valid),
    .io_out_reg_axi_ar_ready(io_out_reg_axi_ar_ready),
    .io_out_reg_axi_ar_payload_addr(io_out_reg_axi_ar_payload_addr),
    .io_out_reg_axi_r_valid(io_out_reg_axi_r_valid),
    .io_out_reg_axi_r_ready(io_out_reg_axi_r_ready),
    .io_out_reg_axi_r_payload_data(io_out_reg_axi_r_payload_data),
    .io_out_reg_axi_r_payload_resp(io_out_reg_axi_r_payload_resp),

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
  );


  // axil_ram #(
  //   .ADDR_WIDTH       (10), // change based on Briey memory size
  //   .DATA_WIDTH       (512)
  // ) register_ram (
  //   .clk        (axi4_mm_clk),
  //   .rst        (!axi4_mm_rst_n),

  //   // AXI write address channel
  //   .s_axil_awvalid    (io_out_reg_axi_aw_valid),
  //   .s_axil_awready    (io_out_reg_axi_aw_ready),
  //   .s_axil_awaddr     (io_out_reg_axi_aw_payload_addr),

  //   // AXIl write data channel
  //   .s_axil_wvalid     (io_out_reg_axi_w_valid),
  //   .s_axil_wready     (io_out_reg_axi_w_ready),
  //   .s_axil_wdata      (io_out_reg_axi_w_payload_data),
  //   .s_axil_wstrb      (io_out_reg_axi_w_payload_strb),

  //   // AXIl write response channel
  //   .s_axil_bvalid     (io_out_reg_axi_b_valid),
  //   .s_axil_bready     (io_out_reg_axi_b_ready),
  //   .s_axil_bresp      (io_out_reg_axi_b_payload_resp),
  //   // AXIl read address channel
  //   .s_axil_arvalid    (io_out_reg_axi_ar_valid),
  //   .s_axil_arready    (io_out_reg_axi_ar_ready),
  //   .s_axil_araddr     (io_out_reg_axi_ar_payload_addr),

  //   .s_axil_rvalid     (io_out_reg_axi_r_valid),
  //   .s_axil_rready     (io_out_reg_axi_r_ready),
  //   .s_axil_rdata      (io_out_reg_axi_r_payload_data),
  //   .s_axil_rresp      (io_out_reg_axi_r_payload_resp)
  //   // AXI read data channel
  // );


  assign awburst = 2'b00;
  assign awlock = 2'b00;
  assign awcache = 4'b0000;
  assign awprot = 3'b000;
  assign awqos = 0;
  assign awuser = 0;
  assign awregion = 0;
  assign awatop = 0;

  assign arburst = 2'b00;
  assign arlock = 2'b00;
  assign arcache = 4'b0000;
  assign arprot = 3'b000;
  assign arregion = 4'b0000;
  assign aruser = 0;
  assign arqos = 0;
endmodule

