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

#[[TODO]] - turn it a makefile

# remove the flist and generated
rm -rf syn_flist.tcl vsim_flist.tcl
rm -rf .bender
rm -rf Bender.lock
rm -rf target/$PROJECT/generated/*

# bender checkout and bender flist
mkdir -p target/$PROJECT/generated
bender checkout

# Chisel Architectures Generation

cd /repo
SIMD=`bender path snax-streamer-simd-dev`
cd $SIMD && make `pwd`/rtl/streamer-simd/streamer_simd_wrapper.sv

cd /repo
RESH=`bender path snax-data-reshuffler-dev`
cd $RESH && make `pwd`/tests/tb/tb_stream_dev_reshuffler.sv

cd /repo
RESH=`bender path snax-data-reshuffler-dev`
cd $RESH && make `pwd`/tests/tb/tb_stream_dev_reshuffler.sv

cd /repo
GEMM=`bender path snax-streamer-gemm-dev`
cd $GEMM && make `pwd`/rtl/streamer-gemm/streamer_gemm_wrapper.sv

