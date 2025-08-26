// Generator : SpinalHDL v1.12.0    git head : 1aa7d7b5732f11cca2dd83bacc2a4cb92ca8e5c9
// Component : Briey
// Git hash  : 718dcc736ebeb92d381c23b77c49c235b478d3b3

`timescale 1ns/1ps

module Briey (
  input  wire          io_asyncReset,
  input  wire          io_axiClk,
  input  wire          io_vgaClk,
  input  wire          io_jtag_tms,
  input  wire          io_jtag_tdi,
  output wire          io_jtag_tdo,
  input  wire          io_jtag_tck,
  input  wire          io_coreInterrupt,
  output wire          io_out_cxl_axi_aw_valid,
  input  wire          io_out_cxl_axi_aw_ready,
  output wire [14:0]   io_out_cxl_axi_aw_payload_addr,
  output wire [11:0]   io_out_cxl_axi_aw_payload_id,
  output wire [7:0]    io_out_cxl_axi_aw_payload_len,
  output wire [2:0]    io_out_cxl_axi_aw_payload_size,
  output wire [1:0]    io_out_cxl_axi_aw_payload_burst,
  output wire          io_out_cxl_axi_w_valid,
  input  wire          io_out_cxl_axi_w_ready,
  output wire [511:0]  io_out_cxl_axi_w_payload_data,
  output wire [63:0]   io_out_cxl_axi_w_payload_strb,
  output wire          io_out_cxl_axi_w_payload_last,
  input  wire          io_out_cxl_axi_b_valid,
  output wire          io_out_cxl_axi_b_ready,
  input  wire [11:0]   io_out_cxl_axi_b_payload_id,
  input  wire [1:0]    io_out_cxl_axi_b_payload_resp,
  output wire          io_out_cxl_axi_ar_valid,
  input  wire          io_out_cxl_axi_ar_ready,
  output wire [14:0]   io_out_cxl_axi_ar_payload_addr,
  output wire [11:0]   io_out_cxl_axi_ar_payload_id,
  output wire [7:0]    io_out_cxl_axi_ar_payload_len,
  output wire [2:0]    io_out_cxl_axi_ar_payload_size,
  output wire [1:0]    io_out_cxl_axi_ar_payload_burst,
  input  wire          io_out_cxl_axi_r_valid,
  output wire          io_out_cxl_axi_r_ready,
  input  wire [511:0]  io_out_cxl_axi_r_payload_data,
  input  wire [11:0]   io_out_cxl_axi_r_payload_id,
  input  wire [1:0]    io_out_cxl_axi_r_payload_resp,
  input  wire          io_out_cxl_axi_r_payload_last
);

  reg                 axi_core_cpu_dBus_cmd_ready;
  wire                axi_core_cpu_dBus_rsp_payload_error;
  wire       [7:0]    axi_core_cpu_debug_bus_cmd_payload_address;
  wire                axi_core_cpu_iBus_rsp_payload_error;
  reg                 dbus_axi_decoder_io_input_r_ready;
  wire       [14:0]   cxl_axi_shared_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire       [14:0]   axi_ram_io_axi_arbiter_io_readInputs_0_ar_payload_addr;
  wire       [14:0]   axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire                axi_ram_io_axi_arbiter_io_output_arw_ready;
  wire       [19:0]   axi_reg_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr;
  wire                axi_reg_io_axi_arbiter_io_output_arw_ready;
  wire                io_asyncReset_buffercc_io_dataOut;
  wire                resetCtrl_axiReset_buffercc_io_dataOut;
  wire                axi_cxl_ram_io_axi_arw_ready;
  wire                axi_cxl_ram_io_axi_w_ready;
  wire                axi_cxl_ram_io_axi_b_valid;
  wire       [11:0]   axi_cxl_ram_io_axi_b_payload_id;
  wire       [1:0]    axi_cxl_ram_io_axi_b_payload_resp;
  wire                axi_cxl_ram_io_axi_r_valid;
  wire       [511:0]  axi_cxl_ram_io_axi_r_payload_data;
  wire       [11:0]   axi_cxl_ram_io_axi_r_payload_id;
  wire       [1:0]    axi_cxl_ram_io_axi_r_payload_resp;
  wire                axi_cxl_ram_io_axi_r_payload_last;
  wire                axi_ram_io_axi_arw_ready;
  wire                axi_ram_io_axi_w_ready;
  wire                axi_ram_io_axi_b_valid;
  wire       [3:0]    axi_ram_io_axi_b_payload_id;
  wire       [1:0]    axi_ram_io_axi_b_payload_resp;
  wire                axi_ram_io_axi_r_valid;
  wire       [511:0]  axi_ram_io_axi_r_payload_data;
  wire       [3:0]    axi_ram_io_axi_r_payload_id;
  wire       [1:0]    axi_ram_io_axi_r_payload_resp;
  wire                axi_ram_io_axi_r_payload_last;
  wire                axi_reg_io_axi_arw_ready;
  wire                axi_reg_io_axi_w_ready;
  wire                axi_reg_io_axi_b_valid;
  wire       [3:0]    axi_reg_io_axi_b_payload_id;
  wire       [1:0]    axi_reg_io_axi_b_payload_resp;
  wire                axi_reg_io_axi_r_valid;
  wire       [511:0]  axi_reg_io_axi_r_payload_data;
  wire       [3:0]    axi_reg_io_axi_r_payload_id;
  wire       [1:0]    axi_reg_io_axi_r_payload_resp;
  wire                axi_reg_io_axi_r_payload_last;
  wire                axi_core_cpu_dBus_cmd_valid;
  wire                axi_core_cpu_dBus_cmd_payload_wr;
  wire                axi_core_cpu_dBus_cmd_payload_uncached;
  wire       [31:0]   axi_core_cpu_dBus_cmd_payload_address;
  wire       [31:0]   axi_core_cpu_dBus_cmd_payload_data;
  wire       [3:0]    axi_core_cpu_dBus_cmd_payload_mask;
  wire       [2:0]    axi_core_cpu_dBus_cmd_payload_size;
  wire                axi_core_cpu_dBus_cmd_payload_last;
  wire                axi_core_cpu_debug_bus_cmd_ready;
  wire       [31:0]   axi_core_cpu_debug_bus_rsp_data;
  wire                axi_core_cpu_debug_resetOut;
  wire                axi_core_cpu_iBus_cmd_valid;
  wire       [31:0]   axi_core_cpu_iBus_cmd_payload_address;
  wire       [2:0]    axi_core_cpu_iBus_cmd_payload_size;
  wire                io_coreInterrupt_buffercc_io_dataOut;
  wire                io_coreInterrupt_buffercc_1_io_dataOut;
  wire                jtagBridge_1_io_jtag_tdo;
  wire                jtagBridge_1_io_remote_cmd_valid;
  wire                jtagBridge_1_io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridge_1_io_remote_cmd_payload_fragment;
  wire                jtagBridge_1_io_remote_rsp_ready;
  wire                systemDebugger_1_io_remote_cmd_ready;
  wire                systemDebugger_1_io_remote_rsp_valid;
  wire                systemDebugger_1_io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1_io_remote_rsp_payload_data;
  wire                systemDebugger_1_io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_data;
  wire                systemDebugger_1_io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1_io_mem_cmd_payload_size;
  wire                axi4ReadOnlyDecoder_1_io_input_ar_ready;
  wire                axi4ReadOnlyDecoder_1_io_input_r_valid;
  wire       [511:0]  axi4ReadOnlyDecoder_1_io_input_r_payload_data;
  wire       [1:0]    axi4ReadOnlyDecoder_1_io_input_r_payload_resp;
  wire                axi4ReadOnlyDecoder_1_io_input_r_payload_last;
  wire                axi4ReadOnlyDecoder_1_io_outputs_0_ar_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_addr;
  wire       [7:0]    axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_len;
  wire       [1:0]    axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_burst;
  wire       [3:0]    axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_1_io_outputs_0_r_ready;
  wire                dbus_axi_decoder_io_input_arw_ready;
  wire                dbus_axi_decoder_io_input_w_ready;
  wire                dbus_axi_decoder_io_input_b_valid;
  wire       [1:0]    dbus_axi_decoder_io_input_b_payload_resp;
  wire                dbus_axi_decoder_io_input_r_valid;
  wire       [511:0]  dbus_axi_decoder_io_input_r_payload_data;
  wire       [1:0]    dbus_axi_decoder_io_input_r_payload_resp;
  wire                dbus_axi_decoder_io_input_r_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_0_arw_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_0_arw_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_0_arw_payload_write;
  wire                dbus_axi_decoder_io_sharedOutputs_0_w_valid;
  wire       [511:0]  dbus_axi_decoder_io_sharedOutputs_0_w_payload_data;
  wire       [63:0]   dbus_axi_decoder_io_sharedOutputs_0_w_payload_strb;
  wire                dbus_axi_decoder_io_sharedOutputs_0_w_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_0_b_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_0_r_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_1_arw_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_1_arw_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_1_arw_payload_write;
  wire                dbus_axi_decoder_io_sharedOutputs_1_w_valid;
  wire       [511:0]  dbus_axi_decoder_io_sharedOutputs_1_w_payload_data;
  wire       [63:0]   dbus_axi_decoder_io_sharedOutputs_1_w_payload_strb;
  wire                dbus_axi_decoder_io_sharedOutputs_1_w_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_1_b_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_1_r_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_2_arw_valid;
  wire       [31:0]   dbus_axi_decoder_io_sharedOutputs_2_arw_payload_addr;
  wire       [7:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_payload_len;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_payload_size;
  wire       [3:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_payload_cache;
  wire       [2:0]    dbus_axi_decoder_io_sharedOutputs_2_arw_payload_prot;
  wire                dbus_axi_decoder_io_sharedOutputs_2_arw_payload_write;
  wire                dbus_axi_decoder_io_sharedOutputs_2_w_valid;
  wire       [511:0]  dbus_axi_decoder_io_sharedOutputs_2_w_payload_data;
  wire       [63:0]   dbus_axi_decoder_io_sharedOutputs_2_w_payload_strb;
  wire                dbus_axi_decoder_io_sharedOutputs_2_w_payload_last;
  wire                dbus_axi_decoder_io_sharedOutputs_2_b_ready;
  wire                dbus_axi_decoder_io_sharedOutputs_2_r_ready;
  wire                cxl_axi_shared_arbiter_io_sharedInputs_0_arw_ready;
  wire                cxl_axi_shared_arbiter_io_sharedInputs_0_w_ready;
  wire                cxl_axi_shared_arbiter_io_sharedInputs_0_b_valid;
  wire       [11:0]   cxl_axi_shared_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    cxl_axi_shared_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                cxl_axi_shared_arbiter_io_sharedInputs_0_r_valid;
  wire       [511:0]  cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [11:0]   cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_last;
  wire                cxl_axi_shared_arbiter_io_output_arw_valid;
  wire       [14:0]   cxl_axi_shared_arbiter_io_output_arw_payload_addr;
  wire       [11:0]   cxl_axi_shared_arbiter_io_output_arw_payload_id;
  wire       [7:0]    cxl_axi_shared_arbiter_io_output_arw_payload_len;
  wire       [2:0]    cxl_axi_shared_arbiter_io_output_arw_payload_size;
  wire       [1:0]    cxl_axi_shared_arbiter_io_output_arw_payload_burst;
  wire                cxl_axi_shared_arbiter_io_output_arw_payload_write;
  wire                cxl_axi_shared_arbiter_io_output_w_valid;
  wire       [511:0]  cxl_axi_shared_arbiter_io_output_w_payload_data;
  wire       [63:0]   cxl_axi_shared_arbiter_io_output_w_payload_strb;
  wire                cxl_axi_shared_arbiter_io_output_w_payload_last;
  wire                cxl_axi_shared_arbiter_io_output_b_ready;
  wire                cxl_axi_shared_arbiter_io_output_r_ready;
  wire                axi_ram_io_axi_arbiter_io_readInputs_0_ar_ready;
  wire                axi_ram_io_axi_arbiter_io_readInputs_0_r_valid;
  wire       [511:0]  axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_data;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_id;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_resp;
  wire                axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_last;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [511:0]  axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                axi_ram_io_axi_arbiter_io_output_arw_valid;
  wire       [14:0]   axi_ram_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_burst;
  wire                axi_ram_io_axi_arbiter_io_output_arw_payload_write;
  wire                axi_ram_io_axi_arbiter_io_output_w_valid;
  wire       [511:0]  axi_ram_io_axi_arbiter_io_output_w_payload_data;
  wire       [63:0]   axi_ram_io_axi_arbiter_io_output_w_payload_strb;
  wire                axi_ram_io_axi_arbiter_io_output_w_payload_last;
  wire                axi_ram_io_axi_arbiter_io_output_b_ready;
  wire                axi_ram_io_axi_arbiter_io_output_r_ready;
  wire                axi_reg_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                axi_reg_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                axi_reg_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [3:0]    axi_reg_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    axi_reg_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                axi_reg_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [511:0]  axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [3:0]    axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                axi_reg_io_axi_arbiter_io_output_arw_valid;
  wire       [19:0]   axi_reg_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    axi_reg_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    axi_reg_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    axi_reg_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    axi_reg_io_axi_arbiter_io_output_arw_payload_burst;
  wire                axi_reg_io_axi_arbiter_io_output_arw_payload_write;
  wire                axi_reg_io_axi_arbiter_io_output_w_valid;
  wire       [511:0]  axi_reg_io_axi_arbiter_io_output_w_payload_data;
  wire       [63:0]   axi_reg_io_axi_arbiter_io_output_w_payload_strb;
  wire                axi_reg_io_axi_arbiter_io_output_w_payload_last;
  wire                axi_reg_io_axi_arbiter_io_output_b_ready;
  wire                axi_reg_io_axi_arbiter_io_output_r_ready;
  wire       [63:0]   _zz_dbus_axi_w_payload_strb;
  wire                cxl_axi_shared_arw_valid;
  wire                cxl_axi_shared_arw_ready;
  wire       [14:0]   cxl_axi_shared_arw_payload_addr;
  wire       [11:0]   cxl_axi_shared_arw_payload_id;
  wire       [7:0]    cxl_axi_shared_arw_payload_len;
  wire       [2:0]    cxl_axi_shared_arw_payload_size;
  wire       [1:0]    cxl_axi_shared_arw_payload_burst;
  wire                cxl_axi_shared_arw_payload_write;
  wire                cxl_axi_shared_w_valid;
  wire                cxl_axi_shared_w_ready;
  wire       [511:0]  cxl_axi_shared_w_payload_data;
  wire       [63:0]   cxl_axi_shared_w_payload_strb;
  wire                cxl_axi_shared_w_payload_last;
  wire                cxl_axi_shared_b_valid;
  wire                cxl_axi_shared_b_ready;
  wire       [11:0]   cxl_axi_shared_b_payload_id;
  wire       [1:0]    cxl_axi_shared_b_payload_resp;
  wire                cxl_axi_shared_r_valid;
  wire                cxl_axi_shared_r_ready;
  wire       [511:0]  cxl_axi_shared_r_payload_data;
  wire       [11:0]   cxl_axi_shared_r_payload_id;
  wire       [1:0]    cxl_axi_shared_r_payload_resp;
  wire                cxl_axi_shared_r_payload_last;
  reg                 resetCtrl_systemResetUnbuffered;
  reg        [5:0]    resetCtrl_systemResetCounter;
  wire       [5:0]    _zz_when_Briey_l219;
  wire                when_Briey_l219;
  wire                when_Briey_l223;
  reg                 resetCtrl_systemReset;
  reg                 resetCtrl_axiReset;
  wire                resetCtrl_vgaReset;
  wire                dbus_axi_arw_valid;
  wire                dbus_axi_arw_ready;
  wire       [31:0]   dbus_axi_arw_payload_addr;
  wire       [7:0]    dbus_axi_arw_payload_len;
  wire       [2:0]    dbus_axi_arw_payload_size;
  wire       [3:0]    dbus_axi_arw_payload_cache;
  wire       [2:0]    dbus_axi_arw_payload_prot;
  wire                dbus_axi_arw_payload_write;
  wire                dbus_axi_w_valid;
  wire                dbus_axi_w_ready;
  reg        [511:0]  dbus_axi_w_payload_data;
  wire       [63:0]   dbus_axi_w_payload_strb;
  wire                dbus_axi_w_payload_last;
  wire                dbus_axi_b_valid;
  wire                dbus_axi_b_ready;
  wire       [1:0]    dbus_axi_b_payload_resp;
  wire                dbus_axi_r_valid;
  wire                dbus_axi_r_ready;
  wire       [511:0]  dbus_axi_r_payload_data;
  wire       [1:0]    dbus_axi_r_payload_resp;
  wire                dbus_axi_r_payload_last;
  wire                dBus_cmd_stage_valid;
  reg                 dBus_cmd_stage_ready;
  wire                dBus_cmd_stage_payload_wr;
  wire                dBus_cmd_stage_payload_uncached;
  wire       [31:0]   dBus_cmd_stage_payload_address;
  wire       [31:0]   dBus_cmd_stage_payload_data;
  wire       [3:0]    dBus_cmd_stage_payload_mask;
  wire       [2:0]    dBus_cmd_stage_payload_size;
  wire                dBus_cmd_stage_payload_last;
  reg                 dBus_cmd_rValid;
  reg                 dBus_cmd_rData_wr;
  reg                 dBus_cmd_rData_uncached;
  reg        [31:0]   dBus_cmd_rData_address;
  reg        [31:0]   dBus_cmd_rData_data;
  reg        [3:0]    dBus_cmd_rData_mask;
  reg        [2:0]    dBus_cmd_rData_size;
  reg                 dBus_cmd_rData_last;
  wire                when_Stream_l399;
  wire                dBus_cmd_stage_stage_valid;
  wire                dBus_cmd_stage_stage_ready;
  wire                dBus_cmd_stage_stage_payload_wr;
  wire                dBus_cmd_stage_stage_payload_uncached;
  wire       [31:0]   dBus_cmd_stage_stage_payload_address;
  wire       [31:0]   dBus_cmd_stage_stage_payload_data;
  wire       [3:0]    dBus_cmd_stage_stage_payload_mask;
  wire       [2:0]    dBus_cmd_stage_stage_payload_size;
  wire                dBus_cmd_stage_stage_payload_last;
  reg                 dBus_cmd_stage_rValid;
  reg                 dBus_cmd_stage_rData_wr;
  reg                 dBus_cmd_stage_rData_uncached;
  reg        [31:0]   dBus_cmd_stage_rData_address;
  reg        [31:0]   dBus_cmd_stage_rData_data;
  reg        [3:0]    dBus_cmd_stage_rData_mask;
  reg        [2:0]    dBus_cmd_stage_rData_size;
  reg                 dBus_cmd_stage_rData_last;
  wire                when_Stream_l399_1;
  wire                dBusToAxi4Shared_cmdPreFork_valid;
  wire                dBusToAxi4Shared_cmdPreFork_ready;
  wire                dBusToAxi4Shared_cmdPreFork_payload_wr;
  wire                dBusToAxi4Shared_cmdPreFork_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_cmdPreFork_payload_address;
  wire       [31:0]   dBusToAxi4Shared_cmdPreFork_payload_data;
  wire       [3:0]    dBusToAxi4Shared_cmdPreFork_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_cmdPreFork_payload_size;
  wire                dBusToAxi4Shared_cmdPreFork_payload_last;
  reg                 dBus_cmd_stage_stage_rValidN;
  reg                 dBus_cmd_stage_stage_rData_wr;
  reg                 dBus_cmd_stage_stage_rData_uncached;
  reg        [31:0]   dBus_cmd_stage_stage_rData_address;
  reg        [31:0]   dBus_cmd_stage_stage_rData_data;
  reg        [3:0]    dBus_cmd_stage_stage_rData_mask;
  reg        [2:0]    dBus_cmd_stage_stage_rData_size;
  reg                 dBus_cmd_stage_stage_rData_last;
  wire                dBusToAxi4Shared_cmdPreFork_fire;
  wire                when_Utils_l716;
  wire                dbus_axi_b_fire;
  reg                 dBusToAxi4Shared_pendingWrites_incrementIt;
  reg                 dBusToAxi4Shared_pendingWrites_decrementIt;
  wire       [2:0]    dBusToAxi4Shared_pendingWrites_valueNext;
  reg        [2:0]    dBusToAxi4Shared_pendingWrites_value;
  wire                dBusToAxi4Shared_pendingWrites_mayOverflow;
  wire                dBusToAxi4Shared_pendingWrites_mayUnderflow;
  wire                dBusToAxi4Shared_pendingWrites_willOverflowIfInc;
  wire                dBusToAxi4Shared_pendingWrites_willOverflow;
  wire                dBusToAxi4Shared_pendingWrites_willUnderflowIfDec;
  wire                dBusToAxi4Shared_pendingWrites_willUnderflow;
  reg        [2:0]    dBusToAxi4Shared_pendingWrites_finalIncrement;
  wire                when_Utils_l751;
  wire                when_Utils_l753;
  wire                dBusToAxi4Shared_hazard;
  wire                _zz_dBusToAxi4Shared_cmdPreFork_ready;
  wire                dBusToAxi4Shared_cmdPreFork_haltWhen_valid;
  reg                 dBusToAxi4Shared_cmdPreFork_haltWhen_ready;
  wire                dBusToAxi4Shared_cmdPreFork_haltWhen_payload_wr;
  wire                dBusToAxi4Shared_cmdPreFork_haltWhen_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_cmdPreFork_haltWhen_payload_address;
  wire       [31:0]   dBusToAxi4Shared_cmdPreFork_haltWhen_payload_data;
  wire       [3:0]    dBusToAxi4Shared_cmdPreFork_haltWhen_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_cmdPreFork_haltWhen_payload_size;
  wire                dBusToAxi4Shared_cmdPreFork_haltWhen_payload_last;
  wire                dBusToAxi4Shared_cmdFork_valid;
  reg                 dBusToAxi4Shared_cmdFork_ready;
  wire                dBusToAxi4Shared_cmdFork_payload_wr;
  wire                dBusToAxi4Shared_cmdFork_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_cmdFork_payload_address;
  wire       [31:0]   dBusToAxi4Shared_cmdFork_payload_data;
  wire       [3:0]    dBusToAxi4Shared_cmdFork_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_cmdFork_payload_size;
  wire                dBusToAxi4Shared_cmdFork_payload_last;
  wire                dBusToAxi4Shared_dataFork_valid;
  reg                 dBusToAxi4Shared_dataFork_ready;
  wire                dBusToAxi4Shared_dataFork_payload_wr;
  wire                dBusToAxi4Shared_dataFork_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_dataFork_payload_address;
  wire       [31:0]   dBusToAxi4Shared_dataFork_payload_data;
  wire       [3:0]    dBusToAxi4Shared_dataFork_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_dataFork_payload_size;
  wire                dBusToAxi4Shared_dataFork_payload_last;
  reg                 dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0;
  reg                 dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1;
  wire                when_Stream_l1119;
  wire                when_Stream_l1119_1;
  wire                dBusToAxi4Shared_cmdFork_fire;
  wire                dBusToAxi4Shared_dataFork_fire;
  reg                 _zz_1;
  reg                 dBusToAxi4Shared_cmdStage_valid;
  wire                dBusToAxi4Shared_cmdStage_ready;
  wire                dBusToAxi4Shared_cmdStage_payload_wr;
  wire                dBusToAxi4Shared_cmdStage_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_cmdStage_payload_address;
  wire       [31:0]   dBusToAxi4Shared_cmdStage_payload_data;
  wire       [3:0]    dBusToAxi4Shared_cmdStage_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_cmdStage_payload_size;
  wire                dBusToAxi4Shared_cmdStage_payload_last;
  wire                when_Stream_l486;
  reg                 dBusToAxi4Shared_dataStage_valid;
  wire                dBusToAxi4Shared_dataStage_ready;
  wire                dBusToAxi4Shared_dataStage_payload_wr;
  wire                dBusToAxi4Shared_dataStage_payload_uncached;
  wire       [31:0]   dBusToAxi4Shared_dataStage_payload_address;
  wire       [31:0]   dBusToAxi4Shared_dataStage_payload_data;
  wire       [3:0]    dBusToAxi4Shared_dataStage_payload_mask;
  wire       [2:0]    dBusToAxi4Shared_dataStage_payload_size;
  wire                dBusToAxi4Shared_dataStage_payload_last;
  reg                 debug_resetOut_regNext;
  wire                debug_bus_cmd_fire;
  reg                 debug_bus_cmd_fire_regNext;
  wire                io_outputs_0_ar_validPipe_valid;
  wire                io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   io_outputs_0_ar_validPipe_payload_addr;
  wire       [7:0]    io_outputs_0_ar_validPipe_payload_len;
  wire       [1:0]    io_outputs_0_ar_validPipe_payload_burst;
  wire       [3:0]    io_outputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    io_outputs_0_ar_validPipe_payload_prot;
  reg                 io_outputs_0_ar_rValid;
  wire                io_outputs_0_ar_validPipe_fire;
  wire                io_sharedOutputs_0_arw_validPipe_valid;
  wire                io_sharedOutputs_0_arw_validPipe_ready;
  wire       [31:0]   io_sharedOutputs_0_arw_validPipe_payload_addr;
  wire       [7:0]    io_sharedOutputs_0_arw_validPipe_payload_len;
  wire       [2:0]    io_sharedOutputs_0_arw_validPipe_payload_size;
  wire       [3:0]    io_sharedOutputs_0_arw_validPipe_payload_cache;
  wire       [2:0]    io_sharedOutputs_0_arw_validPipe_payload_prot;
  wire                io_sharedOutputs_0_arw_validPipe_payload_write;
  reg                 io_sharedOutputs_0_arw_rValid;
  wire                io_sharedOutputs_0_arw_validPipe_fire;
  wire                io_sharedOutputs_1_arw_validPipe_valid;
  wire                io_sharedOutputs_1_arw_validPipe_ready;
  wire       [31:0]   io_sharedOutputs_1_arw_validPipe_payload_addr;
  wire       [7:0]    io_sharedOutputs_1_arw_validPipe_payload_len;
  wire       [2:0]    io_sharedOutputs_1_arw_validPipe_payload_size;
  wire       [3:0]    io_sharedOutputs_1_arw_validPipe_payload_cache;
  wire       [2:0]    io_sharedOutputs_1_arw_validPipe_payload_prot;
  wire                io_sharedOutputs_1_arw_validPipe_payload_write;
  reg                 io_sharedOutputs_1_arw_rValid;
  wire                io_sharedOutputs_1_arw_validPipe_fire;
  wire                io_sharedOutputs_2_arw_validPipe_valid;
  wire                io_sharedOutputs_2_arw_validPipe_ready;
  wire       [31:0]   io_sharedOutputs_2_arw_validPipe_payload_addr;
  wire       [7:0]    io_sharedOutputs_2_arw_validPipe_payload_len;
  wire       [2:0]    io_sharedOutputs_2_arw_validPipe_payload_size;
  wire       [3:0]    io_sharedOutputs_2_arw_validPipe_payload_cache;
  wire       [2:0]    io_sharedOutputs_2_arw_validPipe_payload_prot;
  wire                io_sharedOutputs_2_arw_validPipe_payload_write;
  reg                 io_sharedOutputs_2_arw_rValid;
  wire                io_sharedOutputs_2_arw_validPipe_fire;
  wire                io_input_r_stage_valid;
  wire                io_input_r_stage_ready;
  wire       [511:0]  io_input_r_stage_payload_data;
  wire       [1:0]    io_input_r_stage_payload_resp;
  wire                io_input_r_stage_payload_last;
  reg                 io_input_r_rValid;
  reg        [511:0]  io_input_r_rData_data;
  reg        [1:0]    io_input_r_rData_resp;
  reg                 io_input_r_rData_last;
  wire                when_Stream_l399_2;
  wire       [11:0]   _zz_io_sharedInputs_0_arw_payload_id;
  wire       [2:0]    _zz_io_readInputs_0_ar_payload_id;
  wire       [2:0]    _zz_io_sharedInputs_0_arw_payload_id_1;
  wire                io_output_arw_halfPipe_valid;
  wire                io_output_arw_halfPipe_ready;
  wire       [14:0]   io_output_arw_halfPipe_payload_addr;
  wire       [3:0]    io_output_arw_halfPipe_payload_id;
  wire       [7:0]    io_output_arw_halfPipe_payload_len;
  wire       [2:0]    io_output_arw_halfPipe_payload_size;
  wire       [1:0]    io_output_arw_halfPipe_payload_burst;
  wire                io_output_arw_halfPipe_payload_write;
  reg                 io_output_arw_rValid;
  wire                io_output_arw_halfPipe_fire;
  reg        [14:0]   io_output_arw_rData_addr;
  reg        [3:0]    io_output_arw_rData_id;
  reg        [7:0]    io_output_arw_rData_len;
  reg        [2:0]    io_output_arw_rData_size;
  reg        [1:0]    io_output_arw_rData_burst;
  reg                 io_output_arw_rData_write;
  wire                io_output_w_s2mPipe_valid;
  reg                 io_output_w_s2mPipe_ready;
  wire       [511:0]  io_output_w_s2mPipe_payload_data;
  wire       [63:0]   io_output_w_s2mPipe_payload_strb;
  wire                io_output_w_s2mPipe_payload_last;
  reg                 io_output_w_rValidN;
  reg        [511:0]  io_output_w_rData_data;
  reg        [63:0]   io_output_w_rData_strb;
  reg                 io_output_w_rData_last;
  wire                io_output_w_s2mPipe_m2sPipe_valid;
  wire                io_output_w_s2mPipe_m2sPipe_ready;
  wire       [511:0]  io_output_w_s2mPipe_m2sPipe_payload_data;
  wire       [63:0]   io_output_w_s2mPipe_m2sPipe_payload_strb;
  wire                io_output_w_s2mPipe_m2sPipe_payload_last;
  reg                 io_output_w_s2mPipe_rValid;
  reg        [511:0]  io_output_w_s2mPipe_rData_data;
  reg        [63:0]   io_output_w_s2mPipe_rData_strb;
  reg                 io_output_w_s2mPipe_rData_last;
  wire                when_Stream_l399_3;
  wire       [3:0]    _zz_io_sharedInputs_0_arw_payload_id_2;
  wire                io_output_arw_halfPipe_valid_1;
  wire                io_output_arw_halfPipe_ready_1;
  wire       [19:0]   io_output_arw_halfPipe_payload_addr_1;
  wire       [3:0]    io_output_arw_halfPipe_payload_id_1;
  wire       [7:0]    io_output_arw_halfPipe_payload_len_1;
  wire       [2:0]    io_output_arw_halfPipe_payload_size_1;
  wire       [1:0]    io_output_arw_halfPipe_payload_burst_1;
  wire                io_output_arw_halfPipe_payload_write_1;
  reg                 io_output_arw_rValid_1;
  wire                io_output_arw_halfPipe_fire_1;
  reg        [19:0]   io_output_arw_rData_addr_1;
  reg        [3:0]    io_output_arw_rData_id_1;
  reg        [7:0]    io_output_arw_rData_len_1;
  reg        [2:0]    io_output_arw_rData_size_1;
  reg        [1:0]    io_output_arw_rData_burst_1;
  reg                 io_output_arw_rData_write_1;
  wire                io_output_w_s2mPipe_valid_1;
  reg                 io_output_w_s2mPipe_ready_1;
  wire       [511:0]  io_output_w_s2mPipe_payload_data_1;
  wire       [63:0]   io_output_w_s2mPipe_payload_strb_1;
  wire                io_output_w_s2mPipe_payload_last_1;
  reg                 io_output_w_rValidN_1;
  reg        [511:0]  io_output_w_rData_data_1;
  reg        [63:0]   io_output_w_rData_strb_1;
  reg                 io_output_w_rData_last_1;
  wire                io_output_w_s2mPipe_m2sPipe_valid_1;
  wire                io_output_w_s2mPipe_m2sPipe_ready_1;
  wire       [511:0]  io_output_w_s2mPipe_m2sPipe_payload_data_1;
  wire       [63:0]   io_output_w_s2mPipe_m2sPipe_payload_strb_1;
  wire                io_output_w_s2mPipe_m2sPipe_payload_last_1;
  reg                 io_output_w_s2mPipe_rValid_1;
  reg        [511:0]  io_output_w_s2mPipe_rData_data_1;
  reg        [63:0]   io_output_w_s2mPipe_rData_strb_1;
  reg                 io_output_w_s2mPipe_rData_last_1;
  wire                when_Stream_l399_4;

  assign _zz_dbus_axi_w_payload_strb = {60'd0, dBusToAxi4Shared_dataStage_payload_mask};
  (* keep_hierarchy = "TRUE" *) BufferCC_1 io_asyncReset_buffercc (
    .io_dataIn  (io_asyncReset                    ), //i
    .io_dataOut (io_asyncReset_buffercc_io_dataOut), //o
    .io_axiClk  (io_axiClk                        )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_1 resetCtrl_axiReset_buffercc (
    .io_dataIn  (resetCtrl_axiReset                    ), //i
    .io_dataOut (resetCtrl_axiReset_buffercc_io_dataOut), //o
    .io_axiClk  (io_axiClk                             )  //i
  );
  Axi4SharedOnChipRam axi_cxl_ram (
    .io_axi_arw_valid         (                                        ), //i
    .io_axi_arw_ready         (axi_cxl_ram_io_axi_arw_ready            ), //o
    .io_axi_arw_payload_addr  (                                        ), //i
    .io_axi_arw_payload_id    (                                        ), //i
    .io_axi_arw_payload_len   (                                        ), //i
    .io_axi_arw_payload_size  (                                        ), //i
    .io_axi_arw_payload_burst (                                        ), //i
    .io_axi_arw_payload_write (                                        ), //i
    .io_axi_w_valid           (                                        ), //i
    .io_axi_w_ready           (axi_cxl_ram_io_axi_w_ready              ), //o
    .io_axi_w_payload_data    (                                        ), //i
    .io_axi_w_payload_strb    (                                        ), //i
    .io_axi_w_payload_last    (                                        ), //i
    .io_axi_b_valid           (axi_cxl_ram_io_axi_b_valid              ), //o
    .io_axi_b_ready           (                                        ), //i
    .io_axi_b_payload_id      (axi_cxl_ram_io_axi_b_payload_id[11:0]   ), //o
    .io_axi_b_payload_resp    (axi_cxl_ram_io_axi_b_payload_resp[1:0]  ), //o
    .io_axi_r_valid           (axi_cxl_ram_io_axi_r_valid              ), //o
    .io_axi_r_ready           (                                        ), //i
    .io_axi_r_payload_data    (axi_cxl_ram_io_axi_r_payload_data[511:0]), //o
    .io_axi_r_payload_id      (axi_cxl_ram_io_axi_r_payload_id[11:0]   ), //o
    .io_axi_r_payload_resp    (axi_cxl_ram_io_axi_r_payload_resp[1:0]  ), //o
    .io_axi_r_payload_last    (axi_cxl_ram_io_axi_r_payload_last       ), //o
    .io_axiClk                (io_axiClk                               ), //i
    .resetCtrl_axiReset       (resetCtrl_axiReset                      )  //i
  );
  Axi4SharedOnChipRam_1 axi_ram (
    .io_axi_arw_valid         (io_output_arw_halfPipe_valid                   ), //i
    .io_axi_arw_ready         (axi_ram_io_axi_arw_ready                       ), //o
    .io_axi_arw_payload_addr  (io_output_arw_halfPipe_payload_addr[14:0]      ), //i
    .io_axi_arw_payload_id    (io_output_arw_halfPipe_payload_id[3:0]         ), //i
    .io_axi_arw_payload_len   (io_output_arw_halfPipe_payload_len[7:0]        ), //i
    .io_axi_arw_payload_size  (io_output_arw_halfPipe_payload_size[2:0]       ), //i
    .io_axi_arw_payload_burst (io_output_arw_halfPipe_payload_burst[1:0]      ), //i
    .io_axi_arw_payload_write (io_output_arw_halfPipe_payload_write           ), //i
    .io_axi_w_valid           (io_output_w_s2mPipe_m2sPipe_valid              ), //i
    .io_axi_w_ready           (axi_ram_io_axi_w_ready                         ), //o
    .io_axi_w_payload_data    (io_output_w_s2mPipe_m2sPipe_payload_data[511:0]), //i
    .io_axi_w_payload_strb    (io_output_w_s2mPipe_m2sPipe_payload_strb[63:0] ), //i
    .io_axi_w_payload_last    (io_output_w_s2mPipe_m2sPipe_payload_last       ), //i
    .io_axi_b_valid           (axi_ram_io_axi_b_valid                         ), //o
    .io_axi_b_ready           (axi_ram_io_axi_arbiter_io_output_b_ready       ), //i
    .io_axi_b_payload_id      (axi_ram_io_axi_b_payload_id[3:0]               ), //o
    .io_axi_b_payload_resp    (axi_ram_io_axi_b_payload_resp[1:0]             ), //o
    .io_axi_r_valid           (axi_ram_io_axi_r_valid                         ), //o
    .io_axi_r_ready           (axi_ram_io_axi_arbiter_io_output_r_ready       ), //i
    .io_axi_r_payload_data    (axi_ram_io_axi_r_payload_data[511:0]           ), //o
    .io_axi_r_payload_id      (axi_ram_io_axi_r_payload_id[3:0]               ), //o
    .io_axi_r_payload_resp    (axi_ram_io_axi_r_payload_resp[1:0]             ), //o
    .io_axi_r_payload_last    (axi_ram_io_axi_r_payload_last                  ), //o
    .io_axiClk                (io_axiClk                                      ), //i
    .resetCtrl_axiReset       (resetCtrl_axiReset                             )  //i
  );
  Axi4SharedOnChipRam_2 axi_reg (
    .io_axi_arw_valid         (io_output_arw_halfPipe_valid_1                   ), //i
    .io_axi_arw_ready         (axi_reg_io_axi_arw_ready                         ), //o
    .io_axi_arw_payload_addr  (io_output_arw_halfPipe_payload_addr_1[19:0]      ), //i
    .io_axi_arw_payload_id    (io_output_arw_halfPipe_payload_id_1[3:0]         ), //i
    .io_axi_arw_payload_len   (io_output_arw_halfPipe_payload_len_1[7:0]        ), //i
    .io_axi_arw_payload_size  (io_output_arw_halfPipe_payload_size_1[2:0]       ), //i
    .io_axi_arw_payload_burst (io_output_arw_halfPipe_payload_burst_1[1:0]      ), //i
    .io_axi_arw_payload_write (io_output_arw_halfPipe_payload_write_1           ), //i
    .io_axi_w_valid           (io_output_w_s2mPipe_m2sPipe_valid_1              ), //i
    .io_axi_w_ready           (axi_reg_io_axi_w_ready                           ), //o
    .io_axi_w_payload_data    (io_output_w_s2mPipe_m2sPipe_payload_data_1[511:0]), //i
    .io_axi_w_payload_strb    (io_output_w_s2mPipe_m2sPipe_payload_strb_1[63:0] ), //i
    .io_axi_w_payload_last    (io_output_w_s2mPipe_m2sPipe_payload_last_1       ), //i
    .io_axi_b_valid           (axi_reg_io_axi_b_valid                           ), //o
    .io_axi_b_ready           (axi_reg_io_axi_arbiter_io_output_b_ready         ), //i
    .io_axi_b_payload_id      (axi_reg_io_axi_b_payload_id[3:0]                 ), //o
    .io_axi_b_payload_resp    (axi_reg_io_axi_b_payload_resp[1:0]               ), //o
    .io_axi_r_valid           (axi_reg_io_axi_r_valid                           ), //o
    .io_axi_r_ready           (axi_reg_io_axi_arbiter_io_output_r_ready         ), //i
    .io_axi_r_payload_data    (axi_reg_io_axi_r_payload_data[511:0]             ), //o
    .io_axi_r_payload_id      (axi_reg_io_axi_r_payload_id[3:0]                 ), //o
    .io_axi_r_payload_resp    (axi_reg_io_axi_r_payload_resp[1:0]               ), //o
    .io_axi_r_payload_last    (axi_reg_io_axi_r_payload_last                    ), //o
    .io_axiClk                (io_axiClk                                        ), //i
    .resetCtrl_axiReset       (resetCtrl_axiReset                               )  //i
  );
  VexRiscv axi_core_cpu (
    .dBus_cmd_valid                (axi_core_cpu_dBus_cmd_valid                         ), //o
    .dBus_cmd_ready                (axi_core_cpu_dBus_cmd_ready                         ), //i
    .dBus_cmd_payload_wr           (axi_core_cpu_dBus_cmd_payload_wr                    ), //o
    .dBus_cmd_payload_uncached     (axi_core_cpu_dBus_cmd_payload_uncached              ), //o
    .dBus_cmd_payload_address      (axi_core_cpu_dBus_cmd_payload_address[31:0]         ), //o
    .dBus_cmd_payload_data         (axi_core_cpu_dBus_cmd_payload_data[31:0]            ), //o
    .dBus_cmd_payload_mask         (axi_core_cpu_dBus_cmd_payload_mask[3:0]             ), //o
    .dBus_cmd_payload_size         (axi_core_cpu_dBus_cmd_payload_size[2:0]             ), //o
    .dBus_cmd_payload_last         (axi_core_cpu_dBus_cmd_payload_last                  ), //o
    .dBus_rsp_valid                (dbus_axi_r_valid                                    ), //i
    .dBus_rsp_payload_last         (                                                    ), //i
    .dBus_rsp_payload_data         (dbus_axi_r_payload_data[511:0]                      ), //i
    .dBus_rsp_payload_error        (axi_core_cpu_dBus_rsp_payload_error                 ), //i
    .timerInterrupt                (io_coreInterrupt_buffercc_1_io_dataOut              ), //i
    .externalInterrupt             (io_coreInterrupt_buffercc_io_dataOut                ), //i
    .softwareInterrupt             (1'b0                                                ), //i
    .debug_bus_cmd_valid           (systemDebugger_1_io_mem_cmd_valid                   ), //i
    .debug_bus_cmd_ready           (axi_core_cpu_debug_bus_cmd_ready                    ), //o
    .debug_bus_cmd_payload_wr      (systemDebugger_1_io_mem_cmd_payload_wr              ), //i
    .debug_bus_cmd_payload_address (axi_core_cpu_debug_bus_cmd_payload_address[7:0]     ), //i
    .debug_bus_cmd_payload_data    (systemDebugger_1_io_mem_cmd_payload_data[31:0]      ), //i
    .debug_bus_rsp_data            (axi_core_cpu_debug_bus_rsp_data[31:0]               ), //o
    .debug_resetOut                (axi_core_cpu_debug_resetOut                         ), //o
    .iBus_cmd_valid                (axi_core_cpu_iBus_cmd_valid                         ), //o
    .iBus_cmd_ready                (axi4ReadOnlyDecoder_1_io_input_ar_ready             ), //i
    .iBus_cmd_payload_address      (axi_core_cpu_iBus_cmd_payload_address[31:0]         ), //o
    .iBus_cmd_payload_size         (axi_core_cpu_iBus_cmd_payload_size[2:0]             ), //o
    .iBus_rsp_valid                (axi4ReadOnlyDecoder_1_io_input_r_valid              ), //i
    .iBus_rsp_payload_data         (axi4ReadOnlyDecoder_1_io_input_r_payload_data[511:0]), //i
    .iBus_rsp_payload_error        (axi_core_cpu_iBus_rsp_payload_error                 ), //i
    .io_axiClk                     (io_axiClk                                           ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                                  ), //i
    .resetCtrl_systemReset         (resetCtrl_systemReset                               )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_3 io_coreInterrupt_buffercc (
    .io_dataIn          (io_coreInterrupt                    ), //i
    .io_dataOut         (io_coreInterrupt_buffercc_io_dataOut), //o
    .io_axiClk          (io_axiClk                           ), //i
    .resetCtrl_axiReset (resetCtrl_axiReset                  )  //i
  );
  (* keep_hierarchy = "TRUE" *) BufferCC_3 io_coreInterrupt_buffercc_1 (
    .io_dataIn          (io_coreInterrupt                      ), //i
    .io_dataOut         (io_coreInterrupt_buffercc_1_io_dataOut), //o
    .io_axiClk          (io_axiClk                             ), //i
    .resetCtrl_axiReset (resetCtrl_axiReset                    )  //i
  );
  JtagBridge jtagBridge_1 (
    .io_jtag_tms                    (io_jtag_tms                                      ), //i
    .io_jtag_tdi                    (io_jtag_tdi                                      ), //i
    .io_jtag_tdo                    (jtagBridge_1_io_jtag_tdo                         ), //o
    .io_jtag_tck                    (io_jtag_tck                                      ), //i
    .io_remote_cmd_valid            (jtagBridge_1_io_remote_cmd_valid                 ), //o
    .io_remote_cmd_ready            (systemDebugger_1_io_remote_cmd_ready             ), //i
    .io_remote_cmd_payload_last     (jtagBridge_1_io_remote_cmd_payload_last          ), //o
    .io_remote_cmd_payload_fragment (jtagBridge_1_io_remote_cmd_payload_fragment      ), //o
    .io_remote_rsp_valid            (systemDebugger_1_io_remote_rsp_valid             ), //i
    .io_remote_rsp_ready            (jtagBridge_1_io_remote_rsp_ready                 ), //o
    .io_remote_rsp_payload_error    (systemDebugger_1_io_remote_rsp_payload_error     ), //i
    .io_remote_rsp_payload_data     (systemDebugger_1_io_remote_rsp_payload_data[31:0]), //i
    .io_axiClk                      (io_axiClk                                        ), //i
    .resetCtrl_systemReset          (resetCtrl_systemReset                            )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid            (jtagBridge_1_io_remote_cmd_valid                 ), //i
    .io_remote_cmd_ready            (systemDebugger_1_io_remote_cmd_ready             ), //o
    .io_remote_cmd_payload_last     (jtagBridge_1_io_remote_cmd_payload_last          ), //i
    .io_remote_cmd_payload_fragment (jtagBridge_1_io_remote_cmd_payload_fragment      ), //i
    .io_remote_rsp_valid            (systemDebugger_1_io_remote_rsp_valid             ), //o
    .io_remote_rsp_ready            (jtagBridge_1_io_remote_rsp_ready                 ), //i
    .io_remote_rsp_payload_error    (systemDebugger_1_io_remote_rsp_payload_error     ), //o
    .io_remote_rsp_payload_data     (systemDebugger_1_io_remote_rsp_payload_data[31:0]), //o
    .io_mem_cmd_valid               (systemDebugger_1_io_mem_cmd_valid                ), //o
    .io_mem_cmd_ready               (axi_core_cpu_debug_bus_cmd_ready                 ), //i
    .io_mem_cmd_payload_address     (systemDebugger_1_io_mem_cmd_payload_address[31:0]), //o
    .io_mem_cmd_payload_data        (systemDebugger_1_io_mem_cmd_payload_data[31:0]   ), //o
    .io_mem_cmd_payload_wr          (systemDebugger_1_io_mem_cmd_payload_wr           ), //o
    .io_mem_cmd_payload_size        (systemDebugger_1_io_mem_cmd_payload_size[1:0]    ), //o
    .io_mem_rsp_valid               (debug_bus_cmd_fire_regNext                       ), //i
    .io_mem_rsp_payload             (axi_core_cpu_debug_bus_rsp_data[31:0]            ), //i
    .io_axiClk                      (io_axiClk                                        ), //i
    .resetCtrl_systemReset          (resetCtrl_systemReset                            )  //i
  );
  Axi4ReadOnlyDecoder axi4ReadOnlyDecoder_1 (
    .io_input_ar_valid             (axi_core_cpu_iBus_cmd_valid                                 ), //i
    .io_input_ar_ready             (axi4ReadOnlyDecoder_1_io_input_ar_ready                     ), //o
    .io_input_ar_payload_addr      (axi_core_cpu_iBus_cmd_payload_address[31:0]                 ), //i
    .io_input_ar_payload_len       (8'h0                                                        ), //i
    .io_input_ar_payload_burst     (2'b01                                                       ), //i
    .io_input_ar_payload_cache     (4'b1111                                                     ), //i
    .io_input_ar_payload_prot      (3'b110                                                      ), //i
    .io_input_r_valid              (axi4ReadOnlyDecoder_1_io_input_r_valid                      ), //o
    .io_input_r_ready              (1'b1                                                        ), //i
    .io_input_r_payload_data       (axi4ReadOnlyDecoder_1_io_input_r_payload_data[511:0]        ), //o
    .io_input_r_payload_resp       (axi4ReadOnlyDecoder_1_io_input_r_payload_resp[1:0]          ), //o
    .io_input_r_payload_last       (axi4ReadOnlyDecoder_1_io_input_r_payload_last               ), //o
    .io_outputs_0_ar_valid         (axi4ReadOnlyDecoder_1_io_outputs_0_ar_valid                 ), //o
    .io_outputs_0_ar_ready         (io_outputs_0_ar_validPipe_fire                              ), //i
    .io_outputs_0_ar_payload_addr  (axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_addr[31:0]    ), //o
    .io_outputs_0_ar_payload_len   (axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_len[7:0]      ), //o
    .io_outputs_0_ar_payload_burst (axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_burst[1:0]    ), //o
    .io_outputs_0_ar_payload_cache (axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_cache[3:0]    ), //o
    .io_outputs_0_ar_payload_prot  (axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_prot[2:0]     ), //o
    .io_outputs_0_r_valid          (axi_ram_io_axi_arbiter_io_readInputs_0_r_valid              ), //i
    .io_outputs_0_r_ready          (axi4ReadOnlyDecoder_1_io_outputs_0_r_ready                  ), //o
    .io_outputs_0_r_payload_data   (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_data[511:0]), //i
    .io_outputs_0_r_payload_resp   (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]  ), //i
    .io_outputs_0_r_payload_last   (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_last       ), //i
    .io_axiClk                     (io_axiClk                                                   ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                                          )  //i
  );
  Axi4SharedDecoder dbus_axi_decoder (
    .io_input_arw_valid                   (dbus_axi_arw_valid                                            ), //i
    .io_input_arw_ready                   (dbus_axi_decoder_io_input_arw_ready                           ), //o
    .io_input_arw_payload_addr            (dbus_axi_arw_payload_addr[31:0]                               ), //i
    .io_input_arw_payload_len             (dbus_axi_arw_payload_len[7:0]                                 ), //i
    .io_input_arw_payload_size            (dbus_axi_arw_payload_size[2:0]                                ), //i
    .io_input_arw_payload_cache           (dbus_axi_arw_payload_cache[3:0]                               ), //i
    .io_input_arw_payload_prot            (dbus_axi_arw_payload_prot[2:0]                                ), //i
    .io_input_arw_payload_write           (dbus_axi_arw_payload_write                                    ), //i
    .io_input_w_valid                     (dbus_axi_w_valid                                              ), //i
    .io_input_w_ready                     (dbus_axi_decoder_io_input_w_ready                             ), //o
    .io_input_w_payload_data              (dbus_axi_w_payload_data[511:0]                                ), //i
    .io_input_w_payload_strb              (dbus_axi_w_payload_strb[63:0]                                 ), //i
    .io_input_w_payload_last              (dbus_axi_w_payload_last                                       ), //i
    .io_input_b_valid                     (dbus_axi_decoder_io_input_b_valid                             ), //o
    .io_input_b_ready                     (dbus_axi_b_ready                                              ), //i
    .io_input_b_payload_resp              (dbus_axi_decoder_io_input_b_payload_resp[1:0]                 ), //o
    .io_input_r_valid                     (dbus_axi_decoder_io_input_r_valid                             ), //o
    .io_input_r_ready                     (dbus_axi_decoder_io_input_r_ready                             ), //i
    .io_input_r_payload_data              (dbus_axi_decoder_io_input_r_payload_data[511:0]               ), //o
    .io_input_r_payload_resp              (dbus_axi_decoder_io_input_r_payload_resp[1:0]                 ), //o
    .io_input_r_payload_last              (dbus_axi_decoder_io_input_r_payload_last                      ), //o
    .io_sharedOutputs_0_arw_valid         (dbus_axi_decoder_io_sharedOutputs_0_arw_valid                 ), //o
    .io_sharedOutputs_0_arw_ready         (io_sharedOutputs_0_arw_validPipe_fire                         ), //i
    .io_sharedOutputs_0_arw_payload_addr  (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_addr[31:0]    ), //o
    .io_sharedOutputs_0_arw_payload_len   (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_len[7:0]      ), //o
    .io_sharedOutputs_0_arw_payload_size  (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_size[2:0]     ), //o
    .io_sharedOutputs_0_arw_payload_cache (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_cache[3:0]    ), //o
    .io_sharedOutputs_0_arw_payload_prot  (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_prot[2:0]     ), //o
    .io_sharedOutputs_0_arw_payload_write (dbus_axi_decoder_io_sharedOutputs_0_arw_payload_write         ), //o
    .io_sharedOutputs_0_w_valid           (dbus_axi_decoder_io_sharedOutputs_0_w_valid                   ), //o
    .io_sharedOutputs_0_w_ready           (axi_reg_io_axi_arbiter_io_sharedInputs_0_w_ready              ), //i
    .io_sharedOutputs_0_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_data[511:0]     ), //o
    .io_sharedOutputs_0_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_strb[63:0]      ), //o
    .io_sharedOutputs_0_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_last            ), //o
    .io_sharedOutputs_0_b_valid           (axi_reg_io_axi_arbiter_io_sharedInputs_0_b_valid              ), //i
    .io_sharedOutputs_0_b_ready           (dbus_axi_decoder_io_sharedOutputs_0_b_ready                   ), //o
    .io_sharedOutputs_0_b_payload_resp    (axi_reg_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]  ), //i
    .io_sharedOutputs_0_r_valid           (axi_reg_io_axi_arbiter_io_sharedInputs_0_r_valid              ), //i
    .io_sharedOutputs_0_r_ready           (dbus_axi_decoder_io_sharedOutputs_0_r_ready                   ), //o
    .io_sharedOutputs_0_r_payload_data    (axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_data[511:0]), //i
    .io_sharedOutputs_0_r_payload_resp    (axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]  ), //i
    .io_sharedOutputs_0_r_payload_last    (axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_last       ), //i
    .io_sharedOutputs_1_arw_valid         (dbus_axi_decoder_io_sharedOutputs_1_arw_valid                 ), //o
    .io_sharedOutputs_1_arw_ready         (io_sharedOutputs_1_arw_validPipe_fire                         ), //i
    .io_sharedOutputs_1_arw_payload_addr  (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_addr[31:0]    ), //o
    .io_sharedOutputs_1_arw_payload_len   (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_len[7:0]      ), //o
    .io_sharedOutputs_1_arw_payload_size  (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_size[2:0]     ), //o
    .io_sharedOutputs_1_arw_payload_cache (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_cache[3:0]    ), //o
    .io_sharedOutputs_1_arw_payload_prot  (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_prot[2:0]     ), //o
    .io_sharedOutputs_1_arw_payload_write (dbus_axi_decoder_io_sharedOutputs_1_arw_payload_write         ), //o
    .io_sharedOutputs_1_w_valid           (dbus_axi_decoder_io_sharedOutputs_1_w_valid                   ), //o
    .io_sharedOutputs_1_w_ready           (cxl_axi_shared_arbiter_io_sharedInputs_0_w_ready              ), //i
    .io_sharedOutputs_1_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_data[511:0]     ), //o
    .io_sharedOutputs_1_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_strb[63:0]      ), //o
    .io_sharedOutputs_1_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_last            ), //o
    .io_sharedOutputs_1_b_valid           (cxl_axi_shared_arbiter_io_sharedInputs_0_b_valid              ), //i
    .io_sharedOutputs_1_b_ready           (dbus_axi_decoder_io_sharedOutputs_1_b_ready                   ), //o
    .io_sharedOutputs_1_b_payload_resp    (cxl_axi_shared_arbiter_io_sharedInputs_0_b_payload_resp[1:0]  ), //i
    .io_sharedOutputs_1_r_valid           (cxl_axi_shared_arbiter_io_sharedInputs_0_r_valid              ), //i
    .io_sharedOutputs_1_r_ready           (dbus_axi_decoder_io_sharedOutputs_1_r_ready                   ), //o
    .io_sharedOutputs_1_r_payload_data    (cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_data[511:0]), //i
    .io_sharedOutputs_1_r_payload_resp    (cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_resp[1:0]  ), //i
    .io_sharedOutputs_1_r_payload_last    (cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_last       ), //i
    .io_sharedOutputs_2_arw_valid         (dbus_axi_decoder_io_sharedOutputs_2_arw_valid                 ), //o
    .io_sharedOutputs_2_arw_ready         (io_sharedOutputs_2_arw_validPipe_fire                         ), //i
    .io_sharedOutputs_2_arw_payload_addr  (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_addr[31:0]    ), //o
    .io_sharedOutputs_2_arw_payload_len   (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_len[7:0]      ), //o
    .io_sharedOutputs_2_arw_payload_size  (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_size[2:0]     ), //o
    .io_sharedOutputs_2_arw_payload_cache (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_cache[3:0]    ), //o
    .io_sharedOutputs_2_arw_payload_prot  (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_prot[2:0]     ), //o
    .io_sharedOutputs_2_arw_payload_write (dbus_axi_decoder_io_sharedOutputs_2_arw_payload_write         ), //o
    .io_sharedOutputs_2_w_valid           (dbus_axi_decoder_io_sharedOutputs_2_w_valid                   ), //o
    .io_sharedOutputs_2_w_ready           (axi_ram_io_axi_arbiter_io_sharedInputs_0_w_ready              ), //i
    .io_sharedOutputs_2_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_2_w_payload_data[511:0]     ), //o
    .io_sharedOutputs_2_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_2_w_payload_strb[63:0]      ), //o
    .io_sharedOutputs_2_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_2_w_payload_last            ), //o
    .io_sharedOutputs_2_b_valid           (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_valid              ), //i
    .io_sharedOutputs_2_b_ready           (dbus_axi_decoder_io_sharedOutputs_2_b_ready                   ), //o
    .io_sharedOutputs_2_b_payload_resp    (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]  ), //i
    .io_sharedOutputs_2_r_valid           (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_valid              ), //i
    .io_sharedOutputs_2_r_ready           (dbus_axi_decoder_io_sharedOutputs_2_r_ready                   ), //o
    .io_sharedOutputs_2_r_payload_data    (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[511:0]), //i
    .io_sharedOutputs_2_r_payload_resp    (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]  ), //i
    .io_sharedOutputs_2_r_payload_last    (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last       ), //i
    .io_axiClk                            (io_axiClk                                                     ), //i
    .resetCtrl_axiReset                   (resetCtrl_axiReset                                            )  //i
  );
  Axi4SharedArbiter cxl_axi_shared_arbiter (
    .io_sharedInputs_0_arw_valid         (io_sharedOutputs_1_arw_validPipe_valid                         ), //i
    .io_sharedInputs_0_arw_ready         (cxl_axi_shared_arbiter_io_sharedInputs_0_arw_ready             ), //o
    .io_sharedInputs_0_arw_payload_addr  (cxl_axi_shared_arbiter_io_sharedInputs_0_arw_payload_addr[14:0]), //i
    .io_sharedInputs_0_arw_payload_id    (_zz_io_sharedInputs_0_arw_payload_id[11:0]                     ), //i
    .io_sharedInputs_0_arw_payload_len   (io_sharedOutputs_1_arw_validPipe_payload_len[7:0]              ), //i
    .io_sharedInputs_0_arw_payload_size  (io_sharedOutputs_1_arw_validPipe_payload_size[2:0]             ), //i
    .io_sharedInputs_0_arw_payload_burst (2'b01                                                          ), //i
    .io_sharedInputs_0_arw_payload_write (io_sharedOutputs_1_arw_validPipe_payload_write                 ), //i
    .io_sharedInputs_0_w_valid           (dbus_axi_decoder_io_sharedOutputs_1_w_valid                    ), //i
    .io_sharedInputs_0_w_ready           (cxl_axi_shared_arbiter_io_sharedInputs_0_w_ready               ), //o
    .io_sharedInputs_0_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_data[511:0]      ), //i
    .io_sharedInputs_0_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_strb[63:0]       ), //i
    .io_sharedInputs_0_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_1_w_payload_last             ), //i
    .io_sharedInputs_0_b_valid           (cxl_axi_shared_arbiter_io_sharedInputs_0_b_valid               ), //o
    .io_sharedInputs_0_b_ready           (dbus_axi_decoder_io_sharedOutputs_1_b_ready                    ), //i
    .io_sharedInputs_0_b_payload_id      (cxl_axi_shared_arbiter_io_sharedInputs_0_b_payload_id[11:0]    ), //o
    .io_sharedInputs_0_b_payload_resp    (cxl_axi_shared_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_valid           (cxl_axi_shared_arbiter_io_sharedInputs_0_r_valid               ), //o
    .io_sharedInputs_0_r_ready           (dbus_axi_decoder_io_sharedOutputs_1_r_ready                    ), //i
    .io_sharedInputs_0_r_payload_data    (cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_data[511:0] ), //o
    .io_sharedInputs_0_r_payload_id      (cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_id[11:0]    ), //o
    .io_sharedInputs_0_r_payload_resp    (cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_payload_last    (cxl_axi_shared_arbiter_io_sharedInputs_0_r_payload_last        ), //o
    .io_output_arw_valid                 (cxl_axi_shared_arbiter_io_output_arw_valid                     ), //o
    .io_output_arw_ready                 (cxl_axi_shared_arw_ready                                       ), //i
    .io_output_arw_payload_addr          (cxl_axi_shared_arbiter_io_output_arw_payload_addr[14:0]        ), //o
    .io_output_arw_payload_id            (cxl_axi_shared_arbiter_io_output_arw_payload_id[11:0]          ), //o
    .io_output_arw_payload_len           (cxl_axi_shared_arbiter_io_output_arw_payload_len[7:0]          ), //o
    .io_output_arw_payload_size          (cxl_axi_shared_arbiter_io_output_arw_payload_size[2:0]         ), //o
    .io_output_arw_payload_burst         (cxl_axi_shared_arbiter_io_output_arw_payload_burst[1:0]        ), //o
    .io_output_arw_payload_write         (cxl_axi_shared_arbiter_io_output_arw_payload_write             ), //o
    .io_output_w_valid                   (cxl_axi_shared_arbiter_io_output_w_valid                       ), //o
    .io_output_w_ready                   (cxl_axi_shared_w_ready                                         ), //i
    .io_output_w_payload_data            (cxl_axi_shared_arbiter_io_output_w_payload_data[511:0]         ), //o
    .io_output_w_payload_strb            (cxl_axi_shared_arbiter_io_output_w_payload_strb[63:0]          ), //o
    .io_output_w_payload_last            (cxl_axi_shared_arbiter_io_output_w_payload_last                ), //o
    .io_output_b_valid                   (cxl_axi_shared_b_valid                                         ), //i
    .io_output_b_ready                   (cxl_axi_shared_arbiter_io_output_b_ready                       ), //o
    .io_output_b_payload_id              (cxl_axi_shared_b_payload_id[11:0]                              ), //i
    .io_output_b_payload_resp            (cxl_axi_shared_b_payload_resp[1:0]                             ), //i
    .io_output_r_valid                   (cxl_axi_shared_r_valid                                         ), //i
    .io_output_r_ready                   (cxl_axi_shared_arbiter_io_output_r_ready                       ), //o
    .io_output_r_payload_data            (cxl_axi_shared_r_payload_data[511:0]                           ), //i
    .io_output_r_payload_id              (cxl_axi_shared_r_payload_id[11:0]                              ), //i
    .io_output_r_payload_resp            (cxl_axi_shared_r_payload_resp[1:0]                             ), //i
    .io_output_r_payload_last            (cxl_axi_shared_r_payload_last                                  ), //i
    .io_axiClk                           (io_axiClk                                                      ), //i
    .resetCtrl_axiReset                  (resetCtrl_axiReset                                             )  //i
  );
  Axi4SharedArbiter_1 axi_ram_io_axi_arbiter (
    .io_readInputs_0_ar_valid            (io_outputs_0_ar_validPipe_valid                                ), //i
    .io_readInputs_0_ar_ready            (axi_ram_io_axi_arbiter_io_readInputs_0_ar_ready                ), //o
    .io_readInputs_0_ar_payload_addr     (axi_ram_io_axi_arbiter_io_readInputs_0_ar_payload_addr[14:0]   ), //i
    .io_readInputs_0_ar_payload_id       (_zz_io_readInputs_0_ar_payload_id[2:0]                         ), //i
    .io_readInputs_0_ar_payload_len      (io_outputs_0_ar_validPipe_payload_len[7:0]                     ), //i
    .io_readInputs_0_ar_payload_size     (3'b110                                                         ), //i
    .io_readInputs_0_ar_payload_burst    (io_outputs_0_ar_validPipe_payload_burst[1:0]                   ), //i
    .io_readInputs_0_r_valid             (axi_ram_io_axi_arbiter_io_readInputs_0_r_valid                 ), //o
    .io_readInputs_0_r_ready             (axi4ReadOnlyDecoder_1_io_outputs_0_r_ready                     ), //i
    .io_readInputs_0_r_payload_data      (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_data[511:0]   ), //o
    .io_readInputs_0_r_payload_id        (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_id[2:0]       ), //o
    .io_readInputs_0_r_payload_resp      (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]     ), //o
    .io_readInputs_0_r_payload_last      (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_last          ), //o
    .io_sharedInputs_0_arw_valid         (io_sharedOutputs_2_arw_validPipe_valid                         ), //i
    .io_sharedInputs_0_arw_ready         (axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_ready             ), //o
    .io_sharedInputs_0_arw_payload_addr  (axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[14:0]), //i
    .io_sharedInputs_0_arw_payload_id    (_zz_io_sharedInputs_0_arw_payload_id_1[2:0]                    ), //i
    .io_sharedInputs_0_arw_payload_len   (io_sharedOutputs_2_arw_validPipe_payload_len[7:0]              ), //i
    .io_sharedInputs_0_arw_payload_size  (io_sharedOutputs_2_arw_validPipe_payload_size[2:0]             ), //i
    .io_sharedInputs_0_arw_payload_burst (2'b01                                                          ), //i
    .io_sharedInputs_0_arw_payload_write (io_sharedOutputs_2_arw_validPipe_payload_write                 ), //i
    .io_sharedInputs_0_w_valid           (dbus_axi_decoder_io_sharedOutputs_2_w_valid                    ), //i
    .io_sharedInputs_0_w_ready           (axi_ram_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //o
    .io_sharedInputs_0_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_2_w_payload_data[511:0]      ), //i
    .io_sharedInputs_0_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_2_w_payload_strb[63:0]       ), //i
    .io_sharedInputs_0_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_2_w_payload_last             ), //i
    .io_sharedInputs_0_b_valid           (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //o
    .io_sharedInputs_0_b_ready           (dbus_axi_decoder_io_sharedOutputs_2_b_ready                    ), //i
    .io_sharedInputs_0_b_payload_id      (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_id[2:0]     ), //o
    .io_sharedInputs_0_b_payload_resp    (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_valid           (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //o
    .io_sharedInputs_0_r_ready           (dbus_axi_decoder_io_sharedOutputs_2_r_ready                    ), //i
    .io_sharedInputs_0_r_payload_data    (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[511:0] ), //o
    .io_sharedInputs_0_r_payload_id      (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_id[2:0]     ), //o
    .io_sharedInputs_0_r_payload_resp    (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_payload_last    (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //o
    .io_output_arw_valid                 (axi_ram_io_axi_arbiter_io_output_arw_valid                     ), //o
    .io_output_arw_ready                 (axi_ram_io_axi_arbiter_io_output_arw_ready                     ), //i
    .io_output_arw_payload_addr          (axi_ram_io_axi_arbiter_io_output_arw_payload_addr[14:0]        ), //o
    .io_output_arw_payload_id            (axi_ram_io_axi_arbiter_io_output_arw_payload_id[3:0]           ), //o
    .io_output_arw_payload_len           (axi_ram_io_axi_arbiter_io_output_arw_payload_len[7:0]          ), //o
    .io_output_arw_payload_size          (axi_ram_io_axi_arbiter_io_output_arw_payload_size[2:0]         ), //o
    .io_output_arw_payload_burst         (axi_ram_io_axi_arbiter_io_output_arw_payload_burst[1:0]        ), //o
    .io_output_arw_payload_write         (axi_ram_io_axi_arbiter_io_output_arw_payload_write             ), //o
    .io_output_w_valid                   (axi_ram_io_axi_arbiter_io_output_w_valid                       ), //o
    .io_output_w_ready                   (io_output_w_rValidN                                            ), //i
    .io_output_w_payload_data            (axi_ram_io_axi_arbiter_io_output_w_payload_data[511:0]         ), //o
    .io_output_w_payload_strb            (axi_ram_io_axi_arbiter_io_output_w_payload_strb[63:0]          ), //o
    .io_output_w_payload_last            (axi_ram_io_axi_arbiter_io_output_w_payload_last                ), //o
    .io_output_b_valid                   (axi_ram_io_axi_b_valid                                         ), //i
    .io_output_b_ready                   (axi_ram_io_axi_arbiter_io_output_b_ready                       ), //o
    .io_output_b_payload_id              (axi_ram_io_axi_b_payload_id[3:0]                               ), //i
    .io_output_b_payload_resp            (axi_ram_io_axi_b_payload_resp[1:0]                             ), //i
    .io_output_r_valid                   (axi_ram_io_axi_r_valid                                         ), //i
    .io_output_r_ready                   (axi_ram_io_axi_arbiter_io_output_r_ready                       ), //o
    .io_output_r_payload_data            (axi_ram_io_axi_r_payload_data[511:0]                           ), //i
    .io_output_r_payload_id              (axi_ram_io_axi_r_payload_id[3:0]                               ), //i
    .io_output_r_payload_resp            (axi_ram_io_axi_r_payload_resp[1:0]                             ), //i
    .io_output_r_payload_last            (axi_ram_io_axi_r_payload_last                                  ), //i
    .io_axiClk                           (io_axiClk                                                      ), //i
    .resetCtrl_axiReset                  (resetCtrl_axiReset                                             )  //i
  );
  Axi4SharedArbiter_2 axi_reg_io_axi_arbiter (
    .io_sharedInputs_0_arw_valid         (io_sharedOutputs_0_arw_validPipe_valid                         ), //i
    .io_sharedInputs_0_arw_ready         (axi_reg_io_axi_arbiter_io_sharedInputs_0_arw_ready             ), //o
    .io_sharedInputs_0_arw_payload_addr  (axi_reg_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr[19:0]), //i
    .io_sharedInputs_0_arw_payload_id    (_zz_io_sharedInputs_0_arw_payload_id_2[3:0]                    ), //i
    .io_sharedInputs_0_arw_payload_len   (io_sharedOutputs_0_arw_validPipe_payload_len[7:0]              ), //i
    .io_sharedInputs_0_arw_payload_size  (io_sharedOutputs_0_arw_validPipe_payload_size[2:0]             ), //i
    .io_sharedInputs_0_arw_payload_burst (2'b01                                                          ), //i
    .io_sharedInputs_0_arw_payload_write (io_sharedOutputs_0_arw_validPipe_payload_write                 ), //i
    .io_sharedInputs_0_w_valid           (dbus_axi_decoder_io_sharedOutputs_0_w_valid                    ), //i
    .io_sharedInputs_0_w_ready           (axi_reg_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //o
    .io_sharedInputs_0_w_payload_data    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_data[511:0]      ), //i
    .io_sharedInputs_0_w_payload_strb    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_strb[63:0]       ), //i
    .io_sharedInputs_0_w_payload_last    (dbus_axi_decoder_io_sharedOutputs_0_w_payload_last             ), //i
    .io_sharedInputs_0_b_valid           (axi_reg_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //o
    .io_sharedInputs_0_b_ready           (dbus_axi_decoder_io_sharedOutputs_0_b_ready                    ), //i
    .io_sharedInputs_0_b_payload_id      (axi_reg_io_axi_arbiter_io_sharedInputs_0_b_payload_id[3:0]     ), //o
    .io_sharedInputs_0_b_payload_resp    (axi_reg_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_valid           (axi_reg_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //o
    .io_sharedInputs_0_r_ready           (dbus_axi_decoder_io_sharedOutputs_0_r_ready                    ), //i
    .io_sharedInputs_0_r_payload_data    (axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_data[511:0] ), //o
    .io_sharedInputs_0_r_payload_id      (axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_id[3:0]     ), //o
    .io_sharedInputs_0_r_payload_resp    (axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_payload_last    (axi_reg_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //o
    .io_output_arw_valid                 (axi_reg_io_axi_arbiter_io_output_arw_valid                     ), //o
    .io_output_arw_ready                 (axi_reg_io_axi_arbiter_io_output_arw_ready                     ), //i
    .io_output_arw_payload_addr          (axi_reg_io_axi_arbiter_io_output_arw_payload_addr[19:0]        ), //o
    .io_output_arw_payload_id            (axi_reg_io_axi_arbiter_io_output_arw_payload_id[3:0]           ), //o
    .io_output_arw_payload_len           (axi_reg_io_axi_arbiter_io_output_arw_payload_len[7:0]          ), //o
    .io_output_arw_payload_size          (axi_reg_io_axi_arbiter_io_output_arw_payload_size[2:0]         ), //o
    .io_output_arw_payload_burst         (axi_reg_io_axi_arbiter_io_output_arw_payload_burst[1:0]        ), //o
    .io_output_arw_payload_write         (axi_reg_io_axi_arbiter_io_output_arw_payload_write             ), //o
    .io_output_w_valid                   (axi_reg_io_axi_arbiter_io_output_w_valid                       ), //o
    .io_output_w_ready                   (io_output_w_rValidN_1                                          ), //i
    .io_output_w_payload_data            (axi_reg_io_axi_arbiter_io_output_w_payload_data[511:0]         ), //o
    .io_output_w_payload_strb            (axi_reg_io_axi_arbiter_io_output_w_payload_strb[63:0]          ), //o
    .io_output_w_payload_last            (axi_reg_io_axi_arbiter_io_output_w_payload_last                ), //o
    .io_output_b_valid                   (axi_reg_io_axi_b_valid                                         ), //i
    .io_output_b_ready                   (axi_reg_io_axi_arbiter_io_output_b_ready                       ), //o
    .io_output_b_payload_id              (axi_reg_io_axi_b_payload_id[3:0]                               ), //i
    .io_output_b_payload_resp            (axi_reg_io_axi_b_payload_resp[1:0]                             ), //i
    .io_output_r_valid                   (axi_reg_io_axi_r_valid                                         ), //i
    .io_output_r_ready                   (axi_reg_io_axi_arbiter_io_output_r_ready                       ), //o
    .io_output_r_payload_data            (axi_reg_io_axi_r_payload_data[511:0]                           ), //i
    .io_output_r_payload_id              (axi_reg_io_axi_r_payload_id[3:0]                               ), //i
    .io_output_r_payload_resp            (axi_reg_io_axi_r_payload_resp[1:0]                             ), //i
    .io_output_r_payload_last            (axi_reg_io_axi_r_payload_last                                  ), //i
    .io_axiClk                           (io_axiClk                                                      ), //i
    .resetCtrl_axiReset                  (resetCtrl_axiReset                                             )  //i
  );
  initial begin
    resetCtrl_systemResetCounter = 6'h0;
  end

  assign cxl_axi_shared_arw_ready = (cxl_axi_shared_arw_payload_write ? io_out_cxl_axi_aw_ready : io_out_cxl_axi_ar_ready);
  assign cxl_axi_shared_w_ready = io_out_cxl_axi_w_ready;
  assign cxl_axi_shared_r_valid = io_out_cxl_axi_r_valid;
  assign cxl_axi_shared_r_payload_data = io_out_cxl_axi_r_payload_data;
  assign cxl_axi_shared_r_payload_id = io_out_cxl_axi_r_payload_id;
  assign cxl_axi_shared_r_payload_resp = io_out_cxl_axi_r_payload_resp;
  assign cxl_axi_shared_r_payload_last = io_out_cxl_axi_r_payload_last;
  assign cxl_axi_shared_b_valid = io_out_cxl_axi_b_valid;
  assign cxl_axi_shared_b_payload_id = io_out_cxl_axi_b_payload_id;
  assign cxl_axi_shared_b_payload_resp = io_out_cxl_axi_b_payload_resp;
  assign io_out_cxl_axi_ar_valid = (cxl_axi_shared_arw_valid && (! cxl_axi_shared_arw_payload_write));
  assign io_out_cxl_axi_ar_payload_addr = cxl_axi_shared_arw_payload_addr;
  assign io_out_cxl_axi_ar_payload_id = cxl_axi_shared_arw_payload_id;
  assign io_out_cxl_axi_ar_payload_len = cxl_axi_shared_arw_payload_len;
  assign io_out_cxl_axi_ar_payload_size = cxl_axi_shared_arw_payload_size;
  assign io_out_cxl_axi_ar_payload_burst = cxl_axi_shared_arw_payload_burst;
  assign io_out_cxl_axi_aw_valid = (cxl_axi_shared_arw_valid && cxl_axi_shared_arw_payload_write);
  assign io_out_cxl_axi_aw_payload_addr = cxl_axi_shared_arw_payload_addr;
  assign io_out_cxl_axi_aw_payload_id = cxl_axi_shared_arw_payload_id;
  assign io_out_cxl_axi_aw_payload_len = cxl_axi_shared_arw_payload_len;
  assign io_out_cxl_axi_aw_payload_size = cxl_axi_shared_arw_payload_size;
  assign io_out_cxl_axi_aw_payload_burst = cxl_axi_shared_arw_payload_burst;
  assign io_out_cxl_axi_w_valid = cxl_axi_shared_w_valid;
  assign io_out_cxl_axi_w_payload_data = cxl_axi_shared_w_payload_data;
  assign io_out_cxl_axi_w_payload_strb = cxl_axi_shared_w_payload_strb;
  assign io_out_cxl_axi_w_payload_last = cxl_axi_shared_w_payload_last;
  assign io_out_cxl_axi_r_ready = cxl_axi_shared_r_ready;
  assign io_out_cxl_axi_b_ready = cxl_axi_shared_b_ready;
  always @(*) begin
    resetCtrl_systemResetUnbuffered = 1'b0;
    if(when_Briey_l219) begin
      resetCtrl_systemResetUnbuffered = 1'b1;
    end
  end

  assign _zz_when_Briey_l219[5 : 0] = 6'h3f;
  assign when_Briey_l219 = (resetCtrl_systemResetCounter != _zz_when_Briey_l219);
  assign when_Briey_l223 = io_asyncReset_buffercc_io_dataOut;
  assign resetCtrl_vgaReset = resetCtrl_axiReset_buffercc_io_dataOut;
  assign axi_core_cpu_iBus_rsp_payload_error = (! (axi4ReadOnlyDecoder_1_io_input_r_payload_resp == 2'b00));
  always @(*) begin
    axi_core_cpu_dBus_cmd_ready = dBus_cmd_stage_ready;
    if(when_Stream_l399) begin
      axi_core_cpu_dBus_cmd_ready = 1'b1;
    end
  end

  assign when_Stream_l399 = (! dBus_cmd_stage_valid);
  assign dBus_cmd_stage_valid = dBus_cmd_rValid;
  assign dBus_cmd_stage_payload_wr = dBus_cmd_rData_wr;
  assign dBus_cmd_stage_payload_uncached = dBus_cmd_rData_uncached;
  assign dBus_cmd_stage_payload_address = dBus_cmd_rData_address;
  assign dBus_cmd_stage_payload_data = dBus_cmd_rData_data;
  assign dBus_cmd_stage_payload_mask = dBus_cmd_rData_mask;
  assign dBus_cmd_stage_payload_size = dBus_cmd_rData_size;
  assign dBus_cmd_stage_payload_last = dBus_cmd_rData_last;
  always @(*) begin
    dBus_cmd_stage_ready = dBus_cmd_stage_stage_ready;
    if(when_Stream_l399_1) begin
      dBus_cmd_stage_ready = 1'b1;
    end
  end

  assign when_Stream_l399_1 = (! dBus_cmd_stage_stage_valid);
  assign dBus_cmd_stage_stage_valid = dBus_cmd_stage_rValid;
  assign dBus_cmd_stage_stage_payload_wr = dBus_cmd_stage_rData_wr;
  assign dBus_cmd_stage_stage_payload_uncached = dBus_cmd_stage_rData_uncached;
  assign dBus_cmd_stage_stage_payload_address = dBus_cmd_stage_rData_address;
  assign dBus_cmd_stage_stage_payload_data = dBus_cmd_stage_rData_data;
  assign dBus_cmd_stage_stage_payload_mask = dBus_cmd_stage_rData_mask;
  assign dBus_cmd_stage_stage_payload_size = dBus_cmd_stage_rData_size;
  assign dBus_cmd_stage_stage_payload_last = dBus_cmd_stage_rData_last;
  assign dBus_cmd_stage_stage_ready = dBus_cmd_stage_stage_rValidN;
  assign dBusToAxi4Shared_cmdPreFork_valid = (dBus_cmd_stage_stage_valid || (! dBus_cmd_stage_stage_rValidN));
  assign dBusToAxi4Shared_cmdPreFork_payload_wr = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_wr : dBus_cmd_stage_stage_rData_wr);
  assign dBusToAxi4Shared_cmdPreFork_payload_uncached = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_uncached : dBus_cmd_stage_stage_rData_uncached);
  assign dBusToAxi4Shared_cmdPreFork_payload_address = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_address : dBus_cmd_stage_stage_rData_address);
  assign dBusToAxi4Shared_cmdPreFork_payload_data = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_data : dBus_cmd_stage_stage_rData_data);
  assign dBusToAxi4Shared_cmdPreFork_payload_mask = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_mask : dBus_cmd_stage_stage_rData_mask);
  assign dBusToAxi4Shared_cmdPreFork_payload_size = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_size : dBus_cmd_stage_stage_rData_size);
  assign dBusToAxi4Shared_cmdPreFork_payload_last = (dBus_cmd_stage_stage_rValidN ? dBus_cmd_stage_stage_payload_last : dBus_cmd_stage_stage_rData_last);
  assign dBusToAxi4Shared_cmdPreFork_fire = (dBusToAxi4Shared_cmdPreFork_valid && dBusToAxi4Shared_cmdPreFork_ready);
  assign when_Utils_l716 = (dBusToAxi4Shared_cmdPreFork_fire && dBusToAxi4Shared_cmdPreFork_payload_wr);
  assign dbus_axi_b_fire = (dbus_axi_b_valid && dbus_axi_b_ready);
  always @(*) begin
    dBusToAxi4Shared_pendingWrites_incrementIt = 1'b0;
    if(when_Utils_l716) begin
      dBusToAxi4Shared_pendingWrites_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    dBusToAxi4Shared_pendingWrites_decrementIt = 1'b0;
    if(dbus_axi_b_fire) begin
      dBusToAxi4Shared_pendingWrites_decrementIt = 1'b1;
    end
  end

  assign dBusToAxi4Shared_pendingWrites_mayOverflow = (dBusToAxi4Shared_pendingWrites_value == 3'b111);
  assign dBusToAxi4Shared_pendingWrites_mayUnderflow = (dBusToAxi4Shared_pendingWrites_value == 3'b000);
  assign dBusToAxi4Shared_pendingWrites_willOverflowIfInc = (dBusToAxi4Shared_pendingWrites_mayOverflow && (! dBusToAxi4Shared_pendingWrites_decrementIt));
  assign dBusToAxi4Shared_pendingWrites_willOverflow = (dBusToAxi4Shared_pendingWrites_willOverflowIfInc && dBusToAxi4Shared_pendingWrites_incrementIt);
  assign dBusToAxi4Shared_pendingWrites_willUnderflowIfDec = (dBusToAxi4Shared_pendingWrites_mayUnderflow && (! dBusToAxi4Shared_pendingWrites_incrementIt));
  assign dBusToAxi4Shared_pendingWrites_willUnderflow = (dBusToAxi4Shared_pendingWrites_willUnderflowIfDec && dBusToAxi4Shared_pendingWrites_decrementIt);
  assign when_Utils_l751 = (dBusToAxi4Shared_pendingWrites_incrementIt && (! dBusToAxi4Shared_pendingWrites_decrementIt));
  always @(*) begin
    if(when_Utils_l751) begin
      dBusToAxi4Shared_pendingWrites_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l753) begin
        dBusToAxi4Shared_pendingWrites_finalIncrement = 3'b111;
      end else begin
        dBusToAxi4Shared_pendingWrites_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l753 = ((! dBusToAxi4Shared_pendingWrites_incrementIt) && dBusToAxi4Shared_pendingWrites_decrementIt);
  assign dBusToAxi4Shared_pendingWrites_valueNext = (dBusToAxi4Shared_pendingWrites_value + dBusToAxi4Shared_pendingWrites_finalIncrement);
  assign dBusToAxi4Shared_hazard = (((dBusToAxi4Shared_pendingWrites_value != 3'b000) && (! dBusToAxi4Shared_cmdPreFork_payload_wr)) || (dBusToAxi4Shared_pendingWrites_value == 3'b111));
  assign _zz_dBusToAxi4Shared_cmdPreFork_ready = (! dBusToAxi4Shared_hazard);
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_valid = (dBusToAxi4Shared_cmdPreFork_valid && _zz_dBusToAxi4Shared_cmdPreFork_ready);
  assign dBusToAxi4Shared_cmdPreFork_ready = (dBusToAxi4Shared_cmdPreFork_haltWhen_ready && _zz_dBusToAxi4Shared_cmdPreFork_ready);
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_wr = dBusToAxi4Shared_cmdPreFork_payload_wr;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_uncached = dBusToAxi4Shared_cmdPreFork_payload_uncached;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_address = dBusToAxi4Shared_cmdPreFork_payload_address;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_data = dBusToAxi4Shared_cmdPreFork_payload_data;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_mask = dBusToAxi4Shared_cmdPreFork_payload_mask;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_size = dBusToAxi4Shared_cmdPreFork_payload_size;
  assign dBusToAxi4Shared_cmdPreFork_haltWhen_payload_last = dBusToAxi4Shared_cmdPreFork_payload_last;
  always @(*) begin
    dBusToAxi4Shared_cmdPreFork_haltWhen_ready = 1'b1;
    if(when_Stream_l1119) begin
      dBusToAxi4Shared_cmdPreFork_haltWhen_ready = 1'b0;
    end
    if(when_Stream_l1119_1) begin
      dBusToAxi4Shared_cmdPreFork_haltWhen_ready = 1'b0;
    end
  end

  assign when_Stream_l1119 = ((! dBusToAxi4Shared_cmdFork_ready) && dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0);
  assign when_Stream_l1119_1 = ((! dBusToAxi4Shared_dataFork_ready) && dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1);
  assign dBusToAxi4Shared_cmdFork_valid = (dBusToAxi4Shared_cmdPreFork_haltWhen_valid && dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0);
  assign dBusToAxi4Shared_cmdFork_payload_wr = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_wr;
  assign dBusToAxi4Shared_cmdFork_payload_uncached = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_uncached;
  assign dBusToAxi4Shared_cmdFork_payload_address = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_address;
  assign dBusToAxi4Shared_cmdFork_payload_data = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_data;
  assign dBusToAxi4Shared_cmdFork_payload_mask = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_mask;
  assign dBusToAxi4Shared_cmdFork_payload_size = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_size;
  assign dBusToAxi4Shared_cmdFork_payload_last = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_last;
  assign dBusToAxi4Shared_cmdFork_fire = (dBusToAxi4Shared_cmdFork_valid && dBusToAxi4Shared_cmdFork_ready);
  assign dBusToAxi4Shared_dataFork_valid = (dBusToAxi4Shared_cmdPreFork_haltWhen_valid && dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1);
  assign dBusToAxi4Shared_dataFork_payload_wr = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_wr;
  assign dBusToAxi4Shared_dataFork_payload_uncached = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_uncached;
  assign dBusToAxi4Shared_dataFork_payload_address = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_address;
  assign dBusToAxi4Shared_dataFork_payload_data = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_data;
  assign dBusToAxi4Shared_dataFork_payload_mask = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_mask;
  assign dBusToAxi4Shared_dataFork_payload_size = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_size;
  assign dBusToAxi4Shared_dataFork_payload_last = dBusToAxi4Shared_cmdPreFork_haltWhen_payload_last;
  assign dBusToAxi4Shared_dataFork_fire = (dBusToAxi4Shared_dataFork_valid && dBusToAxi4Shared_dataFork_ready);
  always @(*) begin
    dBusToAxi4Shared_cmdStage_valid = dBusToAxi4Shared_cmdFork_valid;
    if(_zz_1) begin
      dBusToAxi4Shared_cmdStage_valid = 1'b0;
    end
  end

  always @(*) begin
    dBusToAxi4Shared_cmdFork_ready = dBusToAxi4Shared_cmdStage_ready;
    if(_zz_1) begin
      dBusToAxi4Shared_cmdFork_ready = 1'b1;
    end
  end

  assign dBusToAxi4Shared_cmdStage_payload_wr = dBusToAxi4Shared_cmdFork_payload_wr;
  assign dBusToAxi4Shared_cmdStage_payload_uncached = dBusToAxi4Shared_cmdFork_payload_uncached;
  assign dBusToAxi4Shared_cmdStage_payload_address = dBusToAxi4Shared_cmdFork_payload_address;
  assign dBusToAxi4Shared_cmdStage_payload_data = dBusToAxi4Shared_cmdFork_payload_data;
  assign dBusToAxi4Shared_cmdStage_payload_mask = dBusToAxi4Shared_cmdFork_payload_mask;
  assign dBusToAxi4Shared_cmdStage_payload_size = dBusToAxi4Shared_cmdFork_payload_size;
  assign dBusToAxi4Shared_cmdStage_payload_last = dBusToAxi4Shared_cmdFork_payload_last;
  assign when_Stream_l486 = (! dBusToAxi4Shared_dataFork_payload_wr);
  always @(*) begin
    dBusToAxi4Shared_dataStage_valid = dBusToAxi4Shared_dataFork_valid;
    if(when_Stream_l486) begin
      dBusToAxi4Shared_dataStage_valid = 1'b0;
    end
  end

  always @(*) begin
    dBusToAxi4Shared_dataFork_ready = dBusToAxi4Shared_dataStage_ready;
    if(when_Stream_l486) begin
      dBusToAxi4Shared_dataFork_ready = 1'b1;
    end
  end

  assign dBusToAxi4Shared_dataStage_payload_wr = dBusToAxi4Shared_dataFork_payload_wr;
  assign dBusToAxi4Shared_dataStage_payload_uncached = dBusToAxi4Shared_dataFork_payload_uncached;
  assign dBusToAxi4Shared_dataStage_payload_address = dBusToAxi4Shared_dataFork_payload_address;
  assign dBusToAxi4Shared_dataStage_payload_data = dBusToAxi4Shared_dataFork_payload_data;
  assign dBusToAxi4Shared_dataStage_payload_mask = dBusToAxi4Shared_dataFork_payload_mask;
  assign dBusToAxi4Shared_dataStage_payload_size = dBusToAxi4Shared_dataFork_payload_size;
  assign dBusToAxi4Shared_dataStage_payload_last = dBusToAxi4Shared_dataFork_payload_last;
  assign dbus_axi_arw_valid = dBusToAxi4Shared_cmdStage_valid;
  assign dBusToAxi4Shared_cmdStage_ready = dbus_axi_arw_ready;
  assign dbus_axi_arw_payload_write = dBusToAxi4Shared_cmdStage_payload_wr;
  assign dbus_axi_arw_payload_prot = 3'b010;
  assign dbus_axi_arw_payload_cache = 4'b1111;
  assign dbus_axi_arw_payload_size = 3'b110;
  assign dbus_axi_arw_payload_addr = dBusToAxi4Shared_cmdStage_payload_address;
  assign dbus_axi_arw_payload_len = 8'h0;
  assign dbus_axi_w_valid = dBusToAxi4Shared_dataStage_valid;
  assign dBusToAxi4Shared_dataStage_ready = dbus_axi_w_ready;
  always @(*) begin
    dbus_axi_w_payload_data[31 : 0] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[63 : 32] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[95 : 64] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[127 : 96] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[159 : 128] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[191 : 160] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[223 : 192] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[255 : 224] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[287 : 256] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[319 : 288] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[351 : 320] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[383 : 352] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[415 : 384] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[447 : 416] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[479 : 448] = dBusToAxi4Shared_dataStage_payload_data;
    dbus_axi_w_payload_data[511 : 480] = dBusToAxi4Shared_dataStage_payload_data;
  end

  assign dbus_axi_w_payload_strb = (_zz_dbus_axi_w_payload_strb <<< (dBusToAxi4Shared_dataStage_payload_address & 32'h0000003f));
  assign dbus_axi_w_payload_last = dBusToAxi4Shared_dataStage_payload_last;
  assign axi_core_cpu_dBus_rsp_payload_error = (! (dbus_axi_r_payload_resp == 2'b00));
  assign dbus_axi_r_ready = 1'b1;
  assign dbus_axi_b_ready = 1'b1;
  assign axi_core_cpu_debug_bus_cmd_payload_address = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign debug_bus_cmd_fire = (systemDebugger_1_io_mem_cmd_valid && axi_core_cpu_debug_bus_cmd_ready);
  assign io_jtag_tdo = jtagBridge_1_io_jtag_tdo;
  assign io_outputs_0_ar_validPipe_fire = (io_outputs_0_ar_validPipe_valid && io_outputs_0_ar_validPipe_ready);
  assign io_outputs_0_ar_validPipe_valid = io_outputs_0_ar_rValid;
  assign io_outputs_0_ar_validPipe_payload_addr = axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_addr;
  assign io_outputs_0_ar_validPipe_payload_len = axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_len;
  assign io_outputs_0_ar_validPipe_payload_burst = axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_burst;
  assign io_outputs_0_ar_validPipe_payload_cache = axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_cache;
  assign io_outputs_0_ar_validPipe_payload_prot = axi4ReadOnlyDecoder_1_io_outputs_0_ar_payload_prot;
  assign io_outputs_0_ar_validPipe_ready = axi_ram_io_axi_arbiter_io_readInputs_0_ar_ready;
  assign io_sharedOutputs_0_arw_validPipe_fire = (io_sharedOutputs_0_arw_validPipe_valid && io_sharedOutputs_0_arw_validPipe_ready);
  assign io_sharedOutputs_0_arw_validPipe_valid = io_sharedOutputs_0_arw_rValid;
  assign io_sharedOutputs_0_arw_validPipe_payload_addr = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_addr;
  assign io_sharedOutputs_0_arw_validPipe_payload_len = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_len;
  assign io_sharedOutputs_0_arw_validPipe_payload_size = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_size;
  assign io_sharedOutputs_0_arw_validPipe_payload_cache = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_cache;
  assign io_sharedOutputs_0_arw_validPipe_payload_prot = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_prot;
  assign io_sharedOutputs_0_arw_validPipe_payload_write = dbus_axi_decoder_io_sharedOutputs_0_arw_payload_write;
  assign io_sharedOutputs_0_arw_validPipe_ready = axi_reg_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign io_sharedOutputs_1_arw_validPipe_fire = (io_sharedOutputs_1_arw_validPipe_valid && io_sharedOutputs_1_arw_validPipe_ready);
  assign io_sharedOutputs_1_arw_validPipe_valid = io_sharedOutputs_1_arw_rValid;
  assign io_sharedOutputs_1_arw_validPipe_payload_addr = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_addr;
  assign io_sharedOutputs_1_arw_validPipe_payload_len = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_len;
  assign io_sharedOutputs_1_arw_validPipe_payload_size = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_size;
  assign io_sharedOutputs_1_arw_validPipe_payload_cache = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_cache;
  assign io_sharedOutputs_1_arw_validPipe_payload_prot = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_prot;
  assign io_sharedOutputs_1_arw_validPipe_payload_write = dbus_axi_decoder_io_sharedOutputs_1_arw_payload_write;
  assign io_sharedOutputs_1_arw_validPipe_ready = cxl_axi_shared_arbiter_io_sharedInputs_0_arw_ready;
  assign io_sharedOutputs_2_arw_validPipe_fire = (io_sharedOutputs_2_arw_validPipe_valid && io_sharedOutputs_2_arw_validPipe_ready);
  assign io_sharedOutputs_2_arw_validPipe_valid = io_sharedOutputs_2_arw_rValid;
  assign io_sharedOutputs_2_arw_validPipe_payload_addr = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_addr;
  assign io_sharedOutputs_2_arw_validPipe_payload_len = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_len;
  assign io_sharedOutputs_2_arw_validPipe_payload_size = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_size;
  assign io_sharedOutputs_2_arw_validPipe_payload_cache = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_cache;
  assign io_sharedOutputs_2_arw_validPipe_payload_prot = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_prot;
  assign io_sharedOutputs_2_arw_validPipe_payload_write = dbus_axi_decoder_io_sharedOutputs_2_arw_payload_write;
  assign io_sharedOutputs_2_arw_validPipe_ready = axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign dbus_axi_arw_ready = dbus_axi_decoder_io_input_arw_ready;
  assign dbus_axi_w_ready = dbus_axi_decoder_io_input_w_ready;
  assign dbus_axi_b_valid = dbus_axi_decoder_io_input_b_valid;
  assign dbus_axi_b_payload_resp = dbus_axi_decoder_io_input_b_payload_resp;
  always @(*) begin
    dbus_axi_decoder_io_input_r_ready = io_input_r_stage_ready;
    if(when_Stream_l399_2) begin
      dbus_axi_decoder_io_input_r_ready = 1'b1;
    end
  end

  assign when_Stream_l399_2 = (! io_input_r_stage_valid);
  assign io_input_r_stage_valid = io_input_r_rValid;
  assign io_input_r_stage_payload_data = io_input_r_rData_data;
  assign io_input_r_stage_payload_resp = io_input_r_rData_resp;
  assign io_input_r_stage_payload_last = io_input_r_rData_last;
  assign dbus_axi_r_valid = io_input_r_stage_valid;
  assign io_input_r_stage_ready = dbus_axi_r_ready;
  assign dbus_axi_r_payload_data = io_input_r_stage_payload_data;
  assign dbus_axi_r_payload_resp = io_input_r_stage_payload_resp;
  assign dbus_axi_r_payload_last = io_input_r_stage_payload_last;
  assign cxl_axi_shared_arbiter_io_sharedInputs_0_arw_payload_addr = io_sharedOutputs_1_arw_validPipe_payload_addr[14:0];
  assign _zz_io_sharedInputs_0_arw_payload_id[11 : 0] = 12'h0;
  assign cxl_axi_shared_arw_valid = cxl_axi_shared_arbiter_io_output_arw_valid;
  assign cxl_axi_shared_arw_payload_addr = cxl_axi_shared_arbiter_io_output_arw_payload_addr;
  assign cxl_axi_shared_arw_payload_id = cxl_axi_shared_arbiter_io_output_arw_payload_id;
  assign cxl_axi_shared_arw_payload_len = cxl_axi_shared_arbiter_io_output_arw_payload_len;
  assign cxl_axi_shared_arw_payload_size = cxl_axi_shared_arbiter_io_output_arw_payload_size;
  assign cxl_axi_shared_arw_payload_burst = cxl_axi_shared_arbiter_io_output_arw_payload_burst;
  assign cxl_axi_shared_arw_payload_write = cxl_axi_shared_arbiter_io_output_arw_payload_write;
  assign cxl_axi_shared_w_valid = cxl_axi_shared_arbiter_io_output_w_valid;
  assign cxl_axi_shared_w_payload_data = cxl_axi_shared_arbiter_io_output_w_payload_data;
  assign cxl_axi_shared_w_payload_strb = cxl_axi_shared_arbiter_io_output_w_payload_strb;
  assign cxl_axi_shared_w_payload_last = cxl_axi_shared_arbiter_io_output_w_payload_last;
  assign cxl_axi_shared_b_ready = cxl_axi_shared_arbiter_io_output_b_ready;
  assign cxl_axi_shared_r_ready = cxl_axi_shared_arbiter_io_output_r_ready;
  assign axi_ram_io_axi_arbiter_io_readInputs_0_ar_payload_addr = io_outputs_0_ar_validPipe_payload_addr[14:0];
  assign _zz_io_readInputs_0_ar_payload_id[2 : 0] = 3'b000;
  assign axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = io_sharedOutputs_2_arw_validPipe_payload_addr[14:0];
  assign _zz_io_sharedInputs_0_arw_payload_id_1[2 : 0] = 3'b000;
  assign io_output_arw_halfPipe_fire = (io_output_arw_halfPipe_valid && io_output_arw_halfPipe_ready);
  assign axi_ram_io_axi_arbiter_io_output_arw_ready = (! io_output_arw_rValid);
  assign io_output_arw_halfPipe_valid = io_output_arw_rValid;
  assign io_output_arw_halfPipe_payload_addr = io_output_arw_rData_addr;
  assign io_output_arw_halfPipe_payload_id = io_output_arw_rData_id;
  assign io_output_arw_halfPipe_payload_len = io_output_arw_rData_len;
  assign io_output_arw_halfPipe_payload_size = io_output_arw_rData_size;
  assign io_output_arw_halfPipe_payload_burst = io_output_arw_rData_burst;
  assign io_output_arw_halfPipe_payload_write = io_output_arw_rData_write;
  assign io_output_arw_halfPipe_ready = axi_ram_io_axi_arw_ready;
  assign io_output_w_s2mPipe_valid = (axi_ram_io_axi_arbiter_io_output_w_valid || (! io_output_w_rValidN));
  assign io_output_w_s2mPipe_payload_data = (io_output_w_rValidN ? axi_ram_io_axi_arbiter_io_output_w_payload_data : io_output_w_rData_data);
  assign io_output_w_s2mPipe_payload_strb = (io_output_w_rValidN ? axi_ram_io_axi_arbiter_io_output_w_payload_strb : io_output_w_rData_strb);
  assign io_output_w_s2mPipe_payload_last = (io_output_w_rValidN ? axi_ram_io_axi_arbiter_io_output_w_payload_last : io_output_w_rData_last);
  always @(*) begin
    io_output_w_s2mPipe_ready = io_output_w_s2mPipe_m2sPipe_ready;
    if(when_Stream_l399_3) begin
      io_output_w_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l399_3 = (! io_output_w_s2mPipe_m2sPipe_valid);
  assign io_output_w_s2mPipe_m2sPipe_valid = io_output_w_s2mPipe_rValid;
  assign io_output_w_s2mPipe_m2sPipe_payload_data = io_output_w_s2mPipe_rData_data;
  assign io_output_w_s2mPipe_m2sPipe_payload_strb = io_output_w_s2mPipe_rData_strb;
  assign io_output_w_s2mPipe_m2sPipe_payload_last = io_output_w_s2mPipe_rData_last;
  assign io_output_w_s2mPipe_m2sPipe_ready = axi_ram_io_axi_w_ready;
  assign axi_reg_io_axi_arbiter_io_sharedInputs_0_arw_payload_addr = io_sharedOutputs_0_arw_validPipe_payload_addr[19:0];
  assign _zz_io_sharedInputs_0_arw_payload_id_2[3 : 0] = 4'b0000;
  assign io_output_arw_halfPipe_fire_1 = (io_output_arw_halfPipe_valid_1 && io_output_arw_halfPipe_ready_1);
  assign axi_reg_io_axi_arbiter_io_output_arw_ready = (! io_output_arw_rValid_1);
  assign io_output_arw_halfPipe_valid_1 = io_output_arw_rValid_1;
  assign io_output_arw_halfPipe_payload_addr_1 = io_output_arw_rData_addr_1;
  assign io_output_arw_halfPipe_payload_id_1 = io_output_arw_rData_id_1;
  assign io_output_arw_halfPipe_payload_len_1 = io_output_arw_rData_len_1;
  assign io_output_arw_halfPipe_payload_size_1 = io_output_arw_rData_size_1;
  assign io_output_arw_halfPipe_payload_burst_1 = io_output_arw_rData_burst_1;
  assign io_output_arw_halfPipe_payload_write_1 = io_output_arw_rData_write_1;
  assign io_output_arw_halfPipe_ready_1 = axi_reg_io_axi_arw_ready;
  assign io_output_w_s2mPipe_valid_1 = (axi_reg_io_axi_arbiter_io_output_w_valid || (! io_output_w_rValidN_1));
  assign io_output_w_s2mPipe_payload_data_1 = (io_output_w_rValidN_1 ? axi_reg_io_axi_arbiter_io_output_w_payload_data : io_output_w_rData_data_1);
  assign io_output_w_s2mPipe_payload_strb_1 = (io_output_w_rValidN_1 ? axi_reg_io_axi_arbiter_io_output_w_payload_strb : io_output_w_rData_strb_1);
  assign io_output_w_s2mPipe_payload_last_1 = (io_output_w_rValidN_1 ? axi_reg_io_axi_arbiter_io_output_w_payload_last : io_output_w_rData_last_1);
  always @(*) begin
    io_output_w_s2mPipe_ready_1 = io_output_w_s2mPipe_m2sPipe_ready_1;
    if(when_Stream_l399_4) begin
      io_output_w_s2mPipe_ready_1 = 1'b1;
    end
  end

  assign when_Stream_l399_4 = (! io_output_w_s2mPipe_m2sPipe_valid_1);
  assign io_output_w_s2mPipe_m2sPipe_valid_1 = io_output_w_s2mPipe_rValid_1;
  assign io_output_w_s2mPipe_m2sPipe_payload_data_1 = io_output_w_s2mPipe_rData_data_1;
  assign io_output_w_s2mPipe_m2sPipe_payload_strb_1 = io_output_w_s2mPipe_rData_strb_1;
  assign io_output_w_s2mPipe_m2sPipe_payload_last_1 = io_output_w_s2mPipe_rData_last_1;
  assign io_output_w_s2mPipe_m2sPipe_ready_1 = axi_reg_io_axi_w_ready;
  always @(posedge io_axiClk) begin
    if(when_Briey_l219) begin
      resetCtrl_systemResetCounter <= (resetCtrl_systemResetCounter + 6'h01);
    end
    if(when_Briey_l223) begin
      resetCtrl_systemResetCounter <= 6'h0;
    end
  end

  always @(posedge io_axiClk) begin
    resetCtrl_systemReset <= resetCtrl_systemResetUnbuffered;
    resetCtrl_axiReset <= resetCtrl_systemResetUnbuffered;
    if(debug_resetOut_regNext) begin
      resetCtrl_axiReset <= 1'b1;
    end
  end

  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      dBus_cmd_rValid <= 1'b0;
      dBus_cmd_stage_rValid <= 1'b0;
      dBus_cmd_stage_stage_rValidN <= 1'b1;
      dBusToAxi4Shared_pendingWrites_value <= 3'b000;
      dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0 <= 1'b1;
      dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1 <= 1'b1;
      _zz_1 <= 1'b0;
      io_outputs_0_ar_rValid <= 1'b0;
      io_sharedOutputs_0_arw_rValid <= 1'b0;
      io_sharedOutputs_1_arw_rValid <= 1'b0;
      io_sharedOutputs_2_arw_rValid <= 1'b0;
      io_input_r_rValid <= 1'b0;
      io_output_arw_rValid <= 1'b0;
      io_output_w_rValidN <= 1'b1;
      io_output_w_s2mPipe_rValid <= 1'b0;
      io_output_arw_rValid_1 <= 1'b0;
      io_output_w_rValidN_1 <= 1'b1;
      io_output_w_s2mPipe_rValid_1 <= 1'b0;
    end else begin
      if(axi_core_cpu_dBus_cmd_ready) begin
        dBus_cmd_rValid <= axi_core_cpu_dBus_cmd_valid;
      end
      if(dBus_cmd_stage_ready) begin
        dBus_cmd_stage_rValid <= dBus_cmd_stage_valid;
      end
      if(dBus_cmd_stage_stage_valid) begin
        dBus_cmd_stage_stage_rValidN <= 1'b0;
      end
      if(dBusToAxi4Shared_cmdPreFork_ready) begin
        dBus_cmd_stage_stage_rValidN <= 1'b1;
      end
      dBusToAxi4Shared_pendingWrites_value <= dBusToAxi4Shared_pendingWrites_valueNext;
      if(dBusToAxi4Shared_cmdFork_fire) begin
        dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(dBusToAxi4Shared_dataFork_fire) begin
        dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(dBusToAxi4Shared_cmdPreFork_haltWhen_ready) begin
        dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_0 <= 1'b1;
        dBusToAxi4Shared_cmdPreFork_haltWhen_fork2_logic_linkEnable_1 <= 1'b1;
      end
      if(dBusToAxi4Shared_cmdFork_fire) begin
        _zz_1 <= (! dBusToAxi4Shared_cmdFork_payload_last);
      end
      if(axi4ReadOnlyDecoder_1_io_outputs_0_ar_valid) begin
        io_outputs_0_ar_rValid <= 1'b1;
      end
      if(io_outputs_0_ar_validPipe_fire) begin
        io_outputs_0_ar_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_sharedOutputs_0_arw_valid) begin
        io_sharedOutputs_0_arw_rValid <= 1'b1;
      end
      if(io_sharedOutputs_0_arw_validPipe_fire) begin
        io_sharedOutputs_0_arw_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_sharedOutputs_1_arw_valid) begin
        io_sharedOutputs_1_arw_rValid <= 1'b1;
      end
      if(io_sharedOutputs_1_arw_validPipe_fire) begin
        io_sharedOutputs_1_arw_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_sharedOutputs_2_arw_valid) begin
        io_sharedOutputs_2_arw_rValid <= 1'b1;
      end
      if(io_sharedOutputs_2_arw_validPipe_fire) begin
        io_sharedOutputs_2_arw_rValid <= 1'b0;
      end
      if(dbus_axi_decoder_io_input_r_ready) begin
        io_input_r_rValid <= dbus_axi_decoder_io_input_r_valid;
      end
      if(axi_ram_io_axi_arbiter_io_output_arw_valid) begin
        io_output_arw_rValid <= 1'b1;
      end
      if(io_output_arw_halfPipe_fire) begin
        io_output_arw_rValid <= 1'b0;
      end
      if(axi_ram_io_axi_arbiter_io_output_w_valid) begin
        io_output_w_rValidN <= 1'b0;
      end
      if(io_output_w_s2mPipe_ready) begin
        io_output_w_rValidN <= 1'b1;
      end
      if(io_output_w_s2mPipe_ready) begin
        io_output_w_s2mPipe_rValid <= io_output_w_s2mPipe_valid;
      end
      if(axi_reg_io_axi_arbiter_io_output_arw_valid) begin
        io_output_arw_rValid_1 <= 1'b1;
      end
      if(io_output_arw_halfPipe_fire_1) begin
        io_output_arw_rValid_1 <= 1'b0;
      end
      if(axi_reg_io_axi_arbiter_io_output_w_valid) begin
        io_output_w_rValidN_1 <= 1'b0;
      end
      if(io_output_w_s2mPipe_ready_1) begin
        io_output_w_rValidN_1 <= 1'b1;
      end
      if(io_output_w_s2mPipe_ready_1) begin
        io_output_w_s2mPipe_rValid_1 <= io_output_w_s2mPipe_valid_1;
      end
    end
  end

  always @(posedge io_axiClk) begin
    if(axi_core_cpu_dBus_cmd_ready) begin
      dBus_cmd_rData_wr <= axi_core_cpu_dBus_cmd_payload_wr;
      dBus_cmd_rData_uncached <= axi_core_cpu_dBus_cmd_payload_uncached;
      dBus_cmd_rData_address <= axi_core_cpu_dBus_cmd_payload_address;
      dBus_cmd_rData_data <= axi_core_cpu_dBus_cmd_payload_data;
      dBus_cmd_rData_mask <= axi_core_cpu_dBus_cmd_payload_mask;
      dBus_cmd_rData_size <= axi_core_cpu_dBus_cmd_payload_size;
      dBus_cmd_rData_last <= axi_core_cpu_dBus_cmd_payload_last;
    end
    if(dBus_cmd_stage_ready) begin
      dBus_cmd_stage_rData_wr <= dBus_cmd_stage_payload_wr;
      dBus_cmd_stage_rData_uncached <= dBus_cmd_stage_payload_uncached;
      dBus_cmd_stage_rData_address <= dBus_cmd_stage_payload_address;
      dBus_cmd_stage_rData_data <= dBus_cmd_stage_payload_data;
      dBus_cmd_stage_rData_mask <= dBus_cmd_stage_payload_mask;
      dBus_cmd_stage_rData_size <= dBus_cmd_stage_payload_size;
      dBus_cmd_stage_rData_last <= dBus_cmd_stage_payload_last;
    end
    if(dBus_cmd_stage_stage_ready) begin
      dBus_cmd_stage_stage_rData_wr <= dBus_cmd_stage_stage_payload_wr;
      dBus_cmd_stage_stage_rData_uncached <= dBus_cmd_stage_stage_payload_uncached;
      dBus_cmd_stage_stage_rData_address <= dBus_cmd_stage_stage_payload_address;
      dBus_cmd_stage_stage_rData_data <= dBus_cmd_stage_stage_payload_data;
      dBus_cmd_stage_stage_rData_mask <= dBus_cmd_stage_stage_payload_mask;
      dBus_cmd_stage_stage_rData_size <= dBus_cmd_stage_stage_payload_size;
      dBus_cmd_stage_stage_rData_last <= dBus_cmd_stage_stage_payload_last;
    end
    if(dbus_axi_decoder_io_input_r_ready) begin
      io_input_r_rData_data <= dbus_axi_decoder_io_input_r_payload_data;
      io_input_r_rData_resp <= dbus_axi_decoder_io_input_r_payload_resp;
      io_input_r_rData_last <= dbus_axi_decoder_io_input_r_payload_last;
    end
    if(axi_ram_io_axi_arbiter_io_output_arw_ready) begin
      io_output_arw_rData_addr <= axi_ram_io_axi_arbiter_io_output_arw_payload_addr;
      io_output_arw_rData_id <= axi_ram_io_axi_arbiter_io_output_arw_payload_id;
      io_output_arw_rData_len <= axi_ram_io_axi_arbiter_io_output_arw_payload_len;
      io_output_arw_rData_size <= axi_ram_io_axi_arbiter_io_output_arw_payload_size;
      io_output_arw_rData_burst <= axi_ram_io_axi_arbiter_io_output_arw_payload_burst;
      io_output_arw_rData_write <= axi_ram_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(io_output_w_rValidN) begin
      io_output_w_rData_data <= axi_ram_io_axi_arbiter_io_output_w_payload_data;
      io_output_w_rData_strb <= axi_ram_io_axi_arbiter_io_output_w_payload_strb;
      io_output_w_rData_last <= axi_ram_io_axi_arbiter_io_output_w_payload_last;
    end
    if(io_output_w_s2mPipe_ready) begin
      io_output_w_s2mPipe_rData_data <= io_output_w_s2mPipe_payload_data;
      io_output_w_s2mPipe_rData_strb <= io_output_w_s2mPipe_payload_strb;
      io_output_w_s2mPipe_rData_last <= io_output_w_s2mPipe_payload_last;
    end
    if(axi_reg_io_axi_arbiter_io_output_arw_ready) begin
      io_output_arw_rData_addr_1 <= axi_reg_io_axi_arbiter_io_output_arw_payload_addr;
      io_output_arw_rData_id_1 <= axi_reg_io_axi_arbiter_io_output_arw_payload_id;
      io_output_arw_rData_len_1 <= axi_reg_io_axi_arbiter_io_output_arw_payload_len;
      io_output_arw_rData_size_1 <= axi_reg_io_axi_arbiter_io_output_arw_payload_size;
      io_output_arw_rData_burst_1 <= axi_reg_io_axi_arbiter_io_output_arw_payload_burst;
      io_output_arw_rData_write_1 <= axi_reg_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(io_output_w_rValidN_1) begin
      io_output_w_rData_data_1 <= axi_reg_io_axi_arbiter_io_output_w_payload_data;
      io_output_w_rData_strb_1 <= axi_reg_io_axi_arbiter_io_output_w_payload_strb;
      io_output_w_rData_last_1 <= axi_reg_io_axi_arbiter_io_output_w_payload_last;
    end
    if(io_output_w_s2mPipe_ready_1) begin
      io_output_w_s2mPipe_rData_data_1 <= io_output_w_s2mPipe_payload_data_1;
      io_output_w_s2mPipe_rData_strb_1 <= io_output_w_s2mPipe_payload_strb_1;
      io_output_w_s2mPipe_rData_last_1 <= io_output_w_s2mPipe_payload_last_1;
    end
  end

  always @(posedge io_axiClk) begin
    debug_resetOut_regNext <= axi_core_cpu_debug_resetOut;
  end

  always @(posedge io_axiClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      debug_bus_cmd_fire_regNext <= 1'b0;
    end else begin
      debug_bus_cmd_fire_regNext <= debug_bus_cmd_fire;
    end
  end


endmodule

module Axi4SharedArbiter_2 (
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [19:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [3:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [511:0]  io_sharedInputs_0_w_payload_data,
  input  wire [63:0]   io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [3:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [511:0]  io_sharedInputs_0_r_payload_data,
  output wire [3:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [19:0]   io_output_arw_payload_addr,
  output wire [3:0]    io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [511:0]  io_output_w_payload_data,
  output wire [63:0]   io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [511:0]  io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [19:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_availability;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [19:0]   inputsCmd_0_payload_addr;
  wire       [3:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [19:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [19:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1119;
  wire                when_Stream_l1119_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                when_Stream_l486;
  reg                 cmdRouteFork_throwWhen_valid;
  wire                cmdRouteFork_throwWhen_ready;
  wire       [19:0]   cmdRouteFork_throwWhen_payload_addr;
  wire       [3:0]    cmdRouteFork_throwWhen_payload_id;
  wire       [7:0]    cmdRouteFork_throwWhen_payload_len;
  wire       [2:0]    cmdRouteFork_throwWhen_payload_size;
  wire       [1:0]    cmdRouteFork_throwWhen_payload_burst;
  wire                cmdRouteFork_throwWhen_payload_write;
  wire                cmdRouteFork_throwWhen_translated_valid;
  wire                cmdRouteFork_throwWhen_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [511:0]  writeLogic_routeDataInput_payload_data;
  wire       [63:0]   writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire                readRspSels_0;

  StreamArbiter_2 cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[19:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[3:0]            ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[19:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH                 ), //o
    .io_axiClk                 (io_axiClk                              ), //i
    .resetCtrl_axiReset        (resetCtrl_axiReset                     )  //i
  );
  StreamFifoLowLatency cmdRouteFork_throwWhen_translated_fifo (
    .io_push_valid      (cmdRouteFork_throwWhen_translated_valid                    ), //i
    .io_push_ready      (cmdRouteFork_throwWhen_translated_fifo_io_push_ready       ), //o
    .io_pop_valid       (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready       (cmdRouteFork_throwWhen_translated_fifo_io_pop_ready        ), //i
    .io_flush           (1'b0                                                       ), //i
    .io_occupancy       (cmdRouteFork_throwWhen_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability    (cmdRouteFork_throwWhen_translated_fifo_io_availability[2:0]), //o
    .io_axiClk          (io_axiClk                                                  ), //i
    .resetCtrl_axiReset (resetCtrl_axiReset                                         )  //i
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1119) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1119_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1119 = ((! cmdOutputFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1119_1 = ((! cmdRouteFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? cmdOutputFork_payload_id : cmdOutputFork_payload_id);
  assign when_Stream_l486 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_throwWhen_valid = cmdRouteFork_valid;
    if(when_Stream_l486) begin
      cmdRouteFork_throwWhen_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_throwWhen_ready;
    if(when_Stream_l486) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_throwWhen_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_throwWhen_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_throwWhen_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_throwWhen_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_throwWhen_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_throwWhen_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_throwWhen_translated_valid = cmdRouteFork_throwWhen_valid;
  assign cmdRouteFork_throwWhen_ready = cmdRouteFork_throwWhen_translated_ready;
  assign cmdRouteFork_throwWhen_translated_ready = cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_throwWhen_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedArbiter_1 (
  input  wire          io_readInputs_0_ar_valid,
  output wire          io_readInputs_0_ar_ready,
  input  wire [14:0]   io_readInputs_0_ar_payload_addr,
  input  wire [2:0]    io_readInputs_0_ar_payload_id,
  input  wire [7:0]    io_readInputs_0_ar_payload_len,
  input  wire [2:0]    io_readInputs_0_ar_payload_size,
  input  wire [1:0]    io_readInputs_0_ar_payload_burst,
  output wire          io_readInputs_0_r_valid,
  input  wire          io_readInputs_0_r_ready,
  output wire [511:0]  io_readInputs_0_r_payload_data,
  output wire [2:0]    io_readInputs_0_r_payload_id,
  output wire [1:0]    io_readInputs_0_r_payload_resp,
  output wire          io_readInputs_0_r_payload_last,
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [14:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [511:0]  io_sharedInputs_0_w_payload_data,
  input  wire [63:0]   io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [2:0]    io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [511:0]  io_sharedInputs_0_r_payload_data,
  output wire [2:0]    io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [14:0]   io_output_arw_payload_addr,
  output wire [3:0]    io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [511:0]  io_output_w_payload_data,
  output wire [63:0]   io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [3:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [511:0]  io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [14:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_availability;
  wire       [1:0]    _zz__zz_io_output_arw_payload_id;
  wire       [3:0]    _zz_io_output_arw_payload_id_1;
  wire       [2:0]    _zz_io_output_arw_payload_id_2;
  reg                 _zz_io_output_r_ready;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [14:0]   inputsCmd_0_payload_addr;
  wire       [2:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                inputsCmd_1_valid;
  wire                inputsCmd_1_ready;
  wire       [14:0]   inputsCmd_1_payload_addr;
  wire       [2:0]    inputsCmd_1_payload_id;
  wire       [7:0]    inputsCmd_1_payload_len;
  wire       [2:0]    inputsCmd_1_payload_size;
  wire       [1:0]    inputsCmd_1_payload_burst;
  wire                inputsCmd_1_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [14:0]   cmdOutputFork_payload_addr;
  wire       [2:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [14:0]   cmdRouteFork_payload_addr;
  wire       [2:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1119;
  wire                when_Stream_l1119_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                _zz_io_output_arw_payload_id;
  wire                when_Stream_l486;
  reg                 cmdRouteFork_throwWhen_valid;
  wire                cmdRouteFork_throwWhen_ready;
  wire       [14:0]   cmdRouteFork_throwWhen_payload_addr;
  wire       [2:0]    cmdRouteFork_throwWhen_payload_id;
  wire       [7:0]    cmdRouteFork_throwWhen_payload_len;
  wire       [2:0]    cmdRouteFork_throwWhen_payload_size;
  wire       [1:0]    cmdRouteFork_throwWhen_payload_burst;
  wire                cmdRouteFork_throwWhen_payload_write;
  wire                cmdRouteFork_throwWhen_translated_valid;
  wire                cmdRouteFork_throwWhen_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [511:0]  writeLogic_routeDataInput_payload_data;
  wire       [63:0]   writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  assign _zz__zz_io_output_arw_payload_id = {cmdArbiter_io_chosenOH[1 : 1],cmdArbiter_io_chosenOH[0 : 0]};
  assign _zz_io_output_arw_payload_id_2 = cmdOutputFork_payload_id;
  assign _zz_io_output_arw_payload_id_1 = {1'd0, _zz_io_output_arw_payload_id_2};
  StreamArbiter_1 cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[14:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[2:0]            ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_inputs_1_valid         (inputsCmd_1_valid                      ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (inputsCmd_1_payload_addr[14:0]         ), //i
    .io_inputs_1_payload_id    (inputsCmd_1_payload_id[2:0]            ), //i
    .io_inputs_1_payload_len   (inputsCmd_1_payload_len[7:0]           ), //i
    .io_inputs_1_payload_size  (inputsCmd_1_payload_size[2:0]          ), //i
    .io_inputs_1_payload_burst (inputsCmd_1_payload_burst[1:0]         ), //i
    .io_inputs_1_payload_write (inputsCmd_1_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[14:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[2:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosen                 (cmdArbiter_io_chosen                   ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[1:0]            ), //o
    .io_axiClk                 (io_axiClk                              ), //i
    .resetCtrl_axiReset        (resetCtrl_axiReset                     )  //i
  );
  StreamFifoLowLatency cmdRouteFork_throwWhen_translated_fifo (
    .io_push_valid      (cmdRouteFork_throwWhen_translated_valid                    ), //i
    .io_push_ready      (cmdRouteFork_throwWhen_translated_fifo_io_push_ready       ), //o
    .io_pop_valid       (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready       (cmdRouteFork_throwWhen_translated_fifo_io_pop_ready        ), //i
    .io_flush           (1'b0                                                       ), //i
    .io_occupancy       (cmdRouteFork_throwWhen_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability    (cmdRouteFork_throwWhen_translated_fifo_io_availability[2:0]), //o
    .io_axiClk          (io_axiClk                                                  ), //i
    .resetCtrl_axiReset (resetCtrl_axiReset                                         )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : _zz_io_output_r_ready = io_readInputs_0_r_ready;
      default : _zz_io_output_r_ready = io_sharedInputs_0_r_ready;
    endcase
  end

  assign inputsCmd_0_valid = io_readInputs_0_ar_valid;
  assign io_readInputs_0_ar_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_readInputs_0_ar_payload_addr;
  assign inputsCmd_0_payload_id = io_readInputs_0_ar_payload_id;
  assign inputsCmd_0_payload_len = io_readInputs_0_ar_payload_len;
  assign inputsCmd_0_payload_size = io_readInputs_0_ar_payload_size;
  assign inputsCmd_0_payload_burst = io_readInputs_0_ar_payload_burst;
  assign inputsCmd_0_payload_write = 1'b0;
  assign inputsCmd_1_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_1_ready;
  assign inputsCmd_1_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_1_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_1_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_1_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_1_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_1_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign inputsCmd_1_ready = cmdArbiter_io_inputs_1_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1119) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1119_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1119 = ((! cmdOutputFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1119_1 = ((! cmdRouteFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign _zz_io_output_arw_payload_id = _zz__zz_io_output_arw_payload_id[1];
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? _zz_io_output_arw_payload_id_1 : {_zz_io_output_arw_payload_id,cmdOutputFork_payload_id});
  assign when_Stream_l486 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_throwWhen_valid = cmdRouteFork_valid;
    if(when_Stream_l486) begin
      cmdRouteFork_throwWhen_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_throwWhen_ready;
    if(when_Stream_l486) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_throwWhen_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_throwWhen_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_throwWhen_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_throwWhen_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_throwWhen_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_throwWhen_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_throwWhen_translated_valid = cmdRouteFork_throwWhen_valid;
  assign cmdRouteFork_throwWhen_ready = cmdRouteFork_throwWhen_translated_ready;
  assign cmdRouteFork_throwWhen_translated_ready = cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_throwWhen_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id[2:0];
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == 1'b0);
  assign readRspSels_1 = (readRspIndex == 1'b1);
  assign io_readInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_readInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_output_r_ready = _zz_io_output_r_ready;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedArbiter (
  input  wire          io_sharedInputs_0_arw_valid,
  output wire          io_sharedInputs_0_arw_ready,
  input  wire [14:0]   io_sharedInputs_0_arw_payload_addr,
  input  wire [11:0]   io_sharedInputs_0_arw_payload_id,
  input  wire [7:0]    io_sharedInputs_0_arw_payload_len,
  input  wire [2:0]    io_sharedInputs_0_arw_payload_size,
  input  wire [1:0]    io_sharedInputs_0_arw_payload_burst,
  input  wire          io_sharedInputs_0_arw_payload_write,
  input  wire          io_sharedInputs_0_w_valid,
  output wire          io_sharedInputs_0_w_ready,
  input  wire [511:0]  io_sharedInputs_0_w_payload_data,
  input  wire [63:0]   io_sharedInputs_0_w_payload_strb,
  input  wire          io_sharedInputs_0_w_payload_last,
  output wire          io_sharedInputs_0_b_valid,
  input  wire          io_sharedInputs_0_b_ready,
  output wire [11:0]   io_sharedInputs_0_b_payload_id,
  output wire [1:0]    io_sharedInputs_0_b_payload_resp,
  output wire          io_sharedInputs_0_r_valid,
  input  wire          io_sharedInputs_0_r_ready,
  output wire [511:0]  io_sharedInputs_0_r_payload_data,
  output wire [11:0]   io_sharedInputs_0_r_payload_id,
  output wire [1:0]    io_sharedInputs_0_r_payload_resp,
  output wire          io_sharedInputs_0_r_payload_last,
  output wire          io_output_arw_valid,
  input  wire          io_output_arw_ready,
  output wire [14:0]   io_output_arw_payload_addr,
  output wire [11:0]   io_output_arw_payload_id,
  output wire [7:0]    io_output_arw_payload_len,
  output wire [2:0]    io_output_arw_payload_size,
  output wire [1:0]    io_output_arw_payload_burst,
  output wire          io_output_arw_payload_write,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [511:0]  io_output_w_payload_data,
  output wire [63:0]   io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [11:0]   io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [511:0]  io_output_r_payload_data,
  input  wire [11:0]   io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [14:0]   cmdArbiter_io_output_payload_addr;
  wire       [11:0]   cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  wire                cmdRouteFork_throwWhen_translated_fifo_io_pop_valid;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_throwWhen_translated_fifo_io_availability;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [14:0]   inputsCmd_0_payload_addr;
  wire       [11:0]   inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [14:0]   cmdOutputFork_payload_addr;
  wire       [11:0]   cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire                cmdOutputFork_payload_write;
  wire                cmdRouteFork_valid;
  reg                 cmdRouteFork_ready;
  wire       [14:0]   cmdRouteFork_payload_addr;
  wire       [11:0]   cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire                cmdRouteFork_payload_write;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1119;
  wire                when_Stream_l1119_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                when_Stream_l486;
  reg                 cmdRouteFork_throwWhen_valid;
  wire                cmdRouteFork_throwWhen_ready;
  wire       [14:0]   cmdRouteFork_throwWhen_payload_addr;
  wire       [11:0]   cmdRouteFork_throwWhen_payload_id;
  wire       [7:0]    cmdRouteFork_throwWhen_payload_len;
  wire       [2:0]    cmdRouteFork_throwWhen_payload_size;
  wire       [1:0]    cmdRouteFork_throwWhen_payload_burst;
  wire                cmdRouteFork_throwWhen_payload_write;
  wire                cmdRouteFork_throwWhen_translated_valid;
  wire                cmdRouteFork_throwWhen_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [511:0]  writeLogic_routeDataInput_payload_data;
  wire       [63:0]   writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                io_output_w_fire;
  wire                writeLogic_writeRspSels_0;
  wire                readRspSels_0;

  StreamArbiter cmdArbiter (
    .io_inputs_0_valid         (inputsCmd_0_valid                      ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (inputsCmd_0_payload_addr[14:0]         ), //i
    .io_inputs_0_payload_id    (inputsCmd_0_payload_id[11:0]           ), //i
    .io_inputs_0_payload_len   (inputsCmd_0_payload_len[7:0]           ), //i
    .io_inputs_0_payload_size  (inputsCmd_0_payload_size[2:0]          ), //i
    .io_inputs_0_payload_burst (inputsCmd_0_payload_burst[1:0]         ), //i
    .io_inputs_0_payload_write (inputsCmd_0_payload_write              ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[14:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[11:0]  ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_write   (cmdArbiter_io_output_payload_write     ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH                 ), //o
    .io_axiClk                 (io_axiClk                              ), //i
    .resetCtrl_axiReset        (resetCtrl_axiReset                     )  //i
  );
  StreamFifoLowLatency cmdRouteFork_throwWhen_translated_fifo (
    .io_push_valid      (cmdRouteFork_throwWhen_translated_valid                    ), //i
    .io_push_ready      (cmdRouteFork_throwWhen_translated_fifo_io_push_ready       ), //o
    .io_pop_valid       (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready       (cmdRouteFork_throwWhen_translated_fifo_io_pop_ready        ), //i
    .io_flush           (1'b0                                                       ), //i
    .io_occupancy       (cmdRouteFork_throwWhen_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability    (cmdRouteFork_throwWhen_translated_fifo_io_availability[2:0]), //o
    .io_axiClk          (io_axiClk                                                  ), //i
    .resetCtrl_axiReset (resetCtrl_axiReset                                         )  //i
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1119) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1119_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1119 = ((! cmdOutputFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1119_1 = ((! cmdRouteFork_ready) && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_write = cmdArbiter_io_output_payload_write;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_arw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_arw_ready;
  assign io_output_arw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_arw_payload_len = cmdOutputFork_payload_len;
  assign io_output_arw_payload_size = cmdOutputFork_payload_size;
  assign io_output_arw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_arw_payload_write = cmdOutputFork_payload_write;
  assign io_output_arw_payload_id = (cmdOutputFork_payload_write ? cmdOutputFork_payload_id : cmdOutputFork_payload_id);
  assign when_Stream_l486 = (! cmdRouteFork_payload_write);
  always @(*) begin
    cmdRouteFork_throwWhen_valid = cmdRouteFork_valid;
    if(when_Stream_l486) begin
      cmdRouteFork_throwWhen_valid = 1'b0;
    end
  end

  always @(*) begin
    cmdRouteFork_ready = cmdRouteFork_throwWhen_ready;
    if(when_Stream_l486) begin
      cmdRouteFork_ready = 1'b1;
    end
  end

  assign cmdRouteFork_throwWhen_payload_addr = cmdRouteFork_payload_addr;
  assign cmdRouteFork_throwWhen_payload_id = cmdRouteFork_payload_id;
  assign cmdRouteFork_throwWhen_payload_len = cmdRouteFork_payload_len;
  assign cmdRouteFork_throwWhen_payload_size = cmdRouteFork_payload_size;
  assign cmdRouteFork_throwWhen_payload_burst = cmdRouteFork_payload_burst;
  assign cmdRouteFork_throwWhen_payload_write = cmdRouteFork_payload_write;
  assign cmdRouteFork_throwWhen_translated_valid = cmdRouteFork_throwWhen_valid;
  assign cmdRouteFork_throwWhen_ready = cmdRouteFork_throwWhen_translated_ready;
  assign cmdRouteFork_throwWhen_translated_ready = cmdRouteFork_throwWhen_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((cmdRouteFork_throwWhen_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_throwWhen_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedDecoder (
  input  wire          io_input_arw_valid,
  output wire          io_input_arw_ready,
  input  wire [31:0]   io_input_arw_payload_addr,
  input  wire [7:0]    io_input_arw_payload_len,
  input  wire [2:0]    io_input_arw_payload_size,
  input  wire [3:0]    io_input_arw_payload_cache,
  input  wire [2:0]    io_input_arw_payload_prot,
  input  wire          io_input_arw_payload_write,
  input  wire          io_input_w_valid,
  output wire          io_input_w_ready,
  input  wire [511:0]  io_input_w_payload_data,
  input  wire [63:0]   io_input_w_payload_strb,
  input  wire          io_input_w_payload_last,
  output wire          io_input_b_valid,
  input  wire          io_input_b_ready,
  output reg  [1:0]    io_input_b_payload_resp,
  output wire          io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [511:0]  io_input_r_payload_data,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_sharedOutputs_0_arw_valid,
  input  wire          io_sharedOutputs_0_arw_ready,
  output wire [31:0]   io_sharedOutputs_0_arw_payload_addr,
  output wire [7:0]    io_sharedOutputs_0_arw_payload_len,
  output wire [2:0]    io_sharedOutputs_0_arw_payload_size,
  output wire [3:0]    io_sharedOutputs_0_arw_payload_cache,
  output wire [2:0]    io_sharedOutputs_0_arw_payload_prot,
  output wire          io_sharedOutputs_0_arw_payload_write,
  output wire          io_sharedOutputs_0_w_valid,
  input  wire          io_sharedOutputs_0_w_ready,
  output wire [511:0]  io_sharedOutputs_0_w_payload_data,
  output wire [63:0]   io_sharedOutputs_0_w_payload_strb,
  output wire          io_sharedOutputs_0_w_payload_last,
  input  wire          io_sharedOutputs_0_b_valid,
  output wire          io_sharedOutputs_0_b_ready,
  input  wire [1:0]    io_sharedOutputs_0_b_payload_resp,
  input  wire          io_sharedOutputs_0_r_valid,
  output wire          io_sharedOutputs_0_r_ready,
  input  wire [511:0]  io_sharedOutputs_0_r_payload_data,
  input  wire [1:0]    io_sharedOutputs_0_r_payload_resp,
  input  wire          io_sharedOutputs_0_r_payload_last,
  output wire          io_sharedOutputs_1_arw_valid,
  input  wire          io_sharedOutputs_1_arw_ready,
  output wire [31:0]   io_sharedOutputs_1_arw_payload_addr,
  output wire [7:0]    io_sharedOutputs_1_arw_payload_len,
  output wire [2:0]    io_sharedOutputs_1_arw_payload_size,
  output wire [3:0]    io_sharedOutputs_1_arw_payload_cache,
  output wire [2:0]    io_sharedOutputs_1_arw_payload_prot,
  output wire          io_sharedOutputs_1_arw_payload_write,
  output wire          io_sharedOutputs_1_w_valid,
  input  wire          io_sharedOutputs_1_w_ready,
  output wire [511:0]  io_sharedOutputs_1_w_payload_data,
  output wire [63:0]   io_sharedOutputs_1_w_payload_strb,
  output wire          io_sharedOutputs_1_w_payload_last,
  input  wire          io_sharedOutputs_1_b_valid,
  output wire          io_sharedOutputs_1_b_ready,
  input  wire [1:0]    io_sharedOutputs_1_b_payload_resp,
  input  wire          io_sharedOutputs_1_r_valid,
  output wire          io_sharedOutputs_1_r_ready,
  input  wire [511:0]  io_sharedOutputs_1_r_payload_data,
  input  wire [1:0]    io_sharedOutputs_1_r_payload_resp,
  input  wire          io_sharedOutputs_1_r_payload_last,
  output wire          io_sharedOutputs_2_arw_valid,
  input  wire          io_sharedOutputs_2_arw_ready,
  output wire [31:0]   io_sharedOutputs_2_arw_payload_addr,
  output wire [7:0]    io_sharedOutputs_2_arw_payload_len,
  output wire [2:0]    io_sharedOutputs_2_arw_payload_size,
  output wire [3:0]    io_sharedOutputs_2_arw_payload_cache,
  output wire [2:0]    io_sharedOutputs_2_arw_payload_prot,
  output wire          io_sharedOutputs_2_arw_payload_write,
  output wire          io_sharedOutputs_2_w_valid,
  input  wire          io_sharedOutputs_2_w_ready,
  output wire [511:0]  io_sharedOutputs_2_w_payload_data,
  output wire [63:0]   io_sharedOutputs_2_w_payload_strb,
  output wire          io_sharedOutputs_2_w_payload_last,
  input  wire          io_sharedOutputs_2_b_valid,
  output wire          io_sharedOutputs_2_b_ready,
  input  wire [1:0]    io_sharedOutputs_2_b_payload_resp,
  input  wire          io_sharedOutputs_2_r_valid,
  output wire          io_sharedOutputs_2_r_ready,
  input  wire [511:0]  io_sharedOutputs_2_r_payload_data,
  input  wire [1:0]    io_sharedOutputs_2_r_payload_resp,
  input  wire          io_sharedOutputs_2_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  wire                errorSlave_io_axi_arw_valid;
  wire                errorSlave_io_axi_w_valid;
  wire                errorSlave_io_axi_arw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire       [1:0]    errorSlave_io_axi_b_payload_resp;
  wire                errorSlave_io_axi_r_valid;
  wire       [511:0]  errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  reg        [1:0]    _zz_io_input_b_payload_resp;
  reg        [511:0]  _zz_io_input_r_payload_data;
  reg        [1:0]    _zz_io_input_r_payload_resp;
  reg                 _zz_io_input_r_payload_last;
  reg        [2:0]    _zz_pendingCmdCounter;
  reg        [2:0]    _zz_pendingCmdCounter_1;
  reg        [2:0]    _zz_pendingCmdCounter_2;
  wire                cmdAllowedStart;
  wire                io_input_arw_fire;
  wire                io_input_b_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l782;
  reg        [2:0]    pendingCmdCounter;
  wire       [2:0]    _zz_pendingCmdCounter_3;
  wire                when_Utils_l716;
  wire                io_input_w_fire;
  wire                when_Utils_l719;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_mayOverflow;
  wire                pendingDataCounter_mayUnderflow;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  wire                pendingDataCounter_willUnderflowIfDec;
  wire                pendingDataCounter_willUnderflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire                when_Utils_l751;
  wire                when_Utils_l753;
  wire       [2:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [2:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_cmdAllowedStart;
  wire       [2:0]    _zz_io_sharedOutputs_0_arw_valid;
  wire       [2:0]    _zz_io_sharedOutputs_0_w_valid;
  wire       [2:0]    _zz_writeRspIndex;
  wire                _zz_writeRspIndex_1;
  wire                _zz_writeRspIndex_2;
  wire       [1:0]    writeRspIndex;
  wire       [2:0]    _zz_readRspIndex;
  wire                _zz_readRspIndex_1;
  wire                _zz_readRspIndex_2;
  wire       [1:0]    readRspIndex;

  Axi4SharedErrorSlave errorSlave (
    .io_axi_arw_valid         (errorSlave_io_axi_arw_valid            ), //i
    .io_axi_arw_ready         (errorSlave_io_axi_arw_ready            ), //o
    .io_axi_arw_payload_addr  (io_input_arw_payload_addr[31:0]        ), //i
    .io_axi_arw_payload_len   (io_input_arw_payload_len[7:0]          ), //i
    .io_axi_arw_payload_size  (io_input_arw_payload_size[2:0]         ), //i
    .io_axi_arw_payload_cache (io_input_arw_payload_cache[3:0]        ), //i
    .io_axi_arw_payload_prot  (io_input_arw_payload_prot[2:0]         ), //i
    .io_axi_arw_payload_write (io_input_arw_payload_write             ), //i
    .io_axi_w_valid           (errorSlave_io_axi_w_valid              ), //i
    .io_axi_w_ready           (errorSlave_io_axi_w_ready              ), //o
    .io_axi_w_payload_data    (io_input_w_payload_data[511:0]         ), //i
    .io_axi_w_payload_strb    (io_input_w_payload_strb[63:0]          ), //i
    .io_axi_w_payload_last    (io_input_w_payload_last                ), //i
    .io_axi_b_valid           (errorSlave_io_axi_b_valid              ), //o
    .io_axi_b_ready           (io_input_b_ready                       ), //i
    .io_axi_b_payload_resp    (errorSlave_io_axi_b_payload_resp[1:0]  ), //o
    .io_axi_r_valid           (errorSlave_io_axi_r_valid              ), //o
    .io_axi_r_ready           (io_input_r_ready                       ), //i
    .io_axi_r_payload_data    (errorSlave_io_axi_r_payload_data[511:0]), //o
    .io_axi_r_payload_resp    (errorSlave_io_axi_r_payload_resp[1:0]  ), //o
    .io_axi_r_payload_last    (errorSlave_io_axi_r_payload_last       ), //o
    .io_axiClk                (io_axiClk                              ), //i
    .resetCtrl_axiReset       (resetCtrl_axiReset                     )  //i
  );
  always @(*) begin
    case(writeRspIndex)
      2'b00 : _zz_io_input_b_payload_resp = io_sharedOutputs_0_b_payload_resp;
      2'b01 : _zz_io_input_b_payload_resp = io_sharedOutputs_1_b_payload_resp;
      default : _zz_io_input_b_payload_resp = io_sharedOutputs_2_b_payload_resp;
    endcase
  end

  always @(*) begin
    case(readRspIndex)
      2'b00 : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_0_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_0_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_0_r_payload_last;
      end
      2'b01 : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_1_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_1_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_1_r_payload_last;
      end
      default : begin
        _zz_io_input_r_payload_data = io_sharedOutputs_2_r_payload_data;
        _zz_io_input_r_payload_resp = io_sharedOutputs_2_r_payload_resp;
        _zz_io_input_r_payload_last = io_sharedOutputs_2_r_payload_last;
      end
    endcase
  end

  always @(*) begin
    _zz_pendingCmdCounter = _zz_pendingCmdCounter_1;
    if(when_Utils_l782) begin
      _zz_pendingCmdCounter = (_zz_pendingCmdCounter_1 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_1 = _zz_pendingCmdCounter_2;
    if(io_input_b_fire) begin
      _zz_pendingCmdCounter_1 = (_zz_pendingCmdCounter_2 - 3'b001);
    end
  end

  always @(*) begin
    _zz_pendingCmdCounter_2 = _zz_pendingCmdCounter_3;
    if(io_input_arw_fire) begin
      _zz_pendingCmdCounter_2 = (_zz_pendingCmdCounter_3 + 3'b001);
    end
  end

  assign io_input_arw_fire = (io_input_arw_valid && io_input_arw_ready);
  assign io_input_b_fire = (io_input_b_valid && io_input_b_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l782 = (io_input_r_fire && io_input_r_payload_last);
  assign _zz_pendingCmdCounter_3 = pendingCmdCounter;
  assign when_Utils_l716 = (cmdAllowedStart && io_input_arw_payload_write);
  assign io_input_w_fire = (io_input_w_valid && io_input_w_ready);
  assign when_Utils_l719 = (io_input_w_fire && io_input_w_payload_last);
  always @(*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if(when_Utils_l716) begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(when_Utils_l719) begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_mayOverflow = (pendingDataCounter_value == 3'b111);
  assign pendingDataCounter_mayUnderflow = (pendingDataCounter_value == 3'b000);
  assign pendingDataCounter_willOverflowIfInc = (pendingDataCounter_mayOverflow && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  assign pendingDataCounter_willUnderflowIfDec = (pendingDataCounter_mayUnderflow && (! pendingDataCounter_incrementIt));
  assign pendingDataCounter_willUnderflow = (pendingDataCounter_willUnderflowIfDec && pendingDataCounter_decrementIt);
  assign when_Utils_l751 = (pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l751) begin
      pendingDataCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l753) begin
        pendingDataCounter_finalIncrement = 3'b111;
      end else begin
        pendingDataCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l753 = ((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt);
  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = {((io_input_arw_payload_addr & (~ 32'h00007fff)) == 32'h80000000),{((io_input_arw_payload_addr & (~ 32'h00007fff)) == 32'ha0000000),((io_input_arw_payload_addr & (~ 32'h00000fff)) == 32'hf0000000)}};
  assign decodedCmdError = (decodedCmdSels == 3'b000);
  assign allowCmd = ((pendingCmdCounter == 3'b000) || ((pendingCmdCounter != 3'b111) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != 3'b000);
  assign cmdAllowedStart = ((io_input_arw_valid && allowCmd) && _zz_cmdAllowedStart);
  assign io_input_arw_ready = (((|(decodedCmdSels & {io_sharedOutputs_2_arw_ready,{io_sharedOutputs_1_arw_ready,io_sharedOutputs_0_arw_ready}})) || (decodedCmdError && errorSlave_io_axi_arw_ready)) && allowCmd);
  assign errorSlave_io_axi_arw_valid = ((io_input_arw_valid && decodedCmdError) && allowCmd);
  assign _zz_io_sharedOutputs_0_arw_valid = decodedCmdSels[2 : 0];
  assign io_sharedOutputs_0_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[0]) && allowCmd);
  assign io_sharedOutputs_0_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_0_arw_payload_len = io_input_arw_payload_len;
  assign io_sharedOutputs_0_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_0_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_0_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_0_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_1_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[1]) && allowCmd);
  assign io_sharedOutputs_1_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_1_arw_payload_len = io_input_arw_payload_len;
  assign io_sharedOutputs_1_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_1_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_1_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_1_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_2_arw_valid = ((io_input_arw_valid && _zz_io_sharedOutputs_0_arw_valid[2]) && allowCmd);
  assign io_sharedOutputs_2_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_2_arw_payload_len = io_input_arw_payload_len;
  assign io_sharedOutputs_2_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_2_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_2_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_2_arw_payload_write = io_input_arw_payload_write;
  assign io_input_w_ready = (((|(pendingSels[2 : 0] & {io_sharedOutputs_2_w_ready,{io_sharedOutputs_1_w_ready,io_sharedOutputs_0_w_ready}})) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign errorSlave_io_axi_w_valid = ((io_input_w_valid && pendingError) && allowData);
  assign _zz_io_sharedOutputs_0_w_valid = pendingSels[2 : 0];
  assign io_sharedOutputs_0_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[0]) && allowData);
  assign io_sharedOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_0_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_1_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[1]) && allowData);
  assign io_sharedOutputs_1_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_1_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_1_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_2_w_valid = ((io_input_w_valid && _zz_io_sharedOutputs_0_w_valid[2]) && allowData);
  assign io_sharedOutputs_2_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_2_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_2_w_payload_last = io_input_w_payload_last;
  assign _zz_writeRspIndex = pendingSels[2 : 0];
  assign _zz_writeRspIndex_1 = _zz_writeRspIndex[1];
  assign _zz_writeRspIndex_2 = _zz_writeRspIndex[2];
  assign writeRspIndex = {_zz_writeRspIndex_2,_zz_writeRspIndex_1};
  assign io_input_b_valid = ((|{io_sharedOutputs_2_b_valid,{io_sharedOutputs_1_b_valid,io_sharedOutputs_0_b_valid}}) || errorSlave_io_axi_b_valid);
  always @(*) begin
    io_input_b_payload_resp = _zz_io_input_b_payload_resp;
    if(pendingError) begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_sharedOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_1_b_ready = io_input_b_ready;
  assign io_sharedOutputs_2_b_ready = io_input_b_ready;
  assign _zz_readRspIndex = pendingSels[2 : 0];
  assign _zz_readRspIndex_1 = _zz_readRspIndex[1];
  assign _zz_readRspIndex_2 = _zz_readRspIndex[2];
  assign readRspIndex = {_zz_readRspIndex_2,_zz_readRspIndex_1};
  assign io_input_r_valid = ((|{io_sharedOutputs_2_r_valid,{io_sharedOutputs_1_r_valid,io_sharedOutputs_0_r_valid}}) || errorSlave_io_axi_r_valid);
  assign io_input_r_payload_data = _zz_io_input_r_payload_data;
  always @(*) begin
    io_input_r_payload_resp = _zz_io_input_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = _zz_io_input_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_sharedOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_1_r_ready = io_input_r_ready;
  assign io_sharedOutputs_2_r_ready = io_input_r_ready;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      pendingCmdCounter <= 3'b000;
      pendingDataCounter_value <= 3'b000;
      pendingSels <= 3'b000;
      pendingError <= 1'b0;
      _zz_cmdAllowedStart <= 1'b1;
    end else begin
      pendingCmdCounter <= _zz_pendingCmdCounter;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart) begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart) begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart) begin
        _zz_cmdAllowedStart <= 1'b0;
      end
      if(io_input_arw_ready) begin
        _zz_cmdAllowedStart <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyDecoder (
  input  wire          io_input_ar_valid,
  output wire          io_input_ar_ready,
  input  wire [31:0]   io_input_ar_payload_addr,
  input  wire [7:0]    io_input_ar_payload_len,
  input  wire [1:0]    io_input_ar_payload_burst,
  input  wire [3:0]    io_input_ar_payload_cache,
  input  wire [2:0]    io_input_ar_payload_prot,
  output reg           io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [511:0]  io_input_r_payload_data,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_outputs_0_ar_valid,
  input  wire          io_outputs_0_ar_ready,
  output wire [31:0]   io_outputs_0_ar_payload_addr,
  output wire [7:0]    io_outputs_0_ar_payload_len,
  output wire [1:0]    io_outputs_0_ar_payload_burst,
  output wire [3:0]    io_outputs_0_ar_payload_cache,
  output wire [2:0]    io_outputs_0_ar_payload_prot,
  input  wire          io_outputs_0_r_valid,
  output wire          io_outputs_0_r_ready,
  input  wire [511:0]  io_outputs_0_r_payload_data,
  input  wire [1:0]    io_outputs_0_r_payload_resp,
  input  wire          io_outputs_0_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [511:0]  errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l719;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_mayOverflow;
  wire                pendingCmdCounter_mayUnderflow;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  wire                pendingCmdCounter_willUnderflowIfDec;
  wire                pendingCmdCounter_willUnderflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l751;
  wire                when_Utils_l753;
  wire       [0:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [0:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;

  Axi4ReadOnlyErrorSlave errorSlave (
    .io_axi_ar_valid         (errorSlave_io_axi_ar_valid             ), //i
    .io_axi_ar_ready         (errorSlave_io_axi_ar_ready             ), //o
    .io_axi_ar_payload_addr  (io_input_ar_payload_addr[31:0]         ), //i
    .io_axi_ar_payload_len   (io_input_ar_payload_len[7:0]           ), //i
    .io_axi_ar_payload_burst (io_input_ar_payload_burst[1:0]         ), //i
    .io_axi_ar_payload_cache (io_input_ar_payload_cache[3:0]         ), //i
    .io_axi_ar_payload_prot  (io_input_ar_payload_prot[2:0]          ), //i
    .io_axi_r_valid          (errorSlave_io_axi_r_valid              ), //o
    .io_axi_r_ready          (io_input_r_ready                       ), //i
    .io_axi_r_payload_data   (errorSlave_io_axi_r_payload_data[511:0]), //o
    .io_axi_r_payload_resp   (errorSlave_io_axi_r_payload_resp[1:0]  ), //o
    .io_axi_r_payload_last   (errorSlave_io_axi_r_payload_last       ), //o
    .io_axiClk               (io_axiClk                              ), //i
    .resetCtrl_axiReset      (resetCtrl_axiReset                     )  //i
  );
  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l719 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l719) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_mayOverflow = (pendingCmdCounter_value == 3'b111);
  assign pendingCmdCounter_mayUnderflow = (pendingCmdCounter_value == 3'b000);
  assign pendingCmdCounter_willOverflowIfInc = (pendingCmdCounter_mayOverflow && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign pendingCmdCounter_willUnderflowIfDec = (pendingCmdCounter_mayUnderflow && (! pendingCmdCounter_incrementIt));
  assign pendingCmdCounter_willUnderflow = (pendingCmdCounter_willUnderflowIfDec && pendingCmdCounter_decrementIt);
  assign when_Utils_l751 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l751) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l753) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l753 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = (((io_input_ar_payload_addr & (~ 32'h00007fff)) == 32'h80000000) && io_input_ar_valid);
  assign decodedCmdError = (decodedCmdSels == 1'b0);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = (((|(decodedCmdSels & io_outputs_0_ar_ready)) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_0_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_0_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_0_ar_payload_prot = io_input_ar_payload_prot;
  always @(*) begin
    io_input_r_valid = (|io_outputs_0_r_valid);
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = io_outputs_0_r_payload_data;
  always @(*) begin
    io_input_r_payload_resp = io_outputs_0_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = io_outputs_0_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 1'b0;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
    end
  end


endmodule

module SystemDebugger (
  input  wire          io_remote_cmd_valid,
  output wire          io_remote_cmd_ready,
  input  wire          io_remote_cmd_payload_last,
  input  wire [0:0]    io_remote_cmd_payload_fragment,
  output wire          io_remote_rsp_valid,
  input  wire          io_remote_rsp_ready,
  output wire          io_remote_rsp_payload_error,
  output wire [31:0]   io_remote_rsp_payload_data,
  output wire          io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output wire [31:0]   io_mem_cmd_payload_address,
  output wire [31:0]   io_mem_cmd_payload_data,
  output wire          io_mem_cmd_payload_wr,
  output wire [1:0]    io_mem_cmd_payload_size,
  input  wire          io_mem_rsp_valid,
  input  wire [31:0]   io_mem_rsp_payload,
  input  wire          io_axiClk,
  input  wire          resetCtrl_systemReset
);

  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire                when_Fragment_l358;
  wire                when_Fragment_l361;
  wire       [66:0]   _zz_io_mem_cmd_payload_address;
  wire                io_mem_cmd_isStall;
  wire                when_Fragment_l384;

  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign when_Fragment_l358 = (dispatcher_headerLoaded == 1'b0);
  assign when_Fragment_l361 = (dispatcher_counter == 3'b111);
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_io_mem_cmd_payload_address = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_io_mem_cmd_payload_address[31 : 0];
  assign io_mem_cmd_payload_data = _zz_io_mem_cmd_payload_address[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_io_mem_cmd_payload_address[64];
  assign io_mem_cmd_payload_size = _zz_io_mem_cmd_payload_address[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_mem_cmd_isStall = (io_mem_cmd_valid && (! io_mem_cmd_ready));
  assign when_Fragment_l384 = ((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! io_mem_cmd_isStall));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @(posedge io_axiClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid) begin
        if(when_Fragment_l358) begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if(when_Fragment_l361) begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last) begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(when_Fragment_l384) begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @(posedge io_axiClk) begin
    if(io_remote_cmd_valid) begin
      if(when_Fragment_l358) begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1'd1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1'd1);
      end
    end
  end


endmodule

module JtagBridge (
  input  wire          io_jtag_tms,
  input  wire          io_jtag_tdi,
  output wire          io_jtag_tdo,
  input  wire          io_jtag_tck,
  output wire          io_remote_cmd_valid,
  input  wire          io_remote_cmd_ready,
  output wire          io_remote_cmd_payload_last,
  output wire [0:0]    io_remote_cmd_payload_fragment,
  input  wire          io_remote_rsp_valid,
  output wire          io_remote_rsp_ready,
  input  wire          io_remote_rsp_payload_error,
  input  wire [31:0]   io_remote_rsp_payload_data,
  input  wire          io_axiClk,
  input  wire          resetCtrl_systemReset
);
  localparam JtagState_RESET = 4'd0;
  localparam JtagState_IDLE = 4'd1;
  localparam JtagState_IR_SELECT = 4'd2;
  localparam JtagState_IR_CAPTURE = 4'd3;
  localparam JtagState_IR_SHIFT = 4'd4;
  localparam JtagState_IR_EXIT1 = 4'd5;
  localparam JtagState_IR_PAUSE = 4'd6;
  localparam JtagState_IR_EXIT2 = 4'd7;
  localparam JtagState_IR_UPDATE = 4'd8;
  localparam JtagState_DR_SELECT = 4'd9;
  localparam JtagState_DR_CAPTURE = 4'd10;
  localparam JtagState_DR_SHIFT = 4'd11;
  localparam JtagState_DR_EXIT1 = 4'd12;
  localparam JtagState_DR_PAUSE = 4'd13;
  localparam JtagState_DR_EXIT2 = 4'd14;
  localparam JtagState_DR_UPDATE = 4'd15;

  wire                flowCCUnsafeByToggle_1_io_output_valid;
  wire                flowCCUnsafeByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCUnsafeByToggle_1_io_output_payload_fragment;
  wire       [3:0]    _zz_jtag_tap_isBypass;
  wire       [1:0]    _zz_jtag_tap_instructionShift;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  wire                system_cmd_toStream_valid;
  wire                system_cmd_toStream_ready;
  wire                system_cmd_toStream_payload_last;
  wire       [0:0]    system_cmd_toStream_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                io_remote_rsp_fire;
  reg        [3:0]    jtag_tap_fsm_stateNext;
  reg        [3:0]    jtag_tap_fsm_state;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_1;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_2;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_3;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_4;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_5;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_6;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_7;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_8;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_9;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_10;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_11;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_12;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_13;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_14;
  wire       [3:0]    _zz_jtag_tap_fsm_stateNext_15;
  reg        [3:0]    jtag_tap_instruction;
  reg        [3:0]    jtag_tap_instructionShift;
  reg                 jtag_tap_bypass;
  reg                 jtag_tap_tdoUnbufferd;
  reg                 jtag_tap_tdoDr;
  wire                jtag_tap_tdoIr;
  wire                jtag_tap_isBypass;
  reg                 jtag_tap_tdoUnbufferd_regNext;
  wire                jtag_idcodeArea_ctrl_tdi;
  wire                jtag_idcodeArea_ctrl_enable;
  wire                jtag_idcodeArea_ctrl_capture;
  wire                jtag_idcodeArea_ctrl_shift;
  wire                jtag_idcodeArea_ctrl_update;
  wire                jtag_idcodeArea_ctrl_reset;
  wire                jtag_idcodeArea_ctrl_tdo;
  reg        [31:0]   jtag_idcodeArea_shifter;
  wire                when_JtagTap_l121;
  wire                jtag_writeArea_ctrl_tdi;
  wire                jtag_writeArea_ctrl_enable;
  wire                jtag_writeArea_ctrl_capture;
  wire                jtag_writeArea_ctrl_shift;
  wire                jtag_writeArea_ctrl_update;
  wire                jtag_writeArea_ctrl_reset;
  wire                jtag_writeArea_ctrl_tdo;
  wire                jtag_writeArea_source_valid;
  wire                jtag_writeArea_source_payload_last;
  wire       [0:0]    jtag_writeArea_source_payload_fragment;
  reg                 jtag_writeArea_valid;
  reg                 jtag_writeArea_data;
  wire                jtag_readArea_ctrl_tdi;
  wire                jtag_readArea_ctrl_enable;
  wire                jtag_readArea_ctrl_capture;
  wire                jtag_readArea_ctrl_shift;
  wire                jtag_readArea_ctrl_update;
  wire                jtag_readArea_ctrl_reset;
  wire                jtag_readArea_ctrl_tdo;
  reg        [33:0]   jtag_readArea_full_shifter;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_1_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_2_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_3_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_4_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_5_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_6_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_7_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_8_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_9_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_10_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_11_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_12_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_13_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_14_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_15_string;
  `endif


  assign _zz_jtag_tap_isBypass = jtag_tap_instruction;
  assign _zz_jtag_tap_instructionShift = 2'b01;
  FlowCCUnsafeByToggle flowCCUnsafeByToggle_1 (
    .io_input_valid             (jtag_writeArea_source_valid                      ), //i
    .io_input_payload_last      (jtag_writeArea_source_payload_last               ), //i
    .io_input_payload_fragment  (jtag_writeArea_source_payload_fragment           ), //i
    .io_output_valid            (flowCCUnsafeByToggle_1_io_output_valid           ), //o
    .io_output_payload_last     (flowCCUnsafeByToggle_1_io_output_payload_last    ), //o
    .io_output_payload_fragment (flowCCUnsafeByToggle_1_io_output_payload_fragment), //o
    .io_jtag_tck                (io_jtag_tck                                      ), //i
    .io_axiClk                  (io_axiClk                                        ), //i
    .resetCtrl_systemReset      (resetCtrl_systemReset                            )  //i
  );
  initial begin
  `ifndef SYNTHESIS
    jtag_tap_fsm_state = {$urandom};
  `endif
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(jtag_tap_fsm_stateNext)
      JtagState_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(jtag_tap_fsm_state)
      JtagState_RESET : jtag_tap_fsm_state_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_1)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_1_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_1_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_1_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_1_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_1_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_1_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_1_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_1_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_1_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_1_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_1_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_1_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_1_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_1_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_1_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_1_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_1_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_2)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_2_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_2_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_2_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_2_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_2_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_2_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_2_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_2_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_2_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_2_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_2_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_2_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_2_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_2_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_2_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_2_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_2_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_3)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_3_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_3_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_3_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_3_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_3_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_3_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_3_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_3_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_3_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_3_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_3_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_3_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_3_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_3_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_3_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_3_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_3_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_4)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_4_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_4_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_4_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_4_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_4_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_4_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_4_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_4_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_4_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_4_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_4_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_4_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_4_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_4_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_4_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_4_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_4_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_5)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_5_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_5_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_5_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_5_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_5_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_5_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_5_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_5_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_5_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_5_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_5_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_5_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_5_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_5_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_5_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_5_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_5_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_6)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_6_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_6_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_6_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_6_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_6_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_6_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_6_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_6_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_6_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_6_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_6_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_6_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_6_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_6_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_6_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_6_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_6_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_7)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_7_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_7_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_7_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_7_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_7_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_7_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_7_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_7_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_7_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_7_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_7_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_7_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_7_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_7_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_7_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_7_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_7_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_8)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_8_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_8_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_8_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_8_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_8_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_8_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_8_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_8_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_8_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_8_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_8_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_8_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_8_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_8_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_8_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_8_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_8_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_9)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_9_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_9_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_9_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_9_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_9_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_9_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_9_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_9_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_9_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_9_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_9_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_9_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_9_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_9_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_9_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_9_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_9_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_10)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_10_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_10_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_10_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_10_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_10_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_10_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_10_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_10_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_10_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_10_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_10_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_10_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_10_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_10_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_10_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_10_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_10_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_11)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_11_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_11_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_11_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_11_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_11_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_11_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_11_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_11_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_11_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_11_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_11_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_11_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_11_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_11_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_11_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_11_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_11_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_12)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_12_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_12_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_12_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_12_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_12_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_12_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_12_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_12_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_12_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_12_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_12_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_12_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_12_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_12_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_12_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_12_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_12_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_13)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_13_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_13_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_13_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_13_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_13_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_13_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_13_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_13_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_13_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_13_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_13_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_13_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_13_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_13_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_13_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_13_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_13_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_14)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_14_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_14_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_14_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_14_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_14_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_14_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_14_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_14_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_14_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_14_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_14_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_14_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_14_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_14_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_14_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_14_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_14_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext_15)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_15_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_15_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_15_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_15_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_15_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_15_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_15_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_15_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_15_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_15_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_15_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_15_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_15_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_15_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_15_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_15_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_15_string = "??????????";
    endcase
  end
  `endif

  assign system_cmd_toStream_valid = system_cmd_valid;
  assign system_cmd_toStream_payload_last = system_cmd_payload_last;
  assign system_cmd_toStream_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_cmd_valid = system_cmd_toStream_valid;
  assign system_cmd_toStream_ready = io_remote_cmd_ready;
  assign io_remote_cmd_payload_last = system_cmd_toStream_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_toStream_payload_fragment;
  assign io_remote_rsp_fire = (io_remote_rsp_valid && io_remote_rsp_ready);
  assign io_remote_rsp_ready = 1'b1;
  assign _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_RESET : JtagState_IDLE);
  always @(*) begin
    case(jtag_tap_fsm_state)
      JtagState_RESET : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext;
      end
      JtagState_IDLE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_1;
      end
      JtagState_IR_SELECT : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_2;
      end
      JtagState_IR_CAPTURE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_3;
      end
      JtagState_IR_SHIFT : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_4;
      end
      JtagState_IR_EXIT1 : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_5;
      end
      JtagState_IR_PAUSE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_6;
      end
      JtagState_IR_EXIT2 : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_7;
      end
      JtagState_IR_UPDATE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_8;
      end
      JtagState_DR_SELECT : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_9;
      end
      JtagState_DR_CAPTURE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_10;
      end
      JtagState_DR_SHIFT : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_11;
      end
      JtagState_DR_EXIT1 : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_12;
      end
      JtagState_DR_PAUSE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_13;
      end
      JtagState_DR_EXIT2 : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_14;
      end
      JtagState_DR_UPDATE : begin
        jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext_15;
      end
      default : begin
      end
    endcase
  end

  assign _zz_jtag_tap_fsm_stateNext_1 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  assign _zz_jtag_tap_fsm_stateNext_2 = (io_jtag_tms ? JtagState_RESET : JtagState_IR_CAPTURE);
  assign _zz_jtag_tap_fsm_stateNext_3 = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_4 = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_5 = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_6 = (io_jtag_tms ? JtagState_IR_EXIT2 : JtagState_IR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_7 = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_8 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  assign _zz_jtag_tap_fsm_stateNext_9 = (io_jtag_tms ? JtagState_IR_SELECT : JtagState_DR_CAPTURE);
  assign _zz_jtag_tap_fsm_stateNext_10 = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_11 = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_12 = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_13 = (io_jtag_tms ? JtagState_DR_EXIT2 : JtagState_DR_PAUSE);
  assign _zz_jtag_tap_fsm_stateNext_14 = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_SHIFT);
  assign _zz_jtag_tap_fsm_stateNext_15 = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
  always @(*) begin
    jtag_tap_tdoUnbufferd = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      JtagState_IR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoIr;
      end
      JtagState_DR_SHIFT : begin
        if(jtag_tap_isBypass) begin
          jtag_tap_tdoUnbufferd = jtag_tap_bypass;
        end else begin
          jtag_tap_tdoUnbufferd = jtag_tap_tdoDr;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    jtag_tap_tdoDr = 1'b0;
    if(jtag_idcodeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_idcodeArea_ctrl_tdo;
    end
    if(jtag_writeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_writeArea_ctrl_tdo;
    end
    if(jtag_readArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_readArea_ctrl_tdo;
    end
  end

  assign jtag_tap_tdoIr = jtag_tap_instructionShift[0];
  assign jtag_tap_isBypass = ($signed(_zz_jtag_tap_isBypass) == $signed(4'b1111));
  assign io_jtag_tdo = jtag_tap_tdoUnbufferd_regNext;
  assign jtag_idcodeArea_ctrl_tdo = jtag_idcodeArea_shifter[0];
  assign jtag_idcodeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_idcodeArea_ctrl_enable = (jtag_tap_instruction == 4'b0001);
  assign jtag_idcodeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_idcodeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_idcodeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_idcodeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign when_JtagTap_l121 = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_writeArea_source_valid = jtag_writeArea_valid;
  assign jtag_writeArea_source_payload_last = (! (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift));
  assign jtag_writeArea_source_payload_fragment[0] = jtag_writeArea_data;
  assign system_cmd_valid = flowCCUnsafeByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCUnsafeByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCUnsafeByToggle_1_io_output_payload_fragment;
  assign jtag_writeArea_ctrl_tdo = 1'b0;
  assign jtag_writeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_writeArea_ctrl_enable = (jtag_tap_instruction == 4'b0010);
  assign jtag_writeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_writeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_writeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_writeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_readArea_ctrl_tdo = jtag_readArea_full_shifter[0];
  assign jtag_readArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_readArea_ctrl_enable = (jtag_tap_instruction == 4'b0011);
  assign jtag_readArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_readArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_readArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_readArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  always @(posedge io_axiClk) begin
    if(io_remote_cmd_valid) begin
      system_rsp_valid <= 1'b0;
    end
    if(io_remote_rsp_fire) begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @(posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    jtag_tap_bypass <= io_jtag_tdi;
    case(jtag_tap_fsm_state)
      JtagState_IR_CAPTURE : begin
        jtag_tap_instructionShift <= {2'd0, _zz_jtag_tap_instructionShift};
      end
      JtagState_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1'd1);
      end
      JtagState_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      JtagState_DR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1'd1);
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_ctrl_enable) begin
      if(jtag_idcodeArea_ctrl_shift) begin
        jtag_idcodeArea_shifter <= ({jtag_idcodeArea_ctrl_tdi,jtag_idcodeArea_shifter} >>> 1'd1);
      end
    end
    if(jtag_idcodeArea_ctrl_capture) begin
      jtag_idcodeArea_shifter <= 32'h10001fff;
    end
    if(when_JtagTap_l121) begin
      jtag_tap_instruction <= 4'b0001;
    end
    jtag_writeArea_valid <= (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift);
    jtag_writeArea_data <= jtag_writeArea_ctrl_tdi;
    if(jtag_readArea_ctrl_enable) begin
      if(jtag_readArea_ctrl_capture) begin
        jtag_readArea_full_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(jtag_readArea_ctrl_shift) begin
        jtag_readArea_full_shifter <= ({jtag_readArea_ctrl_tdi,jtag_readArea_full_shifter} >>> 1'd1);
      end
    end
  end

  always @(negedge io_jtag_tck) begin
    jtag_tap_tdoUnbufferd_regNext <= jtag_tap_tdoUnbufferd;
  end


endmodule

//BufferCC_4 replaced by BufferCC_3

module BufferCC_3 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_axiClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module VexRiscv (
  output wire          dBus_cmd_valid,
  input  wire          dBus_cmd_ready,
  output wire          dBus_cmd_payload_wr,
  output wire          dBus_cmd_payload_uncached,
  output wire [31:0]   dBus_cmd_payload_address,
  output wire [31:0]   dBus_cmd_payload_data,
  output wire [3:0]    dBus_cmd_payload_mask,
  output wire [2:0]    dBus_cmd_payload_size,
  output wire          dBus_cmd_payload_last,
  input  wire          dBus_rsp_valid,
  input  wire          dBus_rsp_payload_last,
  input  wire [511:0]  dBus_rsp_payload_data,
  input  wire          dBus_rsp_payload_error,
  input  wire          timerInterrupt,
  input  wire          externalInterrupt,
  input  wire          softwareInterrupt,
  input  wire          debug_bus_cmd_valid,
  output reg           debug_bus_cmd_ready,
  input  wire          debug_bus_cmd_payload_wr,
  input  wire [7:0]    debug_bus_cmd_payload_address,
  input  wire [31:0]   debug_bus_cmd_payload_data,
  output reg  [31:0]   debug_bus_rsp_data,
  output wire          debug_resetOut,
  output wire          iBus_cmd_valid,
  input  wire          iBus_cmd_ready,
  output reg  [31:0]   iBus_cmd_payload_address,
  output wire [2:0]    iBus_cmd_payload_size,
  input  wire          iBus_rsp_valid,
  input  wire [511:0]  iBus_rsp_payload_data,
  input  wire          iBus_rsp_payload_error,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset,
  input  wire          resetCtrl_systemReset
);
  localparam ShiftCtrlEnum_DISABLE_1 = 2'd0;
  localparam ShiftCtrlEnum_SLL_1 = 2'd1;
  localparam ShiftCtrlEnum_SRL_1 = 2'd2;
  localparam ShiftCtrlEnum_SRA_1 = 2'd3;
  localparam EnvCtrlEnum_NONE = 1'd0;
  localparam EnvCtrlEnum_XRET = 1'd1;
  localparam BranchCtrlEnum_INC = 2'd0;
  localparam BranchCtrlEnum_B = 2'd1;
  localparam BranchCtrlEnum_JAL = 2'd2;
  localparam BranchCtrlEnum_JALR = 2'd3;
  localparam AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam Src2CtrlEnum_RS = 2'd0;
  localparam Src2CtrlEnum_IMI = 2'd1;
  localparam Src2CtrlEnum_IMS = 2'd2;
  localparam Src2CtrlEnum_PC = 2'd3;
  localparam AluCtrlEnum_ADD_SUB = 2'd0;
  localparam AluCtrlEnum_SLT_SLTU = 2'd1;
  localparam AluCtrlEnum_BITWISE = 2'd2;
  localparam Src1CtrlEnum_RS = 2'd0;
  localparam Src1CtrlEnum_IMU = 2'd1;
  localparam Src1CtrlEnum_PC_INCREMENT = 2'd2;
  localparam Src1CtrlEnum_URS1 = 2'd3;

  wire                IBusCachedPlugin_cache_io_flush;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isUser;
  reg                 IBusCachedPlugin_cache_io_cpu_fill_valid;
  wire                dataCache_1_io_cpu_execute_isValid;
  wire       [31:0]   dataCache_1_io_cpu_execute_address;
  wire                dataCache_1_io_cpu_memory_isValid;
  wire       [31:0]   dataCache_1_io_cpu_memory_address;
  reg                 dataCache_1_io_cpu_memory_mmuRsp_isIoAccess;
  reg                 dataCache_1_io_cpu_writeBack_isValid;
  wire                dataCache_1_io_cpu_writeBack_isUser;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_storeData;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_address;
  wire                dataCache_1_io_cpu_flush_valid;
  wire                dataCache_1_io_cpu_flush_payload_singleLine;
  wire       [5:0]    dataCache_1_io_cpu_flush_payload_lineId;
  reg        [31:0]   RegFilePlugin_regFile_spinal_port0;
  reg        [31:0]   RegFilePlugin_regFile_spinal_port1;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                dataCache_1_io_cpu_execute_haltIt;
  wire                dataCache_1_io_cpu_execute_refilling;
  wire                dataCache_1_io_cpu_memory_isWrite;
  wire                dataCache_1_io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_data;
  wire                dataCache_1_io_cpu_writeBack_mmuException;
  wire                dataCache_1_io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1_io_cpu_writeBack_accessError;
  wire                dataCache_1_io_cpu_writeBack_isWrite;
  wire                dataCache_1_io_cpu_writeBack_keepMemRspData;
  wire                dataCache_1_io_cpu_writeBack_exclusiveOk;
  wire                dataCache_1_io_cpu_flush_ready;
  wire                dataCache_1_io_cpu_redo;
  wire                dataCache_1_io_cpu_writesPending;
  wire                dataCache_1_io_mem_cmd_valid;
  wire                dataCache_1_io_mem_cmd_payload_wr;
  wire                dataCache_1_io_mem_cmd_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_payload_size;
  wire                dataCache_1_io_mem_cmd_payload_last;
  wire       [51:0]   _zz_memory_MUL_LOW;
  wire       [51:0]   _zz_memory_MUL_LOW_1;
  wire       [51:0]   _zz_memory_MUL_LOW_2;
  wire       [32:0]   _zz_memory_MUL_LOW_3;
  wire       [51:0]   _zz_memory_MUL_LOW_4;
  wire       [49:0]   _zz_memory_MUL_LOW_5;
  wire       [51:0]   _zz_memory_MUL_LOW_6;
  wire       [49:0]   _zz_memory_MUL_LOW_7;
  wire       [31:0]   _zz_execute_SHIFT_RIGHT;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_1;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_2;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [12:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [6:0]    _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_17;
  wire       [3:0]    _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  reg        [31:0]   _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  wire       [1:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_6;
  wire       [31:0]   _zz_IBusCachedPlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusCachedPlugin_fetchPc_pc_1;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire       [31:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2;
  wire       [19:0]   _zz__zz_2;
  wire       [11:0]   _zz__zz_4;
  wire       [31:0]   _zz__zz_6;
  wire       [31:0]   _zz__zz_6_1;
  wire       [19:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_4;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_5;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_6;
  wire       [25:0]   _zz_io_cpu_flush_payload_lineId;
  wire       [25:0]   _zz_io_cpu_flush_payload_lineId_1;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted;
  wire       [1:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_2;
  wire       [0:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_3;
  wire       [31:0]   _zz__zz_decode_IS_CSR;
  wire                _zz__zz_decode_IS_CSR_1;
  wire                _zz__zz_decode_IS_CSR_2;
  wire       [0:0]    _zz__zz_decode_IS_CSR_3;
  wire       [0:0]    _zz__zz_decode_IS_CSR_4;
  wire       [0:0]    _zz__zz_decode_IS_CSR_5;
  wire                _zz__zz_decode_IS_CSR_6;
  wire       [0:0]    _zz__zz_decode_IS_CSR_7;
  wire       [24:0]   _zz__zz_decode_IS_CSR_8;
  wire                _zz__zz_decode_IS_CSR_9;
  wire       [0:0]    _zz__zz_decode_IS_CSR_10;
  wire                _zz__zz_decode_IS_CSR_11;
  wire       [31:0]   _zz__zz_decode_IS_CSR_12;
  wire       [0:0]    _zz__zz_decode_IS_CSR_13;
  wire                _zz__zz_decode_IS_CSR_14;
  wire                _zz__zz_decode_IS_CSR_15;
  wire       [20:0]   _zz__zz_decode_IS_CSR_16;
  wire                _zz__zz_decode_IS_CSR_17;
  wire       [0:0]    _zz__zz_decode_IS_CSR_18;
  wire                _zz__zz_decode_IS_CSR_19;
  wire       [31:0]   _zz__zz_decode_IS_CSR_20;
  wire       [0:0]    _zz__zz_decode_IS_CSR_21;
  wire                _zz__zz_decode_IS_CSR_22;
  wire                _zz__zz_decode_IS_CSR_23;
  wire       [16:0]   _zz__zz_decode_IS_CSR_24;
  wire                _zz__zz_decode_IS_CSR_25;
  wire       [1:0]    _zz__zz_decode_IS_CSR_26;
  wire       [31:0]   _zz__zz_decode_IS_CSR_27;
  wire       [31:0]   _zz__zz_decode_IS_CSR_28;
  wire       [31:0]   _zz__zz_decode_IS_CSR_29;
  wire       [31:0]   _zz__zz_decode_IS_CSR_30;
  wire                _zz__zz_decode_IS_CSR_31;
  wire                _zz__zz_decode_IS_CSR_32;
  wire       [0:0]    _zz__zz_decode_IS_CSR_33;
  wire       [0:0]    _zz__zz_decode_IS_CSR_34;
  wire       [31:0]   _zz__zz_decode_IS_CSR_35;
  wire       [0:0]    _zz__zz_decode_IS_CSR_36;
  wire                _zz__zz_decode_IS_CSR_37;
  wire       [12:0]   _zz__zz_decode_IS_CSR_38;
  wire       [4:0]    _zz__zz_decode_IS_CSR_39;
  wire       [31:0]   _zz__zz_decode_IS_CSR_40;
  wire       [31:0]   _zz__zz_decode_IS_CSR_41;
  wire       [0:0]    _zz__zz_decode_IS_CSR_42;
  wire       [31:0]   _zz__zz_decode_IS_CSR_43;
  wire       [31:0]   _zz__zz_decode_IS_CSR_44;
  wire       [1:0]    _zz__zz_decode_IS_CSR_45;
  wire                _zz__zz_decode_IS_CSR_46;
  wire       [31:0]   _zz__zz_decode_IS_CSR_47;
  wire                _zz__zz_decode_IS_CSR_48;
  wire       [31:0]   _zz__zz_decode_IS_CSR_49;
  wire                _zz__zz_decode_IS_CSR_50;
  wire       [0:0]    _zz__zz_decode_IS_CSR_51;
  wire       [31:0]   _zz__zz_decode_IS_CSR_52;
  wire       [31:0]   _zz__zz_decode_IS_CSR_53;
  wire       [2:0]    _zz__zz_decode_IS_CSR_54;
  wire                _zz__zz_decode_IS_CSR_55;
  wire       [31:0]   _zz__zz_decode_IS_CSR_56;
  wire       [0:0]    _zz__zz_decode_IS_CSR_57;
  wire       [31:0]   _zz__zz_decode_IS_CSR_58;
  wire       [31:0]   _zz__zz_decode_IS_CSR_59;
  wire       [0:0]    _zz__zz_decode_IS_CSR_60;
  wire       [31:0]   _zz__zz_decode_IS_CSR_61;
  wire       [31:0]   _zz__zz_decode_IS_CSR_62;
  wire       [0:0]    _zz__zz_decode_IS_CSR_63;
  wire       [0:0]    _zz__zz_decode_IS_CSR_64;
  wire       [4:0]    _zz__zz_decode_IS_CSR_65;
  wire                _zz__zz_decode_IS_CSR_66;
  wire       [31:0]   _zz__zz_decode_IS_CSR_67;
  wire       [0:0]    _zz__zz_decode_IS_CSR_68;
  wire       [31:0]   _zz__zz_decode_IS_CSR_69;
  wire       [31:0]   _zz__zz_decode_IS_CSR_70;
  wire       [2:0]    _zz__zz_decode_IS_CSR_71;
  wire                _zz__zz_decode_IS_CSR_72;
  wire       [0:0]    _zz__zz_decode_IS_CSR_73;
  wire       [31:0]   _zz__zz_decode_IS_CSR_74;
  wire       [0:0]    _zz__zz_decode_IS_CSR_75;
  wire       [31:0]   _zz__zz_decode_IS_CSR_76;
  wire       [9:0]    _zz__zz_decode_IS_CSR_77;
  wire       [1:0]    _zz__zz_decode_IS_CSR_78;
  wire                _zz__zz_decode_IS_CSR_79;
  wire       [31:0]   _zz__zz_decode_IS_CSR_80;
  wire                _zz__zz_decode_IS_CSR_81;
  wire       [0:0]    _zz__zz_decode_IS_CSR_82;
  wire       [0:0]    _zz__zz_decode_IS_CSR_83;
  wire       [31:0]   _zz__zz_decode_IS_CSR_84;
  wire       [31:0]   _zz__zz_decode_IS_CSR_85;
  wire       [0:0]    _zz__zz_decode_IS_CSR_86;
  wire       [0:0]    _zz__zz_decode_IS_CSR_87;
  wire       [31:0]   _zz__zz_decode_IS_CSR_88;
  wire       [31:0]   _zz__zz_decode_IS_CSR_89;
  wire       [6:0]    _zz__zz_decode_IS_CSR_90;
  wire                _zz__zz_decode_IS_CSR_91;
  wire                _zz__zz_decode_IS_CSR_92;
  wire       [0:0]    _zz__zz_decode_IS_CSR_93;
  wire       [4:0]    _zz__zz_decode_IS_CSR_94;
  wire       [31:0]   _zz__zz_decode_IS_CSR_95;
  wire       [31:0]   _zz__zz_decode_IS_CSR_96;
  wire       [0:0]    _zz__zz_decode_IS_CSR_97;
  wire       [31:0]   _zz__zz_decode_IS_CSR_98;
  wire       [1:0]    _zz__zz_decode_IS_CSR_99;
  wire       [31:0]   _zz__zz_decode_IS_CSR_100;
  wire       [31:0]   _zz__zz_decode_IS_CSR_101;
  wire       [31:0]   _zz__zz_decode_IS_CSR_102;
  wire       [31:0]   _zz__zz_decode_IS_CSR_103;
  wire       [4:0]    _zz__zz_decode_IS_CSR_104;
  wire                _zz__zz_decode_IS_CSR_105;
  wire       [31:0]   _zz__zz_decode_IS_CSR_106;
  wire       [31:0]   _zz__zz_decode_IS_CSR_107;
  wire       [0:0]    _zz__zz_decode_IS_CSR_108;
  wire       [0:0]    _zz__zz_decode_IS_CSR_109;
  wire       [31:0]   _zz__zz_decode_IS_CSR_110;
  wire       [1:0]    _zz__zz_decode_IS_CSR_111;
  wire       [31:0]   _zz__zz_decode_IS_CSR_112;
  wire       [31:0]   _zz__zz_decode_IS_CSR_113;
  wire       [31:0]   _zz__zz_decode_IS_CSR_114;
  wire       [31:0]   _zz__zz_decode_IS_CSR_115;
  wire       [2:0]    _zz__zz_decode_IS_CSR_116;
  wire       [1:0]    _zz__zz_decode_IS_CSR_117;
  wire       [31:0]   _zz__zz_decode_IS_CSR_118;
  wire       [31:0]   _zz__zz_decode_IS_CSR_119;
  wire                _zz__zz_decode_IS_CSR_120;
  wire                _zz__zz_decode_IS_CSR_121;
  wire                _zz__zz_decode_IS_CSR_122;
  wire       [31:0]   _zz__zz_decode_IS_CSR_123;
  wire       [31:0]   _zz__zz_decode_IS_CSR_124;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_execute_SRC1;
  wire       [4:0]    _zz__zz_execute_SRC1_1;
  wire       [11:0]   _zz__zz_execute_SRC2_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [65:0]   _zz_writeBack_MulPlugin_result;
  wire       [65:0]   _zz_writeBack_MulPlugin_result_1;
  wire       [31:0]   _zz__zz_decode_RS2_2;
  wire       [31:0]   _zz__zz_decode_RS2_2_1;
  wire       [5:0]    _zz_memory_DivPlugin_div_counter_valueNext;
  wire       [0:0]    _zz_memory_DivPlugin_div_counter_valueNext_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_outRemainder_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_stage_0_outNumerator;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_1;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_2;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_3;
  wire       [32:0]   _zz_memory_DivPlugin_div_result_4;
  wire       [0:0]    _zz_memory_DivPlugin_div_result_5;
  wire       [32:0]   _zz_memory_DivPlugin_rs1_2;
  wire       [0:0]    _zz_memory_DivPlugin_rs1_3;
  wire       [31:0]   _zz_memory_DivPlugin_rs2_1;
  wire       [0:0]    _zz_memory_DivPlugin_rs2_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_4;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire       [0:0]    _zz_execute_BranchPlugin_branch_src2_6;
  wire       [7:0]    _zz_execute_BranchPlugin_branch_src2_7;
  wire                _zz_execute_BranchPlugin_branch_src2_8;
  wire       [0:0]    _zz_execute_BranchPlugin_branch_src2_9;
  wire       [0:0]    _zz_execute_BranchPlugin_branch_src2_10;
  wire       [2:0]    _zz_execute_BranchPlugin_branch_src2_11;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1;
  wire                _zz_when;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_MEMORY_STORE_DATA_RF;
  wire       [31:0]   execute_MEMORY_STORE_DATA_RF;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_PREDICTION_HAD_BRANCHED1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [0:0]    _zz_memory_to_writeBack_ENV_CTRL;
  wire       [0:0]    _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       [0:0]    _zz_execute_to_memory_ENV_CTRL;
  wire       [0:0]    _zz_execute_to_memory_ENV_CTRL_1;
  wire       [0:0]    decode_ENV_CTRL;
  wire       [0:0]    _zz_decode_ENV_CTRL;
  wire       [0:0]    _zz_decode_to_execute_ENV_CTRL;
  wire       [0:0]    _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL_1;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL_1;
  wire       [1:0]    decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       [1:0]    decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_MANAGMENT;
  wire                memory_MEMORY_WR;
  wire                decode_MEMORY_WR;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       [1:0]    decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL_1;
  wire       [1:0]    decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL_1;
  wire       [1:0]    decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL_1;
  wire                decode_MEMORY_FORCE_CONSTISTENCY;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       [0:0]    memory_ENV_CTRL;
  wire       [0:0]    _zz_memory_ENV_CTRL;
  wire       [0:0]    execute_ENV_CTRL;
  wire       [0:0]    _zz_execute_ENV_CTRL;
  wire       [0:0]    writeBack_ENV_CTRL;
  wire       [0:0]    _zz_writeBack_ENV_CTRL;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_PREDICTION_HAD_BRANCHED1;
  wire                execute_BRANCH_COND_RESULT;
  wire       [1:0]    execute_BRANCH_CTRL;
  wire       [1:0]    _zz_execute_BRANCH_CTRL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  reg        [31:0]   _zz_decode_RS2;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [1:0]    memory_SHIFT_CTRL;
  wire       [1:0]    _zz_memory_SHIFT_CTRL;
  wire       [1:0]    execute_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_execute_to_memory_PC;
  wire       [1:0]    execute_SRC2_CTRL;
  wire       [1:0]    _zz_execute_SRC2_CTRL;
  wire       [1:0]    execute_SRC1_CTRL;
  wire       [1:0]    _zz_execute_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       [1:0]    execute_ALU_CTRL;
  wire       [1:0]    _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       [1:0]    execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       [0:0]    _zz_decode_ENV_CTRL_1;
  wire       [1:0]    _zz_decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_1;
  wire       [1:0]    _zz_decode_SRC2_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_CTRL_1;
  wire       [1:0]    _zz_decode_SRC1_CTRL_1;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_MEMORY_STORE_DATA_RF;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  wire                execute_MEMORY_FORCE_CONSTISTENCY;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_MANAGMENT;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       [1:0]    decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_1;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [31:0]   _zz_decode_to_execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  reg                 writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  reg                 writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusCachedPlugin_fetcherHalt;
  wire                IBusCachedPlugin_forceNoDecodeCond;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusCachedPlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  reg                 IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire                IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                IBusCachedPlugin_mmuBus_rsp_isPaging;
  wire                IBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                IBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                DBusCachedPlugin_mmuBus_rsp_isPaging;
  wire                DBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                DBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                DBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                DBusCachedPlugin_mmuBus_rsp_exception;
  wire                DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  wire       [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg                 _zz_when_DBusCachedPlugin_l473;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  reg                 BranchPlugin_inDebugNoFetchFlag;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  reg                 CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  wire                CsrPlugin_csrMapping_doForceFailCsr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  wire                CsrPlugin_xretAwayFromMachine;
  reg                 DebugPlugin_injectionPort_valid;
  reg                 DebugPlugin_injectionPort_ready;
  wire       [31:0]   DebugPlugin_injectionPort_payload;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_2;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_3;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_4;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_output_fire;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  wire                when_Fetcher_l133;
  wire                when_Fetcher_l133_1;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  wire                when_Fetcher_l160;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_payload;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_payload;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_payload;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_ready;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l242;
  wire                when_Fetcher_l322;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l331;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l331_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l331_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l331_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  wire                when_Fetcher_l331_4;
  wire                _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  reg        [18:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1;
  wire                _zz_2;
  reg        [10:0]   _zz_3;
  wire                _zz_4;
  reg        [18:0]   _zz_5;
  reg                 _zz_6;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  reg        [10:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_1;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  reg        [18:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_3;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                when_IBusCachedPlugin_l245;
  wire                when_IBusCachedPlugin_l250;
  wire                when_IBusCachedPlugin_l256;
  wire                when_IBusCachedPlugin_l262;
  wire                when_IBusCachedPlugin_l273;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire                when_DBusCachedPlugin_l353;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_execute_MEMORY_STORE_DATA_RF;
  wire                when_DBusCachedPlugin_l395;
  wire                when_DBusCachedPlugin_l411;
  wire                when_DBusCachedPlugin_l473;
  wire                when_DBusCachedPlugin_l534;
  wire                when_DBusCachedPlugin_l554;
  wire       [31:0]   writeBack_DBusCachedPlugin_rspData;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_0;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_1;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_2;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  wire       [31:0]   writeBack_DBusCachedPlugin_rspRf;
  wire       [1:0]    switch_Misc_l245;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_1;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  wire                when_DBusCachedPlugin_l581;
  wire       [31:0]   _zz_decode_IS_CSR;
  wire                _zz_decode_IS_CSR_1;
  wire                _zz_decode_IS_CSR_2;
  wire                _zz_decode_IS_CSR_3;
  wire                _zz_decode_IS_CSR_4;
  wire                _zz_decode_IS_CSR_5;
  wire       [1:0]    _zz_decode_SRC1_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_CTRL_2;
  wire       [1:0]    _zz_decode_SRC2_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_2;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_2;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_2;
  wire       [0:0]    _zz_decode_ENV_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_10;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_execute_SRC1;
  wire                _zz_execute_SRC2;
  reg        [19:0]   _zz_execute_SRC2_1;
  wire                _zz_execute_SRC2_2;
  reg        [19:0]   _zz_execute_SRC2_3;
  reg        [31:0]   _zz_execute_SRC2_4;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [1:0]    switch_MulPlugin_l87;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  wire                when_MulPlugin_l147;
  wire       [1:0]    switch_MulPlugin_l148;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  wire                when_MulDivIterativePlugin_l126;
  wire                when_MulDivIterativePlugin_l126_1;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l128;
  wire                when_MulDivIterativePlugin_l129;
  wire                when_MulDivIterativePlugin_l132;
  wire       [31:0]   _zz_memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire                when_MulDivIterativePlugin_l151;
  wire       [31:0]   _zz_memory_DivPlugin_div_result;
  wire                when_MulDivIterativePlugin_l162;
  wire                _zz_memory_DivPlugin_rs2;
  wire                _zz_memory_DivPlugin_rs1;
  reg        [32:0]   _zz_memory_DivPlugin_rs1_1;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l245_1;
  reg                 _zz_execute_BRANCH_COND_RESULT;
  reg                 _zz_execute_BRANCH_COND_RESULT_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget;
  reg        [19:0]   _zz_execute_BranchPlugin_missAlignedTarget_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_2;
  reg        [10:0]   _zz_execute_BranchPlugin_missAlignedTarget_3;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_4;
  reg        [18:0]   _zz_execute_BranchPlugin_missAlignedTarget_5;
  reg                 _zz_execute_BranchPlugin_missAlignedTarget_6;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  wire       [1:0]    CsrPlugin_mtvec_mode;
  wire       [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle;
  reg        [63:0]   CsrPlugin_minstret;
  wire                _zz_when_CsrPlugin_l1302;
  wire                _zz_when_CsrPlugin_l1302_1;
  wire                _zz_when_CsrPlugin_l1302_2;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire                when_CsrPlugin_l1259;
  wire                when_CsrPlugin_l1259_1;
  wire                when_CsrPlugin_l1259_2;
  wire                when_CsrPlugin_l1259_3;
  wire                when_CsrPlugin_l1272;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l1296;
  wire                when_CsrPlugin_l1302;
  wire                when_CsrPlugin_l1302_1;
  wire                when_CsrPlugin_l1302_2;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l1335;
  wire                when_CsrPlugin_l1335_1;
  wire                when_CsrPlugin_l1335_2;
  wire                when_CsrPlugin_l1340;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                when_CsrPlugin_l1346;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  wire                CsrPlugin_trapCauseEbreakDebug;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                CsrPlugin_trapEnterDebug;
  wire                when_CsrPlugin_l1390;
  wire                when_CsrPlugin_l1398;
  wire                when_CsrPlugin_l1456;
  wire       [1:0]    switch_CsrPlugin_l1460;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1527;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1547;
  wire                when_CsrPlugin_l1548;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l245_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1587;
  wire                when_CsrPlugin_l1591;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  wire                when_DebugPlugin_l238;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_when_DebugPlugin_l257;
  wire                when_DebugPlugin_l257;
  wire       [5:0]    switch_DebugPlugin_l280;
  wire                when_DebugPlugin_l284;
  wire                when_DebugPlugin_l284_1;
  wire                when_DebugPlugin_l285;
  wire                when_DebugPlugin_l285_1;
  wire                when_DebugPlugin_l286;
  wire                when_DebugPlugin_l287;
  wire                when_DebugPlugin_l288;
  wire                when_DebugPlugin_l288_1;
  wire                when_DebugPlugin_l308;
  wire                when_DebugPlugin_l311;
  wire                when_DebugPlugin_l324;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l344;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg                 decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  wire                when_Pipeline_l124_10;
  reg        [1:0]    decode_to_execute_SRC1_CTRL;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_12;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_13;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_15;
  reg        [1:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_16;
  reg        [1:0]    decode_to_execute_SRC2_CTRL;
  wire                when_Pipeline_l124_17;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_19;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_20;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_22;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_23;
  reg                 decode_to_execute_MEMORY_WR;
  wire                when_Pipeline_l124_24;
  reg                 execute_to_memory_MEMORY_WR;
  wire                when_Pipeline_l124_25;
  reg                 memory_to_writeBack_MEMORY_WR;
  wire                when_Pipeline_l124_26;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  wire                when_Pipeline_l124_27;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_28;
  reg        [1:0]    decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_29;
  reg        [1:0]    decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_30;
  reg        [1:0]    execute_to_memory_SHIFT_CTRL;
  wire                when_Pipeline_l124_31;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_32;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_33;
  reg                 memory_to_writeBack_IS_MUL;
  wire                when_Pipeline_l124_34;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_35;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_36;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_37;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_38;
  reg        [1:0]    decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_39;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_40;
  reg        [0:0]    decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_41;
  reg        [0:0]    execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_42;
  reg        [0:0]    memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_43;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_44;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_45;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_46;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED1;
  wire                when_Pipeline_l124_47;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_48;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_49;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_50;
  reg        [31:0]   execute_to_memory_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_51;
  reg        [31:0]   memory_to_writeBack_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_52;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_53;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_54;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  wire                when_Pipeline_l124_55;
  reg        [31:0]   execute_to_memory_MUL_LL;
  wire                when_Pipeline_l124_56;
  reg        [33:0]   execute_to_memory_MUL_LH;
  wire                when_Pipeline_l124_57;
  reg        [33:0]   execute_to_memory_MUL_HL;
  wire                when_Pipeline_l124_58;
  reg        [33:0]   execute_to_memory_MUL_HH;
  wire                when_Pipeline_l124_59;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  wire                when_Pipeline_l124_60;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_61;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_62;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  reg        [2:0]    IBusCachedPlugin_injector_port_state;
  wire                when_Fetcher_l391;
  wire                when_CsrPlugin_l1669;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1669_1;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1669_2;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1669_3;
  reg                 execute_CsrPlugin_csr_833;
  wire                when_CsrPlugin_l1669_4;
  reg                 execute_CsrPlugin_csr_834;
  wire                when_CsrPlugin_l1669_5;
  reg                 execute_CsrPlugin_csr_835;
  wire       [1:0]    switch_CsrPlugin_l1031;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_5;
  wire                when_CsrPlugin_l1702;
  wire       [11:0]   _zz_when_CsrPlugin_l1709;
  wire                when_CsrPlugin_l1709;
  reg                 when_CsrPlugin_l1719;
  wire                when_CsrPlugin_l1717;
  wire                when_CsrPlugin_l1725;
  `ifndef SYNTHESIS
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_1_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_memory_ENV_CTRL_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_execute_ENV_CTRL_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_writeBack_ENV_CTRL_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_memory_SHIFT_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_execute_SRC2_CTRL_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_execute_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] _zz_decode_ENV_CTRL_1_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [31:0] _zz_decode_ENV_CTRL_2_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_when = (|{decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid});
  assign _zz_memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW_1) + $signed(_zz_memory_MUL_LOW_4));
  assign _zz_memory_MUL_LOW_1 = ($signed(52'h0) + $signed(_zz_memory_MUL_LOW_2));
  assign _zz_memory_MUL_LOW_3 = {1'b0,memory_MUL_LL};
  assign _zz_memory_MUL_LOW_2 = {{19{_zz_memory_MUL_LOW_3[32]}}, _zz_memory_MUL_LOW_3};
  assign _zz_memory_MUL_LOW_5 = ({16'd0,memory_MUL_LH} <<< 5'd16);
  assign _zz_memory_MUL_LOW_4 = {{2{_zz_memory_MUL_LOW_5[49]}}, _zz_memory_MUL_LOW_5};
  assign _zz_memory_MUL_LOW_7 = ({16'd0,memory_MUL_HL} <<< 5'd16);
  assign _zz_memory_MUL_LOW_6 = {{2{_zz_memory_MUL_LOW_7[49]}}, _zz_memory_MUL_LOW_7};
  assign _zz_execute_SHIFT_RIGHT_1 = ($signed(_zz_execute_SHIFT_RIGHT_2) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT_1[31 : 0];
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == ShiftCtrlEnum_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload - 4'b0001);
  assign _zz_IBusCachedPlugin_fetchPc_pc_1 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_IBusCachedPlugin_fetchPc_pc = {29'd0, _zz_IBusCachedPlugin_fetchPc_pc_1};
  assign _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2 = {{_zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_4 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz__zz_6 = {{_zz_3,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_6_1 = {{_zz_5,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_io_cpu_flush_payload_lineId = _zz_io_cpu_flush_payload_lineId_1;
  assign _zz_io_cpu_flush_payload_lineId_1 = (execute_RS1 >>> 3'd6);
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 3'b111 : 3'b101);
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code_1 = (writeBack_MEMORY_WR ? 3'b110 : 3'b100);
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_execute_SRC1 = 3'b100;
  assign _zz__zz_execute_SRC1_1 = execute_INSTRUCTION[19 : 15];
  assign _zz__zz_execute_SRC2_2 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? 32'h00000001 : 32'h0);
  assign _zz_writeBack_MulPlugin_result = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_writeBack_MulPlugin_result_1 = ({32'd0,writeBack_MUL_HH} <<< 6'd32);
  assign _zz__zz_decode_RS2_2 = writeBack_MUL_LOW[31 : 0];
  assign _zz__zz_decode_RS2_2_1 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_memory_DivPlugin_div_counter_valueNext_1 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_memory_DivPlugin_div_counter_valueNext = {5'd0, _zz_memory_DivPlugin_div_counter_valueNext_1};
  assign _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator = {1'd0, memory_DivPlugin_rs2};
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outRemainder_1 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_memory_DivPlugin_div_stage_0_outNumerator = {_zz_memory_DivPlugin_div_stage_0_remainderShifted,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_memory_DivPlugin_div_result_1 = _zz_memory_DivPlugin_div_result_2;
  assign _zz_memory_DivPlugin_div_result_2 = _zz_memory_DivPlugin_div_result_3;
  assign _zz_memory_DivPlugin_div_result_3 = ({memory_DivPlugin_div_needRevert,(memory_DivPlugin_div_needRevert ? (~ _zz_memory_DivPlugin_div_result) : _zz_memory_DivPlugin_div_result)} + _zz_memory_DivPlugin_div_result_4);
  assign _zz_memory_DivPlugin_div_result_5 = memory_DivPlugin_div_needRevert;
  assign _zz_memory_DivPlugin_div_result_4 = {32'd0, _zz_memory_DivPlugin_div_result_5};
  assign _zz_memory_DivPlugin_rs1_3 = _zz_memory_DivPlugin_rs1;
  assign _zz_memory_DivPlugin_rs1_2 = {32'd0, _zz_memory_DivPlugin_rs1_3};
  assign _zz_memory_DivPlugin_rs2_2 = _zz_memory_DivPlugin_rs2;
  assign _zz_memory_DivPlugin_rs2_1 = {31'd0, _zz_memory_DivPlugin_rs2_2};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6 = {_zz_execute_BranchPlugin_missAlignedTarget_1,execute_INSTRUCTION[31 : 20]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1 = {{_zz_execute_BranchPlugin_missAlignedTarget_3,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2 = {{_zz_execute_BranchPlugin_missAlignedTarget_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_branch_src2_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_execute_BranchPlugin_branch_src2_11 = 3'b100;
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code - 2'b01);
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = {_zz_IBusCachedPlugin_jump_pcLoad_payload_4,_zz_IBusCachedPlugin_jump_pcLoad_payload_3};
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_1 = dataCache_1_io_cpu_writeBack_address[1 : 0];
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_3 = dataCache_1_io_cpu_writeBack_address[1 : 1];
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000107f) == 32'h00000013),{((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000207f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000505f);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000003;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000707b) == 32'h00000063);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'h01f0707f) == 32'h0000500f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h00005013),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,{_zz_decode_LEGAL_INSTRUCTION_16,_zz_decode_LEGAL_INSTRUCTION_17}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'hbe00705f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'hfe00305f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h00001013;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_decode_LEGAL_INSTRUCTION_17 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h00100073);
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_4 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_5 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_6 = decode_INSTRUCTION[7];
  assign _zz__zz_decode_IS_CSR = 32'h00103050;
  assign _zz__zz_decode_IS_CSR_1 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz__zz_decode_IS_CSR_2 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz__zz_decode_IS_CSR_3 = _zz_decode_IS_CSR_4;
  assign _zz__zz_decode_IS_CSR_4 = ((decode_INSTRUCTION & 32'h0000001c) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_5 = ((decode_INSTRUCTION & 32'h00000058) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_6 = (|_zz_decode_IS_CSR_5);
  assign _zz__zz_decode_IS_CSR_7 = (|_zz_decode_IS_CSR_5);
  assign _zz__zz_decode_IS_CSR_8 = {(|_zz__zz_decode_IS_CSR_9),{(|_zz__zz_decode_IS_CSR_10),{_zz__zz_decode_IS_CSR_11,{_zz__zz_decode_IS_CSR_13,_zz__zz_decode_IS_CSR_16}}}};
  assign _zz__zz_decode_IS_CSR_9 = ((decode_INSTRUCTION & 32'h02004064) == 32'h02004020);
  assign _zz__zz_decode_IS_CSR_10 = ((decode_INSTRUCTION & 32'h02004074) == 32'h02000030);
  assign _zz__zz_decode_IS_CSR_11 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_12) == 32'h00005010));
  assign _zz__zz_decode_IS_CSR_13 = (|{_zz__zz_decode_IS_CSR_14,_zz__zz_decode_IS_CSR_15});
  assign _zz__zz_decode_IS_CSR_16 = {(|_zz__zz_decode_IS_CSR_17),{(|_zz__zz_decode_IS_CSR_18),{_zz__zz_decode_IS_CSR_19,{_zz__zz_decode_IS_CSR_21,_zz__zz_decode_IS_CSR_24}}}};
  assign _zz__zz_decode_IS_CSR_12 = 32'h02007054;
  assign _zz__zz_decode_IS_CSR_14 = ((decode_INSTRUCTION & 32'h40003054) == 32'h40001010);
  assign _zz__zz_decode_IS_CSR_15 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz__zz_decode_IS_CSR_17 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz__zz_decode_IS_CSR_18 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz__zz_decode_IS_CSR_19 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_20) == 32'h00002000));
  assign _zz__zz_decode_IS_CSR_21 = (|{_zz__zz_decode_IS_CSR_22,_zz__zz_decode_IS_CSR_23});
  assign _zz__zz_decode_IS_CSR_24 = {(|_zz__zz_decode_IS_CSR_25),{(|_zz__zz_decode_IS_CSR_26),{_zz__zz_decode_IS_CSR_31,{_zz__zz_decode_IS_CSR_36,_zz__zz_decode_IS_CSR_38}}}};
  assign _zz__zz_decode_IS_CSR_20 = 32'h00003000;
  assign _zz__zz_decode_IS_CSR_22 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz__zz_decode_IS_CSR_23 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz__zz_decode_IS_CSR_25 = ((decode_INSTRUCTION & 32'h00004048) == 32'h00004008);
  assign _zz__zz_decode_IS_CSR_26 = {(_zz__zz_decode_IS_CSR_27 == _zz__zz_decode_IS_CSR_28),(_zz__zz_decode_IS_CSR_29 == _zz__zz_decode_IS_CSR_30)};
  assign _zz__zz_decode_IS_CSR_31 = (|{_zz__zz_decode_IS_CSR_32,{_zz__zz_decode_IS_CSR_33,_zz__zz_decode_IS_CSR_34}});
  assign _zz__zz_decode_IS_CSR_36 = (|_zz__zz_decode_IS_CSR_37);
  assign _zz__zz_decode_IS_CSR_38 = {(|_zz__zz_decode_IS_CSR_39),{_zz__zz_decode_IS_CSR_50,{_zz__zz_decode_IS_CSR_63,_zz__zz_decode_IS_CSR_77}}};
  assign _zz__zz_decode_IS_CSR_27 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz__zz_decode_IS_CSR_28 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_29 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz__zz_decode_IS_CSR_30 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_32 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_33 = _zz_decode_IS_CSR_2;
  assign _zz__zz_decode_IS_CSR_34 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_35) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_37 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_39 = {(_zz__zz_decode_IS_CSR_40 == _zz__zz_decode_IS_CSR_41),{_zz_decode_IS_CSR_3,{_zz__zz_decode_IS_CSR_42,_zz__zz_decode_IS_CSR_45}}};
  assign _zz__zz_decode_IS_CSR_50 = (|{_zz_decode_IS_CSR_3,{_zz__zz_decode_IS_CSR_51,_zz__zz_decode_IS_CSR_54}});
  assign _zz__zz_decode_IS_CSR_63 = (|{_zz__zz_decode_IS_CSR_64,_zz__zz_decode_IS_CSR_65});
  assign _zz__zz_decode_IS_CSR_77 = {(|_zz__zz_decode_IS_CSR_78),{_zz__zz_decode_IS_CSR_81,{_zz__zz_decode_IS_CSR_86,_zz__zz_decode_IS_CSR_90}}};
  assign _zz__zz_decode_IS_CSR_35 = 32'h00103040;
  assign _zz__zz_decode_IS_CSR_40 = (decode_INSTRUCTION & 32'h00000040);
  assign _zz__zz_decode_IS_CSR_41 = 32'h00000040;
  assign _zz__zz_decode_IS_CSR_42 = (_zz__zz_decode_IS_CSR_43 == _zz__zz_decode_IS_CSR_44);
  assign _zz__zz_decode_IS_CSR_45 = {_zz__zz_decode_IS_CSR_46,_zz__zz_decode_IS_CSR_48};
  assign _zz__zz_decode_IS_CSR_51 = (_zz__zz_decode_IS_CSR_52 == _zz__zz_decode_IS_CSR_53);
  assign _zz__zz_decode_IS_CSR_54 = {_zz__zz_decode_IS_CSR_55,{_zz__zz_decode_IS_CSR_57,_zz__zz_decode_IS_CSR_60}};
  assign _zz__zz_decode_IS_CSR_64 = _zz_decode_IS_CSR_4;
  assign _zz__zz_decode_IS_CSR_65 = {_zz__zz_decode_IS_CSR_66,{_zz__zz_decode_IS_CSR_68,_zz__zz_decode_IS_CSR_71}};
  assign _zz__zz_decode_IS_CSR_78 = {_zz_decode_IS_CSR_3,_zz__zz_decode_IS_CSR_79};
  assign _zz__zz_decode_IS_CSR_81 = (|{_zz__zz_decode_IS_CSR_82,_zz__zz_decode_IS_CSR_83});
  assign _zz__zz_decode_IS_CSR_86 = (|_zz__zz_decode_IS_CSR_87);
  assign _zz__zz_decode_IS_CSR_90 = {_zz__zz_decode_IS_CSR_91,{_zz__zz_decode_IS_CSR_93,_zz__zz_decode_IS_CSR_104}};
  assign _zz__zz_decode_IS_CSR_43 = (decode_INSTRUCTION & 32'h00004020);
  assign _zz__zz_decode_IS_CSR_44 = 32'h00004020;
  assign _zz__zz_decode_IS_CSR_46 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_47) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_48 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_49) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_52 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz__zz_decode_IS_CSR_53 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_55 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_56) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_57 = (_zz__zz_decode_IS_CSR_58 == _zz__zz_decode_IS_CSR_59);
  assign _zz__zz_decode_IS_CSR_60 = (_zz__zz_decode_IS_CSR_61 == _zz__zz_decode_IS_CSR_62);
  assign _zz__zz_decode_IS_CSR_66 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_67) == 32'h00001010);
  assign _zz__zz_decode_IS_CSR_68 = (_zz__zz_decode_IS_CSR_69 == _zz__zz_decode_IS_CSR_70);
  assign _zz__zz_decode_IS_CSR_71 = {_zz__zz_decode_IS_CSR_72,{_zz__zz_decode_IS_CSR_73,_zz__zz_decode_IS_CSR_75}};
  assign _zz__zz_decode_IS_CSR_79 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_80) == 32'h00000020);
  assign _zz__zz_decode_IS_CSR_82 = _zz_decode_IS_CSR_3;
  assign _zz__zz_decode_IS_CSR_83 = (_zz__zz_decode_IS_CSR_84 == _zz__zz_decode_IS_CSR_85);
  assign _zz__zz_decode_IS_CSR_87 = (_zz__zz_decode_IS_CSR_88 == _zz__zz_decode_IS_CSR_89);
  assign _zz__zz_decode_IS_CSR_91 = (|_zz__zz_decode_IS_CSR_92);
  assign _zz__zz_decode_IS_CSR_93 = (|_zz__zz_decode_IS_CSR_94);
  assign _zz__zz_decode_IS_CSR_104 = {_zz__zz_decode_IS_CSR_105,{_zz__zz_decode_IS_CSR_108,_zz__zz_decode_IS_CSR_116}};
  assign _zz__zz_decode_IS_CSR_47 = 32'h00000030;
  assign _zz__zz_decode_IS_CSR_49 = 32'h02000020;
  assign _zz__zz_decode_IS_CSR_56 = 32'h00001030;
  assign _zz__zz_decode_IS_CSR_58 = (decode_INSTRUCTION & 32'h02002060);
  assign _zz__zz_decode_IS_CSR_59 = 32'h00002020;
  assign _zz__zz_decode_IS_CSR_61 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz__zz_decode_IS_CSR_62 = 32'h00000020;
  assign _zz__zz_decode_IS_CSR_67 = 32'h00001010;
  assign _zz__zz_decode_IS_CSR_69 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_IS_CSR_70 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_72 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000010);
  assign _zz__zz_decode_IS_CSR_73 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_74) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_75 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_76) == 32'h0);
  assign _zz__zz_decode_IS_CSR_80 = 32'h00000070;
  assign _zz__zz_decode_IS_CSR_84 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_IS_CSR_85 = 32'h0;
  assign _zz__zz_decode_IS_CSR_88 = (decode_INSTRUCTION & 32'h00004014);
  assign _zz__zz_decode_IS_CSR_89 = 32'h00004010;
  assign _zz__zz_decode_IS_CSR_92 = ((decode_INSTRUCTION & 32'h00006014) == 32'h00002010);
  assign _zz__zz_decode_IS_CSR_94 = {(_zz__zz_decode_IS_CSR_95 == _zz__zz_decode_IS_CSR_96),{_zz_decode_IS_CSR_2,{_zz__zz_decode_IS_CSR_97,_zz__zz_decode_IS_CSR_99}}};
  assign _zz__zz_decode_IS_CSR_105 = (|(_zz__zz_decode_IS_CSR_106 == _zz__zz_decode_IS_CSR_107));
  assign _zz__zz_decode_IS_CSR_108 = (|{_zz__zz_decode_IS_CSR_109,_zz__zz_decode_IS_CSR_111});
  assign _zz__zz_decode_IS_CSR_116 = {(|_zz__zz_decode_IS_CSR_117),{_zz__zz_decode_IS_CSR_120,_zz__zz_decode_IS_CSR_122}};
  assign _zz__zz_decode_IS_CSR_74 = 32'h0000000c;
  assign _zz__zz_decode_IS_CSR_76 = 32'h00000028;
  assign _zz__zz_decode_IS_CSR_95 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_IS_CSR_96 = 32'h0;
  assign _zz__zz_decode_IS_CSR_97 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_98) == 32'h00002000);
  assign _zz__zz_decode_IS_CSR_99 = {(_zz__zz_decode_IS_CSR_100 == _zz__zz_decode_IS_CSR_101),(_zz__zz_decode_IS_CSR_102 == _zz__zz_decode_IS_CSR_103)};
  assign _zz__zz_decode_IS_CSR_106 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_CSR_107 = 32'h0;
  assign _zz__zz_decode_IS_CSR_109 = ((decode_INSTRUCTION & _zz__zz_decode_IS_CSR_110) == 32'h00000040);
  assign _zz__zz_decode_IS_CSR_111 = {(_zz__zz_decode_IS_CSR_112 == _zz__zz_decode_IS_CSR_113),(_zz__zz_decode_IS_CSR_114 == _zz__zz_decode_IS_CSR_115)};
  assign _zz__zz_decode_IS_CSR_117 = {(_zz__zz_decode_IS_CSR_118 == _zz__zz_decode_IS_CSR_119),_zz_decode_IS_CSR_1};
  assign _zz__zz_decode_IS_CSR_120 = (|{_zz__zz_decode_IS_CSR_121,_zz_decode_IS_CSR_1});
  assign _zz__zz_decode_IS_CSR_122 = (|(_zz__zz_decode_IS_CSR_123 == _zz__zz_decode_IS_CSR_124));
  assign _zz__zz_decode_IS_CSR_98 = 32'h00006004;
  assign _zz__zz_decode_IS_CSR_100 = (decode_INSTRUCTION & 32'h00005004);
  assign _zz__zz_decode_IS_CSR_101 = 32'h00001000;
  assign _zz__zz_decode_IS_CSR_102 = (decode_INSTRUCTION & 32'h00004050);
  assign _zz__zz_decode_IS_CSR_103 = 32'h00004000;
  assign _zz__zz_decode_IS_CSR_110 = 32'h00000044;
  assign _zz__zz_decode_IS_CSR_112 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz__zz_decode_IS_CSR_113 = 32'h00002010;
  assign _zz__zz_decode_IS_CSR_114 = (decode_INSTRUCTION & 32'h40000034);
  assign _zz__zz_decode_IS_CSR_115 = 32'h40000030;
  assign _zz__zz_decode_IS_CSR_118 = (decode_INSTRUCTION & 32'h00000014);
  assign _zz__zz_decode_IS_CSR_119 = 32'h00000004;
  assign _zz__zz_decode_IS_CSR_121 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz__zz_decode_IS_CSR_123 = (decode_INSTRUCTION & 32'h00005048);
  assign _zz__zz_decode_IS_CSR_124 = 32'h00001008;
  assign _zz_execute_BranchPlugin_branch_src2_6 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_7 = execute_INSTRUCTION[19 : 12];
  assign _zz_execute_BranchPlugin_branch_src2_8 = execute_INSTRUCTION[20];
  assign _zz_execute_BranchPlugin_branch_src2_9 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_10 = execute_INSTRUCTION[7];
  always @(posedge io_axiClk) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      RegFilePlugin_regFile_spinal_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge io_axiClk) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      RegFilePlugin_regFile_spinal_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge io_axiClk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                              (IBusCachedPlugin_cache_io_flush                           ), //i
    .io_cpu_prefetch_isValid               (IBusCachedPlugin_cache_io_cpu_prefetch_isValid            ), //i
    .io_cpu_prefetch_haltIt                (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt             ), //o
    .io_cpu_prefetch_pc                    (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]     ), //i
    .io_cpu_fetch_isValid                  (IBusCachedPlugin_cache_io_cpu_fetch_isValid               ), //i
    .io_cpu_fetch_isStuck                  (IBusCachedPlugin_cache_io_cpu_fetch_isStuck               ), //i
    .io_cpu_fetch_isRemoved                (                                                          ), //i
    .io_cpu_fetch_pc                       (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]     ), //i
    .io_cpu_fetch_data                     (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]            ), //o
    .io_cpu_fetch_mmuRsp_physicalAddress   (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]         ), //i
    .io_cpu_fetch_mmuRsp_isIoAccess        (IBusCachedPlugin_mmuBus_rsp_isIoAccess                    ), //i
    .io_cpu_fetch_mmuRsp_isPaging          (IBusCachedPlugin_mmuBus_rsp_isPaging                      ), //i
    .io_cpu_fetch_mmuRsp_allowRead         (IBusCachedPlugin_mmuBus_rsp_allowRead                     ), //i
    .io_cpu_fetch_mmuRsp_allowWrite        (IBusCachedPlugin_mmuBus_rsp_allowWrite                    ), //i
    .io_cpu_fetch_mmuRsp_allowExecute      (IBusCachedPlugin_mmuBus_rsp_allowExecute                  ), //i
    .io_cpu_fetch_mmuRsp_exception         (IBusCachedPlugin_mmuBus_rsp_exception                     ), //i
    .io_cpu_fetch_mmuRsp_refilling         (IBusCachedPlugin_mmuBus_rsp_refilling                     ), //i
    .io_cpu_fetch_mmuRsp_bypassTranslation (IBusCachedPlugin_mmuBus_rsp_bypassTranslation             ), //i
    .io_cpu_fetch_physicalAddress          (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0] ), //o
    .io_cpu_decode_isValid                 (IBusCachedPlugin_cache_io_cpu_decode_isValid              ), //i
    .io_cpu_decode_isStuck                 (IBusCachedPlugin_cache_io_cpu_decode_isStuck              ), //i
    .io_cpu_decode_pc                      (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]     ), //i
    .io_cpu_decode_physicalAddress         (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]), //o
    .io_cpu_decode_data                    (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]           ), //o
    .io_cpu_decode_cacheMiss               (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss            ), //o
    .io_cpu_decode_error                   (IBusCachedPlugin_cache_io_cpu_decode_error                ), //o
    .io_cpu_decode_mmuRefilling            (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling         ), //o
    .io_cpu_decode_mmuException            (IBusCachedPlugin_cache_io_cpu_decode_mmuException         ), //o
    .io_cpu_decode_isUser                  (IBusCachedPlugin_cache_io_cpu_decode_isUser               ), //i
    .io_cpu_fill_valid                     (IBusCachedPlugin_cache_io_cpu_fill_valid                  ), //i
    .io_cpu_fill_payload                   (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]), //i
    .io_mem_cmd_valid                      (IBusCachedPlugin_cache_io_mem_cmd_valid                   ), //o
    .io_mem_cmd_ready                      (iBus_cmd_ready                                            ), //i
    .io_mem_cmd_payload_address            (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]   ), //o
    .io_mem_cmd_payload_size               (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]       ), //o
    .io_mem_rsp_valid                      (iBus_rsp_valid                                            ), //i
    .io_mem_rsp_payload_data               (iBus_rsp_payload_data[511:0]                              ), //i
    .io_mem_rsp_payload_error              (iBus_rsp_payload_error                                    ), //i
    ._zz_when_Fetcher_l411                 (IBusCachedPlugin_injector_port_state[2:0]                 ), //i
    ._zz_decodeStage_hit_data_1            (DebugPlugin_injectionPort_payload[31:0]                   ), //i
    .io_axiClk                             (io_axiClk                                                 ), //i
    .resetCtrl_axiReset                    (resetCtrl_axiReset                                        )  //i
  );
  DataCache dataCache_1 (
    .io_cpu_execute_isValid                 (dataCache_1_io_cpu_execute_isValid               ), //i
    .io_cpu_execute_address                 (dataCache_1_io_cpu_execute_address[31:0]         ), //i
    .io_cpu_execute_haltIt                  (dataCache_1_io_cpu_execute_haltIt                ), //o
    .io_cpu_execute_args_wr                 (execute_MEMORY_WR                                ), //i
    .io_cpu_execute_args_size               (execute_DBusCachedPlugin_size[1:0]               ), //i
    .io_cpu_execute_args_totalyConsistent   (execute_MEMORY_FORCE_CONSTISTENCY                ), //i
    .io_cpu_execute_refilling               (dataCache_1_io_cpu_execute_refilling             ), //o
    .io_cpu_memory_isValid                  (dataCache_1_io_cpu_memory_isValid                ), //i
    .io_cpu_memory_isStuck                  (memory_arbitration_isStuck                       ), //i
    .io_cpu_memory_isWrite                  (dataCache_1_io_cpu_memory_isWrite                ), //o
    .io_cpu_memory_address                  (dataCache_1_io_cpu_memory_address[31:0]          ), //i
    .io_cpu_memory_mmuRsp_physicalAddress   (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]), //i
    .io_cpu_memory_mmuRsp_isIoAccess        (dataCache_1_io_cpu_memory_mmuRsp_isIoAccess      ), //i
    .io_cpu_memory_mmuRsp_isPaging          (DBusCachedPlugin_mmuBus_rsp_isPaging             ), //i
    .io_cpu_memory_mmuRsp_allowRead         (DBusCachedPlugin_mmuBus_rsp_allowRead            ), //i
    .io_cpu_memory_mmuRsp_allowWrite        (DBusCachedPlugin_mmuBus_rsp_allowWrite           ), //i
    .io_cpu_memory_mmuRsp_allowExecute      (DBusCachedPlugin_mmuBus_rsp_allowExecute         ), //i
    .io_cpu_memory_mmuRsp_exception         (DBusCachedPlugin_mmuBus_rsp_exception            ), //i
    .io_cpu_memory_mmuRsp_refilling         (DBusCachedPlugin_mmuBus_rsp_refilling            ), //i
    .io_cpu_memory_mmuRsp_bypassTranslation (DBusCachedPlugin_mmuBus_rsp_bypassTranslation    ), //i
    .io_cpu_writeBack_isValid               (dataCache_1_io_cpu_writeBack_isValid             ), //i
    .io_cpu_writeBack_isStuck               (writeBack_arbitration_isStuck                    ), //i
    .io_cpu_writeBack_isFiring              (writeBack_arbitration_isFiring                   ), //i
    .io_cpu_writeBack_isUser                (dataCache_1_io_cpu_writeBack_isUser              ), //i
    .io_cpu_writeBack_haltIt                (dataCache_1_io_cpu_writeBack_haltIt              ), //o
    .io_cpu_writeBack_isWrite               (dataCache_1_io_cpu_writeBack_isWrite             ), //o
    .io_cpu_writeBack_storeData             (dataCache_1_io_cpu_writeBack_storeData[31:0]     ), //i
    .io_cpu_writeBack_data                  (dataCache_1_io_cpu_writeBack_data[31:0]          ), //o
    .io_cpu_writeBack_address               (dataCache_1_io_cpu_writeBack_address[31:0]       ), //i
    .io_cpu_writeBack_mmuException          (dataCache_1_io_cpu_writeBack_mmuException        ), //o
    .io_cpu_writeBack_unalignedAccess       (dataCache_1_io_cpu_writeBack_unalignedAccess     ), //o
    .io_cpu_writeBack_accessError           (dataCache_1_io_cpu_writeBack_accessError         ), //o
    .io_cpu_writeBack_keepMemRspData        (dataCache_1_io_cpu_writeBack_keepMemRspData      ), //o
    .io_cpu_writeBack_fence_SW              (                                                 ), //i
    .io_cpu_writeBack_fence_SR              (                                                 ), //i
    .io_cpu_writeBack_fence_SO              (                                                 ), //i
    .io_cpu_writeBack_fence_SI              (                                                 ), //i
    .io_cpu_writeBack_fence_PW              (                                                 ), //i
    .io_cpu_writeBack_fence_PR              (                                                 ), //i
    .io_cpu_writeBack_fence_PO              (                                                 ), //i
    .io_cpu_writeBack_fence_PI              (                                                 ), //i
    .io_cpu_writeBack_fence_FM              (                                                 ), //i
    .io_cpu_writeBack_exclusiveOk           (dataCache_1_io_cpu_writeBack_exclusiveOk         ), //o
    .io_cpu_redo                            (dataCache_1_io_cpu_redo                          ), //o
    .io_cpu_flush_valid                     (dataCache_1_io_cpu_flush_valid                   ), //i
    .io_cpu_flush_ready                     (dataCache_1_io_cpu_flush_ready                   ), //o
    .io_cpu_flush_payload_singleLine        (dataCache_1_io_cpu_flush_payload_singleLine      ), //i
    .io_cpu_flush_payload_lineId            (dataCache_1_io_cpu_flush_payload_lineId[5:0]     ), //i
    .io_cpu_writesPending                   (dataCache_1_io_cpu_writesPending                 ), //o
    .io_mem_cmd_valid                       (dataCache_1_io_mem_cmd_valid                     ), //o
    .io_mem_cmd_ready                       (dBus_cmd_ready                                   ), //i
    .io_mem_cmd_payload_wr                  (dataCache_1_io_mem_cmd_payload_wr                ), //o
    .io_mem_cmd_payload_uncached            (dataCache_1_io_mem_cmd_payload_uncached          ), //o
    .io_mem_cmd_payload_address             (dataCache_1_io_mem_cmd_payload_address[31:0]     ), //o
    .io_mem_cmd_payload_data                (dataCache_1_io_mem_cmd_payload_data[31:0]        ), //o
    .io_mem_cmd_payload_mask                (dataCache_1_io_mem_cmd_payload_mask[3:0]         ), //o
    .io_mem_cmd_payload_size                (dataCache_1_io_mem_cmd_payload_size[2:0]         ), //o
    .io_mem_cmd_payload_last                (dataCache_1_io_mem_cmd_payload_last              ), //o
    .io_mem_rsp_valid                       (dBus_rsp_valid                                   ), //i
    .io_mem_rsp_payload_last                (dBus_rsp_payload_last                            ), //i
    .io_mem_rsp_payload_data                (dBus_rsp_payload_data[511:0]                     ), //i
    .io_mem_rsp_payload_error               (dBus_rsp_payload_error                           ), //i
    .io_axiClk                              (io_axiClk                                        ), //i
    .resetCtrl_axiReset                     (resetCtrl_axiReset                               )  //i
  );
  always @(*) begin
    case(_zz_IBusCachedPlugin_jump_pcLoad_payload_6)
      2'b00 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = DBusCachedPlugin_redoBranch_payload;
      2'b01 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = CsrPlugin_jumpInterface_payload;
      2'b10 : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = BranchPlugin_jumpInterface_payload;
      default : _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = IBusCachedPlugin_predictionJumpInterface_payload;
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_1)
      2'b00 : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_0;
      2'b01 : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_1;
      2'b10 : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_2;
      default : _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_3;
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_3)
      1'b0 : _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_1;
      default : _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_3;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_string = "XRET";
      default : _zz_decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_memory_ENV_CTRL_string = "XRET";
      default : _zz_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_execute_ENV_CTRL_string = "XRET";
      default : _zz_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : _zz_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_execute_SRC2_CTRL_string = "PC ";
      default : _zz_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_1_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_2_string = "NONE";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_2_string = "XRET";
      default : _zz_decode_ENV_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      EnvCtrlEnum_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW) + $signed(_zz_memory_MUL_LOW_6));
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED1 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE_DATA_RF = execute_to_memory_MEMORY_STORE_DATA_RF;
  assign execute_MEMORY_STORE_DATA_RF = _zz_execute_MEMORY_STORE_DATA_RF;
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_PREDICTION_HAD_BRANCHED1 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_IS_CSR[29];
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign decode_IS_RS2_SIGNED = _zz_decode_IS_CSR[26];
  assign decode_IS_RS1_SIGNED = _zz_decode_IS_CSR[25];
  assign decode_IS_DIV = _zz_decode_IS_CSR[24];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_decode_IS_CSR[23];
  assign _zz_execute_to_memory_SHIFT_CTRL = _zz_execute_to_memory_SHIFT_CTRL_1;
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_IS_CSR[17];
  assign decode_MEMORY_MANAGMENT = _zz_decode_IS_CSR[16];
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_decode_IS_CSR[13];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_IS_CSR[12];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_IS_CSR[11];
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL = _zz_decode_to_execute_SRC2_CTRL_1;
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign _zz_decode_to_execute_SRC1_CTRL = _zz_decode_to_execute_SRC1_CTRL_1;
  assign decode_MEMORY_FORCE_CONSTISTENCY = 1'b0;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_IS_CSR[31];
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED1 = decode_to_execute_PREDICTION_HAD_BRANCHED1;
  assign execute_BRANCH_COND_RESULT = _zz_execute_BRANCH_COND_RESULT_1;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign decode_RS2_USE = _zz_decode_IS_CSR[15];
  assign decode_RS1_USE = _zz_decode_IS_CSR[5];
  always @(*) begin
    _zz_decode_RS2 = execute_REGFILE_WRITE_DATA;
    if(when_CsrPlugin_l1587) begin
      _zz_decode_RS2 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
  end

  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @(*) begin
    _zz_decode_RS2_1 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid) begin
      case(memory_SHIFT_CTRL)
        ShiftCtrlEnum_SLL_1 : begin
          _zz_decode_RS2_1 = _zz_decode_RS2_3;
        end
        ShiftCtrlEnum_SRL_1, ShiftCtrlEnum_SRA_1 : begin
          _zz_decode_RS2_1 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2_1 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_memory_SHIFT_CTRL;
  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_execute_to_memory_PC = execute_PC;
  assign execute_SRC2_CTRL = _zz_execute_SRC2_CTRL;
  assign execute_SRC1_CTRL = _zz_execute_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_IS_CSR[3];
  assign decode_SRC_ADD_ZERO = _zz_decode_IS_CSR[20];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = _zz_execute_SRC2_4;
  assign execute_SRC1 = _zz_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_IS_CSR[10];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = (|{((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}});
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusCachedPlugin_l581) begin
      _zz_decode_RS2_2 = writeBack_DBusCachedPlugin_rspFormated;
    end
    if(when_MulPlugin_l147) begin
      case(switch_MulPlugin_l148)
        2'b00 : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2;
        end
        default : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2_1;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_MEMORY_STORE_DATA_RF = memory_to_writeBack_MEMORY_STORE_DATA_RF;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_FORCE_CONSTISTENCY = decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_ENABLE = _zz_decode_IS_CSR[4];
  assign decode_FLUSH_ALL = _zz_decode_IS_CSR[0];
  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(when_IBusCachedPlugin_l245) begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  always @(*) begin
    _zz_decode_to_execute_FORMAL_PC_NEXT = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      _zz_decode_to_execute_FORMAL_PC_NEXT = IBusCachedPlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l353) begin
      decode_arbitration_haltItself = 1'b1;
    end
    case(IBusCachedPlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1527) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_when) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_when) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l395) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_CsrPlugin_l1591) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(when_DBusCachedPlugin_l411) begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_flushIt = 1'b0;
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l129) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid) begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_branchExceptionPort_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l554) begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1390) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l1272) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1390) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l308) begin
      if(when_DebugPlugin_l311) begin
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l324) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  assign IBusCachedPlugin_forceNoDecodeCond = 1'b0;
  always @(*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l242) begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_DBusCachedPlugin_l473 = 1'b0;
    if(DebugPlugin_godmode) begin
      _zz_when_DBusCachedPlugin_l473 = 1'b1;
    end
  end

  always @(*) begin
    BranchPlugin_inDebugNoFetchFlag = 1'b0;
    if(DebugPlugin_godmode) begin
      BranchPlugin_inDebugNoFetchFlag = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
    if(when_CsrPlugin_l1702) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
    if(when_CsrPlugin_l1709) begin
      CsrPlugin_csrMapping_allowCsrSignal = 1'b1;
    end
  end

  assign CsrPlugin_csrMapping_doForceFailCsr = 1'b0;
  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  assign CsrPlugin_inWfi = 1'b0;
  always @(*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt) begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1456) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1390) begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(when_CsrPlugin_l1456) begin
      case(switch_CsrPlugin_l1460)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode) begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if(when_DebugPlugin_l344) begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode) begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak) begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign CsrPlugin_xretAwayFromMachine = 1'b0;
  assign IBusCachedPlugin_externalFlush = (|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}});
  assign IBusCachedPlugin_jump_pcLoad_valid = (|{CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}});
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload = {IBusCachedPlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload & (~ _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1));
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_2 = _zz_IBusCachedPlugin_jump_pcLoad_payload_1[3];
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_3 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[1] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_4 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[2] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  always @(*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_fire = (IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready);
  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l133 = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate);
  assign when_Fetcher_l133_1 = ((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_IBusCachedPlugin_fetchPc_pc);
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  always @(*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l160 = (IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate));
  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch) begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt) begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_ready && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_valid;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_ready = IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_haltWhen_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy) begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_ready && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_ready = IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_haltWhen_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if(when_IBusCachedPlugin_l273) begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_ready && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_ready = IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_haltWhen_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_valid = IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if(when_Fetcher_l322) begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l242 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid);
  assign when_Fetcher_l322 = (! IBusCachedPlugin_pcValids_0);
  assign when_Fetcher_l331 = (! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready));
  assign when_Fetcher_l331_1 = (! (! IBusCachedPlugin_iBusRsp_stages_2_input_ready));
  assign when_Fetcher_l331_2 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l331_3 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l331_4 = (! writeBack_arbitration_isStuck);
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
    case(IBusCachedPlugin_injector_port_state)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
    if(IBusCachedPlugin_forceNoDecodeCond) begin
      decode_arbitration_isValid = 1'b0;
    end
  end

  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch[11];
  always @(*) begin
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[18] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[17] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[16] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[15] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[14] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[13] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[12] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[11] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[10] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[9] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[8] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[7] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[6] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[5] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[4] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[3] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[2] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[1] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[0] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  end

  always @(*) begin
    IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) || ((decode_BRANCH_CTRL == BranchCtrlEnum_B) && _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2[31]));
    if(_zz_6) begin
      IBusCachedPlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_2 = _zz__zz_2[19];
  always @(*) begin
    _zz_3[10] = _zz_2;
    _zz_3[9] = _zz_2;
    _zz_3[8] = _zz_2;
    _zz_3[7] = _zz_2;
    _zz_3[6] = _zz_2;
    _zz_3[5] = _zz_2;
    _zz_3[4] = _zz_2;
    _zz_3[3] = _zz_2;
    _zz_3[2] = _zz_2;
    _zz_3[1] = _zz_2;
    _zz_3[0] = _zz_2;
  end

  assign _zz_4 = _zz__zz_4[11];
  always @(*) begin
    _zz_5[18] = _zz_4;
    _zz_5[17] = _zz_4;
    _zz_5[16] = _zz_4;
    _zz_5[15] = _zz_4;
    _zz_5[14] = _zz_4;
    _zz_5[13] = _zz_4;
    _zz_5[12] = _zz_4;
    _zz_5[11] = _zz_4;
    _zz_5[10] = _zz_4;
    _zz_5[9] = _zz_4;
    _zz_5[8] = _zz_4;
    _zz_5[7] = _zz_4;
    _zz_5[6] = _zz_4;
    _zz_5[5] = _zz_4;
    _zz_5[4] = _zz_4;
    _zz_5[3] = _zz_4;
    _zz_5[2] = _zz_4;
    _zz_5[1] = _zz_4;
    _zz_5[0] = _zz_4;
  end

  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_JAL : begin
        _zz_6 = _zz__zz_6[1];
      end
      default : begin
        _zz_6 = _zz__zz_6_1[1];
      end
    endcase
  end

  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload[19];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  end

  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2[11];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[18] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[17] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[16] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[15] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[14] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[13] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[12] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[11] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_1,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_4,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_3,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_5,_zz_IBusCachedPlugin_predictionJumpInterface_payload_6},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @(*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign IBusCachedPlugin_cache_io_cpu_prefetch_isValid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isValid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_1_input_ready || IBusCachedPlugin_externalFlush);
  assign IBusCachedPlugin_cache_io_cpu_decode_isValid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_decode_isStuck = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_cache_io_cpu_decode_isUser = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @(*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(when_IBusCachedPlugin_l245) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_cache_io_cpu_fill_valid = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_cache_io_cpu_fill_valid = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(when_IBusCachedPlugin_l262) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_2_input_payload[31 : 2],2'b00};
  assign when_IBusCachedPlugin_l245 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign when_IBusCachedPlugin_l250 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign when_IBusCachedPlugin_l256 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign when_IBusCachedPlugin_l262 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign when_IBusCachedPlugin_l273 = (IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt);
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign IBusCachedPlugin_cache_io_flush = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dBus_cmd_valid = dataCache_1_io_mem_cmd_valid;
  assign dBus_cmd_payload_wr = dataCache_1_io_mem_cmd_payload_wr;
  assign dBus_cmd_payload_uncached = dataCache_1_io_mem_cmd_payload_uncached;
  assign dBus_cmd_payload_address = dataCache_1_io_mem_cmd_payload_address;
  assign dBus_cmd_payload_data = dataCache_1_io_mem_cmd_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1_io_mem_cmd_payload_mask;
  assign dBus_cmd_payload_size = dataCache_1_io_mem_cmd_payload_size;
  assign dBus_cmd_payload_last = dataCache_1_io_mem_cmd_payload_last;
  assign when_DBusCachedPlugin_l353 = ((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE);
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  assign dataCache_1_io_cpu_execute_isValid = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign dataCache_1_io_cpu_execute_address = execute_SRC_ADD;
  always @(*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_execute_MEMORY_STORE_DATA_RF = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dataCache_1_io_cpu_flush_valid = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign dataCache_1_io_cpu_flush_payload_singleLine = (execute_INSTRUCTION[19 : 15] != 5'h0);
  assign dataCache_1_io_cpu_flush_payload_lineId = _zz_io_cpu_flush_payload_lineId[5:0];
  assign when_DBusCachedPlugin_l395 = ((dataCache_1_io_cpu_flush_valid && (! dataCache_1_io_cpu_flush_ready)) || dataCache_1_io_cpu_execute_haltIt);
  assign when_DBusCachedPlugin_l411 = (dataCache_1_io_cpu_execute_refilling && execute_arbitration_isValid);
  assign dataCache_1_io_cpu_memory_isValid = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  assign dataCache_1_io_cpu_memory_address = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_0_isValid = dataCache_1_io_cpu_memory_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_0_isStuck = memory_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_0_virtualAddress = dataCache_1_io_cpu_memory_address;
  assign DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign DBusCachedPlugin_mmuBus_end = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  always @(*) begin
    dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if(when_DBusCachedPlugin_l473) begin
      dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = 1'b1;
    end
  end

  assign when_DBusCachedPlugin_l473 = (_zz_when_DBusCachedPlugin_l473 && (! dataCache_1_io_cpu_memory_isWrite));
  always @(*) begin
    dataCache_1_io_cpu_writeBack_isValid = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
    if(writeBack_arbitration_haltByOther) begin
      dataCache_1_io_cpu_writeBack_isValid = 1'b0;
    end
  end

  assign dataCache_1_io_cpu_writeBack_isUser = (CsrPlugin_privilege == 2'b00);
  assign dataCache_1_io_cpu_writeBack_address = writeBack_REGFILE_WRITE_DATA;
  assign dataCache_1_io_cpu_writeBack_storeData[31 : 0] = writeBack_MEMORY_STORE_DATA_RF;
  always @(*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(when_DBusCachedPlugin_l534) begin
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(when_DBusCachedPlugin_l534) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_payload_code = 4'bxxxx;
    if(when_DBusCachedPlugin_l534) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code};
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 4'b1111 : 4'b1101);
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code_1};
      end
    end
  end

  assign when_DBusCachedPlugin_l534 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign when_DBusCachedPlugin_l554 = (dataCache_1_io_cpu_writeBack_isValid && dataCache_1_io_cpu_writeBack_haltIt);
  assign writeBack_DBusCachedPlugin_rspData = dataCache_1_io_cpu_writeBack_data;
  assign writeBack_DBusCachedPlugin_rspSplits_0 = writeBack_DBusCachedPlugin_rspData[7 : 0];
  assign writeBack_DBusCachedPlugin_rspSplits_1 = writeBack_DBusCachedPlugin_rspData[15 : 8];
  assign writeBack_DBusCachedPlugin_rspSplits_2 = writeBack_DBusCachedPlugin_rspData[23 : 16];
  assign writeBack_DBusCachedPlugin_rspSplits_3 = writeBack_DBusCachedPlugin_rspData[31 : 24];
  always @(*) begin
    writeBack_DBusCachedPlugin_rspShifted[7 : 0] = _zz_writeBack_DBusCachedPlugin_rspShifted;
    writeBack_DBusCachedPlugin_rspShifted[15 : 8] = _zz_writeBack_DBusCachedPlugin_rspShifted_2;
    writeBack_DBusCachedPlugin_rspShifted[23 : 16] = writeBack_DBusCachedPlugin_rspSplits_2;
    writeBack_DBusCachedPlugin_rspShifted[31 : 24] = writeBack_DBusCachedPlugin_rspSplits_3;
  end

  assign writeBack_DBusCachedPlugin_rspRf = writeBack_DBusCachedPlugin_rspShifted[31 : 0];
  assign switch_Misc_l245 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusCachedPlugin_rspFormated = (writeBack_DBusCachedPlugin_rspRf[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[31] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[30] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[29] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[28] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[27] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[26] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[25] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[24] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[23] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[22] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[21] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[20] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[19] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[18] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[17] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[16] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[15] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[14] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[13] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[12] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[11] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[10] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[9] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[8] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[7 : 0] = writeBack_DBusCachedPlugin_rspRf[7 : 0];
  end

  assign _zz_writeBack_DBusCachedPlugin_rspFormated_2 = (writeBack_DBusCachedPlugin_rspRf[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[31] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[30] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[29] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[28] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[27] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[26] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[25] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[24] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[23] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[22] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[21] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[20] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[19] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[18] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[17] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[16] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[15 : 0] = writeBack_DBusCachedPlugin_rspRf[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l245)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspRf;
      end
    endcase
  end

  assign when_DBusCachedPlugin_l581 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (4'b1010 <= IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28]);
  assign IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (4'b1010 <= DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28]);
  assign DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusCachedPlugin_mmuBus_busy = 1'b0;
  assign _zz_decode_IS_CSR_1 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_IS_CSR_2 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_decode_IS_CSR_3 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_IS_CSR_4 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_IS_CSR_5 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_decode_IS_CSR = {(|((decode_INSTRUCTION & 32'h10003050) == 32'h00000050)),{(|((decode_INSTRUCTION & _zz__zz_decode_IS_CSR) == 32'h00000050)),{(|{_zz__zz_decode_IS_CSR_1,_zz__zz_decode_IS_CSR_2}),{(|{_zz__zz_decode_IS_CSR_3,_zz__zz_decode_IS_CSR_4}),{(|_zz__zz_decode_IS_CSR_5),{_zz__zz_decode_IS_CSR_6,{_zz__zz_decode_IS_CSR_7,_zz__zz_decode_IS_CSR_8}}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_IS_CSR[2 : 1];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_IS_CSR[7 : 6];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_IS_CSR[9 : 8];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_IS_CSR[19 : 18];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_IS_CSR[22 : 21];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_IS_CSR[28 : 27];
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_IS_CSR[30 : 30];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h0);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = RegFilePlugin_regFile_spinal_port0;
  assign decode_RegFilePlugin_rs2Data = RegFilePlugin_regFile_spinal_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_10) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_10) begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_10) begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      AluBitwiseCtrlEnum_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      AluCtrlEnum_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : begin
        _zz_execute_SRC1 = execute_RS1;
      end
      Src1CtrlEnum_PC_INCREMENT : begin
        _zz_execute_SRC1 = {29'd0, _zz__zz_execute_SRC1};
      end
      Src1CtrlEnum_IMU : begin
        _zz_execute_SRC1 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_execute_SRC1 = {27'd0, _zz__zz_execute_SRC1_1};
      end
    endcase
  end

  assign _zz_execute_SRC2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_SRC2_1[19] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[18] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[17] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[16] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[15] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[14] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[13] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[12] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[11] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[10] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[9] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[8] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[7] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[6] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[5] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[4] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[3] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[2] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[1] = _zz_execute_SRC2;
    _zz_execute_SRC2_1[0] = _zz_execute_SRC2;
  end

  assign _zz_execute_SRC2_2 = _zz__zz_execute_SRC2_2[11];
  always @(*) begin
    _zz_execute_SRC2_3[19] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[18] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[17] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[16] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[15] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[14] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[13] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[12] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[11] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[10] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[9] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[8] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[7] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[6] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[5] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[4] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[3] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[2] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[1] = _zz_execute_SRC2_2;
    _zz_execute_SRC2_3[0] = _zz_execute_SRC2_2;
  end

  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : begin
        _zz_execute_SRC2_4 = execute_RS2;
      end
      Src2CtrlEnum_IMI : begin
        _zz_execute_SRC2_4 = {_zz_execute_SRC2_1,execute_INSTRUCTION[31 : 20]};
      end
      Src2CtrlEnum_IMS : begin
        _zz_execute_SRC2_4 = {_zz_execute_SRC2_3,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_execute_SRC2_4 = _zz_execute_to_memory_PC;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @(*) begin
    _zz_execute_FullBarrelShifterPlugin_reversed[0] = execute_SRC1[31];
    _zz_execute_FullBarrelShifterPlugin_reversed[1] = execute_SRC1[30];
    _zz_execute_FullBarrelShifterPlugin_reversed[2] = execute_SRC1[29];
    _zz_execute_FullBarrelShifterPlugin_reversed[3] = execute_SRC1[28];
    _zz_execute_FullBarrelShifterPlugin_reversed[4] = execute_SRC1[27];
    _zz_execute_FullBarrelShifterPlugin_reversed[5] = execute_SRC1[26];
    _zz_execute_FullBarrelShifterPlugin_reversed[6] = execute_SRC1[25];
    _zz_execute_FullBarrelShifterPlugin_reversed[7] = execute_SRC1[24];
    _zz_execute_FullBarrelShifterPlugin_reversed[8] = execute_SRC1[23];
    _zz_execute_FullBarrelShifterPlugin_reversed[9] = execute_SRC1[22];
    _zz_execute_FullBarrelShifterPlugin_reversed[10] = execute_SRC1[21];
    _zz_execute_FullBarrelShifterPlugin_reversed[11] = execute_SRC1[20];
    _zz_execute_FullBarrelShifterPlugin_reversed[12] = execute_SRC1[19];
    _zz_execute_FullBarrelShifterPlugin_reversed[13] = execute_SRC1[18];
    _zz_execute_FullBarrelShifterPlugin_reversed[14] = execute_SRC1[17];
    _zz_execute_FullBarrelShifterPlugin_reversed[15] = execute_SRC1[16];
    _zz_execute_FullBarrelShifterPlugin_reversed[16] = execute_SRC1[15];
    _zz_execute_FullBarrelShifterPlugin_reversed[17] = execute_SRC1[14];
    _zz_execute_FullBarrelShifterPlugin_reversed[18] = execute_SRC1[13];
    _zz_execute_FullBarrelShifterPlugin_reversed[19] = execute_SRC1[12];
    _zz_execute_FullBarrelShifterPlugin_reversed[20] = execute_SRC1[11];
    _zz_execute_FullBarrelShifterPlugin_reversed[21] = execute_SRC1[10];
    _zz_execute_FullBarrelShifterPlugin_reversed[22] = execute_SRC1[9];
    _zz_execute_FullBarrelShifterPlugin_reversed[23] = execute_SRC1[8];
    _zz_execute_FullBarrelShifterPlugin_reversed[24] = execute_SRC1[7];
    _zz_execute_FullBarrelShifterPlugin_reversed[25] = execute_SRC1[6];
    _zz_execute_FullBarrelShifterPlugin_reversed[26] = execute_SRC1[5];
    _zz_execute_FullBarrelShifterPlugin_reversed[27] = execute_SRC1[4];
    _zz_execute_FullBarrelShifterPlugin_reversed[28] = execute_SRC1[3];
    _zz_execute_FullBarrelShifterPlugin_reversed[29] = execute_SRC1[2];
    _zz_execute_FullBarrelShifterPlugin_reversed[30] = execute_SRC1[1];
    _zz_execute_FullBarrelShifterPlugin_reversed[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == ShiftCtrlEnum_SLL_1) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
  always @(*) begin
    _zz_decode_RS2_3[0] = memory_SHIFT_RIGHT[31];
    _zz_decode_RS2_3[1] = memory_SHIFT_RIGHT[30];
    _zz_decode_RS2_3[2] = memory_SHIFT_RIGHT[29];
    _zz_decode_RS2_3[3] = memory_SHIFT_RIGHT[28];
    _zz_decode_RS2_3[4] = memory_SHIFT_RIGHT[27];
    _zz_decode_RS2_3[5] = memory_SHIFT_RIGHT[26];
    _zz_decode_RS2_3[6] = memory_SHIFT_RIGHT[25];
    _zz_decode_RS2_3[7] = memory_SHIFT_RIGHT[24];
    _zz_decode_RS2_3[8] = memory_SHIFT_RIGHT[23];
    _zz_decode_RS2_3[9] = memory_SHIFT_RIGHT[22];
    _zz_decode_RS2_3[10] = memory_SHIFT_RIGHT[21];
    _zz_decode_RS2_3[11] = memory_SHIFT_RIGHT[20];
    _zz_decode_RS2_3[12] = memory_SHIFT_RIGHT[19];
    _zz_decode_RS2_3[13] = memory_SHIFT_RIGHT[18];
    _zz_decode_RS2_3[14] = memory_SHIFT_RIGHT[17];
    _zz_decode_RS2_3[15] = memory_SHIFT_RIGHT[16];
    _zz_decode_RS2_3[16] = memory_SHIFT_RIGHT[15];
    _zz_decode_RS2_3[17] = memory_SHIFT_RIGHT[14];
    _zz_decode_RS2_3[18] = memory_SHIFT_RIGHT[13];
    _zz_decode_RS2_3[19] = memory_SHIFT_RIGHT[12];
    _zz_decode_RS2_3[20] = memory_SHIFT_RIGHT[11];
    _zz_decode_RS2_3[21] = memory_SHIFT_RIGHT[10];
    _zz_decode_RS2_3[22] = memory_SHIFT_RIGHT[9];
    _zz_decode_RS2_3[23] = memory_SHIFT_RIGHT[8];
    _zz_decode_RS2_3[24] = memory_SHIFT_RIGHT[7];
    _zz_decode_RS2_3[25] = memory_SHIFT_RIGHT[6];
    _zz_decode_RS2_3[26] = memory_SHIFT_RIGHT[5];
    _zz_decode_RS2_3[27] = memory_SHIFT_RIGHT[4];
    _zz_decode_RS2_3[28] = memory_SHIFT_RIGHT[3];
    _zz_decode_RS2_3[29] = memory_SHIFT_RIGHT[2];
    _zz_decode_RS2_3[30] = memory_SHIFT_RIGHT[1];
    _zz_decode_RS2_3[31] = memory_SHIFT_RIGHT[0];
  end

  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  assign switch_MulPlugin_l87 = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_writeBack_MulPlugin_result) + $signed(_zz_writeBack_MulPlugin_result_1));
  assign when_MulPlugin_l147 = (writeBack_arbitration_isValid && writeBack_IS_MUL);
  assign switch_MulPlugin_l148 = writeBack_INSTRUCTION[13 : 12];
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @(*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @(*) begin
    if(memory_DivPlugin_div_counter_willOverflow) begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_memory_DivPlugin_div_counter_valueNext);
    end
    if(memory_DivPlugin_div_counter_willClear) begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign when_MulDivIterativePlugin_l126 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign when_MulDivIterativePlugin_l126_1 = (! memory_arbitration_isStuck);
  assign when_MulDivIterativePlugin_l128 = (memory_arbitration_isValid && memory_IS_DIV);
  assign when_MulDivIterativePlugin_l129 = ((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done));
  assign when_MulDivIterativePlugin_l132 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_memory_DivPlugin_div_stage_0_remainderShifted = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_memory_DivPlugin_div_stage_0_remainderShifted[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_memory_DivPlugin_div_stage_0_remainderMinusDenominator);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_memory_DivPlugin_div_stage_0_outRemainder : _zz_memory_DivPlugin_div_stage_0_outRemainder_1);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_memory_DivPlugin_div_stage_0_outNumerator[31:0];
  assign when_MulDivIterativePlugin_l151 = (memory_DivPlugin_div_counter_value == 6'h20);
  assign _zz_memory_DivPlugin_div_result = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign when_MulDivIterativePlugin_l162 = (! memory_arbitration_isStuck);
  assign _zz_memory_DivPlugin_rs2 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_memory_DivPlugin_rs1 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @(*) begin
    _zz_memory_DivPlugin_rs1_1[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_memory_DivPlugin_rs1_1[31 : 0] = execute_RS1;
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l245_1 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    case(switch_Misc_l245_1)
      3'b000 : begin
        _zz_execute_BRANCH_COND_RESULT = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_BranchPlugin_eq);
      end
      3'b101 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      3'b111 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b0;
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT_1 = _zz_execute_BRANCH_COND_RESULT;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_1[19] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[18] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[17] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[16] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[15] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[14] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[13] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[12] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[11] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[10] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[9] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[8] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[7] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[6] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[5] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[4] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[3] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[2] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[1] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[0] = _zz_execute_BranchPlugin_missAlignedTarget;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_2 = _zz__zz_execute_BranchPlugin_missAlignedTarget_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_3[10] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[9] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[8] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[7] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[6] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[5] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[4] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[3] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[2] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[1] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[0] = _zz_execute_BranchPlugin_missAlignedTarget_2;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_4 = _zz__zz_execute_BranchPlugin_missAlignedTarget_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_5[18] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[17] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[16] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[15] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[14] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[13] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[12] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[11] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[10] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[9] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[8] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[7] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[6] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[5] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[4] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[3] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[2] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[1] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[0] = _zz_execute_BranchPlugin_missAlignedTarget_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = (_zz__zz_execute_BranchPlugin_missAlignedTarget_6[1] ^ execute_RS1[1]);
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1[1];
      end
      default : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_execute_BranchPlugin_missAlignedTarget_6);
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[19] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[18] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[17] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[16] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[15] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[14] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[13] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[12] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[11] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_execute_BranchPlugin_branch_src2_1,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_execute_BranchPlugin_branch_src2_3,{{{_zz_execute_BranchPlugin_branch_src2_6,_zz_execute_BranchPlugin_branch_src2_7},_zz_execute_BranchPlugin_branch_src2_8},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_execute_BranchPlugin_branch_src2_5,{{{_zz_execute_BranchPlugin_branch_src2_9,_zz_execute_BranchPlugin_branch_src2_10},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED1) begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_execute_BranchPlugin_branch_src2_11};
        end
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = _zz__zz_execute_BranchPlugin_branch_src2_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = (memory_arbitration_isValid && (memory_BRANCH_DO && memory_BRANCH_CALC[1]));
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @(*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign CsrPlugin_mtvec_mode = 2'b00;
  assign CsrPlugin_mtvec_base = 30'h20000008;
  assign _zz_when_CsrPlugin_l1302 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l1302_1 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l1302_2 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1[0];
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(BranchPlugin_branchExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l1259 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1259_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1259_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1259_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1272 = (|{CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}});
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l1296 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l1302 = ((_zz_when_CsrPlugin_l1302 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_1 = ((_zz_when_CsrPlugin_l1302_1 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l1302_2 = ((_zz_when_CsrPlugin_l1302_2 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l1335 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1335_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l1335_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l1340 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l1346) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l1346 = (|{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}});
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  assign CsrPlugin_trapCauseEbreakDebug = 1'b0;
  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign CsrPlugin_trapEnterDebug = 1'b0;
  assign when_CsrPlugin_l1390 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1398 = (! CsrPlugin_trapEnterDebug);
  assign when_CsrPlugin_l1456 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET));
  assign switch_CsrPlugin_l1460 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1527 = (|{(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == EnvCtrlEnum_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET))}});
  assign execute_CsrPlugin_blockedBySideEffects = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1725) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1547) begin
      if(when_CsrPlugin_l1548) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  assign when_CsrPlugin_l1547 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET));
  assign when_CsrPlugin_l1548 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1719) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  assign execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
  assign switch_Misc_l245_2 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l245_2)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1587 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1591 = (execute_arbitration_isValid && (execute_IS_CSR || 1'b0));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign when_DebugPlugin_l238 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = DebugPlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if(when_DebugPlugin_l257) begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign when_DebugPlugin_l257 = (! _zz_when_DebugPlugin_l257);
  always @(*) begin
    DebugPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l280)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign DebugPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l280 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l284 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l284_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l285 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l285_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l286 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l287 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l288 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l288_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l308 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l311 = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) == 1'b0);
  assign when_DebugPlugin_l324 = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l344 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_SRC1_CTRL_1 = decode_SRC1_CTRL;
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC1_CTRL = decode_to_execute_SRC1_CTRL;
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_14 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_15 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL_1 = decode_SRC2_CTRL;
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_16 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC2_CTRL = decode_to_execute_SRC2_CTRL;
  assign when_Pipeline_l124_17 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_24 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_25 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_26 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_27 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_execute_to_memory_SHIFT_CTRL_1 = execute_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_30 = (! memory_arbitration_isStuck);
  assign _zz_memory_SHIFT_CTRL = execute_to_memory_SHIFT_CTRL;
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_32 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_33 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_34 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL;
  assign when_Pipeline_l124_38 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_39 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_41 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_42 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign when_Pipeline_l124_43 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_46 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_56 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_57 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_58 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_59 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_60 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_61 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_62 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}}));
  assign execute_arbitration_isFlushed = ((|{writeBack_arbitration_flushNext,memory_arbitration_flushNext}) || (|{writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}}));
  assign memory_arbitration_isFlushed = ((|writeBack_arbitration_flushNext) || (|{writeBack_arbitration_flushIt,memory_arbitration_flushIt}));
  assign writeBack_arbitration_isFlushed = (1'b0 || (|writeBack_arbitration_flushIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  always @(*) begin
    DebugPlugin_injectionPort_ready = 1'b0;
    case(IBusCachedPlugin_injector_port_state)
      3'b100 : begin
        DebugPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Fetcher_l391 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1669 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_4 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1669_5 = (! execute_arbitration_isStuck);
  assign switch_CsrPlugin_l1031 = CsrPlugin_csrMapping_writeDataSignal[12 : 11];
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit = 32'h0;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit[3 : 3] = CsrPlugin_mstatus_MIE;
      _zz_CsrPlugin_csrMapping_readDataInit[12 : 11] = CsrPlugin_mstatus_MPP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_1 = 32'h0;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_1[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h0;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h0;
    if(execute_CsrPlugin_csr_833) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_4[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_5 = 32'h0;
    if(execute_CsrPlugin_csr_835) begin
      _zz_CsrPlugin_csrMapping_readDataInit_5[31 : 0] = CsrPlugin_mtval;
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = (((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_3)) | (_zz_CsrPlugin_csrMapping_readDataInit_4 | _zz_CsrPlugin_csrMapping_readDataInit_5));
  assign when_CsrPlugin_l1702 = ((execute_arbitration_isValid && execute_IS_CSR) && (({execute_CsrPlugin_csrAddress[11 : 2],2'b00} == 12'h3a0) || ({execute_CsrPlugin_csrAddress[11 : 4],4'b0000} == 12'h3b0)));
  assign _zz_when_CsrPlugin_l1709 = (execute_CsrPlugin_csrAddress & 12'hf60);
  assign when_CsrPlugin_l1709 = (((execute_arbitration_isValid && execute_IS_CSR) && (5'h03 <= execute_CsrPlugin_csrAddress[4 : 0])) && (((_zz_when_CsrPlugin_l1709 == 12'hb00) || (((_zz_when_CsrPlugin_l1709 == 12'hc00) && (! execute_CsrPlugin_writeInstruction)) && (CsrPlugin_privilege == 2'b11))) || ((execute_CsrPlugin_csrAddress & 12'hfe0) == 12'h320)));
  always @(*) begin
    when_CsrPlugin_l1719 = CsrPlugin_csrMapping_doForceFailCsr;
    if(when_CsrPlugin_l1717) begin
      when_CsrPlugin_l1719 = 1'b1;
    end
  end

  assign when_CsrPlugin_l1717 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1725 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      IBusCachedPlugin_fetchPc_pcReg <= 32'h80000000;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_rspCounter <= 32'h0;
      DBusCachedPlugin_rspCounter <= 32'h0;
      _zz_10 <= 1'b1;
      memory_DivPlugin_div_counter_value <= 6'h0;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_mcycle <= 64'h0;
      CsrPlugin_minstret <= 64'h0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      IBusCachedPlugin_injector_port_state <= 3'b000;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_output_fire) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l133) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_output_fire) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l133_1) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l160) begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_0_output_toEvent_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l331) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l331_1) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l331_2) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(when_Fetcher_l331_3) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(when_Fetcher_l331_4) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(iBus_rsp_valid) begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(dBus_rsp_valid) begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      _zz_10 <= 1'b0;
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
      if(writeBack_arbitration_isFiring) begin
        CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
      end
      if(when_CsrPlugin_l1259) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l1259_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l1259_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l1259_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l1296) begin
        if(when_CsrPlugin_l1302) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l1302_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l1335) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l1335_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l1335_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l1340) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1390) begin
        if(when_CsrPlugin_l1398) begin
          case(CsrPlugin_targetPrivilege)
            2'b11 : begin
              CsrPlugin_mstatus_MIE <= 1'b0;
              CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
              CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
            end
            default : begin
            end
          endcase
        end
      end
      if(when_CsrPlugin_l1456) begin
        case(switch_CsrPlugin_l1460)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= ((|{_zz_when_CsrPlugin_l1302_2,{_zz_when_CsrPlugin_l1302_1,_zz_when_CsrPlugin_l1302}}) || CsrPlugin_thirdPartyWake);
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(IBusCachedPlugin_injector_port_state)
        3'b000 : begin
          if(DebugPlugin_injectionPort_valid) begin
            IBusCachedPlugin_injector_port_state <= 3'b001;
          end
        end
        3'b001 : begin
          IBusCachedPlugin_injector_port_state <= 3'b010;
        end
        3'b010 : begin
          IBusCachedPlugin_injector_port_state <= 3'b011;
        end
        3'b011 : begin
          if(when_Fetcher_l391) begin
            IBusCachedPlugin_injector_port_state <= 3'b100;
          end
        end
        3'b100 : begin
          IBusCachedPlugin_injector_port_state <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          case(switch_CsrPlugin_l1031)
            2'b11 : begin
              CsrPlugin_mstatus_MPP <= 2'b11;
            end
            default : begin
            end
          endcase
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
    end
  end

  always @(posedge io_axiClk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready) begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(when_MulDivIterativePlugin_l126) begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if(when_MulDivIterativePlugin_l126_1) begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if(when_MulDivIterativePlugin_l151) begin
          memory_DivPlugin_div_result <= _zz_memory_DivPlugin_div_result_1[31:0];
        end
      end
    end
    if(when_MulDivIterativePlugin_l162) begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_memory_DivPlugin_rs1 ? (~ _zz_memory_DivPlugin_rs1_1) : _zz_memory_DivPlugin_rs1_1) + _zz_memory_DivPlugin_rs1_2);
      memory_DivPlugin_rs2 <= ((_zz_memory_DivPlugin_rs2 ? (~ execute_RS2) : execute_RS2) + _zz_memory_DivPlugin_rs2_1);
      memory_DivPlugin_div_needRevert <= ((_zz_memory_DivPlugin_rs1 ^ (_zz_memory_DivPlugin_rs2 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(BranchPlugin_branchExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= BranchPlugin_branchExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= BranchPlugin_branchExceptionPort_payload_badAddr;
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(when_CsrPlugin_l1296) begin
      if(when_CsrPlugin_l1302) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_1) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l1302_2) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1390) begin
      if(when_CsrPlugin_l1398) begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
            CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
            CsrPlugin_mepc <= writeBack_PC;
            if(CsrPlugin_hadException) begin
              CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
            end
          end
          default : begin
          end
        endcase
      end
    end
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= decode_PC;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= _zz_execute_to_memory_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_decode_to_execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_7) begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      decode_to_execute_MEMORY_FORCE_CONSTISTENCY <= decode_MEMORY_FORCE_CONSTISTENCY;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_SRC1_CTRL <= _zz_decode_to_execute_SRC1_CTRL;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_12) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_13) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_15) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_16) begin
      decode_to_execute_SRC2_CTRL <= _zz_decode_to_execute_SRC2_CTRL;
    end
    if(when_Pipeline_l124_17) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_19) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_20) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_22) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_23) begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if(when_Pipeline_l124_24) begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if(when_Pipeline_l124_25) begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if(when_Pipeline_l124_26) begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if(when_Pipeline_l124_27) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_30) begin
      execute_to_memory_SHIFT_CTRL <= _zz_execute_to_memory_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_32) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_33) begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(when_Pipeline_l124_34) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_35) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_36) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_37) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_38) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_39) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_41) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_42) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_43) begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if(when_Pipeline_l124_45) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_46) begin
      decode_to_execute_PREDICTION_HAD_BRANCHED1 <= decode_PREDICTION_HAD_BRANCHED1;
    end
    if(when_Pipeline_l124_47) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_48) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_49) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_50) begin
      execute_to_memory_MEMORY_STORE_DATA_RF <= execute_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_51) begin
      memory_to_writeBack_MEMORY_STORE_DATA_RF <= memory_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_52) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_53) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_54) begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if(when_Pipeline_l124_55) begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if(when_Pipeline_l124_56) begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if(when_Pipeline_l124_57) begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if(when_Pipeline_l124_58) begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if(when_Pipeline_l124_59) begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if(when_Pipeline_l124_60) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_61) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_62) begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if(when_CsrPlugin_l1669) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1669_1) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1669_2) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1669_3) begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if(when_CsrPlugin_l1669_4) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(when_CsrPlugin_l1669_5) begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
  end

  always @(posedge io_axiClk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= ((|{writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}}) || IBusCachedPlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2_2;
    end
    _zz_when_DebugPlugin_l257 <= debug_bus_cmd_payload_address[2];
    if(when_DebugPlugin_l308) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge io_axiClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
    end else begin
      if(when_DebugPlugin_l238) begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        case(switch_DebugPlugin_l280)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l284) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l284_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l285) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l285_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l286) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l287) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l288) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l288_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l308) begin
        if(when_DebugPlugin_l311) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l324) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end


endmodule

module Axi4SharedOnChipRam_2 (
  input  wire          io_axi_arw_valid,
  output reg           io_axi_arw_ready,
  input  wire [19:0]   io_axi_arw_payload_addr,
  input  wire [3:0]    io_axi_arw_payload_id,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [1:0]    io_axi_arw_payload_burst,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [511:0]  io_axi_w_payload_data,
  input  wire [63:0]   io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [3:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [511:0]  io_axi_r_payload_data,
  output wire [3:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg        [511:0]  ram_spinal_port0;
  wire       [2:0]    _zz_Axi4Incr_sizeValue;
  wire       [2:0]    _zz_Axi4Incr_sizeValue_1;
  wire       [5:0]    _zz_Axi4Incr_alignMask;
  wire       [11:0]   _zz_Axi4Incr_baseIncr;
  wire       [3:0]    _zz_Axi4Incr_wrapCase_1;
  wire       [3:0]    _zz_Axi4Incr_wrapCase_2;
  reg        [11:0]   _zz_Axi4Incr_result;
  wire       [10:0]   _zz_Axi4Incr_result_1;
  wire       [0:0]    _zz_Axi4Incr_result_2;
  wire       [9:0]    _zz_Axi4Incr_result_3;
  wire       [1:0]    _zz_Axi4Incr_result_4;
  wire       [8:0]    _zz_Axi4Incr_result_5;
  wire       [2:0]    _zz_Axi4Incr_result_6;
  wire       [7:0]    _zz_Axi4Incr_result_7;
  wire       [3:0]    _zz_Axi4Incr_result_8;
  wire       [6:0]    _zz_Axi4Incr_result_9;
  wire       [4:0]    _zz_Axi4Incr_result_10;
  wire       [5:0]    _zz_Axi4Incr_result_11;
  wire       [5:0]    _zz_Axi4Incr_result_12;
  wire       [4:0]    _zz_Axi4Incr_result_13;
  wire       [6:0]    _zz_Axi4Incr_result_14;
  wire       [3:0]    _zz_Axi4Incr_result_15;
  wire       [7:0]    _zz_Axi4Incr_result_16;
  wire       [2:0]    _zz_Axi4Incr_result_17;
  wire       [8:0]    _zz_Axi4Incr_result_18;
  wire       [1:0]    _zz_Axi4Incr_result_19;
  wire       [9:0]    _zz_Axi4Incr_result_20;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [19:0]   unburstify_result_payload_fragment_addr;
  reg        [3:0]    unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [19:0]   unburstify_buffer_transaction_addr;
  reg        [3:0]    unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [2:0]    Axi4Incr_validSize;
  reg        [19:0]   Axi4Incr_result;
  wire       [7:0]    Axi4Incr_highCat;
  wire       [6:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_Axi4Incr_wrapCase;
  wire       [3:0]    Axi4Incr_wrapCase;
  wire                when_Axi4Channel_l323;
  wire                _zz_unburstify_result_ready;
  wire                stage0_valid;
  reg                 stage0_ready;
  wire                stage0_payload_last;
  wire       [19:0]   stage0_payload_fragment_addr;
  wire       [3:0]    stage0_payload_fragment_id;
  wire       [2:0]    stage0_payload_fragment_size;
  wire       [1:0]    stage0_payload_fragment_burst;
  wire                stage0_payload_fragment_write;
  wire       [13:0]   _zz_io_axi_r_payload_data;
  wire                stage0_fire;
  wire       [511:0]  _zz_io_axi_r_payload_data_1;
  wire                stage1_valid;
  wire                stage1_ready;
  wire                stage1_payload_last;
  wire       [19:0]   stage1_payload_fragment_addr;
  wire       [3:0]    stage1_payload_fragment_id;
  wire       [2:0]    stage1_payload_fragment_size;
  wire       [1:0]    stage1_payload_fragment_burst;
  wire                stage1_payload_fragment_write;
  reg                 stage0_rValid;
  reg                 stage0_rData_last;
  reg        [19:0]   stage0_rData_fragment_addr;
  reg        [3:0]    stage0_rData_fragment_id;
  reg        [2:0]    stage0_rData_fragment_size;
  reg        [1:0]    stage0_rData_fragment_burst;
  reg                 stage0_rData_fragment_write;
  wire                when_Stream_l399;
  reg [7:0] ram_symbol0 [0:16383];
  reg [7:0] ram_symbol1 [0:16383];
  reg [7:0] ram_symbol2 [0:16383];
  reg [7:0] ram_symbol3 [0:16383];
  reg [7:0] ram_symbol4 [0:16383];
  reg [7:0] ram_symbol5 [0:16383];
  reg [7:0] ram_symbol6 [0:16383];
  reg [7:0] ram_symbol7 [0:16383];
  reg [7:0] ram_symbol8 [0:16383];
  reg [7:0] ram_symbol9 [0:16383];
  reg [7:0] ram_symbol10 [0:16383];
  reg [7:0] ram_symbol11 [0:16383];
  reg [7:0] ram_symbol12 [0:16383];
  reg [7:0] ram_symbol13 [0:16383];
  reg [7:0] ram_symbol14 [0:16383];
  reg [7:0] ram_symbol15 [0:16383];
  reg [7:0] ram_symbol16 [0:16383];
  reg [7:0] ram_symbol17 [0:16383];
  reg [7:0] ram_symbol18 [0:16383];
  reg [7:0] ram_symbol19 [0:16383];
  reg [7:0] ram_symbol20 [0:16383];
  reg [7:0] ram_symbol21 [0:16383];
  reg [7:0] ram_symbol22 [0:16383];
  reg [7:0] ram_symbol23 [0:16383];
  reg [7:0] ram_symbol24 [0:16383];
  reg [7:0] ram_symbol25 [0:16383];
  reg [7:0] ram_symbol26 [0:16383];
  reg [7:0] ram_symbol27 [0:16383];
  reg [7:0] ram_symbol28 [0:16383];
  reg [7:0] ram_symbol29 [0:16383];
  reg [7:0] ram_symbol30 [0:16383];
  reg [7:0] ram_symbol31 [0:16383];
  reg [7:0] ram_symbol32 [0:16383];
  reg [7:0] ram_symbol33 [0:16383];
  reg [7:0] ram_symbol34 [0:16383];
  reg [7:0] ram_symbol35 [0:16383];
  reg [7:0] ram_symbol36 [0:16383];
  reg [7:0] ram_symbol37 [0:16383];
  reg [7:0] ram_symbol38 [0:16383];
  reg [7:0] ram_symbol39 [0:16383];
  reg [7:0] ram_symbol40 [0:16383];
  reg [7:0] ram_symbol41 [0:16383];
  reg [7:0] ram_symbol42 [0:16383];
  reg [7:0] ram_symbol43 [0:16383];
  reg [7:0] ram_symbol44 [0:16383];
  reg [7:0] ram_symbol45 [0:16383];
  reg [7:0] ram_symbol46 [0:16383];
  reg [7:0] ram_symbol47 [0:16383];
  reg [7:0] ram_symbol48 [0:16383];
  reg [7:0] ram_symbol49 [0:16383];
  reg [7:0] ram_symbol50 [0:16383];
  reg [7:0] ram_symbol51 [0:16383];
  reg [7:0] ram_symbol52 [0:16383];
  reg [7:0] ram_symbol53 [0:16383];
  reg [7:0] ram_symbol54 [0:16383];
  reg [7:0] ram_symbol55 [0:16383];
  reg [7:0] ram_symbol56 [0:16383];
  reg [7:0] ram_symbol57 [0:16383];
  reg [7:0] ram_symbol58 [0:16383];
  reg [7:0] ram_symbol59 [0:16383];
  reg [7:0] ram_symbol60 [0:16383];
  reg [7:0] ram_symbol61 [0:16383];
  reg [7:0] ram_symbol62 [0:16383];
  reg [7:0] ram_symbol63 [0:16383];
  reg [7:0] _zz_ramsymbol_read;
  reg [7:0] _zz_ramsymbol_read_1;
  reg [7:0] _zz_ramsymbol_read_2;
  reg [7:0] _zz_ramsymbol_read_3;
  reg [7:0] _zz_ramsymbol_read_4;
  reg [7:0] _zz_ramsymbol_read_5;
  reg [7:0] _zz_ramsymbol_read_6;
  reg [7:0] _zz_ramsymbol_read_7;
  reg [7:0] _zz_ramsymbol_read_8;
  reg [7:0] _zz_ramsymbol_read_9;
  reg [7:0] _zz_ramsymbol_read_10;
  reg [7:0] _zz_ramsymbol_read_11;
  reg [7:0] _zz_ramsymbol_read_12;
  reg [7:0] _zz_ramsymbol_read_13;
  reg [7:0] _zz_ramsymbol_read_14;
  reg [7:0] _zz_ramsymbol_read_15;
  reg [7:0] _zz_ramsymbol_read_16;
  reg [7:0] _zz_ramsymbol_read_17;
  reg [7:0] _zz_ramsymbol_read_18;
  reg [7:0] _zz_ramsymbol_read_19;
  reg [7:0] _zz_ramsymbol_read_20;
  reg [7:0] _zz_ramsymbol_read_21;
  reg [7:0] _zz_ramsymbol_read_22;
  reg [7:0] _zz_ramsymbol_read_23;
  reg [7:0] _zz_ramsymbol_read_24;
  reg [7:0] _zz_ramsymbol_read_25;
  reg [7:0] _zz_ramsymbol_read_26;
  reg [7:0] _zz_ramsymbol_read_27;
  reg [7:0] _zz_ramsymbol_read_28;
  reg [7:0] _zz_ramsymbol_read_29;
  reg [7:0] _zz_ramsymbol_read_30;
  reg [7:0] _zz_ramsymbol_read_31;
  reg [7:0] _zz_ramsymbol_read_32;
  reg [7:0] _zz_ramsymbol_read_33;
  reg [7:0] _zz_ramsymbol_read_34;
  reg [7:0] _zz_ramsymbol_read_35;
  reg [7:0] _zz_ramsymbol_read_36;
  reg [7:0] _zz_ramsymbol_read_37;
  reg [7:0] _zz_ramsymbol_read_38;
  reg [7:0] _zz_ramsymbol_read_39;
  reg [7:0] _zz_ramsymbol_read_40;
  reg [7:0] _zz_ramsymbol_read_41;
  reg [7:0] _zz_ramsymbol_read_42;
  reg [7:0] _zz_ramsymbol_read_43;
  reg [7:0] _zz_ramsymbol_read_44;
  reg [7:0] _zz_ramsymbol_read_45;
  reg [7:0] _zz_ramsymbol_read_46;
  reg [7:0] _zz_ramsymbol_read_47;
  reg [7:0] _zz_ramsymbol_read_48;
  reg [7:0] _zz_ramsymbol_read_49;
  reg [7:0] _zz_ramsymbol_read_50;
  reg [7:0] _zz_ramsymbol_read_51;
  reg [7:0] _zz_ramsymbol_read_52;
  reg [7:0] _zz_ramsymbol_read_53;
  reg [7:0] _zz_ramsymbol_read_54;
  reg [7:0] _zz_ramsymbol_read_55;
  reg [7:0] _zz_ramsymbol_read_56;
  reg [7:0] _zz_ramsymbol_read_57;
  reg [7:0] _zz_ramsymbol_read_58;
  reg [7:0] _zz_ramsymbol_read_59;
  reg [7:0] _zz_ramsymbol_read_60;
  reg [7:0] _zz_ramsymbol_read_61;
  reg [7:0] _zz_ramsymbol_read_62;
  reg [7:0] _zz_ramsymbol_read_63;

  assign _zz_Axi4Incr_alignMask = {(3'b101 < Axi4Incr_validSize),{(3'b100 < Axi4Incr_validSize),{(3'b011 < Axi4Incr_validSize),{(3'b010 < Axi4Incr_validSize),{(3'b001 < Axi4Incr_validSize),(3'b000 < Axi4Incr_validSize)}}}}};
  assign _zz_Axi4Incr_baseIncr = {5'd0, Axi4Incr_sizeValue};
  assign _zz_Axi4Incr_wrapCase_1 = {1'd0, Axi4Incr_validSize};
  assign _zz_Axi4Incr_wrapCase_2 = {2'd0, _zz_Axi4Incr_wrapCase};
  assign _zz_Axi4Incr_sizeValue = 3'b001;
  assign _zz_Axi4Incr_sizeValue_1 = 3'b000;
  assign _zz_Axi4Incr_result_1 = Axi4Incr_base[11 : 1];
  assign _zz_Axi4Incr_result_2 = Axi4Incr_baseIncr[0 : 0];
  assign _zz_Axi4Incr_result_3 = Axi4Incr_base[11 : 2];
  assign _zz_Axi4Incr_result_4 = Axi4Incr_baseIncr[1 : 0];
  assign _zz_Axi4Incr_result_5 = Axi4Incr_base[11 : 3];
  assign _zz_Axi4Incr_result_6 = Axi4Incr_baseIncr[2 : 0];
  assign _zz_Axi4Incr_result_7 = Axi4Incr_base[11 : 4];
  assign _zz_Axi4Incr_result_8 = Axi4Incr_baseIncr[3 : 0];
  assign _zz_Axi4Incr_result_9 = Axi4Incr_base[11 : 5];
  assign _zz_Axi4Incr_result_10 = Axi4Incr_baseIncr[4 : 0];
  assign _zz_Axi4Incr_result_11 = Axi4Incr_base[11 : 6];
  assign _zz_Axi4Incr_result_12 = Axi4Incr_baseIncr[5 : 0];
  assign _zz_Axi4Incr_result_13 = Axi4Incr_base[11 : 7];
  assign _zz_Axi4Incr_result_14 = Axi4Incr_baseIncr[6 : 0];
  assign _zz_Axi4Incr_result_15 = Axi4Incr_base[11 : 8];
  assign _zz_Axi4Incr_result_16 = Axi4Incr_baseIncr[7 : 0];
  assign _zz_Axi4Incr_result_17 = Axi4Incr_base[11 : 9];
  assign _zz_Axi4Incr_result_18 = Axi4Incr_baseIncr[8 : 0];
  assign _zz_Axi4Incr_result_19 = Axi4Incr_base[11 : 10];
  assign _zz_Axi4Incr_result_20 = Axi4Incr_baseIncr[9 : 0];
  always @(*) begin
    ram_spinal_port0 = {_zz_ramsymbol_read_63, _zz_ramsymbol_read_62, _zz_ramsymbol_read_61, _zz_ramsymbol_read_60, _zz_ramsymbol_read_59, _zz_ramsymbol_read_58, _zz_ramsymbol_read_57, _zz_ramsymbol_read_56, _zz_ramsymbol_read_55, _zz_ramsymbol_read_54, _zz_ramsymbol_read_53, _zz_ramsymbol_read_52, _zz_ramsymbol_read_51, _zz_ramsymbol_read_50, _zz_ramsymbol_read_49, _zz_ramsymbol_read_48, _zz_ramsymbol_read_47, _zz_ramsymbol_read_46, _zz_ramsymbol_read_45, _zz_ramsymbol_read_44, _zz_ramsymbol_read_43, _zz_ramsymbol_read_42, _zz_ramsymbol_read_41, _zz_ramsymbol_read_40, _zz_ramsymbol_read_39, _zz_ramsymbol_read_38, _zz_ramsymbol_read_37, _zz_ramsymbol_read_36, _zz_ramsymbol_read_35, _zz_ramsymbol_read_34, _zz_ramsymbol_read_33, _zz_ramsymbol_read_32, _zz_ramsymbol_read_31, _zz_ramsymbol_read_30, _zz_ramsymbol_read_29, _zz_ramsymbol_read_28, _zz_ramsymbol_read_27, _zz_ramsymbol_read_26, _zz_ramsymbol_read_25, _zz_ramsymbol_read_24, _zz_ramsymbol_read_23, _zz_ramsymbol_read_22, _zz_ramsymbol_read_21, _zz_ramsymbol_read_20, _zz_ramsymbol_read_19, _zz_ramsymbol_read_18, _zz_ramsymbol_read_17, _zz_ramsymbol_read_16, _zz_ramsymbol_read_15, _zz_ramsymbol_read_14, _zz_ramsymbol_read_13, _zz_ramsymbol_read_12, _zz_ramsymbol_read_11, _zz_ramsymbol_read_10, _zz_ramsymbol_read_9, _zz_ramsymbol_read_8, _zz_ramsymbol_read_7, _zz_ramsymbol_read_6, _zz_ramsymbol_read_5, _zz_ramsymbol_read_4, _zz_ramsymbol_read_3, _zz_ramsymbol_read_2, _zz_ramsymbol_read_1, _zz_ramsymbol_read};
  end
  always @(posedge io_axiClk) begin
    if(stage0_fire) begin
      _zz_ramsymbol_read <= ram_symbol0[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_1 <= ram_symbol1[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_2 <= ram_symbol2[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_3 <= ram_symbol3[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_4 <= ram_symbol4[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_5 <= ram_symbol5[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_6 <= ram_symbol6[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_7 <= ram_symbol7[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_8 <= ram_symbol8[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_9 <= ram_symbol9[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_10 <= ram_symbol10[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_11 <= ram_symbol11[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_12 <= ram_symbol12[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_13 <= ram_symbol13[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_14 <= ram_symbol14[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_15 <= ram_symbol15[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_16 <= ram_symbol16[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_17 <= ram_symbol17[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_18 <= ram_symbol18[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_19 <= ram_symbol19[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_20 <= ram_symbol20[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_21 <= ram_symbol21[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_22 <= ram_symbol22[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_23 <= ram_symbol23[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_24 <= ram_symbol24[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_25 <= ram_symbol25[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_26 <= ram_symbol26[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_27 <= ram_symbol27[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_28 <= ram_symbol28[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_29 <= ram_symbol29[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_30 <= ram_symbol30[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_31 <= ram_symbol31[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_32 <= ram_symbol32[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_33 <= ram_symbol33[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_34 <= ram_symbol34[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_35 <= ram_symbol35[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_36 <= ram_symbol36[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_37 <= ram_symbol37[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_38 <= ram_symbol38[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_39 <= ram_symbol39[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_40 <= ram_symbol40[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_41 <= ram_symbol41[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_42 <= ram_symbol42[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_43 <= ram_symbol43[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_44 <= ram_symbol44[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_45 <= ram_symbol45[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_46 <= ram_symbol46[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_47 <= ram_symbol47[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_48 <= ram_symbol48[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_49 <= ram_symbol49[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_50 <= ram_symbol50[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_51 <= ram_symbol51[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_52 <= ram_symbol52[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_53 <= ram_symbol53[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_54 <= ram_symbol54[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_55 <= ram_symbol55[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_56 <= ram_symbol56[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_57 <= ram_symbol57[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_58 <= ram_symbol58[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_59 <= ram_symbol59[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_60 <= ram_symbol60[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_61 <= ram_symbol61[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_62 <= ram_symbol62[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_63 <= ram_symbol63[_zz_io_axi_r_payload_data];
    end
  end

  always @(posedge io_axiClk) begin
    if(io_axi_w_payload_strb[0] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol0[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[7 : 0];
    end
    if(io_axi_w_payload_strb[1] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol1[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[15 : 8];
    end
    if(io_axi_w_payload_strb[2] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol2[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[23 : 16];
    end
    if(io_axi_w_payload_strb[3] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol3[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[31 : 24];
    end
    if(io_axi_w_payload_strb[4] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol4[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[39 : 32];
    end
    if(io_axi_w_payload_strb[5] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol5[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[47 : 40];
    end
    if(io_axi_w_payload_strb[6] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol6[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[55 : 48];
    end
    if(io_axi_w_payload_strb[7] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol7[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[63 : 56];
    end
    if(io_axi_w_payload_strb[8] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol8[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[71 : 64];
    end
    if(io_axi_w_payload_strb[9] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol9[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[79 : 72];
    end
    if(io_axi_w_payload_strb[10] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol10[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[87 : 80];
    end
    if(io_axi_w_payload_strb[11] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol11[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[95 : 88];
    end
    if(io_axi_w_payload_strb[12] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol12[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[103 : 96];
    end
    if(io_axi_w_payload_strb[13] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol13[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[111 : 104];
    end
    if(io_axi_w_payload_strb[14] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol14[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[119 : 112];
    end
    if(io_axi_w_payload_strb[15] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol15[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[127 : 120];
    end
    if(io_axi_w_payload_strb[16] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol16[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[135 : 128];
    end
    if(io_axi_w_payload_strb[17] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol17[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[143 : 136];
    end
    if(io_axi_w_payload_strb[18] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol18[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[151 : 144];
    end
    if(io_axi_w_payload_strb[19] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol19[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[159 : 152];
    end
    if(io_axi_w_payload_strb[20] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol20[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[167 : 160];
    end
    if(io_axi_w_payload_strb[21] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol21[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[175 : 168];
    end
    if(io_axi_w_payload_strb[22] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol22[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[183 : 176];
    end
    if(io_axi_w_payload_strb[23] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol23[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[191 : 184];
    end
    if(io_axi_w_payload_strb[24] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol24[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[199 : 192];
    end
    if(io_axi_w_payload_strb[25] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol25[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[207 : 200];
    end
    if(io_axi_w_payload_strb[26] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol26[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[215 : 208];
    end
    if(io_axi_w_payload_strb[27] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol27[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[223 : 216];
    end
    if(io_axi_w_payload_strb[28] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol28[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[231 : 224];
    end
    if(io_axi_w_payload_strb[29] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol29[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[239 : 232];
    end
    if(io_axi_w_payload_strb[30] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol30[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[247 : 240];
    end
    if(io_axi_w_payload_strb[31] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol31[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[255 : 248];
    end
    if(io_axi_w_payload_strb[32] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol32[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[263 : 256];
    end
    if(io_axi_w_payload_strb[33] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol33[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[271 : 264];
    end
    if(io_axi_w_payload_strb[34] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol34[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[279 : 272];
    end
    if(io_axi_w_payload_strb[35] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol35[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[287 : 280];
    end
    if(io_axi_w_payload_strb[36] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol36[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[295 : 288];
    end
    if(io_axi_w_payload_strb[37] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol37[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[303 : 296];
    end
    if(io_axi_w_payload_strb[38] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol38[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[311 : 304];
    end
    if(io_axi_w_payload_strb[39] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol39[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[319 : 312];
    end
    if(io_axi_w_payload_strb[40] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol40[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[327 : 320];
    end
    if(io_axi_w_payload_strb[41] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol41[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[335 : 328];
    end
    if(io_axi_w_payload_strb[42] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol42[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[343 : 336];
    end
    if(io_axi_w_payload_strb[43] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol43[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[351 : 344];
    end
    if(io_axi_w_payload_strb[44] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol44[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[359 : 352];
    end
    if(io_axi_w_payload_strb[45] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol45[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[367 : 360];
    end
    if(io_axi_w_payload_strb[46] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol46[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[375 : 368];
    end
    if(io_axi_w_payload_strb[47] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol47[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[383 : 376];
    end
    if(io_axi_w_payload_strb[48] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol48[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[391 : 384];
    end
    if(io_axi_w_payload_strb[49] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol49[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[399 : 392];
    end
    if(io_axi_w_payload_strb[50] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol50[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[407 : 400];
    end
    if(io_axi_w_payload_strb[51] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol51[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[415 : 408];
    end
    if(io_axi_w_payload_strb[52] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol52[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[423 : 416];
    end
    if(io_axi_w_payload_strb[53] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol53[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[431 : 424];
    end
    if(io_axi_w_payload_strb[54] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol54[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[439 : 432];
    end
    if(io_axi_w_payload_strb[55] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol55[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[447 : 440];
    end
    if(io_axi_w_payload_strb[56] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol56[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[455 : 448];
    end
    if(io_axi_w_payload_strb[57] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol57[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[463 : 456];
    end
    if(io_axi_w_payload_strb[58] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol58[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[471 : 464];
    end
    if(io_axi_w_payload_strb[59] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol59[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[479 : 472];
    end
    if(io_axi_w_payload_strb[60] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol60[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[487 : 480];
    end
    if(io_axi_w_payload_strb[61] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol61[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[495 : 488];
    end
    if(io_axi_w_payload_strb[62] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol62[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[503 : 496];
    end
    if(io_axi_w_payload_strb[63] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol63[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[511 : 504];
    end
  end

  always @(*) begin
    case(Axi4Incr_wrapCase)
      4'b0000 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_1,_zz_Axi4Incr_result_2};
      4'b0001 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_3,_zz_Axi4Incr_result_4};
      4'b0010 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_5,_zz_Axi4Incr_result_6};
      4'b0011 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_7,_zz_Axi4Incr_result_8};
      4'b0100 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_9,_zz_Axi4Incr_result_10};
      4'b0101 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_11,_zz_Axi4Incr_result_12};
      4'b0110 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_13,_zz_Axi4Incr_result_14};
      4'b0111 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_15,_zz_Axi4Incr_result_16};
      4'b1000 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_17,_zz_Axi4Incr_result_18};
      default : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_19,_zz_Axi4Incr_result_20};
    endcase
  end

  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[2 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[19 : 12];
  assign Axi4Incr_sizeValue = {(3'b110 == Axi4Incr_validSize),{(3'b101 == Axi4Incr_validSize),{(3'b100 == Axi4Incr_validSize),{(3'b011 == Axi4Incr_validSize),{(3'b010 == Axi4Incr_validSize),{(_zz_Axi4Incr_sizeValue == Axi4Incr_validSize),(_zz_Axi4Incr_sizeValue_1 == Axi4Incr_validSize)}}}}}};
  assign Axi4Incr_alignMask = {6'd0, _zz_Axi4Incr_alignMask};
  assign Axi4Incr_base = (unburstify_buffer_transaction_addr[11 : 0] & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_Axi4Incr_baseIncr);
  always @(*) begin
    casez(unburstify_buffer_len)
      8'b????1??? : begin
        _zz_Axi4Incr_wrapCase = 2'b11;
      end
      8'b????01?? : begin
        _zz_Axi4Incr_wrapCase = 2'b10;
      end
      8'b????001? : begin
        _zz_Axi4Incr_wrapCase = 2'b01;
      end
      default : begin
        _zz_Axi4Incr_wrapCase = 2'b00;
      end
    endcase
  end

  assign Axi4Incr_wrapCase = (_zz_Axi4Incr_wrapCase_1 + _zz_Axi4Incr_wrapCase_2);
  always @(*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_Axi4Incr_result};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    if(!unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      unburstify_result_payload_last = 1'b1;
      if(when_Axi4Channel_l323) begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign when_Axi4Channel_l323 = (io_axi_arw_payload_len != 8'h0);
  assign _zz_unburstify_result_ready = (! (unburstify_result_payload_fragment_write && (! io_axi_w_valid)));
  assign stage0_valid = (unburstify_result_valid && _zz_unburstify_result_ready);
  assign unburstify_result_ready = (stage0_ready && _zz_unburstify_result_ready);
  assign stage0_payload_last = unburstify_result_payload_last;
  assign stage0_payload_fragment_addr = unburstify_result_payload_fragment_addr;
  assign stage0_payload_fragment_id = unburstify_result_payload_fragment_id;
  assign stage0_payload_fragment_size = unburstify_result_payload_fragment_size;
  assign stage0_payload_fragment_burst = unburstify_result_payload_fragment_burst;
  assign stage0_payload_fragment_write = unburstify_result_payload_fragment_write;
  assign _zz_io_axi_r_payload_data = stage0_payload_fragment_addr[19 : 6];
  assign stage0_fire = (stage0_valid && stage0_ready);
  assign _zz_io_axi_r_payload_data_1 = io_axi_w_payload_data;
  assign io_axi_r_payload_data = ram_spinal_port0;
  assign io_axi_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && stage0_ready);
  always @(*) begin
    stage0_ready = stage1_ready;
    if(when_Stream_l399) begin
      stage0_ready = 1'b1;
    end
  end

  assign when_Stream_l399 = (! stage1_valid);
  assign stage1_valid = stage0_rValid;
  assign stage1_payload_last = stage0_rData_last;
  assign stage1_payload_fragment_addr = stage0_rData_fragment_addr;
  assign stage1_payload_fragment_id = stage0_rData_fragment_id;
  assign stage1_payload_fragment_size = stage0_rData_fragment_size;
  assign stage1_payload_fragment_burst = stage0_rData_fragment_burst;
  assign stage1_payload_fragment_write = stage0_rData_fragment_write;
  assign stage1_ready = ((io_axi_r_ready && (! stage1_payload_fragment_write)) || ((io_axi_b_ready || (! stage1_payload_last)) && stage1_payload_fragment_write));
  assign io_axi_r_valid = (stage1_valid && (! stage1_payload_fragment_write));
  assign io_axi_r_payload_id = stage1_payload_fragment_id;
  assign io_axi_r_payload_last = stage1_payload_last;
  assign io_axi_r_payload_resp = 2'b00;
  assign io_axi_b_valid = ((stage1_valid && stage1_payload_fragment_write) && stage1_payload_last);
  assign io_axi_b_payload_resp = 2'b00;
  assign io_axi_b_payload_id = stage1_payload_fragment_id;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      unburstify_buffer_valid <= 1'b0;
      stage0_rValid <= 1'b0;
    end else begin
      if(unburstify_result_ready) begin
        if(unburstify_buffer_last) begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(!unburstify_buffer_valid) begin
        if(when_Axi4Channel_l323) begin
          if(unburstify_result_ready) begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(stage0_ready) begin
        stage0_rValid <= stage0_valid;
      end
    end
  end

  always @(posedge io_axiClk) begin
    if(unburstify_result_ready) begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(!unburstify_buffer_valid) begin
      if(when_Axi4Channel_l323) begin
        if(unburstify_result_ready) begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(stage0_ready) begin
      stage0_rData_last <= stage0_payload_last;
      stage0_rData_fragment_addr <= stage0_payload_fragment_addr;
      stage0_rData_fragment_id <= stage0_payload_fragment_id;
      stage0_rData_fragment_size <= stage0_payload_fragment_size;
      stage0_rData_fragment_burst <= stage0_payload_fragment_burst;
      stage0_rData_fragment_write <= stage0_payload_fragment_write;
    end
  end


endmodule

module Axi4SharedOnChipRam_1 (
  input  wire          io_axi_arw_valid,
  output reg           io_axi_arw_ready,
  input  wire [14:0]   io_axi_arw_payload_addr,
  input  wire [3:0]    io_axi_arw_payload_id,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [1:0]    io_axi_arw_payload_burst,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [511:0]  io_axi_w_payload_data,
  input  wire [63:0]   io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [3:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [511:0]  io_axi_r_payload_data,
  output wire [3:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg        [511:0]  ram_spinal_port0;
  wire       [2:0]    _zz_Axi4Incr_sizeValue;
  wire       [2:0]    _zz_Axi4Incr_sizeValue_1;
  wire       [5:0]    _zz_Axi4Incr_alignMask;
  wire       [11:0]   _zz_Axi4Incr_baseIncr;
  wire       [3:0]    _zz_Axi4Incr_wrapCase_1;
  wire       [3:0]    _zz_Axi4Incr_wrapCase_2;
  reg        [11:0]   _zz_Axi4Incr_result;
  wire       [10:0]   _zz_Axi4Incr_result_1;
  wire       [0:0]    _zz_Axi4Incr_result_2;
  wire       [9:0]    _zz_Axi4Incr_result_3;
  wire       [1:0]    _zz_Axi4Incr_result_4;
  wire       [8:0]    _zz_Axi4Incr_result_5;
  wire       [2:0]    _zz_Axi4Incr_result_6;
  wire       [7:0]    _zz_Axi4Incr_result_7;
  wire       [3:0]    _zz_Axi4Incr_result_8;
  wire       [6:0]    _zz_Axi4Incr_result_9;
  wire       [4:0]    _zz_Axi4Incr_result_10;
  wire       [5:0]    _zz_Axi4Incr_result_11;
  wire       [5:0]    _zz_Axi4Incr_result_12;
  wire       [4:0]    _zz_Axi4Incr_result_13;
  wire       [6:0]    _zz_Axi4Incr_result_14;
  wire       [3:0]    _zz_Axi4Incr_result_15;
  wire       [7:0]    _zz_Axi4Incr_result_16;
  wire       [2:0]    _zz_Axi4Incr_result_17;
  wire       [8:0]    _zz_Axi4Incr_result_18;
  wire       [1:0]    _zz_Axi4Incr_result_19;
  wire       [9:0]    _zz_Axi4Incr_result_20;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [14:0]   unburstify_result_payload_fragment_addr;
  reg        [3:0]    unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [14:0]   unburstify_buffer_transaction_addr;
  reg        [3:0]    unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [2:0]    Axi4Incr_validSize;
  reg        [14:0]   Axi4Incr_result;
  wire       [2:0]    Axi4Incr_highCat;
  wire       [6:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_Axi4Incr_wrapCase;
  wire       [3:0]    Axi4Incr_wrapCase;
  wire                when_Axi4Channel_l323;
  wire                _zz_unburstify_result_ready;
  wire                stage0_valid;
  reg                 stage0_ready;
  wire                stage0_payload_last;
  wire       [14:0]   stage0_payload_fragment_addr;
  wire       [3:0]    stage0_payload_fragment_id;
  wire       [2:0]    stage0_payload_fragment_size;
  wire       [1:0]    stage0_payload_fragment_burst;
  wire                stage0_payload_fragment_write;
  wire       [8:0]    _zz_io_axi_r_payload_data;
  wire                stage0_fire;
  wire       [511:0]  _zz_io_axi_r_payload_data_1;
  wire                stage1_valid;
  wire                stage1_ready;
  wire                stage1_payload_last;
  wire       [14:0]   stage1_payload_fragment_addr;
  wire       [3:0]    stage1_payload_fragment_id;
  wire       [2:0]    stage1_payload_fragment_size;
  wire       [1:0]    stage1_payload_fragment_burst;
  wire                stage1_payload_fragment_write;
  reg                 stage0_rValid;
  reg                 stage0_rData_last;
  reg        [14:0]   stage0_rData_fragment_addr;
  reg        [3:0]    stage0_rData_fragment_id;
  reg        [2:0]    stage0_rData_fragment_size;
  reg        [1:0]    stage0_rData_fragment_burst;
  reg                 stage0_rData_fragment_write;
  wire                when_Stream_l399;
  reg [7:0] ram_symbol0 [0:511];
  reg [7:0] ram_symbol1 [0:511];
  reg [7:0] ram_symbol2 [0:511];
  reg [7:0] ram_symbol3 [0:511];
  reg [7:0] ram_symbol4 [0:511];
  reg [7:0] ram_symbol5 [0:511];
  reg [7:0] ram_symbol6 [0:511];
  reg [7:0] ram_symbol7 [0:511];
  reg [7:0] ram_symbol8 [0:511];
  reg [7:0] ram_symbol9 [0:511];
  reg [7:0] ram_symbol10 [0:511];
  reg [7:0] ram_symbol11 [0:511];
  reg [7:0] ram_symbol12 [0:511];
  reg [7:0] ram_symbol13 [0:511];
  reg [7:0] ram_symbol14 [0:511];
  reg [7:0] ram_symbol15 [0:511];
  reg [7:0] ram_symbol16 [0:511];
  reg [7:0] ram_symbol17 [0:511];
  reg [7:0] ram_symbol18 [0:511];
  reg [7:0] ram_symbol19 [0:511];
  reg [7:0] ram_symbol20 [0:511];
  reg [7:0] ram_symbol21 [0:511];
  reg [7:0] ram_symbol22 [0:511];
  reg [7:0] ram_symbol23 [0:511];
  reg [7:0] ram_symbol24 [0:511];
  reg [7:0] ram_symbol25 [0:511];
  reg [7:0] ram_symbol26 [0:511];
  reg [7:0] ram_symbol27 [0:511];
  reg [7:0] ram_symbol28 [0:511];
  reg [7:0] ram_symbol29 [0:511];
  reg [7:0] ram_symbol30 [0:511];
  reg [7:0] ram_symbol31 [0:511];
  reg [7:0] ram_symbol32 [0:511];
  reg [7:0] ram_symbol33 [0:511];
  reg [7:0] ram_symbol34 [0:511];
  reg [7:0] ram_symbol35 [0:511];
  reg [7:0] ram_symbol36 [0:511];
  reg [7:0] ram_symbol37 [0:511];
  reg [7:0] ram_symbol38 [0:511];
  reg [7:0] ram_symbol39 [0:511];
  reg [7:0] ram_symbol40 [0:511];
  reg [7:0] ram_symbol41 [0:511];
  reg [7:0] ram_symbol42 [0:511];
  reg [7:0] ram_symbol43 [0:511];
  reg [7:0] ram_symbol44 [0:511];
  reg [7:0] ram_symbol45 [0:511];
  reg [7:0] ram_symbol46 [0:511];
  reg [7:0] ram_symbol47 [0:511];
  reg [7:0] ram_symbol48 [0:511];
  reg [7:0] ram_symbol49 [0:511];
  reg [7:0] ram_symbol50 [0:511];
  reg [7:0] ram_symbol51 [0:511];
  reg [7:0] ram_symbol52 [0:511];
  reg [7:0] ram_symbol53 [0:511];
  reg [7:0] ram_symbol54 [0:511];
  reg [7:0] ram_symbol55 [0:511];
  reg [7:0] ram_symbol56 [0:511];
  reg [7:0] ram_symbol57 [0:511];
  reg [7:0] ram_symbol58 [0:511];
  reg [7:0] ram_symbol59 [0:511];
  reg [7:0] ram_symbol60 [0:511];
  reg [7:0] ram_symbol61 [0:511];
  reg [7:0] ram_symbol62 [0:511];
  reg [7:0] ram_symbol63 [0:511];
  reg [7:0] _zz_ramsymbol_read;
  reg [7:0] _zz_ramsymbol_read_1;
  reg [7:0] _zz_ramsymbol_read_2;
  reg [7:0] _zz_ramsymbol_read_3;
  reg [7:0] _zz_ramsymbol_read_4;
  reg [7:0] _zz_ramsymbol_read_5;
  reg [7:0] _zz_ramsymbol_read_6;
  reg [7:0] _zz_ramsymbol_read_7;
  reg [7:0] _zz_ramsymbol_read_8;
  reg [7:0] _zz_ramsymbol_read_9;
  reg [7:0] _zz_ramsymbol_read_10;
  reg [7:0] _zz_ramsymbol_read_11;
  reg [7:0] _zz_ramsymbol_read_12;
  reg [7:0] _zz_ramsymbol_read_13;
  reg [7:0] _zz_ramsymbol_read_14;
  reg [7:0] _zz_ramsymbol_read_15;
  reg [7:0] _zz_ramsymbol_read_16;
  reg [7:0] _zz_ramsymbol_read_17;
  reg [7:0] _zz_ramsymbol_read_18;
  reg [7:0] _zz_ramsymbol_read_19;
  reg [7:0] _zz_ramsymbol_read_20;
  reg [7:0] _zz_ramsymbol_read_21;
  reg [7:0] _zz_ramsymbol_read_22;
  reg [7:0] _zz_ramsymbol_read_23;
  reg [7:0] _zz_ramsymbol_read_24;
  reg [7:0] _zz_ramsymbol_read_25;
  reg [7:0] _zz_ramsymbol_read_26;
  reg [7:0] _zz_ramsymbol_read_27;
  reg [7:0] _zz_ramsymbol_read_28;
  reg [7:0] _zz_ramsymbol_read_29;
  reg [7:0] _zz_ramsymbol_read_30;
  reg [7:0] _zz_ramsymbol_read_31;
  reg [7:0] _zz_ramsymbol_read_32;
  reg [7:0] _zz_ramsymbol_read_33;
  reg [7:0] _zz_ramsymbol_read_34;
  reg [7:0] _zz_ramsymbol_read_35;
  reg [7:0] _zz_ramsymbol_read_36;
  reg [7:0] _zz_ramsymbol_read_37;
  reg [7:0] _zz_ramsymbol_read_38;
  reg [7:0] _zz_ramsymbol_read_39;
  reg [7:0] _zz_ramsymbol_read_40;
  reg [7:0] _zz_ramsymbol_read_41;
  reg [7:0] _zz_ramsymbol_read_42;
  reg [7:0] _zz_ramsymbol_read_43;
  reg [7:0] _zz_ramsymbol_read_44;
  reg [7:0] _zz_ramsymbol_read_45;
  reg [7:0] _zz_ramsymbol_read_46;
  reg [7:0] _zz_ramsymbol_read_47;
  reg [7:0] _zz_ramsymbol_read_48;
  reg [7:0] _zz_ramsymbol_read_49;
  reg [7:0] _zz_ramsymbol_read_50;
  reg [7:0] _zz_ramsymbol_read_51;
  reg [7:0] _zz_ramsymbol_read_52;
  reg [7:0] _zz_ramsymbol_read_53;
  reg [7:0] _zz_ramsymbol_read_54;
  reg [7:0] _zz_ramsymbol_read_55;
  reg [7:0] _zz_ramsymbol_read_56;
  reg [7:0] _zz_ramsymbol_read_57;
  reg [7:0] _zz_ramsymbol_read_58;
  reg [7:0] _zz_ramsymbol_read_59;
  reg [7:0] _zz_ramsymbol_read_60;
  reg [7:0] _zz_ramsymbol_read_61;
  reg [7:0] _zz_ramsymbol_read_62;
  reg [7:0] _zz_ramsymbol_read_63;

  assign _zz_Axi4Incr_alignMask = {(3'b101 < Axi4Incr_validSize),{(3'b100 < Axi4Incr_validSize),{(3'b011 < Axi4Incr_validSize),{(3'b010 < Axi4Incr_validSize),{(3'b001 < Axi4Incr_validSize),(3'b000 < Axi4Incr_validSize)}}}}};
  assign _zz_Axi4Incr_baseIncr = {5'd0, Axi4Incr_sizeValue};
  assign _zz_Axi4Incr_wrapCase_1 = {1'd0, Axi4Incr_validSize};
  assign _zz_Axi4Incr_wrapCase_2 = {2'd0, _zz_Axi4Incr_wrapCase};
  assign _zz_Axi4Incr_sizeValue = 3'b001;
  assign _zz_Axi4Incr_sizeValue_1 = 3'b000;
  assign _zz_Axi4Incr_result_1 = Axi4Incr_base[11 : 1];
  assign _zz_Axi4Incr_result_2 = Axi4Incr_baseIncr[0 : 0];
  assign _zz_Axi4Incr_result_3 = Axi4Incr_base[11 : 2];
  assign _zz_Axi4Incr_result_4 = Axi4Incr_baseIncr[1 : 0];
  assign _zz_Axi4Incr_result_5 = Axi4Incr_base[11 : 3];
  assign _zz_Axi4Incr_result_6 = Axi4Incr_baseIncr[2 : 0];
  assign _zz_Axi4Incr_result_7 = Axi4Incr_base[11 : 4];
  assign _zz_Axi4Incr_result_8 = Axi4Incr_baseIncr[3 : 0];
  assign _zz_Axi4Incr_result_9 = Axi4Incr_base[11 : 5];
  assign _zz_Axi4Incr_result_10 = Axi4Incr_baseIncr[4 : 0];
  assign _zz_Axi4Incr_result_11 = Axi4Incr_base[11 : 6];
  assign _zz_Axi4Incr_result_12 = Axi4Incr_baseIncr[5 : 0];
  assign _zz_Axi4Incr_result_13 = Axi4Incr_base[11 : 7];
  assign _zz_Axi4Incr_result_14 = Axi4Incr_baseIncr[6 : 0];
  assign _zz_Axi4Incr_result_15 = Axi4Incr_base[11 : 8];
  assign _zz_Axi4Incr_result_16 = Axi4Incr_baseIncr[7 : 0];
  assign _zz_Axi4Incr_result_17 = Axi4Incr_base[11 : 9];
  assign _zz_Axi4Incr_result_18 = Axi4Incr_baseIncr[8 : 0];
  assign _zz_Axi4Incr_result_19 = Axi4Incr_base[11 : 10];
  assign _zz_Axi4Incr_result_20 = Axi4Incr_baseIncr[9 : 0];
  initial begin
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol0.bin",ram_symbol0);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol1.bin",ram_symbol1);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol2.bin",ram_symbol2);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol3.bin",ram_symbol3);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol4.bin",ram_symbol4);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol5.bin",ram_symbol5);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol6.bin",ram_symbol6);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol7.bin",ram_symbol7);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol8.bin",ram_symbol8);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol9.bin",ram_symbol9);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol10.bin",ram_symbol10);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol11.bin",ram_symbol11);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol12.bin",ram_symbol12);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol13.bin",ram_symbol13);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol14.bin",ram_symbol14);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol15.bin",ram_symbol15);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol16.bin",ram_symbol16);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol17.bin",ram_symbol17);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol18.bin",ram_symbol18);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol19.bin",ram_symbol19);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol20.bin",ram_symbol20);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol21.bin",ram_symbol21);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol22.bin",ram_symbol22);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol23.bin",ram_symbol23);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol24.bin",ram_symbol24);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol25.bin",ram_symbol25);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol26.bin",ram_symbol26);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol27.bin",ram_symbol27);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol28.bin",ram_symbol28);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol29.bin",ram_symbol29);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol30.bin",ram_symbol30);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol31.bin",ram_symbol31);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol32.bin",ram_symbol32);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol33.bin",ram_symbol33);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol34.bin",ram_symbol34);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol35.bin",ram_symbol35);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol36.bin",ram_symbol36);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol37.bin",ram_symbol37);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol38.bin",ram_symbol38);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol39.bin",ram_symbol39);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol40.bin",ram_symbol40);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol41.bin",ram_symbol41);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol42.bin",ram_symbol42);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol43.bin",ram_symbol43);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol44.bin",ram_symbol44);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol45.bin",ram_symbol45);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol46.bin",ram_symbol46);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol47.bin",ram_symbol47);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol48.bin",ram_symbol48);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol49.bin",ram_symbol49);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol50.bin",ram_symbol50);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol51.bin",ram_symbol51);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol52.bin",ram_symbol52);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol53.bin",ram_symbol53);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol54.bin",ram_symbol54);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol55.bin",ram_symbol55);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol56.bin",ram_symbol56);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol57.bin",ram_symbol57);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol58.bin",ram_symbol58);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol59.bin",ram_symbol59);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol60.bin",ram_symbol60);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol61.bin",ram_symbol61);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol62.bin",ram_symbol62);
    $readmemb("Briey.v_toplevel_axi_ram_ram_symbol63.bin",ram_symbol63);
  end
  always @(*) begin
    ram_spinal_port0 = {_zz_ramsymbol_read_63, _zz_ramsymbol_read_62, _zz_ramsymbol_read_61, _zz_ramsymbol_read_60, _zz_ramsymbol_read_59, _zz_ramsymbol_read_58, _zz_ramsymbol_read_57, _zz_ramsymbol_read_56, _zz_ramsymbol_read_55, _zz_ramsymbol_read_54, _zz_ramsymbol_read_53, _zz_ramsymbol_read_52, _zz_ramsymbol_read_51, _zz_ramsymbol_read_50, _zz_ramsymbol_read_49, _zz_ramsymbol_read_48, _zz_ramsymbol_read_47, _zz_ramsymbol_read_46, _zz_ramsymbol_read_45, _zz_ramsymbol_read_44, _zz_ramsymbol_read_43, _zz_ramsymbol_read_42, _zz_ramsymbol_read_41, _zz_ramsymbol_read_40, _zz_ramsymbol_read_39, _zz_ramsymbol_read_38, _zz_ramsymbol_read_37, _zz_ramsymbol_read_36, _zz_ramsymbol_read_35, _zz_ramsymbol_read_34, _zz_ramsymbol_read_33, _zz_ramsymbol_read_32, _zz_ramsymbol_read_31, _zz_ramsymbol_read_30, _zz_ramsymbol_read_29, _zz_ramsymbol_read_28, _zz_ramsymbol_read_27, _zz_ramsymbol_read_26, _zz_ramsymbol_read_25, _zz_ramsymbol_read_24, _zz_ramsymbol_read_23, _zz_ramsymbol_read_22, _zz_ramsymbol_read_21, _zz_ramsymbol_read_20, _zz_ramsymbol_read_19, _zz_ramsymbol_read_18, _zz_ramsymbol_read_17, _zz_ramsymbol_read_16, _zz_ramsymbol_read_15, _zz_ramsymbol_read_14, _zz_ramsymbol_read_13, _zz_ramsymbol_read_12, _zz_ramsymbol_read_11, _zz_ramsymbol_read_10, _zz_ramsymbol_read_9, _zz_ramsymbol_read_8, _zz_ramsymbol_read_7, _zz_ramsymbol_read_6, _zz_ramsymbol_read_5, _zz_ramsymbol_read_4, _zz_ramsymbol_read_3, _zz_ramsymbol_read_2, _zz_ramsymbol_read_1, _zz_ramsymbol_read};
  end
  always @(posedge io_axiClk) begin
    if(stage0_fire) begin
      _zz_ramsymbol_read <= ram_symbol0[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_1 <= ram_symbol1[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_2 <= ram_symbol2[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_3 <= ram_symbol3[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_4 <= ram_symbol4[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_5 <= ram_symbol5[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_6 <= ram_symbol6[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_7 <= ram_symbol7[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_8 <= ram_symbol8[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_9 <= ram_symbol9[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_10 <= ram_symbol10[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_11 <= ram_symbol11[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_12 <= ram_symbol12[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_13 <= ram_symbol13[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_14 <= ram_symbol14[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_15 <= ram_symbol15[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_16 <= ram_symbol16[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_17 <= ram_symbol17[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_18 <= ram_symbol18[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_19 <= ram_symbol19[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_20 <= ram_symbol20[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_21 <= ram_symbol21[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_22 <= ram_symbol22[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_23 <= ram_symbol23[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_24 <= ram_symbol24[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_25 <= ram_symbol25[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_26 <= ram_symbol26[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_27 <= ram_symbol27[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_28 <= ram_symbol28[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_29 <= ram_symbol29[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_30 <= ram_symbol30[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_31 <= ram_symbol31[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_32 <= ram_symbol32[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_33 <= ram_symbol33[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_34 <= ram_symbol34[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_35 <= ram_symbol35[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_36 <= ram_symbol36[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_37 <= ram_symbol37[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_38 <= ram_symbol38[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_39 <= ram_symbol39[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_40 <= ram_symbol40[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_41 <= ram_symbol41[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_42 <= ram_symbol42[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_43 <= ram_symbol43[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_44 <= ram_symbol44[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_45 <= ram_symbol45[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_46 <= ram_symbol46[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_47 <= ram_symbol47[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_48 <= ram_symbol48[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_49 <= ram_symbol49[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_50 <= ram_symbol50[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_51 <= ram_symbol51[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_52 <= ram_symbol52[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_53 <= ram_symbol53[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_54 <= ram_symbol54[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_55 <= ram_symbol55[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_56 <= ram_symbol56[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_57 <= ram_symbol57[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_58 <= ram_symbol58[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_59 <= ram_symbol59[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_60 <= ram_symbol60[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_61 <= ram_symbol61[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_62 <= ram_symbol62[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_63 <= ram_symbol63[_zz_io_axi_r_payload_data];
    end
  end

  always @(posedge io_axiClk) begin
    if(io_axi_w_payload_strb[0] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol0[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[7 : 0];
    end
    if(io_axi_w_payload_strb[1] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol1[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[15 : 8];
    end
    if(io_axi_w_payload_strb[2] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol2[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[23 : 16];
    end
    if(io_axi_w_payload_strb[3] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol3[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[31 : 24];
    end
    if(io_axi_w_payload_strb[4] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol4[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[39 : 32];
    end
    if(io_axi_w_payload_strb[5] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol5[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[47 : 40];
    end
    if(io_axi_w_payload_strb[6] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol6[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[55 : 48];
    end
    if(io_axi_w_payload_strb[7] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol7[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[63 : 56];
    end
    if(io_axi_w_payload_strb[8] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol8[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[71 : 64];
    end
    if(io_axi_w_payload_strb[9] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol9[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[79 : 72];
    end
    if(io_axi_w_payload_strb[10] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol10[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[87 : 80];
    end
    if(io_axi_w_payload_strb[11] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol11[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[95 : 88];
    end
    if(io_axi_w_payload_strb[12] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol12[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[103 : 96];
    end
    if(io_axi_w_payload_strb[13] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol13[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[111 : 104];
    end
    if(io_axi_w_payload_strb[14] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol14[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[119 : 112];
    end
    if(io_axi_w_payload_strb[15] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol15[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[127 : 120];
    end
    if(io_axi_w_payload_strb[16] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol16[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[135 : 128];
    end
    if(io_axi_w_payload_strb[17] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol17[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[143 : 136];
    end
    if(io_axi_w_payload_strb[18] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol18[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[151 : 144];
    end
    if(io_axi_w_payload_strb[19] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol19[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[159 : 152];
    end
    if(io_axi_w_payload_strb[20] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol20[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[167 : 160];
    end
    if(io_axi_w_payload_strb[21] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol21[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[175 : 168];
    end
    if(io_axi_w_payload_strb[22] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol22[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[183 : 176];
    end
    if(io_axi_w_payload_strb[23] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol23[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[191 : 184];
    end
    if(io_axi_w_payload_strb[24] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol24[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[199 : 192];
    end
    if(io_axi_w_payload_strb[25] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol25[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[207 : 200];
    end
    if(io_axi_w_payload_strb[26] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol26[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[215 : 208];
    end
    if(io_axi_w_payload_strb[27] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol27[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[223 : 216];
    end
    if(io_axi_w_payload_strb[28] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol28[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[231 : 224];
    end
    if(io_axi_w_payload_strb[29] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol29[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[239 : 232];
    end
    if(io_axi_w_payload_strb[30] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol30[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[247 : 240];
    end
    if(io_axi_w_payload_strb[31] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol31[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[255 : 248];
    end
    if(io_axi_w_payload_strb[32] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol32[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[263 : 256];
    end
    if(io_axi_w_payload_strb[33] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol33[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[271 : 264];
    end
    if(io_axi_w_payload_strb[34] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol34[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[279 : 272];
    end
    if(io_axi_w_payload_strb[35] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol35[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[287 : 280];
    end
    if(io_axi_w_payload_strb[36] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol36[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[295 : 288];
    end
    if(io_axi_w_payload_strb[37] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol37[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[303 : 296];
    end
    if(io_axi_w_payload_strb[38] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol38[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[311 : 304];
    end
    if(io_axi_w_payload_strb[39] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol39[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[319 : 312];
    end
    if(io_axi_w_payload_strb[40] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol40[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[327 : 320];
    end
    if(io_axi_w_payload_strb[41] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol41[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[335 : 328];
    end
    if(io_axi_w_payload_strb[42] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol42[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[343 : 336];
    end
    if(io_axi_w_payload_strb[43] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol43[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[351 : 344];
    end
    if(io_axi_w_payload_strb[44] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol44[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[359 : 352];
    end
    if(io_axi_w_payload_strb[45] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol45[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[367 : 360];
    end
    if(io_axi_w_payload_strb[46] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol46[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[375 : 368];
    end
    if(io_axi_w_payload_strb[47] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol47[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[383 : 376];
    end
    if(io_axi_w_payload_strb[48] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol48[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[391 : 384];
    end
    if(io_axi_w_payload_strb[49] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol49[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[399 : 392];
    end
    if(io_axi_w_payload_strb[50] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol50[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[407 : 400];
    end
    if(io_axi_w_payload_strb[51] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol51[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[415 : 408];
    end
    if(io_axi_w_payload_strb[52] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol52[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[423 : 416];
    end
    if(io_axi_w_payload_strb[53] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol53[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[431 : 424];
    end
    if(io_axi_w_payload_strb[54] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol54[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[439 : 432];
    end
    if(io_axi_w_payload_strb[55] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol55[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[447 : 440];
    end
    if(io_axi_w_payload_strb[56] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol56[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[455 : 448];
    end
    if(io_axi_w_payload_strb[57] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol57[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[463 : 456];
    end
    if(io_axi_w_payload_strb[58] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol58[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[471 : 464];
    end
    if(io_axi_w_payload_strb[59] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol59[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[479 : 472];
    end
    if(io_axi_w_payload_strb[60] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol60[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[487 : 480];
    end
    if(io_axi_w_payload_strb[61] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol61[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[495 : 488];
    end
    if(io_axi_w_payload_strb[62] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol62[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[503 : 496];
    end
    if(io_axi_w_payload_strb[63] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol63[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[511 : 504];
    end
  end

  always @(*) begin
    case(Axi4Incr_wrapCase)
      4'b0000 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_1,_zz_Axi4Incr_result_2};
      4'b0001 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_3,_zz_Axi4Incr_result_4};
      4'b0010 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_5,_zz_Axi4Incr_result_6};
      4'b0011 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_7,_zz_Axi4Incr_result_8};
      4'b0100 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_9,_zz_Axi4Incr_result_10};
      4'b0101 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_11,_zz_Axi4Incr_result_12};
      4'b0110 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_13,_zz_Axi4Incr_result_14};
      4'b0111 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_15,_zz_Axi4Incr_result_16};
      4'b1000 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_17,_zz_Axi4Incr_result_18};
      default : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_19,_zz_Axi4Incr_result_20};
    endcase
  end

  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[2 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[14 : 12];
  assign Axi4Incr_sizeValue = {(3'b110 == Axi4Incr_validSize),{(3'b101 == Axi4Incr_validSize),{(3'b100 == Axi4Incr_validSize),{(3'b011 == Axi4Incr_validSize),{(3'b010 == Axi4Incr_validSize),{(_zz_Axi4Incr_sizeValue == Axi4Incr_validSize),(_zz_Axi4Incr_sizeValue_1 == Axi4Incr_validSize)}}}}}};
  assign Axi4Incr_alignMask = {6'd0, _zz_Axi4Incr_alignMask};
  assign Axi4Incr_base = (unburstify_buffer_transaction_addr[11 : 0] & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_Axi4Incr_baseIncr);
  always @(*) begin
    casez(unburstify_buffer_len)
      8'b????1??? : begin
        _zz_Axi4Incr_wrapCase = 2'b11;
      end
      8'b????01?? : begin
        _zz_Axi4Incr_wrapCase = 2'b10;
      end
      8'b????001? : begin
        _zz_Axi4Incr_wrapCase = 2'b01;
      end
      default : begin
        _zz_Axi4Incr_wrapCase = 2'b00;
      end
    endcase
  end

  assign Axi4Incr_wrapCase = (_zz_Axi4Incr_wrapCase_1 + _zz_Axi4Incr_wrapCase_2);
  always @(*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_Axi4Incr_result};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    if(!unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      unburstify_result_payload_last = 1'b1;
      if(when_Axi4Channel_l323) begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign when_Axi4Channel_l323 = (io_axi_arw_payload_len != 8'h0);
  assign _zz_unburstify_result_ready = (! (unburstify_result_payload_fragment_write && (! io_axi_w_valid)));
  assign stage0_valid = (unburstify_result_valid && _zz_unburstify_result_ready);
  assign unburstify_result_ready = (stage0_ready && _zz_unburstify_result_ready);
  assign stage0_payload_last = unburstify_result_payload_last;
  assign stage0_payload_fragment_addr = unburstify_result_payload_fragment_addr;
  assign stage0_payload_fragment_id = unburstify_result_payload_fragment_id;
  assign stage0_payload_fragment_size = unburstify_result_payload_fragment_size;
  assign stage0_payload_fragment_burst = unburstify_result_payload_fragment_burst;
  assign stage0_payload_fragment_write = unburstify_result_payload_fragment_write;
  assign _zz_io_axi_r_payload_data = stage0_payload_fragment_addr[14 : 6];
  assign stage0_fire = (stage0_valid && stage0_ready);
  assign _zz_io_axi_r_payload_data_1 = io_axi_w_payload_data;
  assign io_axi_r_payload_data = ram_spinal_port0;
  assign io_axi_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && stage0_ready);
  always @(*) begin
    stage0_ready = stage1_ready;
    if(when_Stream_l399) begin
      stage0_ready = 1'b1;
    end
  end

  assign when_Stream_l399 = (! stage1_valid);
  assign stage1_valid = stage0_rValid;
  assign stage1_payload_last = stage0_rData_last;
  assign stage1_payload_fragment_addr = stage0_rData_fragment_addr;
  assign stage1_payload_fragment_id = stage0_rData_fragment_id;
  assign stage1_payload_fragment_size = stage0_rData_fragment_size;
  assign stage1_payload_fragment_burst = stage0_rData_fragment_burst;
  assign stage1_payload_fragment_write = stage0_rData_fragment_write;
  assign stage1_ready = ((io_axi_r_ready && (! stage1_payload_fragment_write)) || ((io_axi_b_ready || (! stage1_payload_last)) && stage1_payload_fragment_write));
  assign io_axi_r_valid = (stage1_valid && (! stage1_payload_fragment_write));
  assign io_axi_r_payload_id = stage1_payload_fragment_id;
  assign io_axi_r_payload_last = stage1_payload_last;
  assign io_axi_r_payload_resp = 2'b00;
  assign io_axi_b_valid = ((stage1_valid && stage1_payload_fragment_write) && stage1_payload_last);
  assign io_axi_b_payload_resp = 2'b00;
  assign io_axi_b_payload_id = stage1_payload_fragment_id;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      unburstify_buffer_valid <= 1'b0;
      stage0_rValid <= 1'b0;
    end else begin
      if(unburstify_result_ready) begin
        if(unburstify_buffer_last) begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(!unburstify_buffer_valid) begin
        if(when_Axi4Channel_l323) begin
          if(unburstify_result_ready) begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(stage0_ready) begin
        stage0_rValid <= stage0_valid;
      end
    end
  end

  always @(posedge io_axiClk) begin
    if(unburstify_result_ready) begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(!unburstify_buffer_valid) begin
      if(when_Axi4Channel_l323) begin
        if(unburstify_result_ready) begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(stage0_ready) begin
      stage0_rData_last <= stage0_payload_last;
      stage0_rData_fragment_addr <= stage0_payload_fragment_addr;
      stage0_rData_fragment_id <= stage0_payload_fragment_id;
      stage0_rData_fragment_size <= stage0_payload_fragment_size;
      stage0_rData_fragment_burst <= stage0_payload_fragment_burst;
      stage0_rData_fragment_write <= stage0_payload_fragment_write;
    end
  end


endmodule

module Axi4SharedOnChipRam (
  input  wire          io_axi_arw_valid,
  output reg           io_axi_arw_ready,
  input  wire [14:0]   io_axi_arw_payload_addr,
  input  wire [11:0]   io_axi_arw_payload_id,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [1:0]    io_axi_arw_payload_burst,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [511:0]  io_axi_w_payload_data,
  input  wire [63:0]   io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [11:0]   io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [511:0]  io_axi_r_payload_data,
  output wire [11:0]   io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg        [511:0]  ram_spinal_port0;
  wire       [2:0]    _zz_Axi4Incr_sizeValue;
  wire       [2:0]    _zz_Axi4Incr_sizeValue_1;
  wire       [5:0]    _zz_Axi4Incr_alignMask;
  wire       [11:0]   _zz_Axi4Incr_baseIncr;
  wire       [3:0]    _zz_Axi4Incr_wrapCase_1;
  wire       [3:0]    _zz_Axi4Incr_wrapCase_2;
  reg        [11:0]   _zz_Axi4Incr_result;
  wire       [10:0]   _zz_Axi4Incr_result_1;
  wire       [0:0]    _zz_Axi4Incr_result_2;
  wire       [9:0]    _zz_Axi4Incr_result_3;
  wire       [1:0]    _zz_Axi4Incr_result_4;
  wire       [8:0]    _zz_Axi4Incr_result_5;
  wire       [2:0]    _zz_Axi4Incr_result_6;
  wire       [7:0]    _zz_Axi4Incr_result_7;
  wire       [3:0]    _zz_Axi4Incr_result_8;
  wire       [6:0]    _zz_Axi4Incr_result_9;
  wire       [4:0]    _zz_Axi4Incr_result_10;
  wire       [5:0]    _zz_Axi4Incr_result_11;
  wire       [5:0]    _zz_Axi4Incr_result_12;
  wire       [4:0]    _zz_Axi4Incr_result_13;
  wire       [6:0]    _zz_Axi4Incr_result_14;
  wire       [3:0]    _zz_Axi4Incr_result_15;
  wire       [7:0]    _zz_Axi4Incr_result_16;
  wire       [2:0]    _zz_Axi4Incr_result_17;
  wire       [8:0]    _zz_Axi4Incr_result_18;
  wire       [1:0]    _zz_Axi4Incr_result_19;
  wire       [9:0]    _zz_Axi4Incr_result_20;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [14:0]   unburstify_result_payload_fragment_addr;
  reg        [11:0]   unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [14:0]   unburstify_buffer_transaction_addr;
  reg        [11:0]   unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [2:0]    Axi4Incr_validSize;
  reg        [14:0]   Axi4Incr_result;
  wire       [2:0]    Axi4Incr_highCat;
  wire       [6:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_Axi4Incr_wrapCase;
  wire       [3:0]    Axi4Incr_wrapCase;
  wire                when_Axi4Channel_l323;
  wire                _zz_unburstify_result_ready;
  wire                stage0_valid;
  reg                 stage0_ready;
  wire                stage0_payload_last;
  wire       [14:0]   stage0_payload_fragment_addr;
  wire       [11:0]   stage0_payload_fragment_id;
  wire       [2:0]    stage0_payload_fragment_size;
  wire       [1:0]    stage0_payload_fragment_burst;
  wire                stage0_payload_fragment_write;
  wire       [8:0]    _zz_io_axi_r_payload_data;
  wire                stage0_fire;
  wire       [511:0]  _zz_io_axi_r_payload_data_1;
  wire                stage1_valid;
  wire                stage1_ready;
  wire                stage1_payload_last;
  wire       [14:0]   stage1_payload_fragment_addr;
  wire       [11:0]   stage1_payload_fragment_id;
  wire       [2:0]    stage1_payload_fragment_size;
  wire       [1:0]    stage1_payload_fragment_burst;
  wire                stage1_payload_fragment_write;
  reg                 stage0_rValid;
  reg                 stage0_rData_last;
  reg        [14:0]   stage0_rData_fragment_addr;
  reg        [11:0]   stage0_rData_fragment_id;
  reg        [2:0]    stage0_rData_fragment_size;
  reg        [1:0]    stage0_rData_fragment_burst;
  reg                 stage0_rData_fragment_write;
  wire                when_Stream_l399;
  reg [7:0] ram_symbol0 [0:511];
  reg [7:0] ram_symbol1 [0:511];
  reg [7:0] ram_symbol2 [0:511];
  reg [7:0] ram_symbol3 [0:511];
  reg [7:0] ram_symbol4 [0:511];
  reg [7:0] ram_symbol5 [0:511];
  reg [7:0] ram_symbol6 [0:511];
  reg [7:0] ram_symbol7 [0:511];
  reg [7:0] ram_symbol8 [0:511];
  reg [7:0] ram_symbol9 [0:511];
  reg [7:0] ram_symbol10 [0:511];
  reg [7:0] ram_symbol11 [0:511];
  reg [7:0] ram_symbol12 [0:511];
  reg [7:0] ram_symbol13 [0:511];
  reg [7:0] ram_symbol14 [0:511];
  reg [7:0] ram_symbol15 [0:511];
  reg [7:0] ram_symbol16 [0:511];
  reg [7:0] ram_symbol17 [0:511];
  reg [7:0] ram_symbol18 [0:511];
  reg [7:0] ram_symbol19 [0:511];
  reg [7:0] ram_symbol20 [0:511];
  reg [7:0] ram_symbol21 [0:511];
  reg [7:0] ram_symbol22 [0:511];
  reg [7:0] ram_symbol23 [0:511];
  reg [7:0] ram_symbol24 [0:511];
  reg [7:0] ram_symbol25 [0:511];
  reg [7:0] ram_symbol26 [0:511];
  reg [7:0] ram_symbol27 [0:511];
  reg [7:0] ram_symbol28 [0:511];
  reg [7:0] ram_symbol29 [0:511];
  reg [7:0] ram_symbol30 [0:511];
  reg [7:0] ram_symbol31 [0:511];
  reg [7:0] ram_symbol32 [0:511];
  reg [7:0] ram_symbol33 [0:511];
  reg [7:0] ram_symbol34 [0:511];
  reg [7:0] ram_symbol35 [0:511];
  reg [7:0] ram_symbol36 [0:511];
  reg [7:0] ram_symbol37 [0:511];
  reg [7:0] ram_symbol38 [0:511];
  reg [7:0] ram_symbol39 [0:511];
  reg [7:0] ram_symbol40 [0:511];
  reg [7:0] ram_symbol41 [0:511];
  reg [7:0] ram_symbol42 [0:511];
  reg [7:0] ram_symbol43 [0:511];
  reg [7:0] ram_symbol44 [0:511];
  reg [7:0] ram_symbol45 [0:511];
  reg [7:0] ram_symbol46 [0:511];
  reg [7:0] ram_symbol47 [0:511];
  reg [7:0] ram_symbol48 [0:511];
  reg [7:0] ram_symbol49 [0:511];
  reg [7:0] ram_symbol50 [0:511];
  reg [7:0] ram_symbol51 [0:511];
  reg [7:0] ram_symbol52 [0:511];
  reg [7:0] ram_symbol53 [0:511];
  reg [7:0] ram_symbol54 [0:511];
  reg [7:0] ram_symbol55 [0:511];
  reg [7:0] ram_symbol56 [0:511];
  reg [7:0] ram_symbol57 [0:511];
  reg [7:0] ram_symbol58 [0:511];
  reg [7:0] ram_symbol59 [0:511];
  reg [7:0] ram_symbol60 [0:511];
  reg [7:0] ram_symbol61 [0:511];
  reg [7:0] ram_symbol62 [0:511];
  reg [7:0] ram_symbol63 [0:511];
  reg [7:0] _zz_ramsymbol_read;
  reg [7:0] _zz_ramsymbol_read_1;
  reg [7:0] _zz_ramsymbol_read_2;
  reg [7:0] _zz_ramsymbol_read_3;
  reg [7:0] _zz_ramsymbol_read_4;
  reg [7:0] _zz_ramsymbol_read_5;
  reg [7:0] _zz_ramsymbol_read_6;
  reg [7:0] _zz_ramsymbol_read_7;
  reg [7:0] _zz_ramsymbol_read_8;
  reg [7:0] _zz_ramsymbol_read_9;
  reg [7:0] _zz_ramsymbol_read_10;
  reg [7:0] _zz_ramsymbol_read_11;
  reg [7:0] _zz_ramsymbol_read_12;
  reg [7:0] _zz_ramsymbol_read_13;
  reg [7:0] _zz_ramsymbol_read_14;
  reg [7:0] _zz_ramsymbol_read_15;
  reg [7:0] _zz_ramsymbol_read_16;
  reg [7:0] _zz_ramsymbol_read_17;
  reg [7:0] _zz_ramsymbol_read_18;
  reg [7:0] _zz_ramsymbol_read_19;
  reg [7:0] _zz_ramsymbol_read_20;
  reg [7:0] _zz_ramsymbol_read_21;
  reg [7:0] _zz_ramsymbol_read_22;
  reg [7:0] _zz_ramsymbol_read_23;
  reg [7:0] _zz_ramsymbol_read_24;
  reg [7:0] _zz_ramsymbol_read_25;
  reg [7:0] _zz_ramsymbol_read_26;
  reg [7:0] _zz_ramsymbol_read_27;
  reg [7:0] _zz_ramsymbol_read_28;
  reg [7:0] _zz_ramsymbol_read_29;
  reg [7:0] _zz_ramsymbol_read_30;
  reg [7:0] _zz_ramsymbol_read_31;
  reg [7:0] _zz_ramsymbol_read_32;
  reg [7:0] _zz_ramsymbol_read_33;
  reg [7:0] _zz_ramsymbol_read_34;
  reg [7:0] _zz_ramsymbol_read_35;
  reg [7:0] _zz_ramsymbol_read_36;
  reg [7:0] _zz_ramsymbol_read_37;
  reg [7:0] _zz_ramsymbol_read_38;
  reg [7:0] _zz_ramsymbol_read_39;
  reg [7:0] _zz_ramsymbol_read_40;
  reg [7:0] _zz_ramsymbol_read_41;
  reg [7:0] _zz_ramsymbol_read_42;
  reg [7:0] _zz_ramsymbol_read_43;
  reg [7:0] _zz_ramsymbol_read_44;
  reg [7:0] _zz_ramsymbol_read_45;
  reg [7:0] _zz_ramsymbol_read_46;
  reg [7:0] _zz_ramsymbol_read_47;
  reg [7:0] _zz_ramsymbol_read_48;
  reg [7:0] _zz_ramsymbol_read_49;
  reg [7:0] _zz_ramsymbol_read_50;
  reg [7:0] _zz_ramsymbol_read_51;
  reg [7:0] _zz_ramsymbol_read_52;
  reg [7:0] _zz_ramsymbol_read_53;
  reg [7:0] _zz_ramsymbol_read_54;
  reg [7:0] _zz_ramsymbol_read_55;
  reg [7:0] _zz_ramsymbol_read_56;
  reg [7:0] _zz_ramsymbol_read_57;
  reg [7:0] _zz_ramsymbol_read_58;
  reg [7:0] _zz_ramsymbol_read_59;
  reg [7:0] _zz_ramsymbol_read_60;
  reg [7:0] _zz_ramsymbol_read_61;
  reg [7:0] _zz_ramsymbol_read_62;
  reg [7:0] _zz_ramsymbol_read_63;

  assign _zz_Axi4Incr_alignMask = {(3'b101 < Axi4Incr_validSize),{(3'b100 < Axi4Incr_validSize),{(3'b011 < Axi4Incr_validSize),{(3'b010 < Axi4Incr_validSize),{(3'b001 < Axi4Incr_validSize),(3'b000 < Axi4Incr_validSize)}}}}};
  assign _zz_Axi4Incr_baseIncr = {5'd0, Axi4Incr_sizeValue};
  assign _zz_Axi4Incr_wrapCase_1 = {1'd0, Axi4Incr_validSize};
  assign _zz_Axi4Incr_wrapCase_2 = {2'd0, _zz_Axi4Incr_wrapCase};
  assign _zz_Axi4Incr_sizeValue = 3'b001;
  assign _zz_Axi4Incr_sizeValue_1 = 3'b000;
  assign _zz_Axi4Incr_result_1 = Axi4Incr_base[11 : 1];
  assign _zz_Axi4Incr_result_2 = Axi4Incr_baseIncr[0 : 0];
  assign _zz_Axi4Incr_result_3 = Axi4Incr_base[11 : 2];
  assign _zz_Axi4Incr_result_4 = Axi4Incr_baseIncr[1 : 0];
  assign _zz_Axi4Incr_result_5 = Axi4Incr_base[11 : 3];
  assign _zz_Axi4Incr_result_6 = Axi4Incr_baseIncr[2 : 0];
  assign _zz_Axi4Incr_result_7 = Axi4Incr_base[11 : 4];
  assign _zz_Axi4Incr_result_8 = Axi4Incr_baseIncr[3 : 0];
  assign _zz_Axi4Incr_result_9 = Axi4Incr_base[11 : 5];
  assign _zz_Axi4Incr_result_10 = Axi4Incr_baseIncr[4 : 0];
  assign _zz_Axi4Incr_result_11 = Axi4Incr_base[11 : 6];
  assign _zz_Axi4Incr_result_12 = Axi4Incr_baseIncr[5 : 0];
  assign _zz_Axi4Incr_result_13 = Axi4Incr_base[11 : 7];
  assign _zz_Axi4Incr_result_14 = Axi4Incr_baseIncr[6 : 0];
  assign _zz_Axi4Incr_result_15 = Axi4Incr_base[11 : 8];
  assign _zz_Axi4Incr_result_16 = Axi4Incr_baseIncr[7 : 0];
  assign _zz_Axi4Incr_result_17 = Axi4Incr_base[11 : 9];
  assign _zz_Axi4Incr_result_18 = Axi4Incr_baseIncr[8 : 0];
  assign _zz_Axi4Incr_result_19 = Axi4Incr_base[11 : 10];
  assign _zz_Axi4Incr_result_20 = Axi4Incr_baseIncr[9 : 0];
  always @(*) begin
    ram_spinal_port0 = {_zz_ramsymbol_read_63, _zz_ramsymbol_read_62, _zz_ramsymbol_read_61, _zz_ramsymbol_read_60, _zz_ramsymbol_read_59, _zz_ramsymbol_read_58, _zz_ramsymbol_read_57, _zz_ramsymbol_read_56, _zz_ramsymbol_read_55, _zz_ramsymbol_read_54, _zz_ramsymbol_read_53, _zz_ramsymbol_read_52, _zz_ramsymbol_read_51, _zz_ramsymbol_read_50, _zz_ramsymbol_read_49, _zz_ramsymbol_read_48, _zz_ramsymbol_read_47, _zz_ramsymbol_read_46, _zz_ramsymbol_read_45, _zz_ramsymbol_read_44, _zz_ramsymbol_read_43, _zz_ramsymbol_read_42, _zz_ramsymbol_read_41, _zz_ramsymbol_read_40, _zz_ramsymbol_read_39, _zz_ramsymbol_read_38, _zz_ramsymbol_read_37, _zz_ramsymbol_read_36, _zz_ramsymbol_read_35, _zz_ramsymbol_read_34, _zz_ramsymbol_read_33, _zz_ramsymbol_read_32, _zz_ramsymbol_read_31, _zz_ramsymbol_read_30, _zz_ramsymbol_read_29, _zz_ramsymbol_read_28, _zz_ramsymbol_read_27, _zz_ramsymbol_read_26, _zz_ramsymbol_read_25, _zz_ramsymbol_read_24, _zz_ramsymbol_read_23, _zz_ramsymbol_read_22, _zz_ramsymbol_read_21, _zz_ramsymbol_read_20, _zz_ramsymbol_read_19, _zz_ramsymbol_read_18, _zz_ramsymbol_read_17, _zz_ramsymbol_read_16, _zz_ramsymbol_read_15, _zz_ramsymbol_read_14, _zz_ramsymbol_read_13, _zz_ramsymbol_read_12, _zz_ramsymbol_read_11, _zz_ramsymbol_read_10, _zz_ramsymbol_read_9, _zz_ramsymbol_read_8, _zz_ramsymbol_read_7, _zz_ramsymbol_read_6, _zz_ramsymbol_read_5, _zz_ramsymbol_read_4, _zz_ramsymbol_read_3, _zz_ramsymbol_read_2, _zz_ramsymbol_read_1, _zz_ramsymbol_read};
  end
  always @(posedge io_axiClk) begin
    if(stage0_fire) begin
      _zz_ramsymbol_read <= ram_symbol0[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_1 <= ram_symbol1[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_2 <= ram_symbol2[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_3 <= ram_symbol3[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_4 <= ram_symbol4[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_5 <= ram_symbol5[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_6 <= ram_symbol6[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_7 <= ram_symbol7[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_8 <= ram_symbol8[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_9 <= ram_symbol9[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_10 <= ram_symbol10[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_11 <= ram_symbol11[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_12 <= ram_symbol12[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_13 <= ram_symbol13[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_14 <= ram_symbol14[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_15 <= ram_symbol15[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_16 <= ram_symbol16[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_17 <= ram_symbol17[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_18 <= ram_symbol18[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_19 <= ram_symbol19[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_20 <= ram_symbol20[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_21 <= ram_symbol21[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_22 <= ram_symbol22[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_23 <= ram_symbol23[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_24 <= ram_symbol24[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_25 <= ram_symbol25[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_26 <= ram_symbol26[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_27 <= ram_symbol27[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_28 <= ram_symbol28[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_29 <= ram_symbol29[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_30 <= ram_symbol30[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_31 <= ram_symbol31[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_32 <= ram_symbol32[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_33 <= ram_symbol33[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_34 <= ram_symbol34[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_35 <= ram_symbol35[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_36 <= ram_symbol36[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_37 <= ram_symbol37[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_38 <= ram_symbol38[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_39 <= ram_symbol39[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_40 <= ram_symbol40[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_41 <= ram_symbol41[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_42 <= ram_symbol42[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_43 <= ram_symbol43[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_44 <= ram_symbol44[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_45 <= ram_symbol45[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_46 <= ram_symbol46[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_47 <= ram_symbol47[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_48 <= ram_symbol48[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_49 <= ram_symbol49[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_50 <= ram_symbol50[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_51 <= ram_symbol51[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_52 <= ram_symbol52[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_53 <= ram_symbol53[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_54 <= ram_symbol54[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_55 <= ram_symbol55[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_56 <= ram_symbol56[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_57 <= ram_symbol57[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_58 <= ram_symbol58[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_59 <= ram_symbol59[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_60 <= ram_symbol60[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_61 <= ram_symbol61[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_62 <= ram_symbol62[_zz_io_axi_r_payload_data];
      _zz_ramsymbol_read_63 <= ram_symbol63[_zz_io_axi_r_payload_data];
    end
  end

  always @(posedge io_axiClk) begin
    if(io_axi_w_payload_strb[0] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol0[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[7 : 0];
    end
    if(io_axi_w_payload_strb[1] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol1[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[15 : 8];
    end
    if(io_axi_w_payload_strb[2] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol2[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[23 : 16];
    end
    if(io_axi_w_payload_strb[3] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol3[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[31 : 24];
    end
    if(io_axi_w_payload_strb[4] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol4[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[39 : 32];
    end
    if(io_axi_w_payload_strb[5] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol5[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[47 : 40];
    end
    if(io_axi_w_payload_strb[6] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol6[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[55 : 48];
    end
    if(io_axi_w_payload_strb[7] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol7[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[63 : 56];
    end
    if(io_axi_w_payload_strb[8] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol8[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[71 : 64];
    end
    if(io_axi_w_payload_strb[9] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol9[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[79 : 72];
    end
    if(io_axi_w_payload_strb[10] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol10[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[87 : 80];
    end
    if(io_axi_w_payload_strb[11] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol11[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[95 : 88];
    end
    if(io_axi_w_payload_strb[12] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol12[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[103 : 96];
    end
    if(io_axi_w_payload_strb[13] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol13[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[111 : 104];
    end
    if(io_axi_w_payload_strb[14] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol14[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[119 : 112];
    end
    if(io_axi_w_payload_strb[15] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol15[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[127 : 120];
    end
    if(io_axi_w_payload_strb[16] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol16[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[135 : 128];
    end
    if(io_axi_w_payload_strb[17] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol17[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[143 : 136];
    end
    if(io_axi_w_payload_strb[18] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol18[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[151 : 144];
    end
    if(io_axi_w_payload_strb[19] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol19[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[159 : 152];
    end
    if(io_axi_w_payload_strb[20] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol20[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[167 : 160];
    end
    if(io_axi_w_payload_strb[21] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol21[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[175 : 168];
    end
    if(io_axi_w_payload_strb[22] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol22[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[183 : 176];
    end
    if(io_axi_w_payload_strb[23] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol23[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[191 : 184];
    end
    if(io_axi_w_payload_strb[24] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol24[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[199 : 192];
    end
    if(io_axi_w_payload_strb[25] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol25[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[207 : 200];
    end
    if(io_axi_w_payload_strb[26] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol26[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[215 : 208];
    end
    if(io_axi_w_payload_strb[27] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol27[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[223 : 216];
    end
    if(io_axi_w_payload_strb[28] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol28[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[231 : 224];
    end
    if(io_axi_w_payload_strb[29] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol29[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[239 : 232];
    end
    if(io_axi_w_payload_strb[30] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol30[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[247 : 240];
    end
    if(io_axi_w_payload_strb[31] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol31[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[255 : 248];
    end
    if(io_axi_w_payload_strb[32] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol32[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[263 : 256];
    end
    if(io_axi_w_payload_strb[33] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol33[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[271 : 264];
    end
    if(io_axi_w_payload_strb[34] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol34[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[279 : 272];
    end
    if(io_axi_w_payload_strb[35] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol35[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[287 : 280];
    end
    if(io_axi_w_payload_strb[36] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol36[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[295 : 288];
    end
    if(io_axi_w_payload_strb[37] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol37[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[303 : 296];
    end
    if(io_axi_w_payload_strb[38] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol38[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[311 : 304];
    end
    if(io_axi_w_payload_strb[39] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol39[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[319 : 312];
    end
    if(io_axi_w_payload_strb[40] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol40[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[327 : 320];
    end
    if(io_axi_w_payload_strb[41] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol41[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[335 : 328];
    end
    if(io_axi_w_payload_strb[42] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol42[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[343 : 336];
    end
    if(io_axi_w_payload_strb[43] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol43[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[351 : 344];
    end
    if(io_axi_w_payload_strb[44] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol44[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[359 : 352];
    end
    if(io_axi_w_payload_strb[45] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol45[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[367 : 360];
    end
    if(io_axi_w_payload_strb[46] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol46[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[375 : 368];
    end
    if(io_axi_w_payload_strb[47] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol47[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[383 : 376];
    end
    if(io_axi_w_payload_strb[48] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol48[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[391 : 384];
    end
    if(io_axi_w_payload_strb[49] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol49[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[399 : 392];
    end
    if(io_axi_w_payload_strb[50] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol50[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[407 : 400];
    end
    if(io_axi_w_payload_strb[51] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol51[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[415 : 408];
    end
    if(io_axi_w_payload_strb[52] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol52[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[423 : 416];
    end
    if(io_axi_w_payload_strb[53] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol53[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[431 : 424];
    end
    if(io_axi_w_payload_strb[54] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol54[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[439 : 432];
    end
    if(io_axi_w_payload_strb[55] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol55[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[447 : 440];
    end
    if(io_axi_w_payload_strb[56] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol56[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[455 : 448];
    end
    if(io_axi_w_payload_strb[57] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol57[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[463 : 456];
    end
    if(io_axi_w_payload_strb[58] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol58[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[471 : 464];
    end
    if(io_axi_w_payload_strb[59] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol59[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[479 : 472];
    end
    if(io_axi_w_payload_strb[60] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol60[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[487 : 480];
    end
    if(io_axi_w_payload_strb[61] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol61[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[495 : 488];
    end
    if(io_axi_w_payload_strb[62] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol62[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[503 : 496];
    end
    if(io_axi_w_payload_strb[63] && stage0_fire && stage0_payload_fragment_write ) begin
      ram_symbol63[_zz_io_axi_r_payload_data] <= _zz_io_axi_r_payload_data_1[511 : 504];
    end
  end

  always @(*) begin
    case(Axi4Incr_wrapCase)
      4'b0000 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_1,_zz_Axi4Incr_result_2};
      4'b0001 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_3,_zz_Axi4Incr_result_4};
      4'b0010 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_5,_zz_Axi4Incr_result_6};
      4'b0011 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_7,_zz_Axi4Incr_result_8};
      4'b0100 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_9,_zz_Axi4Incr_result_10};
      4'b0101 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_11,_zz_Axi4Incr_result_12};
      4'b0110 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_13,_zz_Axi4Incr_result_14};
      4'b0111 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_15,_zz_Axi4Incr_result_16};
      4'b1000 : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_17,_zz_Axi4Incr_result_18};
      default : _zz_Axi4Incr_result = {_zz_Axi4Incr_result_19,_zz_Axi4Incr_result_20};
    endcase
  end

  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[2 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[14 : 12];
  assign Axi4Incr_sizeValue = {(3'b110 == Axi4Incr_validSize),{(3'b101 == Axi4Incr_validSize),{(3'b100 == Axi4Incr_validSize),{(3'b011 == Axi4Incr_validSize),{(3'b010 == Axi4Incr_validSize),{(_zz_Axi4Incr_sizeValue == Axi4Incr_validSize),(_zz_Axi4Incr_sizeValue_1 == Axi4Incr_validSize)}}}}}};
  assign Axi4Incr_alignMask = {6'd0, _zz_Axi4Incr_alignMask};
  assign Axi4Incr_base = (unburstify_buffer_transaction_addr[11 : 0] & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_Axi4Incr_baseIncr);
  always @(*) begin
    casez(unburstify_buffer_len)
      8'b????1??? : begin
        _zz_Axi4Incr_wrapCase = 2'b11;
      end
      8'b????01?? : begin
        _zz_Axi4Incr_wrapCase = 2'b10;
      end
      8'b????001? : begin
        _zz_Axi4Incr_wrapCase = 2'b01;
      end
      default : begin
        _zz_Axi4Incr_wrapCase = 2'b00;
      end
    endcase
  end

  assign Axi4Incr_wrapCase = (_zz_Axi4Incr_wrapCase_1 + _zz_Axi4Incr_wrapCase_2);
  always @(*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_Axi4Incr_result};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    if(!unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      unburstify_result_payload_last = 1'b1;
      if(when_Axi4Channel_l323) begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign when_Axi4Channel_l323 = (io_axi_arw_payload_len != 8'h0);
  assign _zz_unburstify_result_ready = (! (unburstify_result_payload_fragment_write && (! io_axi_w_valid)));
  assign stage0_valid = (unburstify_result_valid && _zz_unburstify_result_ready);
  assign unburstify_result_ready = (stage0_ready && _zz_unburstify_result_ready);
  assign stage0_payload_last = unburstify_result_payload_last;
  assign stage0_payload_fragment_addr = unburstify_result_payload_fragment_addr;
  assign stage0_payload_fragment_id = unburstify_result_payload_fragment_id;
  assign stage0_payload_fragment_size = unburstify_result_payload_fragment_size;
  assign stage0_payload_fragment_burst = unburstify_result_payload_fragment_burst;
  assign stage0_payload_fragment_write = unburstify_result_payload_fragment_write;
  assign _zz_io_axi_r_payload_data = stage0_payload_fragment_addr[14 : 6];
  assign stage0_fire = (stage0_valid && stage0_ready);
  assign _zz_io_axi_r_payload_data_1 = io_axi_w_payload_data;
  assign io_axi_r_payload_data = ram_spinal_port0;
  assign io_axi_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && stage0_ready);
  always @(*) begin
    stage0_ready = stage1_ready;
    if(when_Stream_l399) begin
      stage0_ready = 1'b1;
    end
  end

  assign when_Stream_l399 = (! stage1_valid);
  assign stage1_valid = stage0_rValid;
  assign stage1_payload_last = stage0_rData_last;
  assign stage1_payload_fragment_addr = stage0_rData_fragment_addr;
  assign stage1_payload_fragment_id = stage0_rData_fragment_id;
  assign stage1_payload_fragment_size = stage0_rData_fragment_size;
  assign stage1_payload_fragment_burst = stage0_rData_fragment_burst;
  assign stage1_payload_fragment_write = stage0_rData_fragment_write;
  assign stage1_ready = ((io_axi_r_ready && (! stage1_payload_fragment_write)) || ((io_axi_b_ready || (! stage1_payload_last)) && stage1_payload_fragment_write));
  assign io_axi_r_valid = (stage1_valid && (! stage1_payload_fragment_write));
  assign io_axi_r_payload_id = stage1_payload_fragment_id;
  assign io_axi_r_payload_last = stage1_payload_last;
  assign io_axi_r_payload_resp = 2'b00;
  assign io_axi_b_valid = ((stage1_valid && stage1_payload_fragment_write) && stage1_payload_last);
  assign io_axi_b_payload_resp = 2'b00;
  assign io_axi_b_payload_id = stage1_payload_fragment_id;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      unburstify_buffer_valid <= 1'b0;
      stage0_rValid <= 1'b0;
    end else begin
      if(unburstify_result_ready) begin
        if(unburstify_buffer_last) begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(!unburstify_buffer_valid) begin
        if(when_Axi4Channel_l323) begin
          if(unburstify_result_ready) begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(stage0_ready) begin
        stage0_rValid <= stage0_valid;
      end
    end
  end

  always @(posedge io_axiClk) begin
    if(unburstify_result_ready) begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(!unburstify_buffer_valid) begin
      if(when_Axi4Channel_l323) begin
        if(unburstify_result_ready) begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(stage0_ready) begin
      stage0_rData_last <= stage0_payload_last;
      stage0_rData_fragment_addr <= stage0_payload_fragment_addr;
      stage0_rData_fragment_id <= stage0_payload_fragment_id;
      stage0_rData_fragment_size <= stage0_payload_fragment_size;
      stage0_rData_fragment_burst <= stage0_payload_fragment_burst;
      stage0_rData_fragment_write <= stage0_payload_fragment_write;
    end
  end


endmodule

//BufferCC_2 replaced by BufferCC_1

module BufferCC_1 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_axiClk
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge io_axiClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

//StreamFifoLowLatency_2 replaced by StreamFifoLowLatency

module StreamArbiter_2 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [19:0]   io_inputs_0_payload_addr,
  input  wire [3:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [19:0]   io_output_payload_addr,
  output wire [3:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosenOH,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  wire       [1:0]    _zz__zz_maskProposal_0_2;
  wire       [1:0]    _zz__zz_maskProposal_0_2_1;
  wire       [0:0]    _zz__zz_maskProposal_0_2_2;
  wire       [0:0]    _zz_maskProposal_0_3;
  reg                 locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_maskProposal_0;
  wire       [1:0]    _zz_maskProposal_0_1;
  wire       [1:0]    _zz_maskProposal_0_2;
  wire                io_output_fire;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = maskLocked_0;
  assign _zz__zz_maskProposal_0_2_1 = {1'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[1 : 1] | _zz_maskProposal_0_2[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_maskProposal_0 = io_inputs_0_valid;
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = ((1'b0 || maskRouted_0) && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency

module StreamArbiter_1 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [14:0]   io_inputs_0_payload_addr,
  input  wire [2:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [14:0]   io_inputs_1_payload_addr,
  input  wire [2:0]    io_inputs_1_payload_id,
  input  wire [7:0]    io_inputs_1_payload_len,
  input  wire [2:0]    io_inputs_1_payload_size,
  input  wire [1:0]    io_inputs_1_payload_burst,
  input  wire          io_inputs_1_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [14:0]   io_output_payload_addr,
  output wire [2:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosen,
  output wire [1:0]    io_chosenOH,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_write = (maskRouted_0 ? io_inputs_0_payload_write : io_inputs_1_payload_write);
  assign io_inputs_0_ready = ((1'b0 || maskRouted_0) && io_output_ready);
  assign io_inputs_1_ready = ((1'b0 || maskRouted_1) && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFifoLowLatency (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [2:0]    fifo_io_occupancy;
  wire       [2:0]    fifo_io_availability;

  StreamFifo fifo (
    .io_push_valid      (io_push_valid            ), //i
    .io_push_ready      (fifo_io_push_ready       ), //o
    .io_pop_valid       (fifo_io_pop_valid        ), //o
    .io_pop_ready       (io_pop_ready             ), //i
    .io_flush           (io_flush                 ), //i
    .io_occupancy       (fifo_io_occupancy[2:0]   ), //o
    .io_availability    (fifo_io_availability[2:0]), //o
    .io_axiClk          (io_axiClk                ), //i
    .resetCtrl_axiReset (resetCtrl_axiReset       )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

module StreamArbiter (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [14:0]   io_inputs_0_payload_addr,
  input  wire [11:0]   io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire          io_inputs_0_payload_write,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [14:0]   io_output_payload_addr,
  output wire [11:0]   io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire          io_output_payload_write,
  output wire [0:0]    io_chosenOH,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  wire       [1:0]    _zz__zz_maskProposal_0_2;
  wire       [1:0]    _zz__zz_maskProposal_0_2_1;
  wire       [0:0]    _zz__zz_maskProposal_0_2_2;
  wire       [0:0]    _zz_maskProposal_0_3;
  reg                 locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_maskProposal_0;
  wire       [1:0]    _zz_maskProposal_0_1;
  wire       [1:0]    _zz_maskProposal_0_2;
  wire                io_output_fire;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = maskLocked_0;
  assign _zz__zz_maskProposal_0_2_1 = {1'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[1 : 1] | _zz_maskProposal_0_2[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_maskProposal_0 = io_inputs_0_valid;
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = ((1'b0 || maskRouted_0) && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module Axi4SharedErrorSlave (
  input  wire          io_axi_arw_valid,
  output wire          io_axi_arw_ready,
  input  wire [31:0]   io_axi_arw_payload_addr,
  input  wire [7:0]    io_axi_arw_payload_len,
  input  wire [2:0]    io_axi_arw_payload_size,
  input  wire [3:0]    io_axi_arw_payload_cache,
  input  wire [2:0]    io_axi_arw_payload_prot,
  input  wire          io_axi_arw_payload_write,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [511:0]  io_axi_w_payload_data,
  input  wire [63:0]   io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [1:0]    io_axi_b_payload_resp,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [511:0]  io_axi_r_payload_data,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg                 consumeData;
  reg                 sendReadRsp;
  reg                 sendWriteRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_arw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4ErrorSlave_l92;
  wire                io_axi_b_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_arw_ready = (! ((consumeData || sendWriteRsp) || sendReadRsp));
  assign io_axi_arw_fire = (io_axi_arw_valid && io_axi_arw_ready);
  assign io_axi_w_ready = consumeData;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4ErrorSlave_l92 = (io_axi_w_fire && io_axi_w_payload_last);
  assign io_axi_b_valid = sendWriteRsp;
  assign io_axi_b_payload_resp = 2'b11;
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign io_axi_r_valid = sendReadRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      consumeData <= 1'b0;
      sendReadRsp <= 1'b0;
      sendWriteRsp <= 1'b0;
    end else begin
      if(io_axi_arw_fire) begin
        consumeData <= io_axi_arw_payload_write;
        sendReadRsp <= (! io_axi_arw_payload_write);
      end
      if(when_Axi4ErrorSlave_l92) begin
        consumeData <= 1'b0;
        sendWriteRsp <= 1'b1;
      end
      if(io_axi_b_fire) begin
        sendWriteRsp <= 1'b0;
      end
      if(sendReadRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendReadRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge io_axiClk) begin
    if(io_axi_arw_fire) begin
      remaining <= io_axi_arw_payload_len;
    end
    if(sendReadRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave (
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [7:0]    io_axi_ar_payload_len,
  input  wire [1:0]    io_axi_ar_payload_burst,
  input  wire [3:0]    io_axi_ar_payload_cache,
  input  wire [2:0]    io_axi_ar_payload_prot,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [511:0]  io_axi_r_payload_data,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg                 sendRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge io_axiClk) begin
    if(io_axi_ar_fire) begin
      remaining <= io_axi_ar_payload_len;
    end
    if(sendRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module FlowCCUnsafeByToggle (
  input  wire          io_input_valid,
  input  wire          io_input_payload_last,
  input  wire [0:0]    io_input_payload_fragment,
  output wire          io_output_valid,
  output wire          io_output_payload_last,
  output wire [0:0]    io_output_payload_fragment,
  input  wire          io_jtag_tck,
  input  wire          io_axiClk,
  input  wire          resetCtrl_systemReset
);

  wire                inputArea_target_buffercc_io_dataOut;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 inputArea_target;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 inputArea_data_last;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 outputArea_flow_m2sPipe_valid;
  (* async_reg = "true" , altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 outputArea_flow_m2sPipe_payload_last;
  (* async_reg = "true" , altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg        [0:0]    outputArea_flow_m2sPipe_payload_fragment;

  (* keep_hierarchy = "TRUE" *) BufferCC inputArea_target_buffercc (
    .io_dataIn             (inputArea_target                    ), //i
    .io_dataOut            (inputArea_target_buffercc_io_dataOut), //o
    .io_axiClk             (io_axiClk                           ), //i
    .resetCtrl_systemReset (resetCtrl_systemReset               )  //i
  );
  initial begin
  `ifndef SYNTHESIS
    inputArea_target = $urandom;
    outputArea_hit = $urandom;
  `endif
  end

  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_last = outputArea_flow_m2sPipe_payload_last;
  assign io_output_payload_fragment = outputArea_flow_m2sPipe_payload_fragment;
  always @(posedge io_jtag_tck) begin
    if(io_input_valid) begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @(posedge io_axiClk) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @(posedge io_axiClk or posedge resetCtrl_systemReset) begin
    if(resetCtrl_systemReset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end


endmodule

module DataCache (
  input  wire          io_cpu_execute_isValid,
  input  wire [31:0]   io_cpu_execute_address,
  output reg           io_cpu_execute_haltIt,
  input  wire          io_cpu_execute_args_wr,
  input  wire [1:0]    io_cpu_execute_args_size,
  input  wire          io_cpu_execute_args_totalyConsistent,
  output wire          io_cpu_execute_refilling,
  input  wire          io_cpu_memory_isValid,
  input  wire          io_cpu_memory_isStuck,
  output wire          io_cpu_memory_isWrite,
  input  wire [31:0]   io_cpu_memory_address,
  input  wire [31:0]   io_cpu_memory_mmuRsp_physicalAddress,
  input  wire          io_cpu_memory_mmuRsp_isIoAccess,
  input  wire          io_cpu_memory_mmuRsp_isPaging,
  input  wire          io_cpu_memory_mmuRsp_allowRead,
  input  wire          io_cpu_memory_mmuRsp_allowWrite,
  input  wire          io_cpu_memory_mmuRsp_allowExecute,
  input  wire          io_cpu_memory_mmuRsp_exception,
  input  wire          io_cpu_memory_mmuRsp_refilling,
  input  wire          io_cpu_memory_mmuRsp_bypassTranslation,
  input  wire          io_cpu_writeBack_isValid,
  input  wire          io_cpu_writeBack_isStuck,
  input  wire          io_cpu_writeBack_isFiring,
  input  wire          io_cpu_writeBack_isUser,
  output reg           io_cpu_writeBack_haltIt,
  output wire          io_cpu_writeBack_isWrite,
  input  wire [31:0]   io_cpu_writeBack_storeData,
  output reg  [31:0]   io_cpu_writeBack_data,
  input  wire [31:0]   io_cpu_writeBack_address,
  output wire          io_cpu_writeBack_mmuException,
  output wire          io_cpu_writeBack_unalignedAccess,
  output reg           io_cpu_writeBack_accessError,
  output wire          io_cpu_writeBack_keepMemRspData,
  input  wire          io_cpu_writeBack_fence_SW,
  input  wire          io_cpu_writeBack_fence_SR,
  input  wire          io_cpu_writeBack_fence_SO,
  input  wire          io_cpu_writeBack_fence_SI,
  input  wire          io_cpu_writeBack_fence_PW,
  input  wire          io_cpu_writeBack_fence_PR,
  input  wire          io_cpu_writeBack_fence_PO,
  input  wire          io_cpu_writeBack_fence_PI,
  input  wire [3:0]    io_cpu_writeBack_fence_FM,
  output wire          io_cpu_writeBack_exclusiveOk,
  output reg           io_cpu_redo,
  input  wire          io_cpu_flush_valid,
  output wire          io_cpu_flush_ready,
  input  wire          io_cpu_flush_payload_singleLine,
  input  wire [5:0]    io_cpu_flush_payload_lineId,
  output wire          io_cpu_writesPending,
  output reg           io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output reg           io_mem_cmd_payload_wr,
  output wire          io_mem_cmd_payload_uncached,
  output reg  [31:0]   io_mem_cmd_payload_address,
  output wire [31:0]   io_mem_cmd_payload_data,
  output wire [3:0]    io_mem_cmd_payload_mask,
  output reg  [2:0]    io_mem_cmd_payload_size,
  output wire          io_mem_cmd_payload_last,
  input  wire          io_mem_rsp_valid,
  input  wire          io_mem_rsp_payload_last,
  input  wire [511:0]  io_mem_rsp_payload_data,
  input  wire          io_mem_rsp_payload_error,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg        [21:0]   ways_0_tags_spinal_port0;
  reg        [511:0]  ways_0_data_spinal_port0;
  reg        [31:0]   _zz_ways_0_dataReadRsp;
  wire       [3:0]    _zz_ways_0_dataReadRsp_1;
  wire       [21:0]   _zz_ways_0_tags_port;
  wire       [5:0]    _zz_stage0_dataColisions_1;
  reg        [3:0]    _zz_stage0_dataColisions_2;
  wire       [3:0]    _zz_stage0_dataColisions_3;
  wire       [5:0]    _zz__zz_stageA_dataColisions_1;
  reg        [3:0]    _zz__zz_stageA_dataColisions_1_1;
  wire       [3:0]    _zz__zz_stageA_dataColisions_1_2;
  reg        [31:0]   _zz_stageB_ioMemRspMuxed;
  wire       [3:0]    _zz_stageB_ioMemRspMuxed_1;
  wire       [1:0]    _zz_loader_waysAllocator;
  reg                 _zz_1;
  reg                 _zz_2;
  wire                haltCpu;
  reg                 tagsReadCmd_valid;
  reg        [5:0]    tagsReadCmd_payload;
  reg                 tagsWriteCmd_valid;
  reg        [0:0]    tagsWriteCmd_payload_way;
  reg        [5:0]    tagsWriteCmd_payload_address;
  reg                 tagsWriteCmd_payload_data_valid;
  reg                 tagsWriteCmd_payload_data_error;
  reg        [19:0]   tagsWriteCmd_payload_data_address;
  reg                 tagsWriteLastCmd_valid;
  reg        [0:0]    tagsWriteLastCmd_payload_way;
  reg        [5:0]    tagsWriteLastCmd_payload_address;
  reg                 tagsWriteLastCmd_payload_data_valid;
  reg                 tagsWriteLastCmd_payload_data_error;
  reg        [19:0]   tagsWriteLastCmd_payload_data_address;
  reg                 dataReadCmd_valid;
  reg        [5:0]    dataReadCmd_payload;
  reg                 dataWriteCmd_valid;
  reg        [0:0]    dataWriteCmd_payload_way;
  reg        [5:0]    dataWriteCmd_payload_address;
  reg        [511:0]  dataWriteCmd_payload_data;
  reg        [63:0]   dataWriteCmd_payload_mask;
  wire                _zz_ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [19:0]   ways_0_tagsReadRsp_address;
  wire       [21:0]   _zz_ways_0_tagsReadRsp_valid_1;
  wire                _zz_ways_0_dataReadRspMem;
  wire       [511:0]  ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRsp;
  wire                when_DataCache_l648;
  wire                when_DataCache_l651;
  wire                when_DataCache_l670;
  wire                rspSync;
  wire                rspLast;
  reg                 memCmdSent;
  wire                io_mem_cmd_fire;
  wire                when_DataCache_l692;
  reg        [3:0]    _zz_stage0_mask;
  wire       [3:0]    stage0_mask;
  wire       [9:0]    _zz_stage0_dataColisions;
  wire       [0:0]    stage0_dataColisions;
  wire       [0:0]    stage0_wayInvalidate;
  wire                stage0_isAmo;
  wire                when_DataCache_l779;
  reg                 stageA_request_wr;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_totalyConsistent;
  wire                when_DataCache_l779_1;
  reg        [3:0]    stageA_mask;
  wire                stageA_isAmo;
  wire                stageA_isLrsc;
  wire       [0:0]    stageA_wayHits;
  wire                when_DataCache_l779_2;
  reg        [0:0]    stageA_wayInvalidate;
  wire                when_DataCache_l779_3;
  reg        [0:0]    stage0_dataColisions_regNextWhen;
  wire       [9:0]    _zz_stageA_dataColisions;
  wire       [0:0]    _zz_stageA_dataColisions_1;
  wire       [0:0]    stageA_dataColisions;
  wire                when_DataCache_l830;
  reg                 stageB_request_wr;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_request_totalyConsistent;
  reg                 stageB_mmuRspFreeze;
  wire                when_DataCache_l832;
  reg        [31:0]   stageB_mmuRsp_physicalAddress;
  reg                 stageB_mmuRsp_isIoAccess;
  reg                 stageB_mmuRsp_isPaging;
  reg                 stageB_mmuRsp_allowRead;
  reg                 stageB_mmuRsp_allowWrite;
  reg                 stageB_mmuRsp_allowExecute;
  reg                 stageB_mmuRsp_exception;
  reg                 stageB_mmuRsp_refilling;
  reg                 stageB_mmuRsp_bypassTranslation;
  wire                when_DataCache_l829;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [19:0]   stageB_tagsReadRsp_0_address;
  wire                when_DataCache_l829_1;
  reg        [31:0]   stageB_dataReadRsp_0;
  wire                when_DataCache_l828;
  reg        [0:0]    stageB_wayInvalidate;
  wire                stageB_consistancyHazard;
  wire                when_DataCache_l828_1;
  reg        [0:0]    stageB_dataColisions;
  wire                when_DataCache_l828_2;
  reg                 stageB_unaligned;
  wire                when_DataCache_l828_3;
  reg        [0:0]    stageB_waysHitsBeforeInvalidate;
  wire       [0:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  wire                when_DataCache_l828_4;
  reg        [3:0]    stageB_mask;
  reg                 stageB_loaderValid;
  wire       [31:0]   stageB_ioMemRspMuxed;
  reg                 stageB_flusher_waitDone;
  wire                stageB_flusher_hold;
  reg        [6:0]    stageB_flusher_counter;
  wire                when_DataCache_l858;
  wire                when_DataCache_l864;
  wire                when_DataCache_l866;
  reg                 stageB_flusher_start;
  wire                when_DataCache_l880;
  wire                stageB_isAmo;
  wire                stageB_isAmoCached;
  wire                stageB_isExternalLsrc;
  wire                stageB_isExternalAmo;
  wire       [31:0]   stageB_requestDataBypass;
  reg                 stageB_cpuWriteToCache;
  wire                when_DataCache_l934;
  wire       [15:0]   _zz_7;
  wire                stageB_badPermissions;
  wire                stageB_loadStoreFault;
  wire                stageB_bypassCache;
  wire                when_DataCache_l1003;
  wire                when_DataCache_l1012;
  wire                when_DataCache_l1017;
  wire                when_DataCache_l1028;
  wire                when_DataCache_l1040;
  wire                when_DataCache_l999;
  wire                when_DataCache_l1075;
  wire                when_DataCache_l1084;
  reg                 loader_valid;
  reg                 loader_counter_willIncrement;
  wire                loader_counter_willClear;
  wire                loader_counter_willOverflowIfInc;
  wire                loader_counter_willOverflow;
  reg        [0:0]    loader_waysAllocator;
  reg                 loader_error;
  wire                loader_kill;
  reg                 loader_killReg;
  wire                when_DataCache_l1100;
  wire                loader_done;
  wire                when_DataCache_l1128;
  reg                 loader_valid_regNext;
  wire                when_DataCache_l1132;
  wire                when_DataCache_l1135;
  reg [21:0] ways_0_tags [0:63];
  reg [7:0] ways_0_data_symbol0 [0:63];
  reg [7:0] ways_0_data_symbol1 [0:63];
  reg [7:0] ways_0_data_symbol2 [0:63];
  reg [7:0] ways_0_data_symbol3 [0:63];
  reg [7:0] ways_0_data_symbol4 [0:63];
  reg [7:0] ways_0_data_symbol5 [0:63];
  reg [7:0] ways_0_data_symbol6 [0:63];
  reg [7:0] ways_0_data_symbol7 [0:63];
  reg [7:0] ways_0_data_symbol8 [0:63];
  reg [7:0] ways_0_data_symbol9 [0:63];
  reg [7:0] ways_0_data_symbol10 [0:63];
  reg [7:0] ways_0_data_symbol11 [0:63];
  reg [7:0] ways_0_data_symbol12 [0:63];
  reg [7:0] ways_0_data_symbol13 [0:63];
  reg [7:0] ways_0_data_symbol14 [0:63];
  reg [7:0] ways_0_data_symbol15 [0:63];
  reg [7:0] ways_0_data_symbol16 [0:63];
  reg [7:0] ways_0_data_symbol17 [0:63];
  reg [7:0] ways_0_data_symbol18 [0:63];
  reg [7:0] ways_0_data_symbol19 [0:63];
  reg [7:0] ways_0_data_symbol20 [0:63];
  reg [7:0] ways_0_data_symbol21 [0:63];
  reg [7:0] ways_0_data_symbol22 [0:63];
  reg [7:0] ways_0_data_symbol23 [0:63];
  reg [7:0] ways_0_data_symbol24 [0:63];
  reg [7:0] ways_0_data_symbol25 [0:63];
  reg [7:0] ways_0_data_symbol26 [0:63];
  reg [7:0] ways_0_data_symbol27 [0:63];
  reg [7:0] ways_0_data_symbol28 [0:63];
  reg [7:0] ways_0_data_symbol29 [0:63];
  reg [7:0] ways_0_data_symbol30 [0:63];
  reg [7:0] ways_0_data_symbol31 [0:63];
  reg [7:0] ways_0_data_symbol32 [0:63];
  reg [7:0] ways_0_data_symbol33 [0:63];
  reg [7:0] ways_0_data_symbol34 [0:63];
  reg [7:0] ways_0_data_symbol35 [0:63];
  reg [7:0] ways_0_data_symbol36 [0:63];
  reg [7:0] ways_0_data_symbol37 [0:63];
  reg [7:0] ways_0_data_symbol38 [0:63];
  reg [7:0] ways_0_data_symbol39 [0:63];
  reg [7:0] ways_0_data_symbol40 [0:63];
  reg [7:0] ways_0_data_symbol41 [0:63];
  reg [7:0] ways_0_data_symbol42 [0:63];
  reg [7:0] ways_0_data_symbol43 [0:63];
  reg [7:0] ways_0_data_symbol44 [0:63];
  reg [7:0] ways_0_data_symbol45 [0:63];
  reg [7:0] ways_0_data_symbol46 [0:63];
  reg [7:0] ways_0_data_symbol47 [0:63];
  reg [7:0] ways_0_data_symbol48 [0:63];
  reg [7:0] ways_0_data_symbol49 [0:63];
  reg [7:0] ways_0_data_symbol50 [0:63];
  reg [7:0] ways_0_data_symbol51 [0:63];
  reg [7:0] ways_0_data_symbol52 [0:63];
  reg [7:0] ways_0_data_symbol53 [0:63];
  reg [7:0] ways_0_data_symbol54 [0:63];
  reg [7:0] ways_0_data_symbol55 [0:63];
  reg [7:0] ways_0_data_symbol56 [0:63];
  reg [7:0] ways_0_data_symbol57 [0:63];
  reg [7:0] ways_0_data_symbol58 [0:63];
  reg [7:0] ways_0_data_symbol59 [0:63];
  reg [7:0] ways_0_data_symbol60 [0:63];
  reg [7:0] ways_0_data_symbol61 [0:63];
  reg [7:0] ways_0_data_symbol62 [0:63];
  reg [7:0] ways_0_data_symbol63 [0:63];
  reg [7:0] _zz_ways_0_datasymbol_read;
  reg [7:0] _zz_ways_0_datasymbol_read_1;
  reg [7:0] _zz_ways_0_datasymbol_read_2;
  reg [7:0] _zz_ways_0_datasymbol_read_3;
  reg [7:0] _zz_ways_0_datasymbol_read_4;
  reg [7:0] _zz_ways_0_datasymbol_read_5;
  reg [7:0] _zz_ways_0_datasymbol_read_6;
  reg [7:0] _zz_ways_0_datasymbol_read_7;
  reg [7:0] _zz_ways_0_datasymbol_read_8;
  reg [7:0] _zz_ways_0_datasymbol_read_9;
  reg [7:0] _zz_ways_0_datasymbol_read_10;
  reg [7:0] _zz_ways_0_datasymbol_read_11;
  reg [7:0] _zz_ways_0_datasymbol_read_12;
  reg [7:0] _zz_ways_0_datasymbol_read_13;
  reg [7:0] _zz_ways_0_datasymbol_read_14;
  reg [7:0] _zz_ways_0_datasymbol_read_15;
  reg [7:0] _zz_ways_0_datasymbol_read_16;
  reg [7:0] _zz_ways_0_datasymbol_read_17;
  reg [7:0] _zz_ways_0_datasymbol_read_18;
  reg [7:0] _zz_ways_0_datasymbol_read_19;
  reg [7:0] _zz_ways_0_datasymbol_read_20;
  reg [7:0] _zz_ways_0_datasymbol_read_21;
  reg [7:0] _zz_ways_0_datasymbol_read_22;
  reg [7:0] _zz_ways_0_datasymbol_read_23;
  reg [7:0] _zz_ways_0_datasymbol_read_24;
  reg [7:0] _zz_ways_0_datasymbol_read_25;
  reg [7:0] _zz_ways_0_datasymbol_read_26;
  reg [7:0] _zz_ways_0_datasymbol_read_27;
  reg [7:0] _zz_ways_0_datasymbol_read_28;
  reg [7:0] _zz_ways_0_datasymbol_read_29;
  reg [7:0] _zz_ways_0_datasymbol_read_30;
  reg [7:0] _zz_ways_0_datasymbol_read_31;
  reg [7:0] _zz_ways_0_datasymbol_read_32;
  reg [7:0] _zz_ways_0_datasymbol_read_33;
  reg [7:0] _zz_ways_0_datasymbol_read_34;
  reg [7:0] _zz_ways_0_datasymbol_read_35;
  reg [7:0] _zz_ways_0_datasymbol_read_36;
  reg [7:0] _zz_ways_0_datasymbol_read_37;
  reg [7:0] _zz_ways_0_datasymbol_read_38;
  reg [7:0] _zz_ways_0_datasymbol_read_39;
  reg [7:0] _zz_ways_0_datasymbol_read_40;
  reg [7:0] _zz_ways_0_datasymbol_read_41;
  reg [7:0] _zz_ways_0_datasymbol_read_42;
  reg [7:0] _zz_ways_0_datasymbol_read_43;
  reg [7:0] _zz_ways_0_datasymbol_read_44;
  reg [7:0] _zz_ways_0_datasymbol_read_45;
  reg [7:0] _zz_ways_0_datasymbol_read_46;
  reg [7:0] _zz_ways_0_datasymbol_read_47;
  reg [7:0] _zz_ways_0_datasymbol_read_48;
  reg [7:0] _zz_ways_0_datasymbol_read_49;
  reg [7:0] _zz_ways_0_datasymbol_read_50;
  reg [7:0] _zz_ways_0_datasymbol_read_51;
  reg [7:0] _zz_ways_0_datasymbol_read_52;
  reg [7:0] _zz_ways_0_datasymbol_read_53;
  reg [7:0] _zz_ways_0_datasymbol_read_54;
  reg [7:0] _zz_ways_0_datasymbol_read_55;
  reg [7:0] _zz_ways_0_datasymbol_read_56;
  reg [7:0] _zz_ways_0_datasymbol_read_57;
  reg [7:0] _zz_ways_0_datasymbol_read_58;
  reg [7:0] _zz_ways_0_datasymbol_read_59;
  reg [7:0] _zz_ways_0_datasymbol_read_60;
  reg [7:0] _zz_ways_0_datasymbol_read_61;
  reg [7:0] _zz_ways_0_datasymbol_read_62;
  reg [7:0] _zz_ways_0_datasymbol_read_63;

  assign _zz_stage0_dataColisions_1 = (_zz_stage0_dataColisions >>> 3'd4);
  assign _zz__zz_stageA_dataColisions_1 = (_zz_stageA_dataColisions >>> 3'd4);
  assign _zz_loader_waysAllocator = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_ways_0_tags_port = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  assign _zz_ways_0_dataReadRsp_1 = io_cpu_memory_address[5 : 2];
  assign _zz_stage0_dataColisions_3 = _zz_stage0_dataColisions[3 : 0];
  assign _zz__zz_stageA_dataColisions_1_2 = _zz_stageA_dataColisions[3 : 0];
  assign _zz_stageB_ioMemRspMuxed_1 = io_cpu_writeBack_address[5 : 2];
  always @(posedge io_axiClk) begin
    if(_zz_ways_0_tagsReadRsp_valid) begin
      ways_0_tags_spinal_port0 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @(posedge io_axiClk) begin
    if(_zz_2) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(*) begin
    ways_0_data_spinal_port0 = {_zz_ways_0_datasymbol_read_63, _zz_ways_0_datasymbol_read_62, _zz_ways_0_datasymbol_read_61, _zz_ways_0_datasymbol_read_60, _zz_ways_0_datasymbol_read_59, _zz_ways_0_datasymbol_read_58, _zz_ways_0_datasymbol_read_57, _zz_ways_0_datasymbol_read_56, _zz_ways_0_datasymbol_read_55, _zz_ways_0_datasymbol_read_54, _zz_ways_0_datasymbol_read_53, _zz_ways_0_datasymbol_read_52, _zz_ways_0_datasymbol_read_51, _zz_ways_0_datasymbol_read_50, _zz_ways_0_datasymbol_read_49, _zz_ways_0_datasymbol_read_48, _zz_ways_0_datasymbol_read_47, _zz_ways_0_datasymbol_read_46, _zz_ways_0_datasymbol_read_45, _zz_ways_0_datasymbol_read_44, _zz_ways_0_datasymbol_read_43, _zz_ways_0_datasymbol_read_42, _zz_ways_0_datasymbol_read_41, _zz_ways_0_datasymbol_read_40, _zz_ways_0_datasymbol_read_39, _zz_ways_0_datasymbol_read_38, _zz_ways_0_datasymbol_read_37, _zz_ways_0_datasymbol_read_36, _zz_ways_0_datasymbol_read_35, _zz_ways_0_datasymbol_read_34, _zz_ways_0_datasymbol_read_33, _zz_ways_0_datasymbol_read_32, _zz_ways_0_datasymbol_read_31, _zz_ways_0_datasymbol_read_30, _zz_ways_0_datasymbol_read_29, _zz_ways_0_datasymbol_read_28, _zz_ways_0_datasymbol_read_27, _zz_ways_0_datasymbol_read_26, _zz_ways_0_datasymbol_read_25, _zz_ways_0_datasymbol_read_24, _zz_ways_0_datasymbol_read_23, _zz_ways_0_datasymbol_read_22, _zz_ways_0_datasymbol_read_21, _zz_ways_0_datasymbol_read_20, _zz_ways_0_datasymbol_read_19, _zz_ways_0_datasymbol_read_18, _zz_ways_0_datasymbol_read_17, _zz_ways_0_datasymbol_read_16, _zz_ways_0_datasymbol_read_15, _zz_ways_0_datasymbol_read_14, _zz_ways_0_datasymbol_read_13, _zz_ways_0_datasymbol_read_12, _zz_ways_0_datasymbol_read_11, _zz_ways_0_datasymbol_read_10, _zz_ways_0_datasymbol_read_9, _zz_ways_0_datasymbol_read_8, _zz_ways_0_datasymbol_read_7, _zz_ways_0_datasymbol_read_6, _zz_ways_0_datasymbol_read_5, _zz_ways_0_datasymbol_read_4, _zz_ways_0_datasymbol_read_3, _zz_ways_0_datasymbol_read_2, _zz_ways_0_datasymbol_read_1, _zz_ways_0_datasymbol_read};
  end
  always @(posedge io_axiClk) begin
    if(_zz_ways_0_dataReadRspMem) begin
      _zz_ways_0_datasymbol_read <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_1 <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_2 <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_3 <= ways_0_data_symbol3[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_4 <= ways_0_data_symbol4[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_5 <= ways_0_data_symbol5[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_6 <= ways_0_data_symbol6[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_7 <= ways_0_data_symbol7[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_8 <= ways_0_data_symbol8[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_9 <= ways_0_data_symbol9[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_10 <= ways_0_data_symbol10[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_11 <= ways_0_data_symbol11[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_12 <= ways_0_data_symbol12[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_13 <= ways_0_data_symbol13[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_14 <= ways_0_data_symbol14[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_15 <= ways_0_data_symbol15[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_16 <= ways_0_data_symbol16[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_17 <= ways_0_data_symbol17[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_18 <= ways_0_data_symbol18[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_19 <= ways_0_data_symbol19[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_20 <= ways_0_data_symbol20[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_21 <= ways_0_data_symbol21[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_22 <= ways_0_data_symbol22[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_23 <= ways_0_data_symbol23[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_24 <= ways_0_data_symbol24[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_25 <= ways_0_data_symbol25[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_26 <= ways_0_data_symbol26[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_27 <= ways_0_data_symbol27[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_28 <= ways_0_data_symbol28[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_29 <= ways_0_data_symbol29[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_30 <= ways_0_data_symbol30[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_31 <= ways_0_data_symbol31[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_32 <= ways_0_data_symbol32[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_33 <= ways_0_data_symbol33[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_34 <= ways_0_data_symbol34[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_35 <= ways_0_data_symbol35[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_36 <= ways_0_data_symbol36[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_37 <= ways_0_data_symbol37[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_38 <= ways_0_data_symbol38[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_39 <= ways_0_data_symbol39[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_40 <= ways_0_data_symbol40[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_41 <= ways_0_data_symbol41[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_42 <= ways_0_data_symbol42[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_43 <= ways_0_data_symbol43[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_44 <= ways_0_data_symbol44[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_45 <= ways_0_data_symbol45[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_46 <= ways_0_data_symbol46[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_47 <= ways_0_data_symbol47[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_48 <= ways_0_data_symbol48[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_49 <= ways_0_data_symbol49[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_50 <= ways_0_data_symbol50[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_51 <= ways_0_data_symbol51[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_52 <= ways_0_data_symbol52[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_53 <= ways_0_data_symbol53[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_54 <= ways_0_data_symbol54[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_55 <= ways_0_data_symbol55[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_56 <= ways_0_data_symbol56[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_57 <= ways_0_data_symbol57[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_58 <= ways_0_data_symbol58[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_59 <= ways_0_data_symbol59[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_60 <= ways_0_data_symbol60[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_61 <= ways_0_data_symbol61[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_62 <= ways_0_data_symbol62[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_63 <= ways_0_data_symbol63[dataReadCmd_payload];
    end
  end

  always @(posedge io_axiClk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
    if(dataWriteCmd_payload_mask[4] && _zz_1) begin
      ways_0_data_symbol4[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[39 : 32];
    end
    if(dataWriteCmd_payload_mask[5] && _zz_1) begin
      ways_0_data_symbol5[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[47 : 40];
    end
    if(dataWriteCmd_payload_mask[6] && _zz_1) begin
      ways_0_data_symbol6[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[55 : 48];
    end
    if(dataWriteCmd_payload_mask[7] && _zz_1) begin
      ways_0_data_symbol7[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[63 : 56];
    end
    if(dataWriteCmd_payload_mask[8] && _zz_1) begin
      ways_0_data_symbol8[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[71 : 64];
    end
    if(dataWriteCmd_payload_mask[9] && _zz_1) begin
      ways_0_data_symbol9[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[79 : 72];
    end
    if(dataWriteCmd_payload_mask[10] && _zz_1) begin
      ways_0_data_symbol10[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[87 : 80];
    end
    if(dataWriteCmd_payload_mask[11] && _zz_1) begin
      ways_0_data_symbol11[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[95 : 88];
    end
    if(dataWriteCmd_payload_mask[12] && _zz_1) begin
      ways_0_data_symbol12[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[103 : 96];
    end
    if(dataWriteCmd_payload_mask[13] && _zz_1) begin
      ways_0_data_symbol13[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[111 : 104];
    end
    if(dataWriteCmd_payload_mask[14] && _zz_1) begin
      ways_0_data_symbol14[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[119 : 112];
    end
    if(dataWriteCmd_payload_mask[15] && _zz_1) begin
      ways_0_data_symbol15[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[127 : 120];
    end
    if(dataWriteCmd_payload_mask[16] && _zz_1) begin
      ways_0_data_symbol16[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[135 : 128];
    end
    if(dataWriteCmd_payload_mask[17] && _zz_1) begin
      ways_0_data_symbol17[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[143 : 136];
    end
    if(dataWriteCmd_payload_mask[18] && _zz_1) begin
      ways_0_data_symbol18[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[151 : 144];
    end
    if(dataWriteCmd_payload_mask[19] && _zz_1) begin
      ways_0_data_symbol19[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[159 : 152];
    end
    if(dataWriteCmd_payload_mask[20] && _zz_1) begin
      ways_0_data_symbol20[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[167 : 160];
    end
    if(dataWriteCmd_payload_mask[21] && _zz_1) begin
      ways_0_data_symbol21[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[175 : 168];
    end
    if(dataWriteCmd_payload_mask[22] && _zz_1) begin
      ways_0_data_symbol22[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[183 : 176];
    end
    if(dataWriteCmd_payload_mask[23] && _zz_1) begin
      ways_0_data_symbol23[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[191 : 184];
    end
    if(dataWriteCmd_payload_mask[24] && _zz_1) begin
      ways_0_data_symbol24[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[199 : 192];
    end
    if(dataWriteCmd_payload_mask[25] && _zz_1) begin
      ways_0_data_symbol25[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[207 : 200];
    end
    if(dataWriteCmd_payload_mask[26] && _zz_1) begin
      ways_0_data_symbol26[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[215 : 208];
    end
    if(dataWriteCmd_payload_mask[27] && _zz_1) begin
      ways_0_data_symbol27[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[223 : 216];
    end
    if(dataWriteCmd_payload_mask[28] && _zz_1) begin
      ways_0_data_symbol28[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[231 : 224];
    end
    if(dataWriteCmd_payload_mask[29] && _zz_1) begin
      ways_0_data_symbol29[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[239 : 232];
    end
    if(dataWriteCmd_payload_mask[30] && _zz_1) begin
      ways_0_data_symbol30[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[247 : 240];
    end
    if(dataWriteCmd_payload_mask[31] && _zz_1) begin
      ways_0_data_symbol31[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[255 : 248];
    end
    if(dataWriteCmd_payload_mask[32] && _zz_1) begin
      ways_0_data_symbol32[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[263 : 256];
    end
    if(dataWriteCmd_payload_mask[33] && _zz_1) begin
      ways_0_data_symbol33[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[271 : 264];
    end
    if(dataWriteCmd_payload_mask[34] && _zz_1) begin
      ways_0_data_symbol34[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[279 : 272];
    end
    if(dataWriteCmd_payload_mask[35] && _zz_1) begin
      ways_0_data_symbol35[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[287 : 280];
    end
    if(dataWriteCmd_payload_mask[36] && _zz_1) begin
      ways_0_data_symbol36[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[295 : 288];
    end
    if(dataWriteCmd_payload_mask[37] && _zz_1) begin
      ways_0_data_symbol37[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[303 : 296];
    end
    if(dataWriteCmd_payload_mask[38] && _zz_1) begin
      ways_0_data_symbol38[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[311 : 304];
    end
    if(dataWriteCmd_payload_mask[39] && _zz_1) begin
      ways_0_data_symbol39[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[319 : 312];
    end
    if(dataWriteCmd_payload_mask[40] && _zz_1) begin
      ways_0_data_symbol40[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[327 : 320];
    end
    if(dataWriteCmd_payload_mask[41] && _zz_1) begin
      ways_0_data_symbol41[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[335 : 328];
    end
    if(dataWriteCmd_payload_mask[42] && _zz_1) begin
      ways_0_data_symbol42[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[343 : 336];
    end
    if(dataWriteCmd_payload_mask[43] && _zz_1) begin
      ways_0_data_symbol43[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[351 : 344];
    end
    if(dataWriteCmd_payload_mask[44] && _zz_1) begin
      ways_0_data_symbol44[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[359 : 352];
    end
    if(dataWriteCmd_payload_mask[45] && _zz_1) begin
      ways_0_data_symbol45[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[367 : 360];
    end
    if(dataWriteCmd_payload_mask[46] && _zz_1) begin
      ways_0_data_symbol46[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[375 : 368];
    end
    if(dataWriteCmd_payload_mask[47] && _zz_1) begin
      ways_0_data_symbol47[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[383 : 376];
    end
    if(dataWriteCmd_payload_mask[48] && _zz_1) begin
      ways_0_data_symbol48[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[391 : 384];
    end
    if(dataWriteCmd_payload_mask[49] && _zz_1) begin
      ways_0_data_symbol49[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[399 : 392];
    end
    if(dataWriteCmd_payload_mask[50] && _zz_1) begin
      ways_0_data_symbol50[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[407 : 400];
    end
    if(dataWriteCmd_payload_mask[51] && _zz_1) begin
      ways_0_data_symbol51[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[415 : 408];
    end
    if(dataWriteCmd_payload_mask[52] && _zz_1) begin
      ways_0_data_symbol52[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[423 : 416];
    end
    if(dataWriteCmd_payload_mask[53] && _zz_1) begin
      ways_0_data_symbol53[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[431 : 424];
    end
    if(dataWriteCmd_payload_mask[54] && _zz_1) begin
      ways_0_data_symbol54[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[439 : 432];
    end
    if(dataWriteCmd_payload_mask[55] && _zz_1) begin
      ways_0_data_symbol55[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[447 : 440];
    end
    if(dataWriteCmd_payload_mask[56] && _zz_1) begin
      ways_0_data_symbol56[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[455 : 448];
    end
    if(dataWriteCmd_payload_mask[57] && _zz_1) begin
      ways_0_data_symbol57[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[463 : 456];
    end
    if(dataWriteCmd_payload_mask[58] && _zz_1) begin
      ways_0_data_symbol58[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[471 : 464];
    end
    if(dataWriteCmd_payload_mask[59] && _zz_1) begin
      ways_0_data_symbol59[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[479 : 472];
    end
    if(dataWriteCmd_payload_mask[60] && _zz_1) begin
      ways_0_data_symbol60[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[487 : 480];
    end
    if(dataWriteCmd_payload_mask[61] && _zz_1) begin
      ways_0_data_symbol61[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[495 : 488];
    end
    if(dataWriteCmd_payload_mask[62] && _zz_1) begin
      ways_0_data_symbol62[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[503 : 496];
    end
    if(dataWriteCmd_payload_mask[63] && _zz_1) begin
      ways_0_data_symbol63[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[511 : 504];
    end
  end

  always @(*) begin
    case(_zz_ways_0_dataReadRsp_1)
      4'b0000 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[31 : 0];
      4'b0001 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[63 : 32];
      4'b0010 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[95 : 64];
      4'b0011 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[127 : 96];
      4'b0100 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[159 : 128];
      4'b0101 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[191 : 160];
      4'b0110 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[223 : 192];
      4'b0111 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[255 : 224];
      4'b1000 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[287 : 256];
      4'b1001 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[319 : 288];
      4'b1010 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[351 : 320];
      4'b1011 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[383 : 352];
      4'b1100 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[415 : 384];
      4'b1101 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[447 : 416];
      4'b1110 : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[479 : 448];
      default : _zz_ways_0_dataReadRsp = ways_0_dataReadRspMem[511 : 480];
    endcase
  end

  always @(*) begin
    case(_zz_stage0_dataColisions_3)
      4'b0000 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[3 : 0];
      4'b0001 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[7 : 4];
      4'b0010 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[11 : 8];
      4'b0011 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[15 : 12];
      4'b0100 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[19 : 16];
      4'b0101 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[23 : 20];
      4'b0110 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[27 : 24];
      4'b0111 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[31 : 28];
      4'b1000 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[35 : 32];
      4'b1001 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[39 : 36];
      4'b1010 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[43 : 40];
      4'b1011 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[47 : 44];
      4'b1100 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[51 : 48];
      4'b1101 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[55 : 52];
      4'b1110 : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[59 : 56];
      default : _zz_stage0_dataColisions_2 = dataWriteCmd_payload_mask[63 : 60];
    endcase
  end

  always @(*) begin
    case(_zz__zz_stageA_dataColisions_1_2)
      4'b0000 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[3 : 0];
      4'b0001 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[7 : 4];
      4'b0010 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[11 : 8];
      4'b0011 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[15 : 12];
      4'b0100 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[19 : 16];
      4'b0101 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[23 : 20];
      4'b0110 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[27 : 24];
      4'b0111 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[31 : 28];
      4'b1000 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[35 : 32];
      4'b1001 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[39 : 36];
      4'b1010 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[43 : 40];
      4'b1011 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[47 : 44];
      4'b1100 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[51 : 48];
      4'b1101 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[55 : 52];
      4'b1110 : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[59 : 56];
      default : _zz__zz_stageA_dataColisions_1_1 = dataWriteCmd_payload_mask[63 : 60];
    endcase
  end

  always @(*) begin
    case(_zz_stageB_ioMemRspMuxed_1)
      4'b0000 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[31 : 0];
      4'b0001 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[63 : 32];
      4'b0010 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[95 : 64];
      4'b0011 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[127 : 96];
      4'b0100 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[159 : 128];
      4'b0101 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[191 : 160];
      4'b0110 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[223 : 192];
      4'b0111 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[255 : 224];
      4'b1000 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[287 : 256];
      4'b1001 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[319 : 288];
      4'b1010 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[351 : 320];
      4'b1011 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[383 : 352];
      4'b1100 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[415 : 384];
      4'b1101 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[447 : 416];
      4'b1110 : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[479 : 448];
      default : _zz_stageB_ioMemRspMuxed = io_mem_rsp_payload_data[511 : 480];
    endcase
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_DataCache_l651) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_DataCache_l648) begin
      _zz_2 = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_ways_0_tagsReadRsp_valid = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_ways_0_tagsReadRsp_valid_1 = ways_0_tags_spinal_port0;
  assign ways_0_tagsReadRsp_valid = _zz_ways_0_tagsReadRsp_valid_1[0];
  assign ways_0_tagsReadRsp_error = _zz_ways_0_tagsReadRsp_valid_1[1];
  assign ways_0_tagsReadRsp_address = _zz_ways_0_tagsReadRsp_valid_1[21 : 2];
  assign _zz_ways_0_dataReadRspMem = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRspMem = ways_0_data_spinal_port0;
  assign ways_0_dataReadRsp = _zz_ways_0_dataReadRsp;
  assign when_DataCache_l648 = (tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]);
  assign when_DataCache_l651 = (dataWriteCmd_valid && dataWriteCmd_payload_way[0]);
  always @(*) begin
    tagsReadCmd_valid = 1'b0;
    if(when_DataCache_l670) begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsReadCmd_payload = 6'bxxxxxx;
    if(when_DataCache_l670) begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 6];
    end
  end

  always @(*) begin
    dataReadCmd_valid = 1'b0;
    if(when_DataCache_l670) begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataReadCmd_payload = 6'bxxxxxx;
    if(when_DataCache_l670) begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 6];
    end
  end

  always @(*) begin
    tagsWriteCmd_valid = 1'b0;
    if(when_DataCache_l858) begin
      tagsWriteCmd_valid = 1'b1;
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1075) begin
        tagsWriteCmd_valid = 1'b0;
      end
    end
    if(loader_done) begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_way = 1'bx;
    if(when_DataCache_l858) begin
      tagsWriteCmd_payload_way = 1'b1;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_address = 6'bxxxxxx;
    if(when_DataCache_l858) begin
      tagsWriteCmd_payload_address = stageB_flusher_counter[5:0];
    end
    if(loader_done) begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 6];
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(when_DataCache_l858) begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_data_valid = (! (loader_kill || loader_killReg));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_error = (loader_error || (io_mem_rsp_valid && io_mem_rsp_payload_error));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_address = 20'bxxxxxxxxxxxxxxxxxxxx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @(*) begin
    dataWriteCmd_valid = 1'b0;
    if(stageB_cpuWriteToCache) begin
      if(when_DataCache_l934) begin
        dataWriteCmd_valid = 1'b1;
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1075) begin
        dataWriteCmd_valid = 1'b0;
      end
    end
    if(when_DataCache_l1100) begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_way = 1'bx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_way = stageB_waysHits;
    end
    if(when_DataCache_l1100) begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_address = 6'bxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 6];
    end
    if(when_DataCache_l1100) begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 6];
    end
  end

  always @(*) begin
    dataWriteCmd_payload_data = 512'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_data[31 : 0] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[63 : 32] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[95 : 64] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[127 : 96] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[159 : 128] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[191 : 160] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[223 : 192] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[255 : 224] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[287 : 256] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[319 : 288] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[351 : 320] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[383 : 352] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[415 : 384] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[447 : 416] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[479 : 448] = stageB_requestDataBypass;
      dataWriteCmd_payload_data[511 : 480] = stageB_requestDataBypass;
    end
    if(when_DataCache_l1100) begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_mask = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_mask = 64'h0;
      if(_zz_7[0]) begin
        dataWriteCmd_payload_mask[3 : 0] = stageB_mask;
      end
      if(_zz_7[1]) begin
        dataWriteCmd_payload_mask[7 : 4] = stageB_mask;
      end
      if(_zz_7[2]) begin
        dataWriteCmd_payload_mask[11 : 8] = stageB_mask;
      end
      if(_zz_7[3]) begin
        dataWriteCmd_payload_mask[15 : 12] = stageB_mask;
      end
      if(_zz_7[4]) begin
        dataWriteCmd_payload_mask[19 : 16] = stageB_mask;
      end
      if(_zz_7[5]) begin
        dataWriteCmd_payload_mask[23 : 20] = stageB_mask;
      end
      if(_zz_7[6]) begin
        dataWriteCmd_payload_mask[27 : 24] = stageB_mask;
      end
      if(_zz_7[7]) begin
        dataWriteCmd_payload_mask[31 : 28] = stageB_mask;
      end
      if(_zz_7[8]) begin
        dataWriteCmd_payload_mask[35 : 32] = stageB_mask;
      end
      if(_zz_7[9]) begin
        dataWriteCmd_payload_mask[39 : 36] = stageB_mask;
      end
      if(_zz_7[10]) begin
        dataWriteCmd_payload_mask[43 : 40] = stageB_mask;
      end
      if(_zz_7[11]) begin
        dataWriteCmd_payload_mask[47 : 44] = stageB_mask;
      end
      if(_zz_7[12]) begin
        dataWriteCmd_payload_mask[51 : 48] = stageB_mask;
      end
      if(_zz_7[13]) begin
        dataWriteCmd_payload_mask[55 : 52] = stageB_mask;
      end
      if(_zz_7[14]) begin
        dataWriteCmd_payload_mask[59 : 56] = stageB_mask;
      end
      if(_zz_7[15]) begin
        dataWriteCmd_payload_mask[63 : 60] = stageB_mask;
      end
    end
    if(when_DataCache_l1100) begin
      dataWriteCmd_payload_mask = 64'hffffffffffffffff;
    end
  end

  assign when_DataCache_l670 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  always @(*) begin
    io_cpu_execute_haltIt = 1'b0;
    if(when_DataCache_l858) begin
      io_cpu_execute_haltIt = 1'b1;
    end
  end

  assign rspSync = 1'b1;
  assign rspLast = 1'b1;
  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign when_DataCache_l692 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    _zz_stage0_mask = 4'bxxxx;
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_stage0_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_stage0_mask = 4'b0011;
      end
      2'b10 : begin
        _zz_stage0_mask = 4'b1111;
      end
      default : begin
      end
    endcase
  end

  assign stage0_mask = (_zz_stage0_mask <<< io_cpu_execute_address[1 : 0]);
  assign _zz_stage0_dataColisions = io_cpu_execute_address[11 : 2];
  assign stage0_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_stage0_dataColisions_1)) && ((stage0_mask & _zz_stage0_dataColisions_2) != 4'b0000));
  assign stage0_wayInvalidate = 1'b0;
  assign stage0_isAmo = 1'b0;
  assign when_DataCache_l779 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l779_1 = (! io_cpu_memory_isStuck);
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_isAmo = 1'b0;
  assign stageA_isLrsc = 1'b0;
  assign stageA_wayHits = ((io_cpu_memory_mmuRsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign when_DataCache_l779_2 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l779_3 = (! io_cpu_memory_isStuck);
  assign _zz_stageA_dataColisions = io_cpu_memory_address[11 : 2];
  assign _zz_stageA_dataColisions_1[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz__zz_stageA_dataColisions_1)) && ((stageA_mask & _zz__zz_stageA_dataColisions_1_1) != 4'b0000));
  assign stageA_dataColisions = (stage0_dataColisions_regNextWhen | _zz_stageA_dataColisions_1);
  assign when_DataCache_l830 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_mmuRspFreeze = 1'b0;
    if(when_DataCache_l1135) begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign when_DataCache_l832 = ((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze));
  assign when_DataCache_l829 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l829_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l828 = (! io_cpu_writeBack_isStuck);
  assign stageB_consistancyHazard = 1'b0;
  assign when_DataCache_l828_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l828_2 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l828_3 = (! io_cpu_writeBack_isStuck);
  assign stageB_waysHits = (stageB_waysHitsBeforeInvalidate & (~ stageB_wayInvalidate));
  assign stageB_waysHit = (|stageB_waysHits);
  assign stageB_dataMux = stageB_dataReadRsp_0;
  assign when_DataCache_l828_4 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l999) begin
          if(!when_DataCache_l1012) begin
            if(io_mem_cmd_ready) begin
              stageB_loaderValid = 1'b1;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1075) begin
        stageB_loaderValid = 1'b0;
      end
    end
  end

  assign stageB_ioMemRspMuxed = _zz_stageB_ioMemRspMuxed;
  always @(*) begin
    io_cpu_writeBack_haltIt = 1'b1;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l999) begin
          if(when_DataCache_l1003) begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if(when_DataCache_l1012) begin
            if(when_DataCache_l1017) begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1075) begin
        io_cpu_writeBack_haltIt = 1'b0;
      end
    end
  end

  assign stageB_flusher_hold = 1'b0;
  assign when_DataCache_l858 = (! stageB_flusher_counter[6]);
  assign when_DataCache_l864 = (! stageB_flusher_hold);
  assign when_DataCache_l866 = (io_cpu_flush_valid && io_cpu_flush_payload_singleLine);
  assign io_cpu_flush_ready = (stageB_flusher_waitDone && stageB_flusher_counter[6]);
  assign when_DataCache_l880 = (io_cpu_flush_valid && io_cpu_flush_payload_singleLine);
  assign stageB_isAmo = 1'b0;
  assign stageB_isAmoCached = 1'b0;
  assign stageB_isExternalLsrc = 1'b0;
  assign stageB_isExternalAmo = 1'b0;
  assign stageB_requestDataBypass = io_cpu_writeBack_storeData;
  always @(*) begin
    stageB_cpuWriteToCache = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l999) begin
          if(when_DataCache_l1012) begin
            stageB_cpuWriteToCache = 1'b1;
          end
        end
      end
    end
  end

  assign when_DataCache_l934 = (stageB_request_wr && stageB_waysHit);
  assign _zz_7 = ({15'd0,1'b1} <<< io_cpu_writeBack_address[5 : 2]);
  assign stageB_badPermissions = (((! stageB_mmuRsp_allowWrite) && stageB_request_wr) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_isAmo)));
  assign stageB_loadStoreFault = (io_cpu_writeBack_isValid && (stageB_mmuRsp_exception || stageB_badPermissions));
  always @(*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l999) begin
          if(when_DataCache_l1012) begin
            if(when_DataCache_l1028) begin
              io_cpu_redo = 1'b1;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1084) begin
        io_cpu_redo = 1'b1;
      end
    end
    if(when_DataCache_l1132) begin
      io_cpu_redo = 1'b1;
    end
  end

  always @(*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_bypassCache) begin
      io_cpu_writeBack_accessError = ((((! stageB_request_wr) && 1'b1) && io_mem_rsp_valid) && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = (((stageB_waysHits & stageB_tagsReadRsp_0_error) != 1'b0) || (stageB_loadStoreFault && (! stageB_mmuRsp_isPaging)));
    end
  end

  assign io_cpu_writeBack_mmuException = (stageB_loadStoreFault && stageB_mmuRsp_isPaging);
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && stageB_unaligned);
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @(*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l999) begin
          io_mem_cmd_valid = (! memCmdSent);
        end else begin
          if(when_DataCache_l1012) begin
            if(stageB_request_wr) begin
              io_mem_cmd_valid = 1'b1;
            end
          end else begin
            if(when_DataCache_l1040) begin
              io_mem_cmd_valid = 1'b1;
            end
          end
        end
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(when_DataCache_l1075) begin
        io_mem_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    io_mem_cmd_payload_address = stageB_mmuRsp_physicalAddress;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l999) begin
          if(!when_DataCache_l1012) begin
            io_mem_cmd_payload_address[5 : 0] = 6'h0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_last = 1'b1;
  always @(*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l999) begin
          if(!when_DataCache_l1012) begin
            io_mem_cmd_payload_wr = 1'b0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  assign io_mem_cmd_payload_uncached = stageB_mmuRsp_isIoAccess;
  always @(*) begin
    io_mem_cmd_payload_size = {1'd0, stageB_request_size};
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l999) begin
          if(!when_DataCache_l1012) begin
            io_mem_cmd_payload_size = 3'b110;
          end
        end
      end
    end
  end

  assign stageB_bypassCache = ((stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc) || stageB_isExternalAmo);
  assign io_cpu_writeBack_keepMemRspData = 1'b0;
  assign when_DataCache_l1003 = ((! stageB_request_wr) ? (io_mem_rsp_valid && rspSync) : io_mem_cmd_ready);
  assign when_DataCache_l1012 = (stageB_waysHit || (stageB_request_wr && (! stageB_isAmoCached)));
  assign when_DataCache_l1017 = ((! stageB_request_wr) || io_mem_cmd_ready);
  assign when_DataCache_l1028 = (((! stageB_request_wr) || stageB_isAmoCached) && ((stageB_dataColisions & stageB_waysHits) != 1'b0));
  assign when_DataCache_l1040 = (! memCmdSent);
  assign when_DataCache_l999 = (stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc);
  always @(*) begin
    if(stageB_bypassCache) begin
      io_cpu_writeBack_data = stageB_ioMemRspMuxed;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
  end

  assign when_DataCache_l1075 = ((((stageB_consistancyHazard || stageB_mmuRsp_refilling) || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign when_DataCache_l1084 = (stageB_mmuRsp_refilling || stageB_consistancyHazard);
  always @(*) begin
    loader_counter_willIncrement = 1'b0;
    if(when_DataCache_l1100) begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = 1'b1;
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  assign loader_kill = 1'b0;
  assign when_DataCache_l1100 = ((loader_valid && io_mem_rsp_valid) && rspLast);
  assign loader_done = loader_counter_willOverflow;
  assign when_DataCache_l1128 = (! loader_valid);
  assign when_DataCache_l1132 = (loader_valid && (! loader_valid_regNext));
  assign io_cpu_execute_refilling = loader_valid;
  assign when_DataCache_l1135 = (stageB_loaderValid || loader_valid);
  always @(posedge io_axiClk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if(when_DataCache_l779) begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_size <= io_cpu_execute_args_size;
      stageA_request_totalyConsistent <= io_cpu_execute_args_totalyConsistent;
    end
    if(when_DataCache_l779_1) begin
      stageA_mask <= stage0_mask;
    end
    if(when_DataCache_l779_2) begin
      stageA_wayInvalidate <= stage0_wayInvalidate;
    end
    if(when_DataCache_l779_3) begin
      stage0_dataColisions_regNextWhen <= stage0_dataColisions;
    end
    if(when_DataCache_l830) begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_size <= stageA_request_size;
      stageB_request_totalyConsistent <= stageA_request_totalyConsistent;
    end
    if(when_DataCache_l832) begin
      stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuRsp_physicalAddress;
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuRsp_isIoAccess;
      stageB_mmuRsp_isPaging <= io_cpu_memory_mmuRsp_isPaging;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuRsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuRsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuRsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuRsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuRsp_refilling;
      stageB_mmuRsp_bypassTranslation <= io_cpu_memory_mmuRsp_bypassTranslation;
    end
    if(when_DataCache_l829) begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if(when_DataCache_l829_1) begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if(when_DataCache_l828) begin
      stageB_wayInvalidate <= stageA_wayInvalidate;
    end
    if(when_DataCache_l828_1) begin
      stageB_dataColisions <= stageA_dataColisions;
    end
    if(when_DataCache_l828_2) begin
      stageB_unaligned <= (|{((stageA_request_size == 2'b10) && (io_cpu_memory_address[1 : 0] != 2'b00)),((stageA_request_size == 2'b01) && (io_cpu_memory_address[0 : 0] != 1'b0))});
    end
    if(when_DataCache_l828_3) begin
      stageB_waysHitsBeforeInvalidate <= stageA_wayHits;
    end
    if(when_DataCache_l828_4) begin
      stageB_mask <= stageA_mask;
    end
    loader_valid_regNext <= loader_valid;
  end

  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      memCmdSent <= 1'b0;
      stageB_flusher_waitDone <= 1'b0;
      stageB_flusher_counter <= 7'h0;
      stageB_flusher_start <= 1'b1;
      loader_valid <= 1'b0;
      loader_waysAllocator <= 1'b1;
      loader_error <= 1'b0;
      loader_killReg <= 1'b0;
    end else begin
      if(io_mem_cmd_fire) begin
        memCmdSent <= 1'b1;
      end
      if(when_DataCache_l692) begin
        memCmdSent <= 1'b0;
      end
      if(io_cpu_flush_ready) begin
        stageB_flusher_waitDone <= 1'b0;
      end
      if(when_DataCache_l858) begin
        if(when_DataCache_l864) begin
          stageB_flusher_counter <= (stageB_flusher_counter + 7'h01);
          if(when_DataCache_l866) begin
            stageB_flusher_counter[6] <= 1'b1;
          end
        end
      end
      stageB_flusher_start <= (((((((! stageB_flusher_waitDone) && (! stageB_flusher_start)) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start) begin
        stageB_flusher_waitDone <= 1'b1;
        stageB_flusher_counter <= 7'h0;
        if(when_DataCache_l880) begin
          stageB_flusher_counter <= {1'b0,io_cpu_flush_payload_lineId};
        end
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))); // DataCache.scala:L1087
        `else
          if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
            $display("ERROR writeBack stuck by another plugin is not allowed"); // DataCache.scala:L1087
          end
        `endif
      `endif
      if(stageB_loaderValid) begin
        loader_valid <= 1'b1;
      end
      if(loader_kill) begin
        loader_killReg <= 1'b1;
      end
      if(when_DataCache_l1100) begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_done) begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
        loader_killReg <= 1'b0;
      end
      if(when_DataCache_l1128) begin
        loader_waysAllocator <= _zz_loader_waysAllocator[0:0];
      end
    end
  end


endmodule

module InstructionCache (
  input  wire          io_flush,
  input  wire          io_cpu_prefetch_isValid,
  output reg           io_cpu_prefetch_haltIt,
  input  wire [31:0]   io_cpu_prefetch_pc,
  input  wire          io_cpu_fetch_isValid,
  input  wire          io_cpu_fetch_isStuck,
  input  wire          io_cpu_fetch_isRemoved,
  input  wire [31:0]   io_cpu_fetch_pc,
  output wire [31:0]   io_cpu_fetch_data,
  input  wire [31:0]   io_cpu_fetch_mmuRsp_physicalAddress,
  input  wire          io_cpu_fetch_mmuRsp_isIoAccess,
  input  wire          io_cpu_fetch_mmuRsp_isPaging,
  input  wire          io_cpu_fetch_mmuRsp_allowRead,
  input  wire          io_cpu_fetch_mmuRsp_allowWrite,
  input  wire          io_cpu_fetch_mmuRsp_allowExecute,
  input  wire          io_cpu_fetch_mmuRsp_exception,
  input  wire          io_cpu_fetch_mmuRsp_refilling,
  input  wire          io_cpu_fetch_mmuRsp_bypassTranslation,
  output wire [31:0]   io_cpu_fetch_physicalAddress,
  input  wire          io_cpu_decode_isValid,
  input  wire          io_cpu_decode_isStuck,
  input  wire [31:0]   io_cpu_decode_pc,
  output wire [31:0]   io_cpu_decode_physicalAddress,
  output wire [31:0]   io_cpu_decode_data,
  output wire          io_cpu_decode_cacheMiss,
  output wire          io_cpu_decode_error,
  output wire          io_cpu_decode_mmuRefilling,
  output wire          io_cpu_decode_mmuException,
  input  wire          io_cpu_decode_isUser,
  input  wire          io_cpu_fill_valid,
  input  wire [31:0]   io_cpu_fill_payload,
  output wire          io_mem_cmd_valid,
  input  wire          io_mem_cmd_ready,
  output wire [31:0]   io_mem_cmd_payload_address,
  output wire [2:0]    io_mem_cmd_payload_size,
  input  wire          io_mem_rsp_valid,
  input  wire [511:0]  io_mem_rsp_payload_data,
  input  wire          io_mem_rsp_payload_error,
  input  wire [2:0]    _zz_when_Fetcher_l411,
  input  wire [31:0]   _zz_decodeStage_hit_data_1,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg        [511:0]  banks_0_spinal_port1;
  reg        [21:0]   ways_0_tags_spinal_port1;
  wire       [21:0]   _zz_ways_0_tags_port;
  reg        [31:0]   _zz_fetchStage_read_banksValue_0_data;
  wire       [3:0]    _zz_fetchStage_read_banksValue_0_data_1;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [6:0]    lineLoader_flushCounter;
  wire                when_InstructionCache_l339;
  reg                 _zz_when_InstructionCache_l343;
  wire                when_InstructionCache_l343;
  wire                when_InstructionCache_l352;
  reg                 lineLoader_cmdSent;
  wire                io_mem_cmd_fire;
  wire                when_Utils_l584;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  wire                lineLoader_write_tag_0_valid;
  wire       [5:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [19:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [5:0]    lineLoader_write_data_0_payload_address;
  wire       [511:0]  lineLoader_write_data_0_payload_data;
  wire                when_InstructionCache_l402;
  wire       [5:0]    _zz_fetchStage_read_banksValue_0_dataMem;
  wire                _zz_fetchStage_read_banksValue_0_dataMem_1;
  wire       [511:0]  fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [5:0]    _zz_fetchStage_read_waysValues_0_tag_valid;
  wire                _zz_fetchStage_read_waysValues_0_tag_valid_1;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [19:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [21:0]   _zz_fetchStage_read_waysValues_0_tag_valid_2;
  wire                when_InstructionCache_l460;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_isPaging;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_mmuRsp_bypassTranslation;
  wire                when_InstructionCache_l460_1;
  reg                 decodeStage_hit_tags_0_valid;
  reg                 decodeStage_hit_tags_0_error;
  reg        [19:0]   decodeStage_hit_tags_0_address;
  wire                decodeStage_hit_hits_0;
  wire                decodeStage_hit_valid;
  wire                when_InstructionCache_l460_2;
  reg        [31:0]   _zz_decodeStage_hit_data;
  wire       [31:0]   decodeStage_hit_data;
  wire                when_Fetcher_l411;
  reg [511:0] banks_0 [0:63];
  reg [21:0] ways_0_tags [0:63];

  assign _zz_ways_0_tags_port = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  assign _zz_fetchStage_read_banksValue_0_data_1 = io_cpu_fetch_pc[5 : 2];
  always @(posedge io_axiClk) begin
    if(_zz_1) begin
      banks_0[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @(posedge io_axiClk) begin
    if(_zz_fetchStage_read_banksValue_0_dataMem_1) begin
      banks_0_spinal_port1 <= banks_0[_zz_fetchStage_read_banksValue_0_dataMem];
    end
  end

  always @(posedge io_axiClk) begin
    if(_zz_2) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(posedge io_axiClk) begin
    if(_zz_fetchStage_read_waysValues_0_tag_valid_1) begin
      ways_0_tags_spinal_port1 <= ways_0_tags[_zz_fetchStage_read_waysValues_0_tag_valid];
    end
  end

  always @(*) begin
    case(_zz_fetchStage_read_banksValue_0_data_1)
      4'b0000 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
      4'b0001 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[63 : 32];
      4'b0010 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[95 : 64];
      4'b0011 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[127 : 96];
      4'b0100 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[159 : 128];
      4'b0101 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[191 : 160];
      4'b0110 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[223 : 192];
      4'b0111 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[255 : 224];
      4'b1000 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[287 : 256];
      4'b1001 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[319 : 288];
      4'b1010 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[351 : 320];
      4'b1011 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[383 : 352];
      4'b1100 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[415 : 384];
      4'b1101 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[447 : 416];
      4'b1110 : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[479 : 448];
      default : _zz_fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[511 : 480];
    endcase
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_0_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_tag_0_valid) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid) begin
      if(when_InstructionCache_l402) begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @(*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(when_InstructionCache_l339) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(when_InstructionCache_l343) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign when_InstructionCache_l339 = (! lineLoader_flushCounter[6]);
  assign when_InstructionCache_l343 = (! _zz_when_InstructionCache_l343);
  assign when_InstructionCache_l352 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign io_mem_cmd_fire = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 6],6'h0};
  assign io_mem_cmd_payload_size = 3'b110;
  assign when_Utils_l584 = (! lineLoader_valid);
  always @(*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if(when_Utils_l584) begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[6]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[6] ? lineLoader_address[11 : 6] : lineLoader_flushCounter[5 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[6];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = lineLoader_address[11 : 6];
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign when_InstructionCache_l402 = 1'b1;
  assign _zz_fetchStage_read_banksValue_0_dataMem = io_cpu_prefetch_pc[11 : 6];
  assign _zz_fetchStage_read_banksValue_0_dataMem_1 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = banks_0_spinal_port1;
  assign fetchStage_read_banksValue_0_data = _zz_fetchStage_read_banksValue_0_data;
  assign _zz_fetchStage_read_waysValues_0_tag_valid = io_cpu_prefetch_pc[11 : 6];
  assign _zz_fetchStage_read_waysValues_0_tag_valid_1 = (! io_cpu_fetch_isStuck);
  assign _zz_fetchStage_read_waysValues_0_tag_valid_2 = ways_0_tags_spinal_port1;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_fetchStage_read_waysValues_0_tag_valid_2[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_fetchStage_read_waysValues_0_tag_valid_2[1];
  assign fetchStage_read_waysValues_0_tag_address = _zz_fetchStage_read_waysValues_0_tag_valid_2[21 : 2];
  assign io_cpu_fetch_data = fetchStage_read_banksValue_0_data;
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuRsp_physicalAddress;
  assign when_InstructionCache_l460 = (! io_cpu_decode_isStuck);
  assign when_InstructionCache_l460_1 = (! io_cpu_decode_isStuck);
  assign decodeStage_hit_hits_0 = (decodeStage_hit_tags_0_valid && (decodeStage_hit_tags_0_address == decodeStage_mmuRsp_physicalAddress[31 : 12]));
  assign decodeStage_hit_valid = (|decodeStage_hit_hits_0);
  assign when_InstructionCache_l460_2 = (! io_cpu_decode_isStuck);
  assign decodeStage_hit_data = _zz_decodeStage_hit_data;
  assign io_cpu_decode_data = decodeStage_hit_data;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = (decodeStage_hit_tags_0_error || ((! decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute))));
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = (((! decodeStage_mmuRsp_refilling) && decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  assign when_Fetcher_l411 = (_zz_when_Fetcher_l411 != 3'b000);
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
    end else begin
      if(lineLoader_fire) begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire) begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid) begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush) begin
        lineLoader_flushPending <= 1'b1;
      end
      if(when_InstructionCache_l352) begin
        lineLoader_flushPending <= 1'b0;
      end
      if(io_mem_cmd_fire) begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire) begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid) begin
        if(io_mem_rsp_payload_error) begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @(posedge io_axiClk) begin
    if(io_cpu_fill_valid) begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(when_InstructionCache_l339) begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 7'h01);
    end
    _zz_when_InstructionCache_l343 <= lineLoader_flushCounter[6];
    if(when_InstructionCache_l352) begin
      lineLoader_flushCounter <= 7'h0;
    end
    if(when_InstructionCache_l460) begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuRsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuRsp_isIoAccess;
      decodeStage_mmuRsp_isPaging <= io_cpu_fetch_mmuRsp_isPaging;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuRsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuRsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuRsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuRsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuRsp_refilling;
      decodeStage_mmuRsp_bypassTranslation <= io_cpu_fetch_mmuRsp_bypassTranslation;
    end
    if(when_InstructionCache_l460_1) begin
      decodeStage_hit_tags_0_valid <= fetchStage_read_waysValues_0_tag_valid;
      decodeStage_hit_tags_0_error <= fetchStage_read_waysValues_0_tag_error;
      decodeStage_hit_tags_0_address <= fetchStage_read_waysValues_0_tag_address;
    end
    if(when_InstructionCache_l460_2) begin
      _zz_decodeStage_hit_data <= fetchStage_read_banksValue_0_data;
    end
    if(when_Fetcher_l411) begin
      _zz_decodeStage_hit_data <= _zz_decodeStage_hit_data_1;
    end
  end


endmodule

//StreamFifo_2 replaced by StreamFifo

//StreamFifo_1 replaced by StreamFifo

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          io_axiClk,
  input  wire          resetCtrl_axiReset
);

  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1304;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;

  assign when_Stream_l1304 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if(resetCtrl_axiReset) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1304) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
    end
  end


endmodule

module BufferCC (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          io_axiClk,
  input  wire          resetCtrl_systemReset
);

  (* async_reg = "true" , altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" *) reg                 buffers_0;
  (* altera_attribute = "-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW" , async_reg = "true" *) reg                 buffers_1;

  initial begin
  `ifndef SYNTHESIS
    buffers_0 = $urandom;
    buffers_1 = $urandom;
  `endif
  end

  assign io_dataOut = buffers_1;
  always @(posedge io_axiClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule
