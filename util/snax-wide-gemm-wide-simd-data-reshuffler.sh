# Copyright 2024 KU Leuven, Belgium
#                INESC-ID, Portugal
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Guilherme Paim <gppaim@ieee.org>
# Abdelrahman Ayman Fathallah <abdelrahman.ayman@esat.kuleuven.be>

#######################
# Automagic Bash      #
#######################


export TARGET_ROOT=$HOME
export PROJECT=snitch_cluster
export CFG=snax-wide-gemm-wide-simd-data-reshuffler

cd /repo
bender script synopsys -t synthesis -t $PROJECT -t snax-streamer-gemm-dev -t snax-data-reshuffler-dev -t snax-streamer-simd-dev > syn_flist.tcl
bender script vsim -t $PROJECT -t snax-streamer-gemm-dev -t snax-data-reshuffler-dev -t snax-streamer-simd-dev -t test -t gate -t simulation > vsim_flist.tcl

python3 util/clustergen.py -c target/$PROJECT/cfg/$CFG.hjson -o target/$PROJECT/generated --wrapper --mem

