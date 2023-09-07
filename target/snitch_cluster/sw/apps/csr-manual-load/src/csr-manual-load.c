#include "snrt.h"
#include "data.h"

static inline uint32_t load_reg (
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

int main() {


    uint32_t working_reg;
    uint32_t tcdm_addr_start_upper;
    uint32_t tcdm_addr;

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

        for (uint32_t i = 0; i < 20; i++){
            // Just read data from vanila MAC output
            working_reg = load_reg(tcdm_addr, i*4);
        };

        /*
        csr_number = 0x3d0;

        asm volatile(
            "csrw %[csr], %[new_value]"
            :
            : [csr] "i" (csr_number), [new_value] "r" (array_addr)
        );

        // Load address B
        asm volatile ("la %0, %1"
                      : "=r" (array_addr)
                      : "i" (B)
                      );

        csr_number = 0x3d1;
        
        // Load address C
        asm volatile(
            "csrw %[csr], %[new_value]"
            :
            : [csr] "i" (csr_number), [new_value] "r" (array_addr)
        );

        asm volatile ("la %0, %1"
                      : "=r" (array_addr)
                      : "i" (&C)
                      );

        csr_number = 0x3d2;
        
        // Load address output
        // Place on OUT2 for comparison
        asm volatile(
            "csrw %[csr], %[new_value]"
            :
            : [csr] "i" (csr_number), [new_value] "r" (array_addr)
        );

        asm volatile ("la %0, %1"
                      : "=r" (array_addr)
                      : "i" (&OUT2)
                      );

        csr_number = 0x3d3;
        
        asm volatile(
            "csrw %[csr], %[new_value]"
            :
            : [csr] "i" (csr_number), [new_value] "r" (array_addr)
        );

        // Set 1 iteration for the accelerator's task
        csr_number = 0x3d4;
        input_number = 1;
        
        asm volatile(
            "csrw %[csr], %[new_value]"
            :
            : [csr] "i" (csr_number), [new_value] "r" (input_number)
        );

        // Set vector length
        csr_number = 0x3d5;
        input_number = 19;
        
        asm volatile(
            "csrw %[csr], %[new_value]"
            :
            : [csr] "i" (csr_number), [new_value] "r" (input_number)
        );

        // Enable the accelerator
        csr_number = 0x3c0;
        input_number = 0;

        asm volatile(
            "csrw %[csr], %[new_value]"
            :
            : [csr] "i" (csr_number), [new_value] "r" (input_number)
        );

        // This marks the start of the polling
        uint32_t mac_csr_start = snrt_mcycle();
        
        asm volatile(
            "poll_loop:\n"
            "csrrs t2, 0x3c3, zero\n"
            "bne t2, zero, poll_loop\n"
        );

        // Just read data from vanila MAC output
        asm volatile(
            "lw %0, 0(%1)"
            : "=r" (out1_result)
            : "r" (&OUT)
        );

        // Read data from MAC, should be visible in traces
        asm volatile(
            "lw %0, 0(%1)"
            : "=r" (out2_result)
            : "r" (&OUT2)
        );

        uint32_t end_points = snrt_mcycle();

        */

        
    };

    // Read the mcycle CSR
    uint32_t end_cycle = snrt_mcycle();
}
