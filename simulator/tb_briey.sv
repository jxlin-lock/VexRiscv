`timescale 1ns / 100ps

module tb_briey;

    logic          io_asyncReset;
    logic          io_axiClk;
    logic          io_vgaClk;
    logic          io_jtag_tms;
    logic          io_jtag_tdi;
    logic          io_jtag_tdo;
    logic          io_jtag_tck;
    logic          io_coreInterrupt;
    logic          io_out_cxl_axi_aw_valid;
    logic          io_out_cxl_axi_aw_ready;
    logic [28:0]   io_out_cxl_axi_aw_payload_addr;
    logic [11:0]   io_out_cxl_axi_aw_payload_id;
    logic [7:0]    io_out_cxl_axi_aw_payload_len;
    logic [2:0]    io_out_cxl_axi_aw_payload_size;
    logic [1:0]    io_out_cxl_axi_aw_payload_burst;
    logic          io_out_cxl_axi_w_valid;
    logic          io_out_cxl_axi_w_ready;
    logic [511:0]  io_out_cxl_axi_w_payload_data;
    logic [63:0]   io_out_cxl_axi_w_payload_strb;
    logic          io_out_cxl_axi_w_payload_last;
    logic          io_out_cxl_axi_b_valid;
    logic          io_out_cxl_axi_b_ready;
    logic [11:0]   io_out_cxl_axi_b_payload_id;
    logic [1:0]    io_out_cxl_axi_b_payload_resp;
    logic          io_out_cxl_axi_ar_valid;
    logic          io_out_cxl_axi_ar_ready;
    logic [28:0]   io_out_cxl_axi_ar_payload_addr;
    logic [11:0]   io_out_cxl_axi_ar_payload_id;
    logic [7:0]    io_out_cxl_axi_ar_payload_len;
    logic [2:0]    io_out_cxl_axi_ar_payload_size;
    logic [1:0]    io_out_cxl_axi_ar_payload_burst;
    logic          io_out_cxl_axi_r_valid;
    logic          io_out_cxl_axi_r_ready;
    logic [511:0]  io_out_cxl_axi_r_payload_data;
    logic [11:0]   io_out_cxl_axi_r_payload_id;
    logic [1:0]    io_out_cxl_axi_r_payload_resp;
    logic          io_out_cxl_axi_r_payload_last;
    logic          io_out_reg_axi_aw_valid;
    logic          io_out_reg_axi_aw_ready;
    logic [9:0]    io_out_reg_axi_aw_payload_addr;
    logic [7:0]    io_out_reg_axi_aw_payload_len;
    logic [2:0]    io_out_reg_axi_aw_payload_size;
    logic [1:0]    io_out_reg_axi_aw_payload_burst;
    logic          io_out_reg_axi_w_valid;
    logic          io_out_reg_axi_w_ready;
    logic [511:0]  io_out_reg_axi_w_payload_data;
    logic [63:0]   io_out_reg_axi_w_payload_strb;
    logic          io_out_reg_axi_w_payload_last;
    logic          io_out_reg_axi_b_valid;
    logic          io_out_reg_axi_b_ready;
    logic [1:0]    io_out_reg_axi_b_payload_resp;
    logic          io_out_reg_axi_ar_valid;
    logic          io_out_reg_axi_ar_ready;
    logic [9:0]    io_out_reg_axi_ar_payload_addr;
    logic [7:0]    io_out_reg_axi_ar_payload_len;
    logic [2:0]    io_out_reg_axi_ar_payload_size;
    logic [1:0]    io_out_reg_axi_ar_payload_burst;
    logic          io_out_reg_axi_r_valid;
    logic          io_out_reg_axi_r_ready;
    logic [511:0]  io_out_reg_axi_r_payload_data;
    logic [1:0]    io_out_reg_axi_r_payload_resp;
    logic          io_out_reg_axi_r_payload_last;
    logic          io_in_ram_io_arw_valid;
    logic          io_in_ram_io_arw_ready;
    logic [14:0]   io_in_ram_io_arw_payload_addr;
    logic [3:0]    io_in_ram_io_arw_payload_id;
    logic [7:0]    io_in_ram_io_arw_payload_len;
    logic [2:0]    io_in_ram_io_arw_payload_size;
    logic [1:0]    io_in_ram_io_arw_payload_burst;
    logic          io_in_ram_io_arw_payload_write;
    logic          io_in_ram_io_w_valid;
    logic          io_in_ram_io_w_ready;
    logic [511:0]  io_in_ram_io_w_payload_data;
    logic [63:0]   io_in_ram_io_w_payload_strb;
    logic          io_in_ram_io_w_payload_last;
    logic          io_in_ram_io_b_valid;
    logic          io_in_ram_io_b_ready;
    logic [3:0]    io_in_ram_io_b_payload_id;
    logic [1:0]    io_in_ram_io_b_payload_resp;
    logic          io_in_ram_io_r_valid;
    logic          io_in_ram_io_r_ready;
    logic [511:0]  io_in_ram_io_r_payload_data;
    logic [3:0]    io_in_ram_io_r_payload_id;
    logic [1:0]    io_in_ram_io_r_payload_resp;
    logic          io_in_ram_io_r_payload_last;
    logic          io_in_enable_ram_reload;
    
    Briey uut (
        .io_asyncReset(io_asyncReset),
        .io_axiClk(io_axiClk),
        .io_vgaClk(io_vgaClk),
        .io_jtag_tms(io_jtag_tms),
        .io_jtag_tdi(io_jtag_tdi),
        .io_jtag_tdo(io_jtag_tdo),
        .io_jtag_tck(io_jtag_tck),
        .io_coreInterrupt(io_coreInterrupt),
        .io_out_cxl_axi_aw_valid(io_out_cxl_axi_aw_valid),
        .io_out_cxl_axi_aw_ready(io_out_cxl_axi_aw_ready),
        .io_out_cxl_axi_aw_payload_addr(io_out_cxl_axi_aw_payload_addr),
        .io_out_cxl_axi_aw_payload_id(io_out_cxl_axi_aw_payload_id),
        .io_out_cxl_axi_aw_payload_len(io_out_cxl_axi_aw_payload_len),
        .io_out_cxl_axi_aw_payload_size(io_out_cxl_axi_aw_payload_size),
        .io_out_cxl_axi_aw_payload_burst(io_out_cxl_axi_aw_payload_burst),
        .io_out_cxl_axi_w_valid(io_out_cxl_axi_w_valid),
        .io_out_cxl_axi_w_ready(io_out_cxl_axi_w_ready),
        .io_out_cxl_axi_w_payload_data(io_out_cxl_axi_w_payload_data),
        .io_out_cxl_axi_w_payload_strb(io_out_cxl_axi_w_payload_strb),
        .io_out_cxl_axi_w_payload_last(io_out_cxl_axi_w_payload_last),
        .io_out_cxl_axi_b_valid(io_out_cxl_axi_b_valid),
        .io_out_cxl_axi_b_ready(io_out_cxl_axi_b_ready),
        .io_out_cxl_axi_b_payload_id(io_out_cxl_axi_b_payload_id),
        .io_out_cxl_axi_b_payload_resp(io_out_cxl_axi_b_payload_resp),
        .io_out_cxl_axi_ar_valid(io_out_cxl_axi_ar_valid),
        .io_out_cxl_axi_ar_ready(io_out_cxl_axi_ar_ready),
        .io_out_cxl_axi_ar_payload_addr(io_out_cxl_axi_ar_payload_addr),
        .io_out_cxl_axi_ar_payload_id(io_out_cxl_axi_ar_payload_id),
        .io_out_cxl_axi_ar_payload_len(io_out_cxl_axi_ar_payload_len),
        .io_out_cxl_axi_ar_payload_size(io_out_cxl_axi_ar_payload_size),
        .io_out_cxl_axi_ar_payload_burst(io_out_cxl_axi_ar_payload_burst),
        .io_out_cxl_axi_r_valid(io_out_cxl_axi_r_valid),
        .io_out_cxl_axi_r_ready(io_out_cxl_axi_r_ready),
        .io_out_cxl_axi_r_payload_data(io_out_cxl_axi_r_payload_data),
        .io_out_cxl_axi_r_payload_id(io_out_cxl_axi_r_payload_id),
        .io_out_cxl_axi_r_payload_resp(io_out_cxl_axi_r_payload_resp),
        .io_out_cxl_axi_r_payload_last(io_out_cxl_axi_r_payload_last),
        // .io_out_reg_axi_aw_valid(io_out_reg_axi_aw_valid),
        // .io_out_reg_axi_aw_ready(io_out_reg_axi_aw_ready),
        // .io_out_reg_axi_aw_payload_addr(io_out_reg_axi_aw_payload_addr),
        // .io_out_reg_axi_aw_payload_len(io_out_reg_axi_aw_payload_len),
        // .io_out_reg_axi_aw_payload_size(io_out_reg_axi_aw_payload_size),
        // .io_out_reg_axi_aw_payload_burst(io_out_reg_axi_aw_payload_burst),
        // .io_out_reg_axi_w_valid(io_out_reg_axi_w_valid),
        // .io_out_reg_axi_w_ready(io_out_reg_axi_w_ready),
        // .io_out_reg_axi_w_payload_data(io_out_reg_axi_w_payload_data),
        // .io_out_reg_axi_w_payload_strb(io_out_reg_axi_w_payload_strb),
        // .io_out_reg_axi_w_payload_last(io_out_reg_axi_w_payload_last),
        // .io_out_reg_axi_b_valid(io_out_reg_axi_b_valid),
        // .io_out_reg_axi_b_ready(io_out_reg_axi_b_ready),
        // .io_out_reg_axi_b_payload_resp(io_out_reg_axi_b_payload_resp),
        // .io_out_reg_axi_ar_valid(io_out_reg_axi_ar_valid),
        // .io_out_reg_axi_ar_ready(io_out_reg_axi_ar_ready),
        // .io_out_reg_axi_ar_payload_addr(io_out_reg_axi_ar_payload_addr),
        // .io_out_reg_axi_ar_payload_len(io_out_reg_axi_ar_payload_len),
        // .io_out_reg_axi_ar_payload_size(io_out_reg_axi_ar_payload_size),
        // .io_out_reg_axi_ar_payload_burst(io_out_reg_axi_ar_payload_burst),
        // .io_out_reg_axi_r_valid(io_out_reg_axi_r_valid),
        // .io_out_reg_axi_r_ready(io_out_reg_axi_r_ready),
        // .io_out_reg_axi_r_payload_data(io_out_reg_axi_r_payload_data),
        // .io_out_reg_axi_r_payload_resp(io_out_reg_axi_r_payload_resp),
        // .io_out_reg_axi_r_payload_last(io_out_reg_axi_r_payload_last),
        .io_in_ram_io_arw_valid(io_in_ram_io_arw_valid),
        .io_in_ram_io_arw_ready(io_in_ram_io_arw_ready),
        .io_in_ram_io_arw_payload_addr(io_in_ram_io_arw_payload_addr),
        .io_in_ram_io_arw_payload_id(io_in_ram_io_arw_payload_id),
        .io_in_ram_io_arw_payload_len(io_in_ram_io_arw_payload_len),
        .io_in_ram_io_arw_payload_size(io_in_ram_io_arw_payload_size),
        .io_in_ram_io_arw_payload_burst(io_in_ram_io_arw_payload_burst),
        .io_in_ram_io_arw_payload_write(io_in_ram_io_arw_payload_write),
        .io_in_ram_io_w_valid(io_in_ram_io_w_valid),
        .io_in_ram_io_w_ready(io_in_ram_io_w_ready),
        .io_in_ram_io_w_payload_data(io_in_ram_io_w_payload_data),
        .io_in_ram_io_w_payload_strb(io_in_ram_io_w_payload_strb),
        .io_in_ram_io_w_payload_last(io_in_ram_io_w_payload_last),
        .io_in_ram_io_b_valid(io_in_ram_io_b_valid),
        .io_in_ram_io_b_ready(io_in_ram_io_b_ready),
        .io_in_ram_io_b_payload_id(io_in_ram_io_b_payload_id),
        .io_in_ram_io_b_payload_resp(io_in_ram_io_b_payload_resp),
        .io_in_ram_io_r_valid(io_in_ram_io_r_valid),
        .io_in_ram_io_r_ready(io_in_ram_io_r_ready),
        .io_in_ram_io_r_payload_data(io_in_ram_io_r_payload_data),
        .io_in_ram_io_r_payload_id(io_in_ram_io_r_payload_id),
        .io_in_ram_io_r_payload_resp(io_in_ram_io_r_payload_resp),
        .io_in_ram_io_r_payload_last(io_in_ram_io_r_payload_last),
        .io_in_enable_ram_reload(io_in_enable_ram_reload)
    );

    logic clk;
    logic rst;
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        rst = 1;
        io_jtag_tms = 0;
        io_jtag_tdi = 0;
        io_jtag_tck = 0;
        io_coreInterrupt = 0;
        io_out_cxl_axi_aw_ready = 0;
        io_out_cxl_axi_w_ready = 0;

        io_out_cxl_axi_b_payload_resp = 0;
        io_out_cxl_axi_ar_ready = 0;
        io_out_cxl_axi_r_valid = 0;
        io_out_cxl_axi_r_payload_data = 0;
        io_out_cxl_axi_r_payload_id = 0;
        io_out_cxl_axi_r_payload_resp = 0;
        io_out_cxl_axi_r_payload_last = 0;
        io_out_reg_axi_aw_ready = 0;
        io_out_reg_axi_w_ready = 0;
        io_out_reg_axi_b_valid = 0;
        io_out_reg_axi_b_payload_resp = 0;
        io_out_reg_axi_ar_ready = 0;
        io_out_reg_axi_r_valid = 0;
        io_out_reg_axi_r_payload_data = 0;
        io_out_reg_axi_r_payload_resp = 0;
        io_out_reg_axi_r_payload_last = 0;
        io_in_ram_io_arw_valid = 0;
        io_in_ram_io_arw_payload_addr = 0;
        io_in_ram_io_arw_payload_id = 0;
        io_in_ram_io_arw_payload_len = 0;
        io_in_ram_io_arw_payload_size = 0;
        io_in_ram_io_arw_payload_burst = 0;
        io_in_ram_io_arw_payload_write = 0;
        io_in_ram_io_w_valid = 0;
        io_in_ram_io_w_payload_data = 0;
        io_in_ram_io_w_payload_strb = 0;
        io_in_ram_io_w_payload_last = 0;
        io_in_ram_io_b_ready = 0;
        io_in_ram_io_r_ready = 0;
        io_in_enable_ram_reload = 0;
        
        repeat(1000) @(posedge clk);
        rst = 0;
        io_out_cxl_axi_aw_ready = 1;
        io_out_cxl_axi_w_ready = 1;
        io_out_cxl_axi_ar_ready = 1;

        repeat(100000) @(posedge clk);
        $finish;
    end


    initial begin
        while(1) begin
            @(posedge clk);
            if(io_out_cxl_axi_aw_valid && io_out_cxl_axi_aw_ready) $display("[%10t] awaddr %016x awid %016x", $time, io_out_cxl_axi_aw_payload_addr, io_out_cxl_axi_aw_payload_id);
            if(io_out_cxl_axi_w_valid && io_out_cxl_axi_w_ready) $display("[%10t] wdata %016x wlast %0d", $time, io_out_cxl_axi_w_payload_data[63:0], io_out_cxl_axi_w_payload_last);
            if(io_out_cxl_axi_b_valid && io_out_cxl_axi_b_ready) $display("[%10t] bid %016x", $time, io_in_ram_io_b_payload_id);

            if(io_out_cxl_axi_ar_valid && io_out_cxl_axi_ar_ready) $display("[%10t] araddr %016x arid %016x", $time, io_out_cxl_axi_ar_payload_addr, io_out_cxl_axi_ar_payload_id);
            if(io_out_cxl_axi_r_valid && io_out_cxl_axi_r_ready) $display("[%10t]  rdata %016x rid %0d", $time, io_out_cxl_axi_r_payload_data, io_out_cxl_axi_r_payload_id);
            // if(io_out_cxl_axi_aw_valid) $display("[%10t] %016x", $time, io_out_cxl_axi_aw_payload_addr);
        end
    end

    mailbox #(logic[11:0]) m_bid = new();
    initial begin
        while(1) begin
            @(posedge clk);
            if(io_out_cxl_axi_aw_valid && io_out_cxl_axi_aw_ready) m_bid.put(io_out_cxl_axi_aw_payload_id);
        end
    end

    initial begin
        logic [11:0] id;
        io_out_cxl_axi_b_valid = 0;
        io_out_cxl_axi_b_payload_id = 0;
        while(1) begin
            @(negedge clk);
            if(m_bid.try_get(io_out_cxl_axi_b_payload_id)) begin
                @(negedge clk);
                for(int i = 0 ; i < 1000; i++) @(negedge clk);
                io_out_cxl_axi_b_valid = 1;
                
                while(1) begin
                    @(posedge clk);
                    if(io_out_cxl_axi_b_ready) break;
                end
                @(negedge clk);
                io_out_cxl_axi_b_valid = 0;
            end
        end
    end


    mailbox #(logic[11:0]) m_rid = new();
    initial begin
        while(1) begin
            @(posedge clk);
            if(io_out_cxl_axi_ar_valid && io_out_cxl_axi_ar_ready) m_rid.put(io_out_cxl_axi_ar_payload_id);
        end
    end

    initial begin
        logic [11:0] id;
        io_out_cxl_axi_r_valid = 0;
        io_out_cxl_axi_r_payload_id = 0;
        io_out_cxl_axi_r_payload_last = 1;
        while(1) begin
            @(negedge clk);
            if(m_rid.try_get(io_out_cxl_axi_r_payload_id)) begin
                @(negedge clk);
                for(int i = 0 ; i < 1000; i++) @(negedge clk);
                io_out_cxl_axi_r_valid = 1;
                
                while(1) begin
                    @(posedge clk);
                    if(io_out_cxl_axi_r_ready) break;
                end
                @(negedge clk);
                io_out_cxl_axi_r_valid = 0;
            end
        end
    end

    assign io_asyncReset = rst;
    assign io_axiClk = clk;
    assign io_vgaClk = clk;

endmodule