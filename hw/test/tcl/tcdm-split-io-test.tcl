vlog -f ../flists/tcdm-split.f +define+SYNTHESIS
vsim -voptargs=+acc work.tb_snitch_tcdm_split_io
do ../do/tcdm-split-test.do
run 6000ns