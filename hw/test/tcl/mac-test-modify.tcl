vlog -f ../flists/snitch_cluster_modify.f +define+SYNTHESIS
vsim -voptargs=+acc work.tb_snax_cluster
do ../do/mac-test-modify.do
run 8000ns