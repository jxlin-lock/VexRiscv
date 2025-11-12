`timescale 1ns/1ps


module Briey_axil_cfg (
    input logic clk,
    input logic rstn,
    axil_bus_t.slave axil,
    output logic enable,
    output logic [63:0] physical_address_base,
    output logic core_rst,

    output logic [1:0][5:0] briey_awuser,
    output logic [1:0][5:0] briey_aruser,

   	output logic ctrl_enable,
	  input  logic ctrl_ready,

    output logic [63:0] ctrl_base_h0,
    output logic [63:0] ctrl_base_h1,
    output logic [63:0] ctrl_high_h0,
    output logic [63:0] ctrl_high_h1,

    output logic ctrl_clear_counter,
    input  logic [63:0] h0_counter,
    input  logic [63:0] h1_counter,

    input dbg_h0_rdy,
    input dbg_h1_rdy,
    input dbg_axi_rdy,

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

  logic [6:0] load_w_payload_data_idx;
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
        'h90: axil.rdata <= {program_load_aw_ready, program_load_w_ready};
        'ha0: axil.rdata <= load_aw_payload_addr;

        'hb0: axil.rdata <= {dbg_h0_rdy, dbg_h1_rdy, dbg_axi_rdy, ctrl_clear_counter, ctrl_ready, ctrl_enable};
        'hc0: axil.rdata <= h0_counter;
        'hd0: axil.rdata <= h1_counter;

        'h120: axil.rdata <= {briey_aruser[1], briey_aruser[0], briey_awuser[1], briey_awuser[0]};
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

      ctrl_enable <= 0;
      ctrl_base_h0 <= 0;
      ctrl_base_h1 <= 0;
      ctrl_high_h0 <= 0;
      ctrl_high_h1 <= 0;
      
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
          'h70: load_w_payload_data[(load_w_payload_data_idx[5:0] + 1) * 8 - 1 -: 8] <= axil.wdata[7:0]; // can this overflow?
          'h80: {load_aw_valid, load_w_valid} <= {1'b1, 1'b1};
          'ha0: load_aw_payload_addr <= axil.wdata[14:0];

          'hb0: ctrl_enable <= axil.wdata[0];
          'hc0: ctrl_clear_counter <= axil.wdata[0];
          'hd0: ctrl_base_h0 <= axil.wdata;
          'hf0: ctrl_base_h1 <= axil.wdata;

          'he0: {briey_aruser[1], briey_aruser[0], briey_awuser[1], briey_awuser[0]} <= axil.wdata;

          'h100: ctrl_high_h0 <= axil.wdata;
          'h110: ctrl_high_h1 <= axil.wdata;
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

module axi_id_wait(
    input clk,
    input rstn,

    input enable,

    input slave_aXvalid,
    input slave_aXid,
    output slave_aXready,

    output slave_Xvalid,
    output slave_Xid,
    input slave_Xready,

    output master_aXvalid,
    output [11:0] master_aXid,
    input master_aXready,

    input master_Xvalid,
    input [11:0] master_Xid,
    output master_Xready
);
    logic [31:0] taken_id;
    logic [4 :0] curr_id;

    always_ff @(posedge clk) begin
        if(!rstn) taken_id <= 0;
        else begin
            if(master_Xready  && master_Xvalid) taken_id[master_Xid[4:0]] <= 0;
            if(master_aXready && master_aXvalid) taken_id[curr_id] <= 1;
        end
    end

    assign curr_id = slave_aXid;

    assign slave_aXready = master_aXready && !taken_id[curr_id] && enable;

    assign master_aXvalid = slave_aXvalid && !taken_id[curr_id] && enable;
    assign master_aXid[4:0] = curr_id;
    assign master_aXid[11:5] = 0;

    assign master_Xready = slave_Xready && enable;
    assign slave_Xvalid = master_Xvalid && enable;
    assign slave_Xid = master_Xid;
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
   output wire                           rready,

    output ctrl_enable,
    input ctrl_ready,

    output [63:0] ctrl_base_h0,
    output [63:0] ctrl_base_h1,

    output [63:0] ctrl_high_h0,
    output [63:0] ctrl_high_h1,

    output ctrl_clear_counter,
    input [63:0] h0_counter,
    input [63:0] h1_counter,

    input dbg_h0_rdy,
    input dbg_h1_rdy,
    input dbg_axi_rdy
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
  logic [1:0][5:0] briey_awuser, briey_aruser;

  logic [28:0] riscv_axi_awaddr, riscv_axi_araddr; // change address width to xx bits based on Briey memory size
  logic [63:0] physical_address_base; // change base address based on host memory map
  logic enable, core_rst;

  Briey_axil_cfg Briey_axil_cfg_inst(
    .clk(axi4_mm_clk),
    .rstn(axi4_mm_rst_n),
    .axil(axil),
    .enable(enable),
    .physical_address_base(physical_address_base),
    .core_rst(core_rst),

    .briey_aruser(briey_aruser),
    .briey_awuser(briey_awuser),

    .ctrl_enable(ctrl_enable),
    .ctrl_ready(ctrl_ready),
    .ctrl_base_h0(ctrl_base_h0),
    .ctrl_base_h1(ctrl_base_h1),
    .ctrl_high_h0(ctrl_high_h0),
    .ctrl_high_h1(ctrl_high_h1),
    .ctrl_clear_counter(ctrl_clear_counter),
    .h0_counter(h0_counter),
    .h1_counter(h1_counter),
    
    .dbg_h0_rdy(dbg_h0_rdy),
    .dbg_h1_rdy(dbg_h1_rdy),
    .dbg_axi_rdy(dbg_axi_rdy),

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

  logic briey_awvalid, briey_awready, briey_awid;
  logic briey_wvalid, briey_wready;
  logic briey_bvalid, briey_bready, briey_bid;

  logic briey_arvalid, briey_arready, briey_arid;
  logic briey_rvalid, briey_rready, briey_rid;

  assign wvalid = briey_wvalid && enable;
  assign briey_wready = wready && enable;

  axi_id_wait axi_id_wait_inst_WRITE (
    .clk(axi4_mm_clk),
    .rstn(axi4_mm_rst_n),

    .enable(enable),

    .slave_aXvalid(briey_awvalid),
    .slave_aXid(briey_awid),
    .slave_aXready(briey_awready),
    
    .slave_Xvalid(briey_bvalid),
    .slave_Xid(briey_bid),
    .slave_Xready(briey_bready),
    
    
    .master_aXvalid(awvalid),
    .master_aXid(awid),
    .master_aXready(awready),
    
    .master_Xvalid(bvalid),
    .master_Xid(bid),
    .master_Xready(bready)
  );


  axi_id_wait axi_id_wait_inst_READ (
    .clk(axi4_mm_clk),
    .rstn(axi4_mm_rst_n),

    .enable(enable),
    
    .slave_aXvalid(briey_arvalid),
    .slave_aXid(briey_arid),
    .slave_aXready(briey_arready),
    
    .slave_Xvalid(briey_rvalid),
    .slave_Xid(briey_rid),
    .slave_Xready(briey_rready),
    
    
    .master_aXvalid(arvalid),
    .master_aXid(arid),
    .master_aXready(arready),
    
    .master_Xvalid(rvalid),
    .master_Xid(rid),
    .master_Xready(rready)
  );

  Briey briey_inst (
    .io_asyncReset (!axi4_mm_rst_n | core_rst),
    .io_axiClk (axi4_mm_clk),
    .io_vgaClk (axi4_mm_clk),
    .io_jtag_tms (1'b0),
    .io_jtag_tdi (1'b0),
    .io_jtag_tdo (),
    .io_jtag_tck (1'b0),
    
    .io_coreInterrupt (1'b0),


    .io_out_cxl_axi_aw_valid(briey_awvalid),
    .io_out_cxl_axi_aw_ready(briey_awready),
    .io_out_cxl_axi_aw_payload_addr(riscv_axi_awaddr), // RISVcore address range 14bits 
    .io_out_cxl_axi_aw_payload_id(briey_awid),
    .io_out_cxl_axi_aw_payload_len(awlen), // TODO: change len width based on Briey
    .io_out_cxl_axi_aw_payload_size(awsize),
    .io_out_cxl_axi_aw_payload_burst(), // ignored since len is always 0

    .io_out_cxl_axi_w_valid(briey_wvalid),
    .io_out_cxl_axi_w_ready(briey_wready),
    .io_out_cxl_axi_w_payload_data(wdata),
    .io_out_cxl_axi_w_payload_strb(wstrb),
    .io_out_cxl_axi_w_payload_last(wlast),
    .io_out_cxl_axi_b_valid(briey_bvalid),
    .io_out_cxl_axi_b_ready(briey_bready),
    .io_out_cxl_axi_b_payload_id(briey_bid), 
    .io_out_cxl_axi_b_payload_resp(bresp),

    .io_out_cxl_axi_ar_valid(briey_arvalid),
    .io_out_cxl_axi_ar_ready(briey_arready),
    .io_out_cxl_axi_ar_payload_addr(riscv_axi_araddr),
    .io_out_cxl_axi_ar_payload_id(briey_arid), 
    .io_out_cxl_axi_ar_payload_len(arlen), // TODO: change len width based on Briey
    .io_out_cxl_axi_ar_payload_size(arsize),
    .io_out_cxl_axi_ar_payload_burst(), // ignored since len is always 0
    .io_out_cxl_axi_r_valid(briey_rvalid),
    .io_out_cxl_axi_r_ready(briey_rready),
    .io_out_cxl_axi_r_payload_data(rdata),
    .io_out_cxl_axi_r_payload_id(briey_rid),
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
  );


  assign awburst = 2'b00;
  assign awlock = 2'b00;
  assign awcache = 4'b0000;
  assign awprot = 3'b000;
  assign awqos = 0;
  assign awuser = (riscv_axi_awaddr >= 'h8000) ? briey_awuser[1] : briey_awuser[0];
  assign awregion = 0;
  assign awatop = 0;

  assign arburst = 2'b00;
  assign arlock = 2'b00;
  assign arcache = 4'b0000;
  assign arprot = 3'b000;
  assign arregion = 4'b0000;
  assign aruser = (riscv_axi_araddr >= 'h8000) ? briey_aruser[1] : briey_aruser[0];
  assign arqos = 0;
endmodule

