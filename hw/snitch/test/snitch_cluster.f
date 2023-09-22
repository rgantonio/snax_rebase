#------------------------------------
# Includes
#------------------------------------
+incdir+/users/micas/xyi/snitch_cluster/hw/reqrsp_interface/include
+incdir+/users/micas/xyi/snitch_cluster/hw/mem_interface/include
+incdir+/users/micas/xyi/snitch_cluster/hw/tcdm_interface/include
+incdir+/users/micas/xyi/snitch_cluster/hw/snitch/include
+incdir+/users/micas/xyi/snitch_cluster/hw/snitch_ssr/include
+incdir+/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/include
+incdir+/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/include
+incdir+/users/micas/xyi/snitch_cluster/.bender/git/checkouts/register_interface-f4ec7adf92a180e1/include

#------------------------------------
# Tech cells
#------------------------------------
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/tech_cells_generic-1282165f7b690985/src/rtl/tc_sram.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/tech_cells_generic-1282165f7b690985/src/rtl/tc_sram_impl.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/tech_cells_generic-1282165f7b690985/src/rtl/tc_clk.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/tech_cells_generic-1282165f7b690985/src/deprecated/cluster_clk_cells.sv

#------------------------------------
# Common cells
#------------------------------------
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/cf_math_pkg.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/ecc_pkg.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/cb_filter_pkg.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/spill_register_flushable.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/spill_register.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/isochronous_spill_register.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/fifo_v3.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_to_mem.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_mux.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_demux.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_arbiter.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_arbiter_flushable.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/rr_arb_tree.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_fifo.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_fifo.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/addr_decode_napot.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/addr_decode.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/cc_onehot.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/lzc.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/popcount.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/delta_counter.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/counter.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/shift_reg.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/shift_reg_gated.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_xbar.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/mem_to_banks_detailed.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/mem_to_banks.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_fork.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_intf.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_join.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_fork_dynamic.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/onehot_to_bin.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/sync.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/id_queue.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/common_cells-02aa01ee4a3b2e52/src/stream_register.sv

#------------------------------------
# AXI components
#------------------------------------
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_pkg.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_intf.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_demux.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_mux.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_to_mem.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_to_detailed_mem.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_demux_simple.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_to_mem_interleaved.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_cut.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_xbar.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_to_axi_lite.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_atop_filter.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_burst_splitter.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_multicut.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_err_slv.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/axi-10c18867bc585e38/src/axi_id_prepend.sv

#------------------------------------
# HWPE CTRL components
#------------------------------------
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_interfaces.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_package.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_regfile_latch.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_seq_mult.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_uloop.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_regfile_latch_test_wrap.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_regfile.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-ctrl-078b13d4b656e469/rtl/hwpe_ctrl_slave.sv

#------------------------------------
# HWPE Stream components
#------------------------------------
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/hwpe_stream_interfaces.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/hwpe_stream_package.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_assign.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_buffer.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_demux_static.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_deserialize.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_fence.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_merge.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_mux_static.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_serialize.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/basic/hwpe_stream_split.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_ctrl.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_scm.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_addressgen.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_addressgen_v2.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_addressgen_v3.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_sink_realign.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_source_realign.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_strbgen.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_streamer_queue.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_assign.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_mux.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_mux_static.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_reorder.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_reorder_static.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_earlystall.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_earlystall_sidech.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_scm_test_wrap.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo_sidech.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/fifo/hwpe_stream_fifo.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_fifo_load_sidech.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_source.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_fifo.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_fifo_load.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/tcdm/hwpe_stream_tcdm_fifo_store.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-stream-b9a93a56b69d7039/rtl/streamer/hwpe_stream_sink.sv

#--------------------------------------------
# Floating point components
#--------------------------------------------
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_pkg.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_cast_multi.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_classifier.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_divsqrt_multi.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_fma.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_fma_multi.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_sdotp_multi.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_sdotp_multi_wrapper.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_noncomp.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_opgroup_block.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_opgroup_fmt_slice.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_opgroup_multifmt_slice.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_rounding.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/fpnew-afcaf014ef5047df/src/fpnew_top.sv

