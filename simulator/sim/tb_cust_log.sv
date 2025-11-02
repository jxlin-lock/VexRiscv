module tb_cust_log;
    
    logic clk;
    logic rstn;
	
	logic [3:0] log_operation_mode;
	logic [5:0] log_awuser_reg;
	logic [63:0] log_write_base_addr;

	logic [63:0] stat_h0;
	logic [63:0] stat_h1;
	logic [63:0] stat_d0;
	logic [63:0] stat_d1;

	logic [11:0]               awid;
	logic [63:0]               awaddr; 
	logic [5:0]                awuser;
	logic                      awvalid;
	logic                      awready;

	logic [511:0]              wdata;
	logic [(512/8)-1:0]        wstrb;
	logic                      wlast;
	logic                      wvalid;
	logic                      wready;

	logic [11:0]                     bid;
	logic [1:0]                      bresp;
	logic [3:0]                      buser;
	logic                            bvalid;
	logic                     bready;


    logic                        ip2cafu_axisth0_tvalid;
    logic  [71:0]                ip2cafu_axisth0_tdata;  
    logic                        cafu2ip_axisth0_tready;


    // logic                        ip2cafu_axisth1_tvalid;
    // logic  [71:0]                ip2cafu_axisth1_tdata;
    // logic                        cafu2ip_axisth1_tready;

    // logic                        ip2cafu_axistd0_tvalid;
    // logic  [71:0]                ip2cafu_axistd0_tdata; 
    // logic                        cafu2ip_axistd0_tready;
   

    // logic                        ip2cafu_axistd1_tvalid;
    // logic  [71:0]                ip2cafu_axistd1_tdata;
    // logic                        cafu2ip_axistd1_tready;

    initial begin
        clk = 0;
        forever #1 clk = !clk;
    end

    initial begin
        rstn = 0;
        repeat(20) @(posedge clk);
        @(negedge clk);
        rstn = 1;
    end

    initial begin: main_block
        log_operation_mode = 0;
        log_awuser_reg = 0;
        log_write_base_addr = 64'hbeef_dead_0000_0000;

        awready = 0;
        wready = 0;
        
        bid = 0;
        bresp = 0;
        buser = 0;
        bvalid = 0;

        ip2cafu_axisth0_tvalid = 0;
        ip2cafu_axisth0_tdata = 0;

        repeat(10) @(posedge clk);
        wait(rstn == 1);
        @(negedge clk);
        
        ip2cafu_axisth0_tvalid = 1;

        repeat(100) @(posedge clk);
        log_operation_mode = 1;

        fork: fork_block
            begin
                while(1) begin
                    @(negedge clk);
                    awready = 1;
                    for(int i = 0; i < $random % 25; i++) begin
                        @(negedge clk);
                        awready = 0;
                    end
                end
            end
            begin
                while(1) begin
                    @(negedge clk);
                    wready = 1;
                    for(int i = 0; i < $random % 7; i++) begin
                        @(negedge clk);
                        wready = 0;
                    end
                end
            end
            begin
                int i = 0;
                ip2cafu_axisth0_tvalid = 1;
                while(i < 7 * 64) begin
                    @(posedge clk);
                    if(cafu2ip_axisth0_tready) begin
                        @(negedge clk);
                        i++;
                        ip2cafu_axisth0_tdata = ip2cafu_axisth0_tdata + 1;
                    end
                end
                @(negedge clk);
                ip2cafu_axisth0_tvalid = 0;
            end

            begin: b_block
                int rnd;
                logic [31:0] id_taken;
                id_taken = 0;
                while(1) begin
                    bvalid = id_taken != 0;
                    @(posedge clk);
                    if(awvalid && awready) id_taken[awid[4:0]] = 1;
                    if(bready && bvalid) id_taken[bid] = 0;
                    @(negedge clk);
                    rnd = $random % 32;
                    for(int i = rnd; i < rnd + 32; i++) begin
                        if(id_taken[i] == 1) begin
                            bid = i;
                            break;
                        end
                    end
                end
            end
        join_any

        repeat(100) @(posedge clk);
        $finish;
    end

    initial begin
        while(1) begin
            @(posedge clk);
            // $display("awvalid %0d awready %0d wvalid %0d wready %0d line_index: %0d", awvalid, awready, wvalid, wready, uut.line_index);
            $display("uut.id_taken: %b id_taken: %b", uut.id_taken, main_block.fork_block.b_block.id_taken);
        end
    end

    initial begin
        while(1) begin
            @(posedge clk);
            if(awvalid && awready) begin
                $display("[%10t] awaddr %16x awid %6d", $time, awaddr, awid);
            end

            if(wvalid && wready) begin
                $display("[%10t] wdata[71:0]    %0x", $time, wdata[71:0]);
                $display("[%10t] wdata[143:72]  %0x", $time, wdata[143:72]);
                $display("[%10t] wdata[215:144] %0x", $time, wdata[215:144]);
                $display("[%10t] wdata[287:216] %0x", $time, wdata[287:216]);
                $display("[%10t] wdata[359:288] %0x", $time, wdata[359:288]);
                $display("[%10t] wdata[431:360] %0x", $time, wdata[431:360]);
                $display("[%10t] wdata[503:432] %0x", $time, wdata[503:432]);
                $display("[%10t] wdata[511:504] %0x", $time, wdata[511:504]);
            end

            if(bvalid && bready) begin
                $display("[%10t] bid %6d", $time, bid);
            end
        end
    end

    cafu_log uut(
        .clk(clk),
        .rstn(rstn),
        
        .log_operation_mode(log_operation_mode),
        .log_awuser_reg(log_awuser_reg),
        .log_write_base_addr(log_write_base_addr),

        .stat_h0(stat_h0),
        .stat_h1(stat_h1),
        .stat_d0(stat_d0),
        .stat_d1(stat_d1),

        .awid(awid),
        .awaddr(awaddr), 
        .awuser(awuser),
        .awvalid(awvalid),
        .awready(awready),

        .wdata(wdata),
        .wstrb(wstrb),
        .wlast(wlast),
        .wvalid(wvalid),
        .wready(wready),

        .bid(bid),
        .bresp(bresp),
        .buser(buser),
        .bvalid(bvalid),
        .bready(bready),

        .ip2cafu_axisth0_tvalid(ip2cafu_axisth0_tvalid),
        .ip2cafu_axisth0_tdata(ip2cafu_axisth0_tdata),  
        .cafu2ip_axisth0_tready(cafu2ip_axisth0_tready)
    );

endmodule