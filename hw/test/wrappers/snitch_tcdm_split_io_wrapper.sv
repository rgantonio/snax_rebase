//--------------------------------
// Snitch TCDM Top-level Wrapper
//--------------------------------

`include "tcdm_interface/typedef.svh"
`include "mem_interface/typedef.svh"

package snitch_tcdm_split_pkg;

  // Top-level parameters for the snitch tcdm interconnect
  localparam int unsigned       NumInp                = 32;
  localparam int unsigned       NumOut                = 32;
  localparam int unsigned       NumWrOnly             = 16;
  localparam int unsigned       NumRdOnly             = NumInp - NumWrOnly;
  localparam int unsigned       MemAddrWidth          = 10;
  localparam int unsigned       PhysicalAddrWidth     = 48;
  localparam int unsigned       DataWidth             = 64;
  localparam int unsigned       TCDMAddrWidth         = 32;
  localparam int unsigned       CoreIDWidth           = 5;
  localparam int unsigned       MemoryResponseLatency = 1;
  localparam int unsigned       Radix                 = 2;
  localparam snitch_pkg::topo_e Topology              = snitch_pkg::LogarithmicInterconnect;
  

  // Type definitions
  typedef logic [    TCDMAddrWidth-1:0] tcdm_addr_t;
  typedef logic [     MemAddrWidth-1:0] tcdm_mem_addr_t;
  typedef logic [PhysicalAddrWidth-1:0] addr_t;
  typedef logic [        DataWidth-1:0] data_t;
  typedef logic [      DataWidth/8-1:0] strb_t;

  typedef struct packed {
    logic [CoreIDWidth-1:0] core_id;
    bit                     is_core;
  } tcdm_user_t;
  
  `TCDM_TYPEDEF_ALL(tcdm,     tcdm_addr_t, data_t, strb_t, tcdm_user_t)
  `MEM_TYPEDEF_ALL ( mem, tcdm_mem_addr_t, data_t, strb_t, tcdm_user_t)

endpackage


module snitch_tcdm_split_io_wrapper (
  input  logic                                                        clk_i,
  input  logic                                                        rst_ni,
  input  snitch_tcdm_split_pkg::tcdm_req_t [snitch_tcdm_split_pkg::NumWrOnly-1:0] wr_req_i,
  output snitch_tcdm_split_pkg::tcdm_rsp_t [snitch_tcdm_split_pkg::NumWrOnly-1:0] wr_rsp_o,
  input  snitch_tcdm_split_pkg::tcdm_req_t [snitch_tcdm_split_pkg::NumRdOnly-1:0] rd_req_i,
  output snitch_tcdm_split_pkg::tcdm_rsp_t [snitch_tcdm_split_pkg::NumRdOnly-1:0] rd_rsp_o,
  output snitch_tcdm_split_pkg::mem_req_t  [   snitch_tcdm_split_pkg::NumOut-1:0] mem_req_o,
  input  snitch_tcdm_split_pkg::mem_rsp_t  [   snitch_tcdm_split_pkg::NumOut-1:0] mem_rsp_i
);

  snitch_tcdm_split_pkg::tcdm_req_t [snitch_tcdm_split_pkg::NumInp-1:0] req;
  snitch_tcdm_split_pkg::tcdm_rsp_t [snitch_tcdm_split_pkg::NumInp-1:0] rsp;

  //--------------------------------
  // Wrappers
  //--------------------------------
  always_comb begin
    for(int i = 0; i < snitch_tcdm_split_pkg::NumWrOnly; i++) begin
      req[i].q.addr  = wr_req_i[i].q.addr;
      req[i].q.write = 1'b1;
      req[i].q.amo   = wr_req_i[i].q.amo;
      req[i].q.data  = wr_req_i[i].q.data;
      req[i].q.strb  = wr_req_i[i].q.strb;
      req[i].q.user  = wr_req_i[i].q.user;
      req[i].q_valid = wr_req_i[i].q_valid;

      wr_rsp_o[i].p.data  = rsp[i].p.data;
      wr_rsp_o[i].p_valid = rsp[i].p_valid;
      wr_rsp_o[i].q_ready = rsp[i].q_ready;
    end

    for(int i = 0; i < snitch_tcdm_split_pkg::NumRdOnly; i=i+1) begin
      req[i+snitch_tcdm_split_pkg::NumWrOnly].q.addr   = rd_req_i[i].q.addr;
      req[i+snitch_tcdm_split_pkg::NumWrOnly].q.write  = 1'b0;
      req[i+snitch_tcdm_split_pkg::NumWrOnly].q.amo    = rd_req_i[i].q.amo;
      req[i+snitch_tcdm_split_pkg::NumWrOnly].q.data   = rd_req_i[i].q.data;
      req[i+snitch_tcdm_split_pkg::NumWrOnly].q.strb   = rd_req_i[i].q.strb;
      req[i+snitch_tcdm_split_pkg::NumWrOnly].q.user   = rd_req_i[i].q.user;
      req[i+snitch_tcdm_split_pkg::NumWrOnly].q_valid  = rd_req_i[i].q_valid;

      rd_rsp_o[i].p.data  = rsp[i+snitch_tcdm_split_pkg::NumWrOnly].p.data;
      rd_rsp_o[i].p_valid = rsp[i+snitch_tcdm_split_pkg::NumWrOnly].p_valid;
      rd_rsp_o[i].q_ready = rsp[i+snitch_tcdm_split_pkg::NumWrOnly].q_ready;
    end

  end

  // The remaining NumInp - NumWrOnly are dedicated for read only
  snitch_tcdm_interconnect #(
    .NumInp                ( snitch_tcdm_split_pkg::NumInp                ),
    .NumOut                ( snitch_tcdm_split_pkg::NumOut                ),
    .tcdm_req_t            ( snitch_tcdm_split_pkg::tcdm_req_t            ),
    .tcdm_rsp_t            ( snitch_tcdm_split_pkg::tcdm_rsp_t            ),
    .mem_req_t             ( snitch_tcdm_split_pkg::mem_req_t             ),
    .mem_rsp_t             ( snitch_tcdm_split_pkg::mem_rsp_t             ),
    .MemAddrWidth          ( snitch_tcdm_split_pkg::MemAddrWidth          ),
    .DataWidth             ( snitch_tcdm_split_pkg::DataWidth             ),
    .user_t                ( snitch_tcdm_split_pkg::tcdm_user_t           ),
    .MemoryResponseLatency ( snitch_tcdm_split_pkg::MemoryResponseLatency ),
    .Radix                 ( snitch_tcdm_split_pkg::Radix                 ),
    .Topology              ( snitch_tcdm_split_pkg::Topology              )
  ) i_snitch_tcdm_interconnect (
    .clk_i                 ( clk_i     ),
    .rst_ni                ( rst_ni    ),
    .req_i                 ( req       ),
    .rsp_o                 ( rsp       ),
    .mem_req_o             ( mem_req_o ),
    .mem_rsp_i             ( mem_rsp_i )
  );

endmodule

