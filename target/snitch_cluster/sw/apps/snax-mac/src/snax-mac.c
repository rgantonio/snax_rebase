// Copyright 2020 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "snrt.h"

#include "data.h"

int main() {
    // Set err value for checking
    int err = 0;

    uint64_t *local_a, *local_b, *local_c, *local_o_mac;

    // Allocate space in TCDM
    local_a = (uint64_t *)snrt_l1_next();
    local_b = local_a + VEC_LEN;
    local_c = local_b + VEC_LEN;
    local_o_mac = local_c + 1;

    size_t vector_size = VEC_LEN * sizeof(uint64_t);
    size_t scale_size = 1 * sizeof(uint64_t);

    uint32_t start_dma, end_dma;
    uint32_t start_csr, start_mac, end_mac;
    uint32_t break_poll;

    // Use data mover core to bring data from L3 to TCDM
    if (snrt_is_dm_core()) {

        start_dma = snrt_mcycle();
        snrt_dma_start_1d(local_a, A, vector_size);
        snrt_dma_start_1d(local_b, B, vector_size);
        snrt_dma_start_1d(local_c, &C, scale_size);
        end_dma = snrt_mcycle();

        printf("DMA cycles: %d \n", (end_dma - start_dma));
    }

    // Wait until DMA transfer is done
    snrt_cluster_hw_barrier();

    if (snrt_is_compute_core()) {

        // This marks the start of the accelerator style of MAC operation
        start_csr = snrt_mcycle();

        // Set addresses
        write_csr(0x3d0, (uint64_t)local_a);
        write_csr(0x3d1, (uint64_t)local_b);
        write_csr(0x3d2, (uint64_t)local_c);
        write_csr(0x3d3, (uint64_t)local_o_mac);

        // Set configs
        write_csr(0x3d4, 1);   // Number of iterations
        write_csr(0x3d5, 99);  // Vector length

        // Write start CSR to launch accelerator
        write_csr(0x3c0, 0);

        // Start of CSR start and poll until accelerator finishes
        start_mac = snrt_mcycle();

        while (1) {
            // 0x3c3 is the CSR address for accelerator status
            break_poll = read_csr(0x3c3);
            if (break_poll == 0) {
                break;
            };
        };

        end_mac = snrt_mcycle();

        if (*local_o_mac != 244977) {
            err += 1;
        }
        printf("CSR cycles: %d \n", (start_mac - start_csr));
        printf("MAC cycles: %d \n", (end_mac - start_mac));

    };

    return err;
}
