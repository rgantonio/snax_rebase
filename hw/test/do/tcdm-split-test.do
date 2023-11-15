onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_snitch_tcdm_split_io/clk_i
add wave -noupdate /tb_snitch_tcdm_split_io/rst_ni
add wave -noupdate /tb_snitch_tcdm_split_io/wr_req_i
add wave -noupdate /tb_snitch_tcdm_split_io/wr_rsp_o
add wave -noupdate /tb_snitch_tcdm_split_io/rd_req_i
add wave -noupdate /tb_snitch_tcdm_split_io/rd_rsp_o
add wave -noupdate /tb_snitch_tcdm_split_io/mem_req_o
add wave -noupdate /tb_snitch_tcdm_split_io/mem_rsp_i
add wave -noupdate -divider <NULL>
add wave -noupdate /tb_snitch_tcdm_split_io/i_snitch_tcdm_split_io_wrapper/req
add wave -noupdate /tb_snitch_tcdm_split_io/i_snitch_tcdm_split_io_wrapper/rsp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4167127 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 303
configure wave -valuecolwidth 314
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
WaveRestoreZoom {0 ps} {5880993 ps}
