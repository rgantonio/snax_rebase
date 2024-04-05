# // Copyright 2023 KU Leuven.
# // Licensed under the Apache License, Version 2.0, see LICENSE for details.
# // SPDX-License-Identifier: Apache-2.0
# //
# // Xiaoling Yi <xiaoling.yi@esat.kuleuven.be>

import os
import hjson
import re

common_dir = {
    #// hardware configuration
    "Batch": 1,
    "strideC": 0,
    "spatial_len_0": 8,
    "spatial_len_1": 8,
    "tileSize": 8,
    "meshRow": 8,
    "meshCol": 8
}

def build_hw(arch_name):
    # Build the hardware and software
    cmd = "make clean && ./gen_acc_files.sh && ./gen_acc_files.sh"
    os.system(cmd)
    cmd = f"make CFG_OVERRIDE=cfg/{arch_name}.hjson bin/snitch_cluster.vlt > run.log"
    os.system(cmd)

def build_sw(sw_exp_name, wl_size):
    # gen run-time config
    if sw_exp_name == "snax-wide-gemm-data-reshuffler" or sw_exp_name == "snax-wide-gemm-snitch-reshuffler":
        run_time_cfg = {
            "tempLoop0_A": wl_size["K"],
            "tempLoop1_A": wl_size["M"],
            "DMAtempStride0_A_in": 64,
            "DMAtempStride1_A_in": 64 * wl_size["K"],
            "DMAspatialStride1_A_in": 8,
            "tempStride0_A_in": 8,
            "tempStride1_A_in": 64 * wl_size["K"],
            "spatialStride1_A_in": 16,
            "tempStride0_A_out": 64,
            "tempStride1_A_out": 64 * wl_size["K"],
            "spatialStride1_A_out": 8,
            "delta_local_A_in": 0,
            "delta_local_A_out": 64 * wl_size["K"] * wl_size["M"],
            "transpose_A": 0,
            "tempLoop0_B": wl_size["K"],
            "tempLoop1_B": wl_size["N"],
            "DMAtempStride0_B_in": 64,
            "DMAtempStride1_B_in": 64 * wl_size["K"],
            "DMAspatialStride1_B_in": 8,
            "tempStride0_B_in": 8,
            "tempStride1_B_in": 64 * wl_size["K"],
            "spatialStride1_B_in": 16,
            "tempStride0_B_out": 64,
            "tempStride1_B_out": 64 * wl_size["K"],
            "spatialStride1_B_out": 8,
            "delta_local_B_in": 64 * wl_size["K"] * wl_size["M"] * 2,
            "delta_local_B_out": 64 * wl_size["K"] * wl_size["M"] * 2 + 64 * wl_size["K"] * wl_size["N"],
            "transpose_B": 0,
            "tempLoop0_C": wl_size["N"],
            "tempLoop1_C": wl_size["M"],
            "DMAtempStride0_C_in": 256,
            "DMAtempStride1_C_in": 256 * wl_size["N"],
            "DMAspatialStride1_C_in": 32,
            "tempStride0_C_in": 512,
            "tempStride1_C_in": 32,
            "spatialStride1_C_in": 256,
            "tempStride0_C_out": 256,
            "tempStride1_C_out": 512,
            "spatialStride1_C_out": 32,
            "delta_local_C_in": 64 * wl_size["K"] * wl_size["M"] * 2 + 64 * wl_size["K"] * wl_size["N"] * 2,
            "delta_local_C_out": 8192,
            "transpose_C": 0,
        }
        run_time_cfg.update(common_dir)

    if sw_exp_name == "snax-streamer-gemm-data-layout":
        run_time_cfg = {
            "Batch": 1,
            "K": wl_size["K"],
            "N": wl_size["N"],
            "M": wl_size["M"],
            "DMA_strideInnermostA": 64,
            "DMA_strideInnermostB": 64,
            "DMA_ldA": 64 * wl_size["K"],
            "DMA_ldB": 64 * wl_size["K"],
            "spatialA": 16,
            "spatialB": 16,
            "spatialC": 32,
            "strideInnermostA": 8,
            "strideInnermostB": 8,
            "strideInnermostC": 256,
            "strideHalfC": 0,
            "ldA": 64 * wl_size["K"],
            "ldB": 64 * wl_size["K"],
            "ldC": 256 * wl_size["N"],
            "strideA": 0,
            "strideB": 0,
            "strideC": 0,
            "tileSize": 8,
            "meshRow": 8,
            "meshCol": 8,
            "delta_local_a": 0,
            "delta_local_b": 64 * wl_size["K"] * wl_size["M"],
            "delta_local_c": 64 * wl_size["K"] * wl_size["M"] + 64 * wl_size["K"] * wl_size["N"]
        }

    # Write the run-time config to a hjson file
    json_filename = f"sw/apps/{sw_exp_name}/data/params.hjson"
    with open(json_filename, 'w') as f:
        hjson.dump(run_time_cfg, f)
        
    # Build the software
    cmd = f"rm sw/apps/{sw_exp_name}/build/{sw_exp_name}.elf ; make DEBUG=ON sw > sw_build.log"
    os.system(cmd)


