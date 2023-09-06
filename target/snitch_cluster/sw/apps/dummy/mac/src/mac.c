#include "snrt.h"
#include "data.h"

int main() {
    
    // Read the mcycle CSR (this is our way to mark/delimit a specific code region for benchmarking)
    uint32_t start_cycle = snrt_mcycle();

    if(snrt_is_compute_core()){

        OUT = 0;

        // Simple adding of data
        for(uint32_t i = 0; i < 20; i++){
            OUT += A[i]+B[i];
        };

        OUT += C;

    };

    // Read the mcycle CSR
    uint32_t end_cycle = snrt_mcycle();
}
