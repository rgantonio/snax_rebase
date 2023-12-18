//--------------------------------
// Snitch TCDM Top-level Wrapper
//--------------------------------

`include "tcdm_interface/typedef.svh"
`include "mem_interface/typedef.svh"

package snitch_tcdm_split_pkg;

  // Top-level parameters for the snitch tcdm interconnect
  localparam int unsigned       NumInp                = 8;
  localparam int unsigned       NumOut                = 8;
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


module snitch_tcdm_wr_split_wrapper import snitch_tcdm_split_pkg::* (
  input  logic                      clk_i,
  input  logic                      rst_ni,
  input  tcdm_req_t [NumWrOnly-1:0] wr_req_i,
  output tcdm_rsp_t [NumWrOnly-1:0] wr_rsp_o,
  input  tcdm_req_t [NumRdOnly-1:0] rd_req_i,
  output tcdm_rsp_t [NumRdOnly-1:0] rd_rsp_o,
  output mem_req_t  [   NumOut-1:0] mem_req_o,
  input  mem_rsp_t  [   NumOut-1:0] mem_rsp_i
);

  mem_req_t [NumOut-1:0] mem_req_wr;
  mem_rsp_t [NumOut-1:0] mem_rsp_wr;

  mem_req_t [NumOut-1:0] mem_req_rd;
  mem_rsp_t [NumOut-1:0] mem_rsp_rd;

  // The remaining NumInp - NumWrOnly are dedicated for read only
  snitch_tcdm_interconnect #(
    .NumInp                ( NumWrOnly             ),
    .NumOut                ( NumOut                ),
    .tcdm_req_t            ( tcdm_req_t            ),
    .tcdm_rsp_t            ( tcdm_rsp_t            ),
    .mem_req_t             ( mem_req_t             ),
    .mem_rsp_t             ( mem_rsp_t             ),
    .MemAddrWidth          ( MemAddrWidth          ),
    .DataWidth             ( DataWidth             ),
    .user_t                ( tcdm_user_t           ),
    .MemoryResponseLatency ( MemoryResponseLatency ),
    .Radix                 ( Radix                 ),
    .Topology              ( Topology              )
  ) i_snitch_tcdm_wr (
    .clk_i                 ( clk_i                 ),
    .rst_ni                ( rst_ni                ),
    .req_i                 ( wr_req_i              ),
    .rsp_o                 ( wr_rsp_o              ),
    .mem_req_o             ( mem_req_wr            ),
    .mem_rsp_i             ( mem_rsp_wr            )
  );


  // The remaining NumInp - NumWrOnly are dedicated for read only
  snitch_tcdm_interconnect #(
    .NumInp                ( NumRdOnly             ),
    .NumOut                ( NumOut                ),
    .tcdm_req_t            ( tcdm_req_t            ),
    .tcdm_rsp_t            ( tcdm_rsp_t            ),
    .mem_req_t             ( mem_req_t             ),
    .mem_rsp_t             ( mem_rsp_t             ),
    .MemAddrWidth          ( MemAddrWidth          ),
    .DataWidth             ( DataWidth             ),
    .user_t                ( tcdm_user_t           ),
    .MemoryResponseLatency ( MemoryResponseLatency ),
    .Radix                 ( Radix                 ),
    .Topology              ( Topology              )
  ) i_snitch_tcdm_rd (
    .clk_i                 ( clk_i                 ),
    .rst_ni                ( rst_ni                ),
    .req_i                 ( req                   ),
    .rsp_o                 ( rsp                   ),
    .mem_req_o             ( mem_req_rd            ),
    .mem_rsp_i             ( mem_rsp_rd            )
  );

endmodule