def run_sw_exp(sw_exp_name, wl_size):
    # build the software
    build_sw(sw_exp_name, wl_size)
    # Run the software experiment
    res_file = f"sw/apps/{sw_exp_name}/build/res.txt"
    cmd = f"bin/snitch_cluster.vlt sw/apps/{sw_exp_name}/build/{sw_exp_name}.elf > {res_file}"
    os.system(cmd)

def parse_traces(dr_core_id, dr_csr):
    # Parse the traces
    cmd = "make traces"
    os.system(cmd)
    dr_cycle_num = []
    trace_filename = f"logs/trace_hart_0000000{dr_core_id}.txt"

    # Parse the traces
    dr_reg = ""
    find_dr_num = False
    with open(trace_filename, 'r') as f:
        lines = f.readlines()
        for line in lines:
            if find_dr_num:
                if dr_reg in line:
                    cycle = re.findall(r'\b\d+\b', line)[-1]
                    dr_cycle_num.append(cycle)
                    find_dr_num = False
            else:
                if dr_csr in line:
                    find_dr_num = True
                    dr_reg = line.split()[-3][:-1]
    return dr_cycle_num

def parse_results(sw_exp_name, parse_dr_results = False, parse_dr_idx = 1, parse_dr_csr = "unknown_3d2"):
    res_dir = {
        "GeMM_cycle": 0,
        "SIMD_cycle": 0,
        "DR_cycle": 0,  
        "SN_R_cycle": [],
    }
    # Parse the results
    res_file = f"sw/apps/{sw_exp_name}/build/res.txt"
    with open(res_file, 'r') as f:
        lines = f.readlines()
        for line in lines:
            if "GEMM cycles:" in line:
                res_dir["GeMM_cycle"] = re.findall(r'\d+', line)
            if "SIMD cycles:" in line:
                res_dir["SIMD_cycle"] = re.findall(r'\d+', line)
            if "Reshuffle A cycles:" in line:
                res_dir["SN_R_cycle"].append(re.findall(r'\d+', line))
            if "Reshuffle B cycles:" in line:
                res_dir["SN_R_cycle"].append(re.findall(r'\d+', line))
    # Parse the DR results from traces (can not be parsed from the res.txt file)            
    if parse_dr_results:
        res_dir["DR_cycle"] = parse_traces(parse_dr_idx, parse_dr_csr)
    return res_dir

def profile_wide_gemm_snitch_reshuffler():
    sw_exp_name = "snax-wide-gemm-snitch-reshuffler"
    arch_name = "snax-wide-gemm"

    # wl_size = { "M": 2, "N": 2, "K": 2 }
    # build_hw(arch_name)
    # run_sw_exp(sw_exp_name, wl_size)
    # res_list.append(parse_results(sw_exp_name, parse_dr_results = False))
    # print(res_list)

    # wl_size = { "M": 2, "N": 2, "K": 4 }
    # run_sw_exp(sw_exp_name, wl_size)
    # res_list.append(parse_results(sw_exp_name, parse_dr_results = False))
    # print(res_list)

    wl_size = { "M": 2, "N": 5, "K": 4 }
    run_sw_exp(sw_exp_name, wl_size)
    res_list.append(parse_results(sw_exp_name, parse_dr_results = False))
    print(res_list)

def profile_wide_gemm_data_reshuffler():
    arch_name = "snax-wide-gemm-data-reshuffler"
    # build_hw(arch_name)

    sw_exp_name = "snax-wide-gemm-data-reshuffler"

    wl_size = { "M": 2, "N": 2, "K": 2 }
    run_sw_exp(sw_exp_name, wl_size)
    res_list.append(parse_results(sw_exp_name, parse_dr_results = True))
    print(res_list)

    # wl_size = { "M": 2, "N": 2, "K": 4 }
    # run_sw_exp(sw_exp_name, wl_size)
    # res_list.append(parse_results(sw_exp_name, parse_dr_results = False))
    # print(res_list)

    # wl_size = { "M": 2, "N": 5, "K": 4 }
    # run_sw_exp(sw_exp_name, wl_size)
    # res_list.append(parse_results(sw_exp_name, parse_dr_results = False))
    # print(res_list)

def profile_streamer_gemm():
    res_list = []
    arch_name = "snax-streamer-gemm"
    # build_hw(arch_name)

    sw_exp_name = "snax-streamer-gemm-data-layout"

    # wl_size = { "M": 2, "N": 2, "K": 2 }
    # run_sw_exp(sw_exp_name, wl_size)
    # res_list.append(parse_results(sw_exp_name, parse_dr_results = False))
    # print(res_list)

    # wl_size = { "M": 2, "N": 2, "K": 4 }
    # run_sw_exp(sw_exp_name, wl_size)
    # res_list.append(parse_results(sw_exp_name, parse_dr_results = False))
    # print(res_list)

    # wl_size = { "M": 2, "N": 5, "K": 4 }
    # run_sw_exp(sw_exp_name, wl_size)
    # res_list.append(parse_results(sw_exp_name, parse_dr_results = False))
    # print(res_list)

    wl_size = { "M": 2, "N": 5, "K": 6 }
    run_sw_exp(sw_exp_name, wl_size)
    res_list.append(parse_results(sw_exp_name, parse_dr_results = False))
    print(res_list)


res_list = []

# profile_streamer_gemm()
# profile_wide_gemm_data_reshuffler()
profile_wide_gemm_snitch_reshuffler()

# print(parse_traces(1, "unknown_3d2"))

