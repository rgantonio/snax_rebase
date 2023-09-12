//---------------------------------------------
// Copyright 2023 KULeuven
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
// Author: Ryan Antonio (ryan.antonio@esat.kuleuven.be)
// Description: Added definitions for the SNAX CSR addresses
// It's meant to be a range of address
//---------------------------------------------

// verilog_lint: waive-start parameter-name-style

package snax_riscv_def;
  localparam logic [11:0] CSR_SNAX_BEGIN      = 12'h3c0;
  localparam logic [11:0] CSR_SNAX_END        = 12'h5ff;
endpackage

// verilog_lint: waive-stop parameter-name-style
