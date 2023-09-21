vlog -f ../flists/snitch_cluster.f +define+SYNTHESIS
vsim -voptargs=+acc work.tb_snax_cluster
do ../do/mac-test.do