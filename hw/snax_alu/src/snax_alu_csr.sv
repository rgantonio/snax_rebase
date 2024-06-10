// Copyright 2024 KU Leuven.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Ryan Antonio <ryan.antonio@esat.kuleuven.be>

//-------------------------------
// Simple set of CSRs for the
// simple ALU accelerator
//-------------------------------
module snax_alu_csr #(
  parameter int unsigned RegRWCount   = 3,
  parameter int unsigned RegROCount   = 2,
  parameter int unsigned RegDataWidth = 32
)(
  //-------------------------------
  // Clocks and reset
  //-------------------------------
  input  logic                                    clk_i,
  input  logic                                    rst_ni,
  //-------------------------------
  // Register RW from CSR manager
  //-------------------------------
  input  logic [RegRWCount-1:0][RegDataWidth-1:0] csr_reg_set_i,
  input  logic                                    csr_reg_set_valid_i,
  output logic                                    csr_reg_set_ready_o,
  //-------------------------------
  // Register RO to CSR manager
  //-------------------------------
  output logic [RegROCount-1:0][RegDataWidth-1:0] csr_reg_ro_set_o,
  //-------------------------------
  // Direct register control signals
  // to and from the ALU PEs
  //-------------------------------
  // Signal to indicate an output was placed to memory
  input  logic                                    acc_output_success_i,
  // Signal to set ready signal for PE side
  // Accelerator is only ready when it's busy!
  output logic                                    acc_ready_o,
  // 4 ALU operations that go directly to the PE
  output logic               [1:0]                csr_alu_config_o
);

  //-------------------------------
  // R/W register set
  //-------------------------------
  logic [RegRWCount-1:0][RegDataWidth-1:0] csr_reg_rw_set;

  //-------------------------------
  // Control for updating register set
  //-------------------------------
  logic [RegDataWidth-1:0] csr_reg_rw_len;
  logic                    csr_reg_set_req_success;

  //-------------------------------
  // Internal registers that become
  // read only to the CSR manager
  //-------------------------------
  logic                    reg_ro_busy;
  logic [RegDataWidth-1:0] reg_ro_perf_counter;

  logic [RegDataWidth-1:0] len_counter;
  logic                    len_counter_finish;

  // The CSR manager is always ready to take
  // in new configurations
  assign csr_reg_set_ready_o = 1'b1;

  // When a valid-ready is successful
  assign csr_reg_set_req_success = csr_reg_set_valid_i && csr_reg_set_ready_o;

  //-------------------------------
  // Updating CSR registers
  //-------------------------------
  always_ff @ (posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
      for( int i = 0; i < RegRWCount; i++) begin
        csr_reg_rw_set[i] <= {RegDataWidth{1'b0}};
      end
    end else begin

      if(csr_reg_set_req_success) begin
        csr_reg_rw_set <= csr_reg_set_i;
      end else begin
        csr_reg_rw_set <= csr_reg_rw_set;
      end
    end
  end

  //-------------------------------
  // Register control signals directly
  // going to the accelerators
  //-------------------------------
  // This one is for the ALU configuration
  assign csr_alu_config_o = csr_reg_rw_set[0][1:0];

  // This one is for the total length
  // to indicate how long it takes for the process to finish
  assign csr_reg_rw_len = csr_reg_rw_set[1];

  // Indicate if accelerator is busy or not
  // Use this signal for the ready side of the PEs
  assign acc_ready_o = reg_ro_busy;

  // Some simple logic to indicate the last counter
  assign len_counter_finish = (len_counter == (csr_reg_rw_len - 1));

  // First one is when the accelerator will be busy
  // It's set when the start arrives
  // Then it's cleared when the len of elements is complete
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
      len_counter         <= {RegDataWidth{1'b0}};
      reg_ro_busy         <= 1'b0;
      reg_ro_perf_counter <= {RegDataWidth{1'b0}};
    end else begin

      // First logic for reg_ro_busy
      // End takes priority over start
      // Otherwise maintain the state
      if (len_counter_finish && acc_output_success_i) begin
        reg_ro_busy <= 1'b0;
      end else if (csr_reg_set_req_success) begin
        reg_ro_busy <= 1'b1;
      end else begin
        reg_ro_busy <= reg_ro_busy;
      end

      // This counter is continuous then
      // holds the value when the busy is 0
      if (csr_reg_set_req_success) begin
        reg_ro_perf_counter <= 1;
      end else if (reg_ro_busy && !len_counter_finish) begin
        // The !leng_counter_finish is to avoid adding 1
        // after the last signal that it finished
        reg_ro_perf_counter <= reg_ro_perf_counter + 1;
      end else begin
        reg_ro_perf_counter <= reg_ro_perf_counter;
      end

      // This one is just for tracking and setting busy
      // status of the accelerator
      if (len_counter_finish && acc_output_success_i) begin
        len_counter <= {RegDataWidth{1'b0}};
      end else if (acc_output_success_i) begin
        len_counter <= len_counter + 1;
      end else begin
        len_counter <= len_counter;
      end

    end
  end

  //-------------------------------
  // Register read only parts
  //-------------------------------
  assign csr_reg_ro_set_o[0] = {{(RegDataWidth-1){1'b0}},reg_ro_busy};
  assign csr_reg_ro_set_o[1] = reg_ro_perf_counter;

endmodule
