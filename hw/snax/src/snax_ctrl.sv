//----------------------------------------
// Copyright 2023 KULeuven
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Author: Ryan Antonio <ryan.antonio@esat.kuleuven.be>
// Description: SNAX control that converts accelerator ports
//              into CSR register read/write ports
//----------------------------------------

import riscv_instr::*;

module snax_ctrl # (
  parameter int unsigned DataWidth  = 64,
  parameter int unsigned AddrWidth  = 32,
  parameter int unsigned FifoWidth  = 8,
  parameter type acc_req_t          = logic,
  parameter type acc_rsp_t          = logic
)(
  //----------------------------------------
  // Clock and reset
  //----------------------------------------
  input  logic                 clk_i,
  input  logic                 rst_ni,
  //----------------------------------------
  // Snitch ports
  //----------------------------------------
  input  acc_req_t             sn_req_i,
  input  logic                 sn_req_valid_i,
  output logic                 sn_req_ready_o,
  output acc_rsp_t             sn_resp_o,
  output logic                 sn_rsp_valid_o,
  input  logic                 sn_rsp_ready_i,

  //----------------------------------------
  // Translated accelerator ports
  //----------------------------------------
  output logic [AddrWidth-1:0] acc_req_addr_o,
  output logic [DataWidth-1:0] acc_req_data_o,
  output logic                 acc_req_wen_o,
  output logic                 acc_req_valid_o,
  input  logic                 acc_req_ready_i,
  input  logic [DataWidth-1:0] acc_rsp_data_i,
  input  logic                 acc_rsp_valid_i,
  output logic                 acc_rsp_ready_o
);

  // Local parameter for starting register
  localparam int unsigned CsrAddrOffset = 32'h3c0;

  //----------------------------------------
  // Decoding of SNAX ports to accelerator ports
  //----------------------------------------
  always_comb begin

    // CSR address is stored in the data_argb port
    // Note that the starting address is from 0x3c0
    // SNAX CSR addresses are in range [0x3c0,0x5ff]
    // In decimal form that is [960, 1535]
    acc_req_addr_o = sn_req_i.data_argb[31:0] - CsrAddrOffset;

    // Write enable is sticky
    // because all RISCV CSR instructions
    // are read and write
    acc_req_wen_o = 1'b1;

    // Need to decode the data to be written
    // Depending on the CSR instruction
    unique casez (sn_req_i.data_op)
      CSRRW, CSRRWI: begin acc_req_data_o =   sn_req_i.data_arga[31:0] end
      CSRRS, CSRRSI: begin acc_req_data_o =   sn_req_i.data_arga[31:0] | acc_rsp_data_i[31:0] end
      CSRRC, CSRRCI: begin acc_req_data_o = !(sn_req_i.data_arga[31:0] | acc_rsp_data_i[31:0]) end
      default: begin
        acc_req_data_o = sn_req_i.data_arga[31:0];
      end
    endcase

    // Valid and ready responses should be "pass-throughs"
    acc_req_valid_o = sn_req_valid_i;
    sn_req_ready_o  = acc_req_ready_i;

    // Response ports are actually pass throughs
    // Let error be 0 since it's not used
    sn_resp_o.error = 1'b0; 
    sn_resp_o.id    = sn_req_i.id;
    sn_resp_o.data  = acc_rsp_data_i;

    // Valid and ready responses should be "pass-throughs"
    sn_rsp_valid_o  = acc_rsp_valid_i;
    acc_rsp_ready_o = sn_rsp_ready_i;

  end



endmodule
