onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/clk_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/rst_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/hart_id_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/irq_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/flush_i_valid_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/flush_i_ready_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_addr_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_cacheable_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_data_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_valid_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/inst_ready_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_qreq_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_qvalid_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_qready_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_prsp_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_pvalid_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/acc_pready_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/data_req_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/data_rsp_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_valid_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_ready_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_va_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_ppn_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_pte_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/ptw_is_4mega_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/fpu_rnd_mode_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/fpu_fmt_mode_o}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/fpu_status_i}
add wave -noupdate {/tb_snax_cluster/i_cluster/gen_core[0]/i_snitch_cc/i_snitch/core_events_o}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2210 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 523
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {5250 ns}
add wave -position insertpoint  \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/clk_i} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/rst_ni} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_qvalid_i} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_qready_o} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_req_i} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_resp_o} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_pvalid_o} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_pready_i} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_tcdm_req_o} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_tcdm_rsp_i}
add wave -position insertpoint  \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/csr_cstate} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/csr_nstate}
add wave -position insertpoint  \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/cstate} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/nstate}
add wave -position insertpoint  \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/csr_addr}
add wave -position insertpoint  \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/clk_i} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/rst_ni} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_qvalid_i} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_qready_o} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_req_i} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_resp_o} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_pvalid_o} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_pready_i} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_tcdm_req_o} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_tcdm_rsp_i} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/CSRs} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/write_csr} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/read_csr} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/csr_read_done} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/csr_write_done} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/csr_addr} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/csr_cstate} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/csr_nstate} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/io_start_do} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/io_data_in_valid} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/io_a_io_in} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/io_b_io_in} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/io_data_out_valid} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/io_c_io_out} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/io_c_io_out_reg} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/read_tcdm} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/write_tcdm_1} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/write_tcdm_2} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/read_tcdm_done} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/write_tcdm_done} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/write_tcdm_done_1} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/write_tcdm_done_2} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_tcdm_rsp_i_p_valid} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/snax_tcdm_req_o_q_valid} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/cstate} \
{sim:/tb_snax_cluster/i_cluster/gen_core[0]/gen_yes_gemm/i_snax_gemm/nstate}