#include "snrt.h"
#include "data.h"

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

    uint32_t *local_a, *local_b, *local_c, *local_o;

    // Allocate space in TCDM
    local_a   = (uint32_t *)snrt_l1_next();
    local_b   = local_a + VEC_LEN;
    local_c   = local_b + VEC_LEN;
    local_o   = local_c + 1;

    uint32_t dma_pre_load = snrt_mcycle();

    if (snrt_is_dm_core()) {
        size_t vector_size = VEC_LEN * sizeof(uint32_t);
        size_t scale_size  = 1 * sizeof(uint32_t);
        snrt_dma_start_1d(local_a, A, vector_size);
        snrt_dma_start_1d(local_b, B, vector_size);
        snrt_dma_start_1d(local_c, &C, scale_size);
    }

    snrt_cluster_hw_barrier();

    // Read the mcycle CSR (this is our way to mark/delimit a specific code region for benchmarking)
    uint32_t pre_is_compute_core = snrt_mcycle();

    
    if(snrt_is_compute_core()){

        // This marks the start of the accelerator style of MAC operation
        uint32_t pre_load = snrt_mcycle();

        // Start of csr setup
        uint32_t csr_setup = snrt_mcycle();

        // Set addresses
        update_csr(0x3d0, (uint32_t)local_a);
        update_csr(0x3d1, (uint32_t)local_b);
        update_csr(0x3d2, (uint32_t)local_c);
        update_csr(0x3d3, (uint32_t)local_o);
        
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
        if(((uint32_t)local_o) % 8){
            final_output = *(local_o-4);
        }else {
            final_output = *local_o;
        };

        if(final_output != 54763){
            err = 1;
        }
        
        uint32_t end_of_computation = snrt_mcycle();
    };

    snrt_cluster_hw_barrier();

    return err;
}
