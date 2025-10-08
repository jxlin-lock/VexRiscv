`timescale 1ns / 100ps

module riscv_bench;
reg  clk;
reg rst;

always begin
    clk = ~clk; 
    #2;
end

// program load signals
reg           program_load_en;
wire          program_load_aw_valid;
wire          program_load_aw_ready;
wire [14:0]   program_load_aw_payload_addr;
wire          program_load_w_valid;
wire          program_load_w_ready;
wire  [511:0] program_load_w_payload_data;
wire  [63:0]  program_load_w_payload_strb;

initial begin
    $dumpfile("wave.vcd");   // for GTKWave
    $dumpvars(0, riscv_bench);
    clk = 0;
    rst = 1;

    program_load_en = 0;
    
    #100;
    rst = 0;   // run riscv core

    #8000; // reset core
    rst = 1;

    # 100;
    // hold core reset, reload program
    program_load_en = 1;

    # 800;
    program_load_en = 0; // finish loading program

    # 80;   // de-reset core, run new program
    rst = 0;


    repeat(1000) @(negedge clk);
    $finish;
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

    program_loader program_loader_inst (
    .clk(clk),
    .program_load_en(program_load_en),
    .program_load_aw_valid(program_load_aw_valid),
    .program_load_aw_ready(program_load_aw_ready),
    .program_load_aw_payload_addr(program_load_aw_payload_addr),
    .program_load_w_valid(program_load_w_valid),
    .program_load_w_ready(program_load_w_ready),
    .program_load_w_payload_data(program_load_w_payload_data),
    .program_load_w_payload_strb(program_load_w_payload_strb)
    );

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
    .rready                                (axi_rready),

    .program_load_en(program_load_en), // if program_load_en is high, the ram will be de_reset and program is loaded to ram
    .program_load_aw_valid(program_load_aw_valid),
    .program_load_aw_ready(program_load_aw_ready),
    .program_load_aw_payload_addr(program_load_aw_payload_addr),
    .program_load_w_valid(program_load_w_valid),
    .program_load_w_ready(program_load_w_ready),
    .program_load_w_payload_data(program_load_w_payload_data),
    .program_load_w_payload_strb(program_load_w_payload_strb)
    );


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


    initial begin
        # 800;
        while(1) begin
            @(posedge clk);
            if(axi_awready && axi_awvalid) begin
                // $display("[%10t] awaddr %016x", $time, axi_awaddr);
            end

            if(axi_wready && axi_wvalid) begin
                // $display("[%10t] wdata  %016x", $time, axi_wdata);
                $display("[%10t] wstrb  %016b", $time, axi_wstrb);
            end
        end
    end

endmodule


module program_loader(
    input        clk,
    input        program_load_en,
    output reg   program_load_aw_valid,
    input        program_load_aw_ready,
    output reg [14:0]  program_load_aw_payload_addr,
    output reg   program_load_w_valid,
    input        program_load_w_ready,
    output reg [511:0] program_load_w_payload_data,
    output reg [63:0]  program_load_w_payload_strb
);
  reg [7:0] program_file [0:2047];
  integer file_handle;
  initial begin
    $readmemb("cxl_flash_converted.bin", program_file);
  end

 reg[19:0] w_load_addr;
 reg[19:0] aw_load_addr;

always@(posedge clk) begin
    if (!program_load_en) begin
        w_load_addr <= 0;
        aw_load_addr <= 0;
    end 
    else begin
        if (program_load_w_valid & program_load_w_ready) begin
            w_load_addr <= w_load_addr + 64;
        end
        if (program_load_aw_valid & program_load_aw_ready) begin
            aw_load_addr <= aw_load_addr + 64;
        end
    end
end

always_comb begin
    program_load_aw_valid = (aw_load_addr < 2048) && program_load_en;
    program_load_aw_payload_addr = aw_load_addr[14:0];

    program_load_w_payload_strb = 64'hFFFFFFFFFFFFFFFF;
    program_load_w_valid = (w_load_addr < 2048) && program_load_en;
    program_load_w_payload_data = {program_file[w_load_addr + 63], 
                                           program_file[w_load_addr + 62],
                                           program_file[w_load_addr + 61],
                                           program_file[w_load_addr + 60],
                                           program_file[w_load_addr + 59],
                                           program_file[w_load_addr + 58],
                                           program_file[w_load_addr + 57],
                                           program_file[w_load_addr + 56],
                                           program_file[w_load_addr + 55],
                                           program_file[w_load_addr + 54],
                                           program_file[w_load_addr + 53],
                                           program_file[w_load_addr + 52],
                                           program_file[w_load_addr + 51],
                                           program_file[w_load_addr + 50],
                                           program_file[w_load_addr + 49],
                                           program_file[w_load_addr + 48],
                                           program_file[w_load_addr + 47],
                                           program_file[w_load_addr + 46],
                                           program_file[w_load_addr + 45],
                                           program_file[w_load_addr + 44],
                                           program_file[w_load_addr + 43],
                                           program_file[w_load_addr + 42],
                                           program_file[w_load_addr + 41],
                                           program_file[w_load_addr + 40],
                                           program_file[w_load_addr + 39],
                                           program_file[w_load_addr + 38],
                                           program_file[w_load_addr + 37],
                                           program_file[w_load_addr + 36],
                                           program_file[w_load_addr + 35],
                                           program_file[w_load_addr + 34],
                                           program_file[w_load_addr + 33],
                                           program_file[w_load_addr + 32],
                                           program_file[w_load_addr + 31],
                                           program_file[w_load_addr + 30],
                                           program_file[w_load_addr + 29],
                                           program_file[w_load_addr + 28],
                                           program_file[w_load_addr + 27],
                                           program_file[w_load_addr + 26],
                                           program_file[w_load_addr + 25],
                                           program_file[w_load_addr + 24],
                                           program_file[w_load_addr + 23],
                                           program_file[w_load_addr + 22],
                                           program_file[w_load_addr + 21],
                                           program_file[w_load_addr + 20],
                                           program_file[w_load_addr + 19],
                                           program_file[w_load_addr + 18],
                                           program_file[w_load_addr + 17],
                                           program_file[w_load_addr + 16],
                                           program_file[w_load_addr + 15],
                                           program_file[w_load_addr + 14],
                                           program_file[w_load_addr + 13],
                                           program_file[w_load_addr + 12],
                                           program_file[w_load_addr + 11],
                                           program_file[w_load_addr + 10],
                                           program_file[w_load_addr + 9],
                                           program_file[w_load_addr + 8],
                                           program_file[w_load_addr + 7],
                                           program_file[w_load_addr + 6],
                                           program_file[w_load_addr + 5],
                                           program_file[w_load_addr + 4],
                                           program_file[w_load_addr + 3],
                                           program_file[w_load_addr + 2],
                                           program_file[w_load_addr + 1],
                                           program_file[w_load_addr + 0]};
    
end


endmodule