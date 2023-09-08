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

static inline uint32_t extract_csr(
    uint16_t csr_number
){
    uint32_t result;
    
    asm volatile(
        "csrr %[result], %[csr]"
        : [result] "=r" (result)
        : [csr] "i" (csr_number)
    );

    return result;
};

int main() {

    // Set err value for checking
    int err = 0;

    uint32_t working_reg;
    uint32_t tcdm_addr_start;
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

        // Transfer data from global memory A to local memory (tcdm)
        // TODO: Change me to DMA transfers later
        tcdm_addr_start = 0x10000000;
        global_addr = get_array_addr(A);
        tcdm_A_addr = tcdm_addr_start;

        for (uint32_t i = 0; i < 20; i++){
            working_reg = lw_reg(global_addr, i*4);
            sw_reg(working_reg,tcdm_A_addr,i*4);
        };
        
        // Transfer data from global memory B to local memory (tcdm)
        global_addr = get_array_addr(B);
        tcdm_B_addr = tcdm_addr_start + 80;

        for (uint32_t i = 0; i < 20; i++){
            // Just read data from vanila MAC output
            working_reg = lw_reg(global_addr, i*4);
            sw_reg(working_reg,tcdm_B_addr,i*4);
        };

        // Transfer single byte from global memory C to local memory (tcdm)
        // This asm volatile extracts address of a single variable only
        asm volatile ("la %0, %1"
                      : "=r" (global_addr)
                      : "i" (&C)
                      );

        tcdm_C_addr = tcdm_addr_start + 160;

        working_reg = lw_reg(global_addr, 0);
        sw_reg(working_reg,tcdm_C_addr,0);

        // Get address of final output
        tcdm_OUT_addr = tcdm_addr_start + 164;

        // Start of csr setup
        uint32_t csr_setup = snrt_mcycle();

        // Set addresses
        update_csr(0x3d0, tcdm_A_addr);
        update_csr(0x3d1, tcdm_B_addr);
        update_csr(0x3d2, tcdm_C_addr);
        update_csr(0x3d3, tcdm_OUT_addr);
        
        // Set configs
        update_csr(0x3d4, 1);   // Number of iterations
        update_csr(0x3d5, 19);  // Vector length

        // CSR start
        update_csr(0x3c0, 0);
        
        // Start of CSR start and poll until accelerator finishes
        uint32_t mac_csr_start = snrt_mcycle();
        uint32_t break_poll;

        while(1){
            // 0x3c3 is the CSR address for accelerator status
            break_poll = extract_csr(0x3c3);
            if(break_poll == 0){
                break;
            };
        };

        uint32_t accelerator_end = snrt_mcycle();

        // Data memory is 64-bits per access, hence it is double word addressable
        // But HWPE accelerator and snitch cores are 32-bits (word) addressable
        // If output address is divisble by 8, we read normally
        // Otherwise, we get the lower 32-bits (get the lower word address)
        if(tcdm_OUT_addr % 8){
            final_output = lw_reg(tcdm_OUT_addr-4, 0);
        }else {
            final_output = lw_reg(tcdm_OUT_addr, 0);
        };

        if(final_output != 54763){
            err = 1;
        }
        
        uint32_t end_simulation = snrt_mcycle();
    };

    return err;
}
