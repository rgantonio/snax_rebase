// Copyright 2020 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "snrt.h"

#include "data.h"

int main() {
    // Set err value for checking
    int err = 0;

    uint64_t *local_a, *local_b, *local_c, *local_o_base;

    // Allocate space in TCDM
    local_a = (uint64_t *)snrt_l1_next();
    local_b = local_a + VEC_LEN;
    local_c = local_b + VEC_LEN;
    local_o_base = local_c + 1;

    size_t vector_size = VEC_LEN * sizeof(uint64_t);
    size_t scale_size = 1 * sizeof(uint64_t);

    uint32_t start_dma, end_dma;
    uint32_t start_mac, end_mac;
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
        // Base computation without the MAC engine
        start_mac = snrt_mcycle();

        for (uint32_t i = 0; i < VEC_LEN; i++) {
            *(local_o_base) +=
                (*(local_a + (uint32_t)i)) * (*(local_b + (uint32_t)i));
        };

        *(local_o_base) += *local_c;

        end_mac = snrt_mcycle();

        if (*local_o_base != 244977) {
            err += 1;
        }

        printf("MAC cycles: %d \n", (end_mac - start_mac));
    };

    return err;
}
