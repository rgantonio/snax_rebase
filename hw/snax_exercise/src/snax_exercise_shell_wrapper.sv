// Copyright 2024 KU Leuven.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Ryan Antonio <ryan.antonio@esat.kuleuven.be>

//-------------------------------
// Accelerator wrapper
//-------------------------------
module snax_exercise_shell_wrapper #(
  // What parameters should we use?
  // This is a hint but you can still
  // have your own defined parameters
  parameter int unsigned InDataWidth  = 64,
  parameter int unsigned OutDataWidth = 128,
  parameter int unsigned RegRWCount   = 3,
  parameter int unsigned RegROCount   = 2,
  parameter int unsigned RegDataWidth = 32
)(
  //-------------------------------
  // Clocks and reset
  //-------------------------------
  input  logic clk_i,
  input  logic rst_ni,

  //-------------------------------
  // Accelerator ports
  //-------------------------------
  // What are the accelerator ports that you need to use?
  // You might want to check the `*_shell_wrapper` template
  // Alternatively, you could use the generations script

  //-------------------------------
  // CSR manager ports
  //-------------------------------
  // What are the control ports that you need to use?
  // You might want to check the `*_shell_wrapper` template
  // Alternatively, you could use the generations script
);

  //-------------------------------
  // What should we fill in here?
  //-------------------------------
  // Hint:
  // You only need to instantiate the top-level module
  // but you also need to re-wire things a bit

  // We instantiate it for you!
  snax_exercise_top #(
    .RegDataWidth             ( ),
    .DataWidth                ( )
  ) i_ snax_exercise_top (
    //-------------------------------
    // Clocks and reset
    //-------------------------------
    .clk_i                    ( ),
    .rst_ni                   ( ),
    //-------------------------------
    // Register RW from CSR manager
    //-------------------------------
    .csr_rw_reg_upper_i       ( ),
    .csr_rw_reg_lower_i       ( ),
    .csr_rw_reg_len_i         ( ),
    .csr_rw_reg_start_i       ( ),
    .csr_rw_reg_valid_i       ( ),
    .csr_rw_reg_ready_o       ( ),
    //-------------------------------
    // Register RO to CSR manager
    //-------------------------------
    .csr_ro_reg_busy_o        ( ),
    .csr_ro_reg_perf_count_o  ( ),
    //-------------------------------
    // Data path IO
    //-------------------------------
    .a_i                      ( ),
    .a_valid_i                ( ),
    .a_ready_o                ( ),
    .b_i                      ( ),
    .b_valid_i                ( ),
    .b_ready_o                ( ),
    .out_o                    ( ),
    .out_valid_o              ( ),
    .out_ready_i              ( )
  );

endmodule
