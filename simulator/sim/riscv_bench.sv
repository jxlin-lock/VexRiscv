`timescale 1ns / 100ps


module riscv_bench;
    logic  clk;
    logic rst;

    always begin
        clk = 0;
        forever #0.5 clk = !clk;
    end
    axil_bus_t axil();



    logic [11:0]               awid;
    logic [63:0]               awaddr; 
    logic [9:0]                awlen;
    logic [2:0]                awsize;
    logic [1:0]                awburst;
    logic [2:0]                awprot;
    logic [3:0]                awqos;
    logic [5:0]                awuser;
    logic                      awvalid;
    logic [3:0]                awcache;
    logic [1:0]                awlock;
    logic [3:0]                awregion;
    logic [5:0]                awatop;
    logic                      awready;

    logic [511:0]              wdata;
    logic [(512/8)-1:0]        wstrb;
    logic                      wlast;
    logic                      wuser;
    logic                      wvalid;
    logic                      wready;

    logic [11:0]                bid;
    logic [1:0]                 bresp;
    logic [3:0]                 buser;
    logic                       bvalid;
    logic                      bready;

    logic [11:0]               arid;
    logic [63:0]               araddr;
    logic [9:0]                arlen;
    logic [2:0]                arsize;
    logic [1:0]                arburst;
    logic [2:0]                arprot;
    logic [3:0]                arqos;
    logic [4:0]                aruser;
    logic                      arvalid;
    logic [3:0]                arcache;
    logic [1:0]                arlock;
    logic [3:0]                arregion;
    logic                      arready;

    logic [11:0]                rid;
    logic [511:0]               rdata;
    logic [1:0]                 rresp;
    logic                       rlast;
    logic                       ruser;
    logic                       rvalid;
    logic                      rready;


    logic ctrl_enable;
    logic ctrl_ready;

    logic [63:0] ctrl_base_h0;
    logic [63:0] ctrl_base_h1;

    logic [63:0] ctrl_high_h0;
    logic [63:0] ctrl_high_h1;

    logic ctrl_clear_counter;
    logic [63:0] h0_counter;
    logic [63:0] h1_counter;

    logic dbg_h0_rdy;
    logic dbg_h1_rdy;
    logic dbg_axi_rdy;

    localparam ID_WIDTH = 20;


    Briey_Wrap #(
    ) uut (
        .axi4_mm_clk                           (clk), 
        .axi4_mm_rst_n                         (!rst),
        .axil(axil),

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


        // .ctrl_enable(ctrl_enable),
        // .ctrl_ready(ctrl_ready),

        // .ctrl_base_h0(ctrl_base_h0),
        // .ctrl_base_h1(ctrl_base_h1),

        // .ctrl_high_h0(ctrl_high_h0),
        // .ctrl_high_h1(ctrl_high_h1),

        // .ctrl_clear_counter(ctrl_clear_counter),
        // .h0_counter(h0_counter),
        // .h1_counter(h1_counter),

        // .dbg_h0_rdy(dbg_h0_rdy),
        // .dbg_h1_rdy(dbg_h1_rdy),
        // .dbg_axi_rdy(dbg_axi_rdy)
    );


    // axi_ram #(
    //     .DATA_WIDTH(512),
    //     .ADDR_WIDTH(64),
    //     .PIPELINE_OUTPUT(0),
    //     .ID_WIDTH(12)
    // )
    // axi_ram_inst (
    //     .clk(clk),
    //     .rst(rst),
    //     .s_axi_awid(awid),
    //     .s_axi_awaddr(awaddr),
    //     .s_axi_awlen(awlen),
    //     .s_axi_awsize(awsize),
    //     .s_axi_awburst(awburst),
    //     .s_axi_awlock(awlock),
    //     .s_axi_awcache(awcache),
    //     .s_axi_awprot(awprot),
    //     .s_axi_awvalid(awvalid),
    //     .s_axi_awready(awready),
    //     .s_axi_wdata(wdata),
    //     .s_axi_wstrb(wstrb),
    //     .s_axi_wlast(wlast),
    //     .s_axi_wvalid(wvalid),
    //     .s_axi_wready(wready),
    //     .s_axi_bid(bid),
    //     .s_axi_bresp(bresp),
    //     .s_axi_bvalid(bvalid),
    //     .s_axi_bready(bready),
    //     .s_axi_arid(arid),
    //     .s_axi_araddr(araddr),
    //     .s_axi_arlen(arlen),
    //     .s_axi_arsize(arsize),
    //     .s_axi_arburst(arburst),
    //     .s_axi_arlock(arlock),
    //     .s_axi_arcache(arcache),
    //     .s_axi_arprot(arprot),
    //     .s_axi_arvalid(arvalid),
    //     .s_axi_arready(arready),
    //     .s_axi_rid(rid),
    //     .s_axi_rdata(rdata),
    //     .s_axi_rresp(rresp),
    //     .s_axi_rlast(rlast),
    //     .s_axi_rvalid(rvalid),
    //     .s_axi_rready(rready)
    // );


    initial begin
        while(1) begin
            @(posedge clk);
            // $display(" wready %0d  wvalid %0d", wready, wvalid);
            // $display("awready %0d awvalid %0d", awready, awvalid);
            // $display("arready %0d arvalid %0d", arready, arvalid);

            // if(uut.enable) begin
            //     $display("%x %x %x", uut.cxl_briey_axi_instance.physical_address_base, uut.cxl_briey_axi_instance.briey_awaddr, uut.cxl_briey_axi_instance.physical_address_base + uut.cxl_briey_axi_instance.briey_awaddr);
            // end

            // if(uut.briey_inst.io_out_cxl_axi_aw_valid)
            //     $display("[%10t] uut.awaddr %016x", $time, uut.briey_inst.io_out_cxl_axi_aw_payload_addr);

            if(awready && awvalid) begin
                $display("[%10t] awaddr %016x awid %0d awburst %b ", $time, awaddr, awid, awburst);
            end

            if(wready && wvalid) begin
                $display("[%10t] wdata  %016x wstrb %016x wlast %0d", $time, wdata[63:0], wstrb, wlast);
            end

            if(bready && bvalid) begin
                $display("[%10t] bvalid", $time);
            end

            if(arready && arvalid) begin
                $display("[%10t] araddr %016x arid %0d arburst %b", $time, araddr, awid, arburst);
            end

            if(rready && rvalid) begin
                $display("[%10t] rdata  %016x  rid %0d rlast %0d", $time, rdata, rid, rlast);
            end

            // if(uut.briey_bvalid && uut.briey_bready) begin
            //     $display("[%10t] bid %0d", $time, uut.briey_bid);
            // end
        end
    end


    task axil_WR(logic[31:0] addr, logic[63:0] data);
        @(negedge clk);
        axil.awvalid = 1;
        axil.awaddr = addr;
        while(1) begin
            @(posedge clk);
            if(axil.awready) break;
        end
        @(negedge clk);
        axil.awvalid = 0;
        axil.wvalid = 1;
        axil.wdata = data;
        while(1) begin
            @(posedge clk);
            if(axil.wready) break;
        end
        @(negedge clk);
        axil.wvalid = 0;
        @(negedge clk);
    endtask

    initial begin
        // awready = 0;
        // wready = 0;
        // arready = 0;

        

        axil.awvalid = 0;
        axil.wvalid = 0;
        axil.bready = 1;

        rst = 1;
        
        repeat(1000) @(negedge clk);
        $display("Done reset");

        awready = 1;
        wready = 1;
        arready = 1;

        rst = 0;
        // axil_WR('h20, 'h4000000);
        axil_WR('h40, 1);
        axil_WR('h10, 1);

        repeat(10000) @(negedge clk);
        $finish;
    end

    mailbox #(logic[11:0]) m = new();
    mailbox #(logic[11:0]) m_rid = new();
    initial begin
        while(1) begin
            @(posedge clk);
            if(awvalid && awready) m.put(awid);
        end
    end
    
    initial begin
        while(1) begin
            @(posedge clk);
            if(arvalid && arready) m_rid.put(arid);
        end
    end


    initial begin
        logic [11:0] id;
        bvalid = 0;
        bid = 0;
        while(1) begin
            @(negedge clk);
            if(m.try_get(bid)) begin
                @(negedge clk);
                for(int i = 0 ; i < 1000; i++) @(negedge clk);
                bvalid = 1;
                
                while(1) begin
                    @(posedge clk);
                    if(bready) break;
                end
                @(negedge clk);
                bvalid = 0;
            end
        end
    end


    initial begin
        logic [11:0] id;
        rvalid = 0;
                
        rid = 0;
        rdata = 0;
        rresp = 0;
        rlast = 1;
        ruser = 0;

        while(1) begin
            @(negedge clk);
            if(m_rid.try_get(rid)) begin
                @(negedge clk);
                for(int i = 0 ; i < 1000; i++) @(negedge clk);
                rvalid = 1;
                while(1) begin
                    @(posedge clk);
                    if(bready) break;
                end
                @(negedge clk);
                rvalid = 0;
            end
        end
    end
endmodule

