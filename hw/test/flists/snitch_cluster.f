#------------------------------------
# Includes
#------------------------------------
+incdir+../../../hw/reqrsp_interface/include
+incdir+../../../hw/mem_interface/include
+incdir+../../../hw/tcdm_interface/include
+incdir+../../../hw/snitch/include
+incdir+../../../hw/snitch_ssr/include
+incdir+../../../.bender/git/checkouts/axi-10c18867bc585e38/include
+incdir+../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/include
+incdir+../../../.bender/git/checkouts/register_interface-f4ec7adf92a180e1/include

#------------------------------------
# Tech cells
#------------------------------------
../../../.bender/git/checkouts/tech_cells_generic-1282165f7b690985/src/rtl/tc_sram.sv
../../../.bender/git/checkouts/tech_cells_generic-1282165f7b690985/src/rtl/tc_sram_impl.sv
../../../.bender/git/checkouts/tech_cells_generic-1282165f7b690985/src/rtl/tc_clk.sv
../../../.bender/git/checkouts/tech_cells_generic-1282165f7b690985/src/deprecated/cluster_clk_cells.sv

#------------------------------------
# Common cells
#------------------------------------
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/cf_math_pkg.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/ecc_pkg.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/cb_filter_pkg.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/spill_register_flushable.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/spill_register.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/isochronous_spill_register.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/fifo_v3.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_to_mem.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_mux.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_demux.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_arbiter.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_arbiter_flushable.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/rr_arb_tree.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_fifo.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_fifo.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/addr_decode_napot.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/addr_decode.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/cc_onehot.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/lzc.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/popcount.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/delta_counter.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/counter.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/shift_reg.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/shift_reg_gated.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_xbar.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/mem_to_banks_detailed.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/mem_to_banks.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_fork.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_intf.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_join.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_fork_dynamic.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/onehot_to_bin.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/sync.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/id_queue.sv
../../../.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_register.sv

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

#------------------------------------
# HWPE CTRL components
#------------------------------------
../../../.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_interfaces.sv
../../../.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_package.sv
../../../.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_regfile_latch.sv
../../../.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_seq_mult.sv
../../../.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_uloop.sv
../../../.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_regfile_latch_test_wrap.sv
../../../.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_regfile.sv
../../../.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_slave.sv

#------------------------------------
# HWPE Stream components
#------------------------------------
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/hwpe_stream_interfaces.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/hwpe_stream_package.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_assign.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_buffer.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_demux_static.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_deserialize.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_fence.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_merge.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_mux_static.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_serialize.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_split.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_ctrl.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_scm.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_addressgen.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_addressgen_v2.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_addressgen_v3.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_sink_realign.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_source_realign.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_strbgen.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_streamer_queue.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_assign.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_mux.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_mux_static.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_reorder.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_reorder_static.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_earlystall.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_earlystall_sidech.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_scm_test_wrap.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_sidech.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_fifo_load_sidech.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_source.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_fifo.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_fifo_load.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_fifo_store.sv
../../../.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_sink.sv

#--------------------------------------------
# Floating point components
#--------------------------------------------
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_pkg.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_cast_multi.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_classifier.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_divsqrt_multi.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_fma.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_fma_multi.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_sdotp_multi.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_sdotp_multi_wrapper.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_noncomp.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_opgroup_block.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_opgroup_fmt_slice.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_opgroup_multifmt_slice.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_rounding.sv
../../../.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_top.sv

#--------------------------------------------
# MAC Engine
#--------------------------------------------
../../../.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_package.sv
../../../.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_engine.sv
../../../.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_fsm.sv
../../../.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_streamer.sv
../../../.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_ctrl.sv
../../../.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_top.sv
../../../.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/wrap/mac_top_wrap.sv

#--------------------------------------------
# Regsiter interface
#--------------------------------------------
../../../.bender/git/checkouts/register_interface-f4ec7adf92a180e1/src/reg_intf.sv
../../../.bender/git/checkouts/register_interface-f4ec7adf92a180e1/src/axi_to_reg.sv
../../../.bender/git/checkouts/register_interface-f4ec7adf92a180e1/vendor/lowrisc_opentitan/src/prim_subreg.sv
../../../.bender/git/checkouts/register_interface-f4ec7adf92a180e1/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv
../../../.bender/git/checkouts/register_interface-f4ec7adf92a180e1/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv
../../../.bender/git/checkouts/register_interface-f4ec7adf92a180e1/src/axi_lite_to_reg.sv

#--------------------------------------------
# RISCV debug components
#--------------------------------------------
../../../.bender/git/checkouts/riscv-dbg-4d2e83f8d49c3adc/src/dm_pkg.sv

