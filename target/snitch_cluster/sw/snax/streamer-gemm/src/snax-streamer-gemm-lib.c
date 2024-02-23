// Copyright 2023 KU Leuven.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Xiaoling Yi <xiaoling.yi@esat.kuleuven.be>

#include "snax-streamer-gemm-lib.h"

// Set STREAMER configuration CSR
void set_streamer_csr() { 

    write_csr(960, 2);
    write_csr(961, 2);
    write_csr(962, 2);

    write_csr(963, 256);
    write_csr(964, 0);
    write_csr(965, 512);

    write_csr(966, 256);
    write_csr(967, 512);
    write_csr(968, 0);

    write_csr(969, 0);
    write_csr(970, 256);
    write_csr(971, 512);

    write_csr(972, 1);
    write_csr(973, 8);
    write_csr(974, 1);
    write_csr(975, 8);
    write_csr(976, 4);
    write_csr(977, 32);

    write_csr(978, (uint32_t)(0 + (int8_t*)snrt_l1_next()));
    write_csr(979, (uint32_t)(64 + (int8_t*)snrt_l1_next()));
    write_csr(980, (uint32_t)(1024 + (int8_t*)snrt_l1_next()));
}

// Set CSR to start STREAMER
void set_streamer_start() { write_csr(981, 1); }

// Set GEMM configuration CSR
void set_block_gemm_csr(){
    write_csr(982, 2);
    write_csr(983, 2);
    write_csr(984, 2);

    write_csr(985, 0);
}

// Set CSR to start GEMM
void set_block_gemm_start() { write_csr(986, 1); }

void wait_streamer_gemm() {
    write_csr(981, 1);
    write_csr(986, 1);
}
