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
