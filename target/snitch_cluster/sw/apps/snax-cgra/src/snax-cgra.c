// Copyright 2023 KU Leuven.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Xiaoling Yi <xiaoling.yi@esat.kuleuven.be>

#include "data.h"

#include "snax-gemm-lib.h"

#include "snax-gemm-params.h"

// This tests the following:
// 1) Generate random data with gendata.py
// 2) Allocate space in TCDM
// 3) Write data from L3 to TCDM
// 4) Configure the csrs for performing a block GEMM
// 5) Launch the accelerator
// 6) Wait until the accelerator finishes
// 7) Check the result of the CPU and the accelerator vs the golden model
// (gendata.py)

int main() {
    // Set err value for checking
    int err = 0;

    // Prepare addresses in TCDM
    int8_t *local_a, *local_b;
    int32_t* local_c;

    // Allocate space in TCDM
    local_a = (int8_t*)snrt_l1_next();
    local_b = local_a + delta_local_a * sizeof(int8_t);
    local_c = (int32_t*)(local_b + delta_local_b * sizeof(int8_t));

    uint32_t dma_pre_load = snrt_mcycle();

    // Transfer data from L3 to L1
    // Using DMA only
    if (snrt_is_dm_core()) {
        load_input_data(Batch, M, K, N, local_a, local_b, A, B,
                        strideInnermostA, strideInnermostB, ldA, ldB, strideA,
                        strideB);
    }

    // Wait for DMA to finish
    snrt_cluster_hw_barrier();

    if (snrt_is_compute_core()) {
        // Just to test the write csr is working
        int tic = snrt_mcycle();
        write_csr(0x3c0, 0);
        write_csr(0x3c1, 1);
        write_csr(0x3c2, 2);
        write_csr(0x3c3, 3);
        int toc = snrt_mcycle();
        printf("Cycles: %d \n", toc - tic);
    }


    return 0;
}
