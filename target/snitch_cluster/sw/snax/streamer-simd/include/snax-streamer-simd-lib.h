// Copyright 2023 KU Leuven.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Xiaoling Yi <xiaoling.yi@esat.kuleuven.be>

#include <stdbool.h>
#include "snrt.h"
#include "stdint.h"

#pragma once

// the spatial unrolling of simd
# define vec_len 64

// set the address of the first CSR
// uint32_t csr_offset = 1024;

// generate the configuration for CSR0
int32_t gen_csr0_config(uint8_t input_zp_i, uint8_t output_zp_i,
                        uint8_t shift_i, uint8_t max_int_i);

// generate the configuration for CSR1
int32_t gen_csr1_config(uint8_t min_int_i, bool double_round_i);

// generate the configuration for CSR2
int32_t gen_csr2_config(uint32_t multiplier_i);

// set the configuration for the streamer
void set_streamer_simd_csr(int tempLoop0, int tempLoop1, int tempStride0_in,
                       int tempStride1_in, int tempStride0_out,
                       int tempStride1_out, int32_t delta_local_in, int32_t delta_local_out);

// start the streamer
void start_streamer_simd();

// set the configuration for the SIMD
void set_simd_csr(uint32_t csr0, uint32_t csr1, uint32_t csr2);

// start the SIMD
void start_simd();

// wait for the streamer to finish
void wait_streamer_simd();

// load the test data into TCDM
void load_simd_test_data(int tempLoop0, int tempLoop1, int tempStride0,
                         int tempStride1, int32_t* base_ptr_local,
                         int32_t* base_ptr_l2);

// check the result of the SIMD
uint32_t check_simd_result(int tempLoop0, int tempLoop1, int tempStride0,
                           int tempStride1, int8_t* base_ptr_local,
                           int8_t* base_ptr_l2);