#--------------------------------------------
# MAC Engine
#--------------------------------------------
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_package.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_engine.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_fsm.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_streamer.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_ctrl.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/rtl/mac_top.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/hwpe-mac-engine-2e73b3bfb9f7ed43/wrap/mac_top_wrap.sv

#--------------------------------------------
# Regsiter interface
#--------------------------------------------
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/register_interface-f4ec7adf92a180e1/src/reg_intf.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/register_interface-f4ec7adf92a180e1/src/axi_to_reg.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/register_interface-f4ec7adf92a180e1/vendor/lowrisc_opentitan/src/prim_subreg.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/register_interface-f4ec7adf92a180e1/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/register_interface-f4ec7adf92a180e1/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/register_interface-f4ec7adf92a180e1/src/axi_lite_to_reg.sv


#--------------------------------------------
# RISCV debug components
#--------------------------------------------
/users/micas/xyi/snitch_cluster/.bender/git/checkouts/riscv-dbg-4d2e83f8d49c3adc/src/dm_pkg.sv

#--------------------------------------------
# Snitch stuff
#--------------------------------------------
/users/micas/xyi/snitch_cluster/hw/future/src/mem_to_axi_lite.sv
/users/micas/xyi/snitch_cluster/hw/future/src/idma_reg64_frontend_reg_pkg.sv
/users/micas/xyi/snitch_cluster/hw/future/src/idma_tf_id_gen.sv
/users/micas/xyi/snitch_cluster/hw/future/src/dma/axi_dma_data_path.sv
/users/micas/xyi/snitch_cluster/hw/future/src/axi_interleaved_xbar.sv
/users/micas/xyi/snitch_cluster/hw/future/src/axi_zero_mem.sv
/users/micas/xyi/snitch_cluster/hw/future/src/idma_reg64_frontend_reg_top.sv
/users/micas/xyi/snitch_cluster/hw/future/src/idma_reg64_frontend.sv
/users/micas/xyi/snitch_cluster/hw/future/src/dma/axi_dma_data_mover.sv
/users/micas/xyi/snitch_cluster/hw/future/src/dma/axi_dma_burst_reshaper.sv
/users/micas/xyi/snitch_cluster/hw/future/src/dma/axi_dma_backend.sv
/users/micas/xyi/snitch_cluster/hw/reqrsp_interface/src/reqrsp_pkg.sv
/users/micas/xyi/snitch_cluster/hw/reqrsp_interface/src/reqrsp_intf.sv
/users/micas/xyi/snitch_cluster/hw/reqrsp_interface/src/axi_to_reqrsp.sv
/users/micas/xyi/snitch_cluster/hw/reqrsp_interface/src/reqrsp_cut.sv
/users/micas/xyi/snitch_cluster/hw/reqrsp_interface/src/reqrsp_demux.sv
/users/micas/xyi/snitch_cluster/hw/reqrsp_interface/src/reqrsp_iso.sv
/users/micas/xyi/snitch_cluster/hw/reqrsp_interface/src/reqrsp_mux.sv
/users/micas/xyi/snitch_cluster/hw/reqrsp_interface/src/reqrsp_to_axi.sv
/users/micas/xyi/snitch_cluster/hw/mem_interface/src/mem_wide_narrow_mux.sv
/users/micas/xyi/snitch_cluster/hw/mem_interface/src/mem_interface.sv
/users/micas/xyi/snitch_cluster/hw/tcdm_interface/src/tcdm_interface.sv
/users/micas/xyi/snitch_cluster/hw/tcdm_interface/src/axi_to_tcdm.sv
/users/micas/xyi/snitch_cluster/hw/tcdm_interface/src/reqrsp_to_tcdm.sv
/users/micas/xyi/snitch_cluster/hw/tcdm_interface/src/tcdm_mux.sv
/users/micas/xyi/snitch_cluster/hw/snitch/src/snitch_pma_pkg.sv
/users/micas/xyi/snitch_cluster/hw/snitch/src/csr_snax_def.sv
/users/micas/xyi/snitch_cluster/hw/snitch/src/riscv_instr.sv
/users/micas/xyi/snitch_cluster/hw/snitch/src/snitch_pkg.sv
/users/micas/xyi/snitch_cluster/hw/snitch/src/snitch_regfile_ff.sv
/users/micas/xyi/snitch_cluster/hw/snitch/src/snitch_lsu.sv
/users/micas/xyi/snitch_cluster/hw/snitch/src/snitch_l0_tlb.sv
/users/micas/xyi/snitch_cluster/hw/snitch/src/snitch.sv
/users/micas/xyi/snitch_cluster/hw/snitch_vm/src/snitch_ptw.sv
/users/micas/xyi/snitch_cluster/hw/snitch_dma/src/axi_dma_pkg.sv
/users/micas/xyi/snitch_cluster/hw/snitch_dma/src/axi_dma_error_handler.sv
/users/micas/xyi/snitch_cluster/hw/snitch_dma/src/axi_dma_perf_counters.sv
/users/micas/xyi/snitch_cluster/hw/snitch_dma/src/axi_dma_twod_ext.sv
/users/micas/xyi/snitch_cluster/hw/snitch_dma/src/axi_dma_tc_snitch_fe.sv
/users/micas/xyi/snitch_cluster/hw/snitch_icache/src/snitch_icache_pkg.sv
/users/micas/xyi/snitch_cluster/hw/snitch_icache/src/snitch_icache_l0.sv
/users/micas/xyi/snitch_cluster/hw/snitch_icache/src/snitch_icache_refill.sv
/users/micas/xyi/snitch_cluster/hw/snitch_icache/src/snitch_icache_lfsr.sv
/users/micas/xyi/snitch_cluster/hw/snitch_icache/src/snitch_icache_lookup.sv
/users/micas/xyi/snitch_cluster/hw/snitch_icache/src/snitch_icache_handler.sv
/users/micas/xyi/snitch_cluster/hw/snitch_icache/src/snitch_icache.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ipu/src/snitch_ipu_pkg.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ipu/src/snitch_ipu_alu.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ipu/src/snitch_int_ss.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ssr/src/snitch_ssr_pkg.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ssr/src/snitch_ssr_switch.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ssr/src/snitch_ssr_credit_counter.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ssr/src/snitch_ssr_indirector.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ssr/src/snitch_ssr_intersector.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ssr/src/snitch_ssr_addr_gen.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ssr/src/snitch_ssr.sv
/users/micas/xyi/snitch_cluster/hw/snitch_ssr/src/snitch_ssr_streamer.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_amo_shim.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral_reg_pkg.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral_reg_top.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_fpu.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_sequencer.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_tcdm_interconnect.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_barrier.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_fp_ss.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_shared_muldiv.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_cc.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_clkdiv2.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_hive.sv
/users/micas/xyi/snitch_cluster/hw/snitch_cluster/src/snitch_cluster.sv


