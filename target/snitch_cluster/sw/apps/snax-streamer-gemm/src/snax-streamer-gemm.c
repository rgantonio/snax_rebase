// Copyright 2023 KU Leuven.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Xiaoling Yi <xiaoling.yi@esat.kuleuven.be>

#include "data.h"

#include "snax-gemm-lib.h"

#include "snax-streamer-gemm-lib.h"

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
    local_c = (int32_t*)(local_a + delta_local_b * sizeof(int8_t));

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
        uint32_t gemm_start = snrt_mcycle();

        // Set GEMM configuration CSR
        set_streamer_csr();
        set_streamer_start();

        // Set CSR to start GEMM and poll until GEMM accelerator finishes
        set_block_gemm_csr();
        set_block_gemm_start();

        wait_streamer_gemm();

        uint32_t gemm_end = snrt_mcycle();

        // Compare SNAX GEMM result with golden model
        err += check_result(local_c, C_golden, Batch, M, N, strideInnermostC,
                            strideHalfC, ldC, strideC, false);
    };

    // snrt_cluster_hw_barrier();

    // if (snrt_is_compute_core()) {
    //     // Also perform calculation on CPU

    //     // Read the mcycle CSR (this is our way to mark/delimit a specific
    //     code
    //     // region for benchmarking)
    //     uint32_t start_cycle = snrt_mcycle();

    //     batch_gemm_cpu(Batch, M, K, N, local_a, local_b, subtraction_a,
    //                    subtraction_b, C_cpu, strideInnermostA,
    //                    strideInnermostB, strideInnermostC, ldA, ldB, ldC,
    //                    strideA, strideB, strideC);

    //     // Read the mcycle CSR
    //     uint32_t end_cycle = snrt_mcycle();

    //     printf("cycle number for CPU to do matrix multiply: %d \n",
    //            end_cycle - start_cycle);
    //     // Compare CPU result with golden model
    //     err += check_result(C_cpu, C_golden, Batch, M, N, strideInnermostC,
    //                         strideHalfC, ldC, strideC, true);
    // }

    return err;
}