#--------------------------------------------
# Snitch stuff
#--------------------------------------------
../../../hw/future/src/mem_to_axi_lite.sv
../../../hw/future/src/idma_reg64_frontend_reg_pkg.sv
../../../hw/future/src/idma_tf_id_gen.sv
../../../hw/future/src/dma/axi_dma_data_path.sv
../../../hw/future/src/axi_interleaved_xbar.sv
../../../hw/future/src/axi_zero_mem.sv
../../../hw/future/src/idma_reg64_frontend_reg_top.sv
../../../hw/future/src/idma_reg64_frontend.sv
../../../hw/future/src/dma/axi_dma_data_mover.sv
../../../hw/future/src/dma/axi_dma_burst_reshaper.sv
../../../hw/future/src/dma/axi_dma_backend.sv
../../../hw/reqrsp_interface/src/reqrsp_pkg.sv
../../../hw/reqrsp_interface/src/reqrsp_intf.sv
../../../hw/reqrsp_interface/src/axi_to_reqrsp.sv
../../../hw/reqrsp_interface/src/reqrsp_cut.sv
../../../hw/reqrsp_interface/src/reqrsp_demux.sv
../../../hw/reqrsp_interface/src/reqrsp_iso.sv
../../../hw/reqrsp_interface/src/reqrsp_mux.sv
../../../hw/reqrsp_interface/src/reqrsp_to_axi.sv
../../../hw/mem_interface/src/mem_wide_narrow_mux.sv
../../../hw/mem_interface/src/mem_interface.sv
../../../hw/tcdm_interface/src/tcdm_interface.sv
../../../hw/tcdm_interface/src/axi_to_tcdm.sv
../../../hw/tcdm_interface/src/reqrsp_to_tcdm.sv
../../../hw/tcdm_interface/src/tcdm_mux.sv
../../../hw/snitch/src/snitch_pma_pkg.sv
../../../hw/snitch/src/riscv_instr.sv
../../../hw/snitch/src/csr_snax_def.sv
../../../hw/snitch/src/snitch_pkg.sv
../../../hw/snitch/src/snitch_regfile_ff.sv
../../../hw/snitch/src/snitch_lsu.sv
../../../hw/snitch/src/snitch_l0_tlb.sv
../../../hw/snitch/src/snitch.sv
../../../hw/snitch_vm/src/snitch_ptw.sv
../../../hw/snitch_dma/src/axi_dma_pkg.sv
../../../hw/snitch_dma/src/axi_dma_error_handler.sv
../../../hw/snitch_dma/src/axi_dma_perf_counters.sv
../../../hw/snitch_dma/src/axi_dma_twod_ext.sv
../../../hw/snitch_dma/src/axi_dma_tc_snitch_fe.sv
../../../hw/snitch_icache/src/snitch_icache_pkg.sv
../../../hw/snitch_icache/src/snitch_icache_l0.sv
../../../hw/snitch_icache/src/snitch_icache_refill.sv
../../../hw/snitch_icache/src/snitch_icache_lfsr.sv
../../../hw/snitch_icache/src/snitch_icache_lookup.sv
../../../hw/snitch_icache/src/snitch_icache_handler.sv
../../../hw/snitch_icache/src/snitch_icache.sv
../../../hw/snitch_ipu/src/snitch_ipu_pkg.sv
../../../hw/snitch_ipu/src/snitch_ipu_alu.sv
../../../hw/snitch_ipu/src/snitch_int_ss.sv
../../../hw/snitch_ssr/src/snitch_ssr_pkg.sv
../../../hw/snitch_ssr/src/snitch_ssr_switch.sv
../../../hw/snitch_ssr/src/snitch_ssr_credit_counter.sv
../../../hw/snitch_ssr/src/snitch_ssr_indirector.sv
../../../hw/snitch_ssr/src/snitch_ssr_intersector.sv
../../../hw/snitch_ssr/src/snitch_ssr_addr_gen.sv
../../../hw/snitch_ssr/src/snitch_ssr.sv
../../../hw/snitch_ssr/src/snitch_ssr_streamer.sv
../../../hw/snitch_cluster/src/snitch_amo_shim.sv
../../../hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral_reg_pkg.sv
../../../hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral_reg_top.sv
../../../hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral.sv
../../../hw/snitch_cluster/src/snitch_fpu.sv
../../../hw/snitch_cluster/src/snitch_sequencer.sv
../../../hw/snitch_cluster/src/snitch_tcdm_interconnect.sv
../../../hw/snitch_cluster/src/snitch_barrier.sv
../../../hw/snitch_cluster/src/snitch_fp_ss.sv
../../../hw/snitch_cluster/src/snitch_shared_muldiv.sv
../../../hw/snitch_cluster/src/snitch_cc.sv
../../../hw/snitch_cluster/src/snitch_clkdiv2.sv
../../../hw/snitch_cluster/src/snitch_hive.sv
../../../hw/snitch_cluster/src/snitch_cluster.sv

#--------------------------------------------
# SNAX stuff
#--------------------------------------------
../../../hw/snax_hwpe_mac/src/snax_hwpe_ctrl.sv
../../../hw/snax_hwpe_mac/src/snax_hwpe_to_reqrsp.sv
../../../hw/snax_hwpe_mac/src/snax_mac.sv

#--------------------------------------------
# SNAX Gemm Accelerator
#--------------------------------------------

../../../hw/snax_gemm/src/gemm.sv
../../../hw/snax_gemm/src/snax_gemm.sv

#--------------------------------------------
# Working testbench
#--------------------------------------------
../../../hw/test/tb/tb_snitch_cluster.sv

