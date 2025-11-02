`timescale 1ns/1ps

`define SYNTHESIS
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

    input logic [63:0] DEBUG_axi_aw,
    input logic [63:0] DEBUG_axi_w,
    input logic [63:0] DEBUG_axi_b,

    input logic [63:0] DEBUG_axi_ar,
    input logic [63:0] DEBUG_axi_r,

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
        'h10: axil.rdata <= {63'h0, enable, core_rst};
        'h20: axil.rdata <= physical_address_base;
        'h60: axil.rdata <= load_w_payload_data_idx;
        'h80: axil.rdata <= {load_aw_valid, load_w_valid};
        'h90: axil.rdata <= {program_load_aw_ready, program_load_w_ready};
        'ha0: axil.rdata <= load_aw_payload_addr;

        'hb0: axil.rdata <= {dbg_h0_rdy, dbg_h1_rdy, dbg_axi_rdy, ctrl_clear_counter, ctrl_ready, ctrl_enable};
        'hc0: axil.rdata <= h0_counter;
        'hd0: axil.rdata <= h1_counter;

        'he0: axil.rdata <= DEBUG_axi_aw;
        'hf0: axil.rdata <= DEBUG_axi_w;
        'h100: axil.rdata <= DEBUG_axi_b;
        'h110: axil.rdata <= DEBUG_axi_ar;
        'h130: axil.rdata <= DEBUG_axi_r;

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
      core_rst <= 1;

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

