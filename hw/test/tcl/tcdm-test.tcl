vlog -f ../flists/tcdm.f +define+SYNTHESIS
vsim -voptargs=+acc work.tb_snitch_tcdm
do ../do/tcdm-test.do
run 6000ns