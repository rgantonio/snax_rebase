#------------------------------------
# Includes
#------------------------------------
+incdir+../../../hw/reqrsp_interface/include
+incdir+../../../hw/mem_interface/include
+incdir+../../../hw/tcdm_interface/include
+incdir+../../../.bender/git/checkouts/axi-10c18867bc585e38/include
+incdir+../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/include

#------------------------------------
# Common cells
#------------------------------------
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/cf_math_pkg.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/lzc.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/shift_reg.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/shift_reg_gated.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_xbar.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_demux.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/rr_arb_tree.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/spill_register_flushable.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/spill_register.sv

#--------------------------------------------
# RISCV debug components
#--------------------------------------------
../../../.bender/git/checkouts/riscv-dbg-4d2e83f8d49c3adc/src/dm_pkg.sv

#------------------------------------
# AXI components
#------------------------------------
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_pkg.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_intf.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_demux.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_mux.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_to_mem.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_demux_simple.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_to_detailed_mem.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_to_mem_interleaved.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_cut.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_xbar.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_to_axi_lite.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_atop_filter.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_burst_splitter.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_multicut.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_err_slv.sv
../../../.bender/git/checkouts/axi-10c18867bc585e38/src/axi_id_prepend.sv

#--------------------------------------------
# Snitch TCDM
#--------------------------------------------
../../../hw/snitch/src/snitch_pkg.sv
../../../hw/reqrsp_interface/src/reqrsp_pkg.sv
../../../hw/tcdm_interface/src/tcdm_interface.sv
../../../hw/tcdm_interface/src/axi_to_tcdm.sv
../../../hw/tcdm_interface/src/reqrsp_to_tcdm.sv
../../../hw/tcdm_interface/src/tcdm_mux.sv
../../../hw/snitch_cluster/src/snitch_tcdm_interconnect.sv

#--------------------------------------------
# Snitch TCDM Wrapper
#--------------------------------------------
../wrappers/snitch_tcdm_split_io_wrapper.sv

#--------------------------------------------
# Snitch TCDM TB
#--------------------------------------------
../tb/tb_snitch_tcdm_split_io.sv