module axi_id_rewrite(
    input clk,
    input rstn,

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

    assign slave_aXready = master_aXready && !taken_id[curr_id];

    assign master_aXvalid = slave_aXvalid && !taken_id[curr_id];
    assign master_aXid[4:0] = curr_id;
    assign master_aXid[11:5] = 0;

    assign master_Xready = slave_Xready;
    assign slave_Xvalid = master_Xvalid;
    assign slave_Xid = master_Xid;
endmodule

module cxl_briey_axi(
  input clk,
  input rstn,

  input logic core_rst,
  input logic enable,
  input logic [63:0] physical_address_base,

  input logic [28:0]               briey_awaddr, 
  input logic [1:0][5:0]           briey_awuser,
  input logic                      briey_awvalid,
  input logic [11:0]               briey_awid,
  input logic [9:0]                 briey_awlen,
  input logic [2:0]                 briey_awsize,
  input logic [1:0]                 briey_awburst,
  output logic                      briey_awready,
  

  input logic [511:0]              briey_wdata,
  input logic [(512/8)-1:0]        briey_wstrb,
  input logic                      briey_wlast,
  input logic                      briey_wvalid,
  output logic                      briey_wready,

  output logic [11:0]               briey_bid,
  output logic [1:0]                briey_bresp,
  output logic                      briey_bvalid,
  input logic                      briey_bready,
  
  input logic [11:0]               briey_arid,
  input logic [28:0]               briey_araddr,
  input logic [9:0]                briey_arlen,
  input logic [2:0]                briey_arsize,
  input logic [1:0][5:0]           briey_aruser,
  input logic [1:0]                briey_arburst,
  input logic                      briey_arvalid,
  output logic                      briey_arready,

  output logic [11:0]               briey_rid,
  output logic [511:0]              briey_rdata,
  output logic [1:0]                briey_rresp,
  output logic                      briey_rlast,
  output logic                      briey_rvalid,
  input logic                      briey_rready,


  output logic [11:0]               awid,
  output logic [63:0]               awaddr, 
  output logic [9:0]                awlen,
  output logic [2:0]                awsize,
  output logic [1:0]                awburst,
  output logic [2:0]                awprot,
  output logic [3:0]                awqos,
  output logic [5:0]                awuser,
  output logic                      awvalid,
  output logic [3:0]                awcache,
  output logic [1:0]                awlock,
  output logic [3:0]                awregion,
  output logic [5:0]                awatop,
  input                            awready,
  

  output logic [511:0]              wdata,
  output logic [(512/8)-1:0]        wstrb,
  output logic                      wlast,
  output logic                      wuser,
  output logic                      wvalid,
  input                            wready,
  
  input logic [11:0]                bid,
  input logic [1:0]                 bresp,
  input logic [3:0]                 buser,
  input logic                       bvalid,
  output logic                      bready,
  
  output logic [11:0]               arid,
  output logic [63:0]               araddr,
  output logic [9:0]                arlen,
  output logic [2:0]                arsize,
  output logic [1:0]                arburst,
  output logic [2:0]                arprot,
  output logic [3:0]                arqos,
  output logic [4:0]                aruser,
  output logic                      arvalid,
  output logic [3:0]                arcache,
  output logic [1:0]                arlock,
  output logic [3:0]                arregion,
  input                            arready,


  input logic [11:0]                     rid,
  input logic [511:0]                    rdata,
  input logic [1:0]                      rresp,
  input logic                            rlast,
  input logic                            ruser,
  input logic                            rvalid,
  output logic                           rready

);
  // logic _briey_awready, _briey_bvalid;
  // logic _awvalid, _bready;

  // logic _briey_arready, _briey_rvalid;
  // logic _arvalid, _rready;

  axi_id_rewrite axi_id_W (
    .clk(clk),
    .rstn(rstn),
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

  axi_id_rewrite axi_id_R (
    .clk(clk),
    .rstn(rstn),
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


  assign awaddr = physical_address_base + briey_awaddr; // byte address
  assign araddr = physical_address_base + briey_araddr; // byte address


  // assign awid = briey_awid;
  // assign awaddr = briey_awaddr; 
  assign awlen = 0; // briey_awlen;
  assign awsize = 3'b110; // briey_awsize;
  assign awburst = 0; // TODO: briey_awburst; TODO: why briey burst is 01
  assign awprot = 0; // briey_awprot;
  assign awqos = 0; // briey_awqos;
  assign awuser = (briey_awaddr >= 'h8000) ? briey_awuser[1] : briey_awuser[0];
  // assign awvalid = briey_awvalid;
  assign awcache = 0; // briey_awcache;
  assign awlock = 0; // briey_awlock;
  assign awregion = 0; // briey_awregion;
  assign awatop = 0; // briey_awatop;
  

  assign wdata = briey_wdata;
  assign wstrb = briey_wstrb;
  assign wlast = briey_wlast;
  assign wuser = 0;
  assign wvalid = briey_wvalid;
  
  // assign bready = briey_bready;
  
  // assign arid = briey_arid;
  // assign araddr = briey_araddr;
  assign arlen = 0; // briey_arlen;
  assign arsize = 3'b110; // briey_arsize;
  assign arburst = 0; // briey_arburst;
  assign arprot = 0; // briey_arprot;
  assign arqos = 0; // briey_arqos;
  assign aruser = (briey_araddr >= 'h8000) ? briey_aruser[1] : briey_aruser[0];
  // assign arvalid = briey_arvalid;
  assign arcache = 0; // briey_arcache;
  assign arlock = 0; // briey_arlock;
  assign arregion = 0; // briey_arregion;


  // assign rready = briey_rready;




  // assign briey_awready = awready;
  assign briey_wready = wready;

  // assign briey_bid = bid;
  assign briey_bresp = bresp;
  // assign briey_bvalid = bvalid;
  
  // assign briey_arready = arready;

  // assign briey_rid = rid;
  assign briey_rdata = rdata;
  assign briey_rresp = rresp;
  assign briey_rlast = rlast;
  // assign briey_rvalid = rvalid;


  always_ff @(posedge clk) begin
    if(rstn) begin
      assert(briey_arlen[7:0] == 0) else begin
        $error("briey_arlen %0b", briey_arlen);
      end
      assert(briey_arsize == 3'b110) else begin
        $error("briey_arsize %0d", briey_arsize);
      end
      assert(briey_awlen[7:0] == 0) else begin
        $error("brie_awlen %0d", briey_awlen);
      end

      assert(briey_awsize == 3'b110) else begin
        $error("briey_awsize %0d", briey_awsize);
      end

      assert(briey_wlast == 1) else begin
        $error("briey_wlast %0d", briey_wlast);
      end
    end
  end
endmodule

module Briey_Wrap (
  input logic  axi4_mm_clk, 
  input logic  axi4_mm_rst_n,

  axil_bus_t.slave axil,

  output logic [11:0]               awid,
  output logic [63:0]               awaddr, 
  output logic [9:0]                awlen,
  output logic [2:0]                awsize,
  output logic [1:0]                awburst,
  output logic [2:0]                awprot,
  output logic [3:0]                awqos,
  output logic [5:0]                awuser,
  output logic                      awvalid,
  output logic [3:0]                awcache,
  output logic [1:0]                awlock,
  output logic [3:0]                awregion,
  output logic [5:0]                awatop,
  input                            awready,
  
  output logic [511:0]              wdata,
  output logic [(512/8)-1:0]        wstrb,
  output logic                      wlast,
  output logic                      wuser,
  output logic                      wvalid,
  input                            wready,
  
  input logic [11:0]                bid,
  input logic [1:0]                 bresp,
  input logic [3:0]                 buser,
  input logic                       bvalid,
  output logic                      bready,
  
  output logic [11:0]               arid,
  output logic [63:0]               araddr,
  output logic [9:0]                arlen,
  output logic [2:0]                arsize,
  output logic [1:0]                arburst,
  output logic [2:0]                arprot,
  output logic [3:0]                arqos,
  output logic [4:0]                aruser,
  output logic                      arvalid,
  output logic [3:0]                arcache,
  output logic [1:0]                arlock,
  output logic [3:0]                arregion,
  input                            arready,

  input logic [11:0]                rid,
  input logic [511:0]               rdata,
  input logic [1:0]                 rresp,
  input logic                       rlast,
  input logic                       ruser,
  input logic                       rvalid,
  output logic                      rready,


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

  logic [28:0]               briey_awaddr; 
  logic [1:0][5:0]           briey_awuser;
  logic                      briey_awvalid;
  logic [11:0]               briey_awid;
  logic                      briey_awready;
  logic [9:0]                briey_awlen;
  logic [2:0]                briey_awsize;
  logic [1:0]                briey_awburst;

  logic [511:0]              briey_wdata;
  logic [(512/8)-1:0]        briey_wstrb;
  logic                      briey_wlast;
  logic                      briey_wvalid;
  logic                      briey_wready;

  logic [11:0]               briey_bid;
  logic [1:0]                briey_bresp;
  logic                      briey_bvalid;
  logic                      briey_bready;
  
  logic [11:0]               briey_arid;
  logic [28:0]               briey_araddr;
  logic [9:0]                briey_arlen;
  logic [2:0]                briey_arsize;
  logic [1:0][5:0]           briey_aruser;
  logic                      briey_arvalid;
  logic                      briey_arready;
  logic [1:0]                briey_arburst;

  logic [11:0]               briey_rid;
  logic [511:0]              briey_rdata;
  logic [1:0]                briey_rresp;
  logic                      briey_rlast;
  logic                      briey_rvalid;
  logic                      briey_rready;


  logic         program_load_en; // when high; start load program from h2c; need to set to low before enable RISCV core
  logic         program_load_aw_valid;
  logic         program_load_aw_ready;
  logic [ 14:0] program_load_aw_payload_addr;
  logic         program_load_w_valid;
  logic         program_load_w_ready;
  logic [511:0] program_load_w_payload_data;
  logic [ 63:0] program_load_w_payload_strb;
  logic [ 63:0] physical_address_base; // change base address based on host memory map
  logic enable, core_rst;


  logic [63:0] DEBUG_axi_aw;
  logic [63:0] DEBUG_axi_w;
  logic [63:0] DEBUG_axi_b;

  logic [63:0] DEBUG_axi_ar;
  logic [63:0] DEBUG_axi_r;
  
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

    .DEBUG_axi_aw(DEBUG_axi_aw),
    .DEBUG_axi_w(DEBUG_axi_w),
    .DEBUG_axi_b(DEBUG_axi_b),

    .DEBUG_axi_ar(DEBUG_axi_ar),
    .DEBUG_axi_r(DEBUG_axi_r),

    .program_load_en(program_load_en),
    .program_load_aw_valid(program_load_aw_valid),
    .program_load_aw_ready(program_load_aw_ready),
    .program_load_aw_payload_addr(program_load_aw_payload_addr),
    .program_load_w_valid(program_load_w_valid),
    .program_load_w_ready(program_load_w_ready),
    .program_load_w_payload_data(program_load_w_payload_data),
    .program_load_w_payload_strb(program_load_w_payload_strb)
  );


  Briey briey_inst (
    .io_asyncReset (!axi4_mm_rst_n || core_rst),
    .io_axiClk (axi4_mm_clk),
    .io_vgaClk (axi4_mm_clk),
    .io_jtag_tms (1'b0),
    .io_jtag_tdi (1'b0),
    .io_jtag_tdo (),
    .io_jtag_tck (1'b0),
    
    .io_coreInterrupt (1'b0),

    .io_out_cxl_axi_aw_valid(briey_awvalid),
    .io_out_cxl_axi_aw_ready(briey_awready),
    .io_out_cxl_axi_aw_payload_addr(briey_awaddr),
    .io_out_cxl_axi_aw_payload_id(briey_awid),
    .io_out_cxl_axi_aw_payload_len(briey_awlen),
    .io_out_cxl_axi_aw_payload_size(briey_awsize),
    .io_out_cxl_axi_aw_payload_burst(briey_awburst),
    
    .io_out_cxl_axi_w_valid(briey_wvalid),
    .io_out_cxl_axi_w_ready(briey_wready),
    .io_out_cxl_axi_w_payload_data(briey_wdata),
    .io_out_cxl_axi_w_payload_strb(briey_wstrb),
    .io_out_cxl_axi_w_payload_last(briey_wlast),
    
    .io_out_cxl_axi_b_valid(briey_bvalid),
    .io_out_cxl_axi_b_ready(briey_bready),
    .io_out_cxl_axi_b_payload_id(briey_bid),
    .io_out_cxl_axi_b_payload_resp(briey_bresp),
    
    .io_out_cxl_axi_ar_valid(briey_arvalid),
    .io_out_cxl_axi_ar_ready(briey_arready),
    .io_out_cxl_axi_ar_payload_addr(briey_araddr),
    .io_out_cxl_axi_ar_payload_id(briey_arid),
    .io_out_cxl_axi_ar_payload_len(briey_arlen),
    .io_out_cxl_axi_ar_payload_size(briey_arsize),
    .io_out_cxl_axi_ar_payload_burst(briey_arburst),
    .io_out_cxl_axi_r_valid(briey_rvalid),
    .io_out_cxl_axi_r_ready(briey_rready),
    .io_out_cxl_axi_r_payload_data(briey_rdata),
    .io_out_cxl_axi_r_payload_id(briey_rid),
    .io_out_cxl_axi_r_payload_resp(briey_rresp),
    .io_out_cxl_axi_r_payload_last(briey_rlast),

    // write riscv ram interface (for loading binarys)
    .io_in_ram_io_arw_valid(program_load_aw_valid),
    .io_in_ram_io_arw_ready(program_load_aw_ready),
    .io_in_ram_io_arw_payload_addr(program_load_aw_payload_addr),
    .io_in_ram_io_arw_payload_id(0),
    .io_in_ram_io_arw_payload_len(0),
    .io_in_ram_io_arw_payload_size(3'b110), // 64B aligned transfer
    .io_in_ram_io_arw_payload_burst(2'b01), // TODO: Why?
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

  cxl_briey_axi cxl_briey_axi_instance (
    .clk(axi4_mm_clk),
    .rstn(axi4_mm_rst_n),
    .core_rst(core_rst),
    .enable(enable),
    .physical_address_base(physical_address_base),
    .briey_awaddr(briey_awaddr),
    .briey_awuser(briey_awuser),
    .briey_awvalid(briey_awvalid),
    .briey_awid(briey_awid),
    .briey_awlen(briey_awlen),
    .briey_awsize(briey_awsize),
    .briey_awburst(briey_awburst),
    .briey_awready(briey_awready),
    .briey_wdata(briey_wdata),
    .briey_wstrb(briey_wstrb),
    .briey_wlast(briey_wlast),
    .briey_wvalid(briey_wvalid),
    .briey_wready(briey_wready),
    .briey_bid(briey_bid),
    .briey_bresp(briey_bresp),
    .briey_bvalid(briey_bvalid),
    .briey_bready(briey_bready),
    .briey_arid(briey_arid),
    .briey_araddr(briey_araddr),
    .briey_arlen(briey_arlen),
    .briey_arsize(briey_arsize),
    .briey_aruser(briey_aruser),
    .briey_arvalid(briey_arvalid),
    .briey_arready(briey_arready),
    .briey_arburst(briey_arburst),
    .briey_rid(briey_rid),
    .briey_rdata(briey_rdata),
    .briey_rresp(briey_rresp),
    .briey_rlast(briey_rlast),
    .briey_rvalid(briey_rvalid),
    .briey_rready(briey_rready),
    .awid(awid),
    .awaddr(awaddr),
    .awlen(awlen),
    .awsize(awsize),
    .awburst(awburst),
    .awprot(awprot),
    .awqos(awqos),
    .awuser(awuser),
    .awvalid(awvalid),
    .awcache(awcache),
    .awlock(awlock),
    .awregion(awregion),
    .awatop(awatop),
    .awready(awready),
    .wdata(wdata),
    .wstrb(wstrb),
    .wlast(wlast),
    .wuser(wuser),
    .wvalid(wvalid),
    .wready(wready),
    .bid(bid),
    .bresp(bresp),
    .buser(buser),
    .bvalid(bvalid),
    .bready(bready),
    .arid(arid),
    .araddr(araddr),
    .arlen(arlen),
    .arsize(arsize),
    .arburst(arburst),
    .arprot(arprot),
    .arqos(arqos),
    .aruser(aruser),
    .arvalid(arvalid),
    .arcache(arcache),
    .arlock(arlock),
    .arregion(arregion),
    .arready(arready),
    .rid(rid),
    .rdata(rdata),
    .rresp(rresp),
    .rlast(rlast),
    .ruser(ruser),
    .rvalid(rvalid),
    .rready(rready)
  );


  always_ff @(posedge axi4_mm_clk) begin
    if(!axi4_mm_rst_n || ctrl_clear_counter) begin
      DEBUG_axi_ar <= 0;
      DEBUG_axi_r <= 0;
      DEBUG_axi_w <= 0;
      DEBUG_axi_aw <= 0;
      DEBUG_axi_b <= 0;
    end else begin
      if(arvalid && arready) DEBUG_axi_ar <= DEBUG_axi_ar + 1;
      if(rvalid && rready) DEBUG_axi_r <= DEBUG_axi_r + 1;
      if(awvalid && awready) DEBUG_axi_aw <= DEBUG_axi_aw + 1;
      if(wvalid && wready) DEBUG_axi_w <= DEBUG_axi_w + 1;
      if(bvalid && bready) DEBUG_axi_b <= DEBUG_axi_b + 1;
    end
  end
endmodule
