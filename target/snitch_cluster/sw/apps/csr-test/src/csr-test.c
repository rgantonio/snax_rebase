#include "snrt.h"
#include "data.h"


int main() {

    unsigned int array_addr;
    unsigned int csr_number;
    unsigned int input_number;
    unsigned int out1_result;
    unsigned int out2_result;

    // Read the mcycle CSR (this is our way to mark/delimit a specific code region for benchmarking)
    uint32_t start_cycle = snrt_mcycle();

    if(snrt_is_compute_core()){

        // This is the beginning of a simple MAC operation
        uint32_t mac_normal_start = snrt_mcycle();


        OUT = 0;

        for(uint32_t i = 0; i < 20; i++){
            OUT += A[i]*B[i];
        };

        OUT += C;

        // This marks the start of the accelerator style of MAC operation
        uint32_t pre_csr_cycle = snrt_mcycle();
        
        // Load address A 
        asm volatile ("la %0, %1"
                      : "=r" (array_addr)
                      : "i" (A)
                      );

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

        
    };

    // Read the mcycle CSR
    uint32_t end_cycle = snrt_mcycle();
}
