// Copyright 2023 KU Leuven.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Xiaoling Yi <xiaoling.yi@esat.kuleuven.be>

#include <stdbool.h>
#include "snrt.h"
#include "stdint.h"

#pragma once

// Set STREAMER configuration CSR
void set_streamer_csr();

// Set CSR to start STREAMER
void set_streamer_start();

// Set GEMM configuration CSR
void set_block_gemm_csr();

// Set CSR to start GEMM
void set_block_gemm_start();

void wait_streamer_gemm();
