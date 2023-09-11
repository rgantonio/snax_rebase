#include "snrt.h"
#include "data.h"

int main() {

    // Set err value for checking
    int err = 0;

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

    
    if(snrt_is_compute_core()){

        // This marks the start of the accelerator style of MAC operation
        uint32_t csr_set = snrt_mcycle();

        uint32_t acc_val = 0;

        uint32_t addr_a;
        uint32_t addr_b;
        uint32_t op_a;
        uint32_t op_b;

        for(int32_t i = 0; i < VEC_LEN; i++){

            acc_val += local_a[i] * local_b[i];
        };



        final_output = acc_val + *local_c;

        uint32_t mac_end = snrt_mcycle();

        if(final_output != 54763){
            err = 1;
        }
        
        uint32_t end_of_check = snrt_mcycle();
    };

    snrt_cluster_hw_barrier();

    return err;
}
