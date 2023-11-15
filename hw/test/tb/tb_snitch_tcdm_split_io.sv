//--------------------------------
// Snitch TCDM Testbench
//--------------------------------

`timescale 1ns/1ps

//--------------------------------
// Importing packages
//--------------------------------

import snitch_tcdm_pkg::*;

module tb_snitch_tcdm_split_io;

  logic clk_i;
  logic rst_ni;

  always begin #10; clk_i <= !clk_i; end

  tcdm_req_t [NumWrOnly-1:0] wr_req_i;
  tcdm_rsp_t [NumWrOnly-1:0] wr_rsp_o;
  tcdm_req_t [NumRdOnly-1:0] rd_req_i;
  tcdm_rsp_t [NumRdOnly-1:0] rd_rsp_o;
  mem_req_t  [NumOut-1:0] mem_req_o;
  mem_rsp_t  [NumOut-1:0] mem_rsp_i;

  snitch_tcdm_split_io_wrapper i_snitch_tcdm_split_io_wrapper (
    .clk_i        ( clk_i     ),
    .rst_ni       ( rst_ni    ),
    .wr_req_i     ( wr_req_i  ),
    .wr_rsp_o     ( wr_rsp_o  ),
    .rd_req_i     ( rd_req_i  ),
    .rd_rsp_o     ( rd_rsp_o  ),
    .mem_req_o    ( mem_req_o ),
    .mem_rsp_i    ( mem_rsp_i )
  ); 


  initial begin
    clk_i = 0;
    rst_ni = 0;
    wr_req_i = '0;
    rd_req_i = '0;
    mem_rsp_i = '0;
    @(posedge clk_i);
    @(posedge clk_i);
    rst_ni = 1;
    @(posedge clk_i);
    @(posedge clk_i);
    #500;
  end

endmodule