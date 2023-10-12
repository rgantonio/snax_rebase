//--------------------------------
// Snitch TCDM Testbench
//--------------------------------

`timescale 1ns/1ps

//--------------------------------
// Importing packages
//--------------------------------

import snitch_tcdm_pkg::*;

module tb_snitch_tcdm;

  logic clk_i;
  logic rst_ni;

  always begin #10; clk_i <= !clk_i; end

  tcdm_req_t [NumInp-1:0] req_i;
  tcdm_rsp_t [NumInp-1:0] rsp_o;
  mem_req_t  [NumOut-1:0] mem_req_o;
  mem_rsp_t  [NumOut-1:0] mem_rsp_i;

  snitch_tcdm_wrapper i_snitch_tcdm_wrapper (
    .clk_i     ( clk_i     ),
    .rst_ni    ( rst_ni    ),
    .req_i     ( req_i     ),
    .rsp_o     ( rsp_o     ),
    .mem_req_o ( mem_req_o ),
    .mem_rsp_i ( mem_rsp_i )
  );


  initial begin
    clk_i = 0;
    rst_ni = 0;
    req_i = '0;
    mem_rsp_i = '0;
    @(posedge clk_i);
    @(posedge clk_i);
    rst_ni = 1;
    @(posedge clk_i);
    @(posedge clk_i);
    #500;
  end

endmodule