#--------------------------------------------
# SNAX stuff
#--------------------------------------------
// /users/micas/xyi/snitch_cluster/hw/snax/src/snax_riscv_def.sv
/users/micas/xyi/snitch_cluster/hw/snax_hwpe_mac/src/snax_hwpe_ctrl.sv
/users/micas/xyi/snitch_cluster/hw/snax_hwpe_mac/src/snax_hwpe_to_reqrsp.sv
// /users/micas/xyi/snitch_cluster/hw/snax_hwpe_mac/src/snax_remodel_mac_stream.sv
// /users/micas/xyi/snitch_cluster/hw/snax_hwpe_mac/src/snax_remodel_mac_top.sv
// /users/micas/xyi/snitch_cluster/hw/snax_hwpe_mac/src/snax_remodel_mac_top_wrap.sv
/users/micas/xyi/snitch_cluster/hw/snax_hwpe_mac/src/snax_mac.sv
// /users/micas/xyi/snitch_cluster/hw/snax/src/snax_snitch.sv
// /users/micas/xyi/snitch_cluster/hw/snax/src/snax_cc.sv
// /users/micas/xyi/snitch_cluster/hw/snax/src/snax_cluster.sv

#--------------------------------------------
# Working testbench
#--------------------------------------------
/users/micas/xyi/snitch_cluster/hw/snitch/test/tb_snitch_cluster.sv