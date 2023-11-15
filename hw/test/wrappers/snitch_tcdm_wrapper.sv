//--------------------------------
// Snitch TCDM Top-level Wrapper
//--------------------------------

`include "tcdm_interface/typedef.svh"
`include "mem_interface/typedef.svh"

package snitch_tcdm_pkg;

  // Top-level parameters for the snitch tcdm interconnect
  localparam int unsigned       NumInp                = 64;
  localparam int unsigned       NumOut                = 64;
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


module snitch_tcdm_wrapper (
  input                        logic                               clk_i,
  input                        logic                               rst_ni,
  input  snitch_tcdm_pkg::tcdm_req_t [snitch_tcdm_pkg::NumInp-1:0] req_i,
  output snitch_tcdm_pkg::tcdm_rsp_t [snitch_tcdm_pkg::NumInp-1:0] rsp_o,
  output snitch_tcdm_pkg::mem_req_t  [snitch_tcdm_pkg::NumOut-1:0] mem_req_o,
  input  snitch_tcdm_pkg::mem_rsp_t  [snitch_tcdm_pkg::NumOut-1:0] mem_rsp_i
);

  snitch_tcdm_interconnect #(
    .NumInp                ( snitch_tcdm_pkg::NumInp                ),
    .NumOut                ( snitch_tcdm_pkg::NumOut                ),
    .tcdm_req_t            ( snitch_tcdm_pkg::tcdm_req_t            ),
    .tcdm_rsp_t            ( snitch_tcdm_pkg::tcdm_rsp_t            ),
    .mem_req_t             ( snitch_tcdm_pkg::mem_req_t             ),
    .mem_rsp_t             ( snitch_tcdm_pkg::mem_rsp_t             ),
    .MemAddrWidth          ( snitch_tcdm_pkg::MemAddrWidth          ),
    .DataWidth             ( snitch_tcdm_pkg::DataWidth             ),
    .user_t                ( snitch_tcdm_pkg::tcdm_user_t           ),
    .MemoryResponseLatency ( snitch_tcdm_pkg::MemoryResponseLatency ),
    .Radix                 ( snitch_tcdm_pkg::Radix                 ),
    .Topology              ( snitch_tcdm_pkg::Topology              )
  ) i_snitch_tcdm_interconnect (
    .clk_i                 ( clk_i                 ),
    .rst_ni                ( rst_ni                ),
    .req_i                 ( req_i                 ),
    .rsp_o                 ( rsp_o                 ),
    .mem_req_o             ( mem_req_o                ),
    .mem_rsp_i             ( mem_rsp_i                )
  );

endmodule

