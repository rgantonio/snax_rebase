#include "snrt.h"
#include "data.h"

static inline uint32_t get_array_addr(
    uint32_t array[]
){
    uint32_t global_addr;

    asm volatile ("la %0, %1"
                      : "=r" (global_addr)
                      : "i" (array)
                      );

    return global_addr;
};

static inline uint32_t lw_reg (
    uint32_t base_address,
    uint16_t immediate_offset
){
    uint32_t loaded_reg;

    asm volatile(
        "lw %[result], %[offset](%[base])"
        : [result ]"=r" (loaded_reg)
        : [offset] "i" (immediate_offset), [base] "r" (base_address)
    );

    return loaded_reg;
};

static inline void sw_reg(
    uint32_t reg_data,
    uint32_t base_address,
    uint16_t immediate_offset
){
    asm volatile(
        "sw %[reg_data], %[offset](%[base])"
        :
        : [reg_data] "r" (reg_data), [offset] "i" (immediate_offset), [base] "r" (base_address)
    );

    return;
};

static inline void update_csr(
    uint16_t csr_number,
    uint32_t new_value
){
    asm volatile(
        "csrw %[csr], %[new_value]"
        :
        : [csr] "i" (csr_number), [new_value] "r" (new_value)
    );

    return;
};

int main() {

    uint32_t working_reg;
    uint32_t tcdm_addr_start_upper;
    uint32_t tcdm_addr;
    uint32_t global_addr;
    uint32_t tcdm_A_addr;
    uint32_t tcdm_B_addr;
    uint32_t tcdm_C_addr;
    uint32_t tcdm_OUT_addr;
    uint32_t final_output;

    // Read the mcycle CSR (this is our way to mark/delimit a specific code region for benchmarking)
    uint32_t pre_is_compute_core = snrt_mcycle();

    if(snrt_is_compute_core()){

        // This marks the start of the accelerator style of MAC operation
        uint32_t pre_load = snrt_mcycle();

        tcdm_addr_start_upper = 0x10000;

        asm volatile ("lui %0, %1"
                      : "=r" (tcdm_addr)
                      : "i"  (tcdm_addr_start_upper)
                      );

        // Do for A
        global_addr = get_array_addr(A);
        tcdm_addr = tcdm_addr + (0x00000FFF & global_addr);
        tcdm_A_addr = tcdm_addr;

        for (uint32_t i = 0; i < 20; i++){
            // Just read data from vanila MAC output
            working_reg = lw_reg(global_addr, i*4);
            sw_reg(working_reg,tcdm_addr,i*4);
        };
        
        // Do for B
        global_addr = get_array_addr(B);
        tcdm_addr = tcdm_addr + (0x00000FFF & global_addr);
        tcdm_B_addr = tcdm_addr;

        for (uint32_t i = 0; i < 20; i++){
            // Just read data from vanila MAC output
            working_reg = lw_reg(global_addr, i*4);
            sw_reg(working_reg,tcdm_addr,i*4);
        };

        // Do for C
        asm volatile ("la %0, %1"
                      : "=r" (global_addr)
                      : "i" (&C)
                      );
        tcdm_addr = tcdm_addr + (0x00000FFF & global_addr);
        tcdm_C_addr = tcdm_addr;
        working_reg = lw_reg(global_addr, 0);
        sw_reg(working_reg,tcdm_addr,0);

        // Get address of final output
        asm volatile ("la %0, %1"
                      : "=r" (global_addr)
                      : "i" (&OUT)
                      );
        tcdm_addr = tcdm_addr + (0x00000FFF & global_addr);
        tcdm_OUT_addr = tcdm_addr;

        uint32_t csr_setup = snrt_mcycle();

        // Set addresses
        update_csr(0x3d0, tcdm_A_addr);
        update_csr(0x3d1, tcdm_B_addr);
        update_csr(0x3d2, tcdm_C_addr);
        update_csr(0x3d3, tcdm_OUT_addr);
        update_csr(0x3d4, 0);
        
        // Set configs
        update_csr(0x3d4, 1);
        update_csr(0x3d5, 1);

        // CSR start
        update_csr(0x3c0, 0);
        
        uint32_t mac_csr_start = snrt_mcycle();

        asm volatile(
            "poll_loop:\n"
            "csrrs t2, 0x3c3, zero\n"
            "bne t2, zero, poll_loop\n"
        );

        final_output = lw_reg(tcdm_OUT_addr, 0);

        // Read the mcycle CSR
        uint32_t end_simulation = snrt_mcycle();

        // For scanning purposes
        for (uint32_t i = 0; i < 20; i++){
            final_output = lw_reg(tcdm_A_addr, i*4);
        };

        for (uint32_t i = 0; i < 20; i++){
            final_output = lw_reg(tcdm_B_addr, i*4);
        };

        final_output = lw_reg(tcdm_C_addr, 0);

        final_output = lw_reg(tcdm_OUT_addr, 0);

        
    };

    
}
