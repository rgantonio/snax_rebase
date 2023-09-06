#include "snrt.h"
#include "data.h"

int main() {
    // Read the mcycle CSR (this is our way to mark/delimit a specific code region for benchmarking)
    uint32_t start_cycle = snrt_mcycle();

    // Simple adding of data
    if(snrt_is_compute_core()){
        OUT[0] = A+B; // 686 + 448
        OUT[1] = C-D; // 170 - 775 
        OUT[2] = (A-D)+(C-B); //(686 - 775) + (170 - 448)
    };

    // Read the mcycle CSR
    uint32_t end_cycle = snrt_mcycle();
}
