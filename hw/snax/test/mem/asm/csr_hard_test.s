# ---------------------------------------------
# Copyright 2023 Katolieke Universiteit Leuven (KUL)
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
# Author: Ryan Antonio (ryan.antonio@kuleuven.be)
# ---------------------------------------------
nop
nop
nop
nop
nop
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 0
addi x2, x0, 1
sw x2, 0(x1)
addi x2, x0, 2
sw x2, 4(x1)
addi x2, x0, 3
sw x2, 8(x1)
addi x2, x0, 4
sw x2, 12(x1)
addi x2, x0, 5
sw x2, 16(x1)
addi x2, x0, 6
sw x2, 20(x1)
addi x2, x0, 7
sw x2, 24(x1)
addi x2, x0, 8
sw x2, 28(x1)
addi x2, x0, 9
sw x2, 32(x1)
addi x2, x0, 10
sw x2, 36(x1)
addi x2, x0, 11
sw x2, 40(x1)
addi x2, x0, 12
sw x2, 44(x1)
addi x2, x0, 13
sw x2, 48(x1)
addi x2, x0, 14
sw x2, 52(x1)
addi x2, x0, 15
sw x2, 56(x1)
addi x2, x0, 16
sw x2, 60(x1)
addi x2, x0, 17
sw x2, 64(x1)
addi x2, x0, 18
sw x2, 68(x1)
addi x2, x0, 19
sw x2, 72(x1)
addi x2, x0, 20
sw x2, 76(x1)
nop
nop
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 80
addi x2, x0, 1
sw x2, 0(x1)
sw x2, 4(x1)
sw x2, 8(x1)
sw x2, 12(x1)
sw x2, 16(x1)
sw x2, 20(x1)
sw x2, 24(x1)
sw x2, 28(x1)
sw x2, 32(x1)
sw x2, 36(x1)
sw x2, 40(x1)
sw x2, 44(x1)
sw x2, 48(x1)
sw x2, 52(x1)
sw x2, 56(x1)
sw x2, 60(x1)
sw x2, 64(x1)
sw x2, 68(x1)
sw x2, 72(x1)
sw x2, 76(x1)
nop
nop
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 160
addi x2, x0, 55
sw x2, 0(x1)
nop
nop
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 164
addi x2, x0, 0
sw x2, 0(x1)
nop
nop
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 0
csrrw x0, 976, x1 # offset = 960, addr = 16 for REG_ADDR_A = 0
lui x1, 65536
addi x1, x1, 80
csrrw x0, 977, x1 # offset = 960, addr = 17 for REG_ADDR_B = 132
lui x1, 65536
addi x1, x1, 160  
csrrw x0, 979, x1 # offset = 960, addr = 19 for REG_ADDR_D = 520
addi x6, x0, 1  
csrrw x0, 980, x6 # offset = 960, addr = 20 for REG_NB_ITER = 1
addi x6, x0, 19  
csrrw x0, 981, x6 # offset = 960, addr = 21 for REG_LEN_ITER = 9 + 1 (the + 1 is always there)
addi x6, x0, 1 
csrrw x0, 982, x6 # offset = 960, addr = 21 for simple mult
nop
nop
nop
nop
nop
csrrs x6, 976, x0
csrrs x6, 977, x0
csrrs x6, 978, x0
csrrs x6, 979, x0
csrrs x6, 980, x0
csrrs x6, 981, x0
nop
nop
nop
nop
nop
csrrw x0, 960, x0 # offset = 960, addr = 0 for MANDATORY TRIGGER
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 164
lw x5, 0(x1)
lw x5, 4(x1)
lw x5, 8(x1)
lw x5, 12(x1)
lw x5, 16(x1)
lw x5, 20(x1)
lw x5, 24(x1)
lw x5, 28(x1)
lw x5, 32(x1)
lw x5, 36(x1)
lw x5, 40(x1)
lw x5, 44(x1)
lw x5, 48(x1)
lw x5, 52(x1)
lw x5, 56(x1)
lw x5, 60(x1)
lw x5, 64(x1)
lw x5, 68(x1)
lw x5, 72(x1)
lw x5, 76(x1)
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
lui x1, 65536
addi x1, x1, 576
lw x10, 0(x1)
lui x1, 65536
addi x1, x1, 580
lw x11, 0(x1)
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop