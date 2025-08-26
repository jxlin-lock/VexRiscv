`timescale 1ns / 100ps

module riscv_bench;
reg  clk;
reg rst;
reg start;
always begin
    clk = ~clk; 
    #2;
end
reg    [23:0]                                   write_reg_addr;
reg    [511:0]                                  write_reg_data;
reg                                             write_reg_enabled;


reg [71:0]                ip2cafu_axisth1_tdata;
reg ip2cafu_axisth1_tvalid;
wire cafu2ip_axisth1_tready;
initial begin
    $dumpfile("wave.vcd");   // for GTKWave
    $dumpvars(0, riscv_bench);
    clk = 0;
    rst = 1;
    start = 0;
    ip2cafu_axisth1_tvalid = 0;
    
    #100;
    rst = 0;

    #100;
    write_reg_addr = 23'h9000; // dest cxl
    write_reg_data = 512'h0;
    write_reg_enabled = 1;
    #4;
    write_reg_enabled = 0;


    #100;
    write_reg_addr = 23'hf000; // addr
    write_reg_data = 512'h40000;
    write_reg_enabled = 1;
    #4;
    write_reg_enabled = 0;


    #100;
    write_reg_addr = 23'h8500; // awuser
    write_reg_data = 512'h000000;
    write_reg_enabled = 1;
    #4;
    write_reg_enabled = 0;
    
    #100;
    write_reg_addr = 23'h8600; // awuser
    write_reg_data = 512'h400000;
    write_reg_enabled = 1;
    #4;
    write_reg_enabled = 0;


    #800;


end


        wire [12-1:0]    axi_awid;
        wire [64-1:0]  axi_awaddr;
        wire [14:0]  riscv_axi_awaddr;
        wire [7:0]                 axi_awlen;
        wire [2:0]                 axi_awsize;
        wire [1:0]                 axi_awburst;
        wire [1:0]                 axi_awlock;
        wire [3:0]                 axi_awcache;
        wire [2:0]                 axi_awprot;
        wire                       axi_awvalid;
        wire                       axi_awready;
        wire [512-1:0]  axi_wdata;
        wire [64-1:0]  axi_wstrb;
        wire                       axi_wlast;
        wire                       axi_wvalid;
        wire                       axi_wready;
        wire [12-1:0]    axi_bid;
        wire [1:0]                 axi_bresp;
        wire                       axi_bvalid;
        wire                       axi_bready;
        wire [12-1:0]    axi_arid;
        wire [64-1:0]  axi_araddr;
        wire [14:0]  riscv_axi_araddr;
        wire [7:0]                 axi_arlen;
        wire [2:0]                 axi_arsize;
        wire [1:0]                 axi_arburst;
        wire [1:0]                 axi_arlock;
        wire [3:0]                 axi_arcache;
        wire [2:0]                 axi_arprot;
        wire                       axi_arvalid;
        wire                       axi_arready;
        wire [12-1:0]    axi_rid;
        wire [512-1:0]  axi_rdata;
        wire [1:0]                 axi_rresp;
        wire                       axi_rlast;
        wire                       axi_rvalid;
        wire                       axi_rready;

        localparam ID_WIDTH = 20;

    Briey_Wrap #(
    ) briey_inst (
// Clocks
    .axi4_mm_clk                           (clk), 
    // Resets
    .axi4_mm_rst_n                         (!rst),

    // AXI-MM interface - write address channel
    .awid                                  (axi_awid),
    .awaddr                                (axi_awaddr), 
    .awlen                                 (axi_awlen),
    .awsize                                (axi_awsize),
    .awburst                               (axi_awburst),
    .awprot                                (axi_awprot),
    .awvalid                               (axi_awvalid),
    .awcache                               (axi_awcache),
    .awlock                                (axi_awlock),
    .awready                               (axi_awready),
    
    // AXI-MM interface - write data channel
    .wdata                                 (axi_wdata),
    .wstrb                                 (axi_wstrb),
    .wlast                                 (axi_wlast),
    .wvalid                                (axi_wvalid),
    .wready                                (axi_wready),
    
    //  AXI-MM interface - write response channel
    .bid                                  (axi_bid),
    .bresp                                (axi_bresp),
    .bvalid                               (axi_bvalid),
    .bready                               (axi_bready),
    
    // AXI-MM interface - read address channel
    .arid                                  (axi_arid),
    .araddr                                (axi_araddr),
    .arlen                                 (axi_arlen),
    .arsize                                (axi_arsize),
    .arburst                               (axi_arburst),
    .arprot                                (axi_arprot),
    .arvalid                               (axi_arvalid),
    .arcache                               (axi_arcache),
    .arlock                                (axi_arlock),
    .arready                               (axi_arready),

    // AXI-MM interface - read response channel
    .rid                                   (axi_rid),
    .rdata                                 (axi_rdata),
    .rresp                                 (axi_rresp),
    .rlast                                 (axi_rlast),
    .rvalid                                (axi_rvalid),
    .rready                                (axi_rready)
    );


    // Briey #()
    // briey_inst (
    //     .io_asyncReset (rst),
    //     .io_axiClk (clk),
    //     .io_vgaClk (clk),
    //     .io_jtag_tms (1'b0),
    //     .io_jtag_tdi (1'b0),
    //     .io_jtag_tdo (),
    //     .io_jtag_tck (1'b0),
        
    //     .io_coreInterrupt (1'b0),

    //     .io_out_cxl_axi_aw_valid(axi_awvalid),
    //     .io_out_cxl_axi_aw_ready(axi_awready),
    //     .io_out_cxl_axi_aw_payload_addr(riscv_axi_awaddr), // RISVcore address range 14bits 
    //     .io_out_cxl_axi_aw_payload_id(axi_awid),
    //     .io_out_cxl_axi_aw_payload_len(axi_awlen),
    //     .io_out_cxl_axi_aw_payload_size(axi_awsize),
    //     .io_out_cxl_axi_aw_payload_burst(axi_awburst),

    //     .io_out_cxl_axi_w_valid(axi_wvalid),
    //     .io_out_cxl_axi_w_ready(axi_wready),
    //     .io_out_cxl_axi_w_payload_data(axi_wdata),
    //     .io_out_cxl_axi_w_payload_strb(axi_wstrb),
    //     .io_out_cxl_axi_w_payload_last(axi_wlast),
    //     .io_out_cxl_axi_b_valid(axi_bvalid),
    //     .io_out_cxl_axi_b_ready(axi_bready),
    //     .io_out_cxl_axi_b_payload_id(axi_bid),
    //     .io_out_cxl_axi_b_payload_resp(axi_bresp),

    //     .io_out_cxl_axi_ar_valid(axi_arvalid),
    //     .io_out_cxl_axi_ar_ready(axi_arready),
    //     .io_out_cxl_axi_ar_payload_addr(riscv_axi_araddr),
    //     .io_out_cxl_axi_ar_payload_id(axi_arid),
    //     .io_out_cxl_axi_ar_payload_len(axi_arlen),
    //     .io_out_cxl_axi_ar_payload_size(axi_arsize),
    //     .io_out_cxl_axi_ar_payload_burst(axi_arburst),
    //     .io_out_cxl_axi_r_valid(axi_rvalid),
    //     .io_out_cxl_axi_r_ready(axi_rready),
    //     .io_out_cxl_axi_r_payload_data(axi_rdata),
    //     .io_out_cxl_axi_r_payload_id(axi_rid),
    //     .io_out_cxl_axi_r_payload_resp(axi_rresp),
    //     .io_out_cxl_axi_r_payload_last(axi_rlast)
    // );


    // assign axi_awaddr = {49'b0, riscv_axi_awaddr}; // byte address
    // assign axi_araddr = {49'b0, riscv_axi_araddr}; // byte address

    // assign axi_awlock = 1'b0;
    // assign axi_awcache = 4'b0011;
    // assign axi_awprot = 3'b000;
    // assign axi_arlock = 1'b0;
    // assign axi_arcache = 4'b0011;
    // assign axi_arprot = 3'b000;



    axi_ram #(
        .DATA_WIDTH(512),
        .ADDR_WIDTH(64),
        .PIPELINE_OUTPUT(0),
        .ID_WIDTH(12)
    )
    axi_ram_inst (
        .clk(clk),
        .rst(rst),
        .s_axi_awid(axi_awid),
        .s_axi_awaddr(axi_awaddr),
        .s_axi_awlen(axi_awlen),
        .s_axi_awsize(axi_awsize),
        .s_axi_awburst(axi_awburst),
        .s_axi_awlock(axi_awlock),
        .s_axi_awcache(axi_awcache),
        .s_axi_awprot(axi_awprot),
        .s_axi_awvalid(axi_awvalid),
        .s_axi_awready(axi_awready),
        .s_axi_wdata(axi_wdata),
        .s_axi_wstrb(axi_wstrb),
        .s_axi_wlast(axi_wlast),
        .s_axi_wvalid(axi_wvalid),
        .s_axi_wready(axi_wready),
        .s_axi_bid(axi_bid),
        .s_axi_bresp(axi_bresp),
        .s_axi_bvalid(axi_bvalid),
        .s_axi_bready(axi_bready),
        .s_axi_arid(axi_arid),
        .s_axi_araddr(axi_araddr),
        .s_axi_arlen(axi_arlen),
        .s_axi_arsize(axi_arsize),
        .s_axi_arburst(axi_arburst),
        .s_axi_arlock(axi_arlock),
        .s_axi_arcache(axi_arcache),
        .s_axi_arprot(axi_arprot),
        .s_axi_arvalid(axi_arvalid),
        .s_axi_arready(axi_arready),
        .s_axi_rid(axi_rid),
        .s_axi_rdata(axi_rdata),
        .s_axi_rresp(axi_rresp),
        .s_axi_rlast(axi_rlast),
        .s_axi_rvalid(axi_rvalid),
        .s_axi_rready(axi_rready)
    );

endmodule
