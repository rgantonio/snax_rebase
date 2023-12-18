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
addi x2, x0, 99
sw x2, 0(x1)
addi x2, x0, 67
sw x2, 4(x1)
addi x2, x0, 39
sw x2, 8(x1)
addi x2, x0, 26
sw x2, 12(x1)
addi x2, x0, 62
sw x2, 16(x1)
addi x2, x0, 14
sw x2, 20(x1)
addi x2, x0, 17
sw x2, 24(x1)
addi x2, x0, 18
sw x2, 28(x1)
addi x2, x0, 54
sw x2, 32(x1)
addi x2, x0, 16
sw x2, 36(x1)
addi x2, x0, 44
sw x2, 40(x1)
addi x2, x0, 9
sw x2, 44(x1)
addi x2, x0, 26
sw x2, 48(x1)
addi x2, x0, 85
sw x2, 52(x1)
addi x2, x0, 72
sw x2, 56(x1)
addi x2, x0, 66
sw x2, 60(x1)
addi x2, x0, 95
sw x2, 64(x1)
addi x2, x0, 65
sw x2, 68(x1)
addi x2, x0, 43
sw x2, 72(x1)
addi x2, x0, 84
sw x2, 76(x1)
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 80
addi x2, x0, 86
sw x2, 0(x1)
addi x2, x0, 10
sw x2, 4(x1)
addi x2, x0, 14
sw x2, 8(x1)
addi x2, x0, 11
sw x2, 12(x1)
addi x2, x0, 38
sw x2, 16(x1)
addi x2, x0, 41
sw x2, 20(x1)
addi x2, x0, 94
sw x2, 24(x1)
addi x2, x0, 82
sw x2, 28(x1)
addi x2, x0, 97
sw x2, 32(x1)
addi x2, x0, 25
sw x2, 36(x1)
addi x2, x0, 96
sw x2, 40(x1)
addi x2, x0, 71
sw x2, 44(x1)
addi x2, x0, 44
sw x2, 48(x1)
addi x2, x0, 59
sw x2, 52(x1)
addi x2, x0, 93
sw x2, 56(x1)
addi x2, x0, 38
sw x2, 60(x1)
addi x2, x0, 57
sw x2, 64(x1)
addi x2, x0, 21
sw x2, 68(x1)
addi x2, x0, 84
sw x2, 72(x1)
addi x2, x0, 29
sw x2, 76(x1)
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 160
addi x2, x0, 51
sw x2, 0(x1)
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 164
sw x0, 0(x1)
sw x0, 4(x1)
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
addi x1, x1, 0   # offset = 960, addr = 16 for REG_ADDR_A = 0
addi x2, x1, 80  # offset = 960, addr = 17 for REG_ADDR_B = 80
addi x3, x1, 164 # offset = 960, addr = 19 for REG_ADDR_D = 168
addi x4, x0, 1   # offset = 960, addr = 20 for REG_NB_ITER = 1
addi x5, x0, 19  
addi x6, x0, 1
csrrw x0, 976, x1 # offset = 960, addr = 16 for REG_ADDR_A = 0
csrrw x0, 977, x2 # offset = 960, addr = 17 for REG_ADDR_B = 80
csrrw x0, 979, x3 # offset = 960, addr = 19 for REG_ADDR_D = 168
csrrw x0, 980, x4  # offset = 960, addr = 20 for REG_NB_ITER = 1
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
csrrw x0, 981, x5 # offset = 960, addr = 21 for REG_LEN_ITER = 9 + 1 (the + 1 is always there)
csrrw x0, 982, x6 # offset = 960, addr = 22 for simple mult
csrrw x0, 960, x0 # offset = 960, addr = 0 for MANDATORY TRIGGER
csrrs x4, 963, x0
bne x4, x0, 0x1FFC
addi x7, x0, 0
csrrw x0, 965, x7 # Clear first
csrrw x0, 976, x1 # offset = 960, addr = 16 for REG_ADDR_A = 0
csrrw x0, 977, x2 # offset = 960, addr = 17 for REG_ADDR_B = 80
csrrw x0, 979, x3 # offset = 960, addr = 19 for REG_ADDR_D = 168
csrrw x0, 980, x4  # offset = 960, addr = 20 for REG_NB_ITER = 1
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
csrrw x0, 981, x5 # offset = 960, addr = 21 for REG_LEN_ITER = 9 + 1 (the + 1 is always there)
csrrw x0, 982, x6 # offset = 960, addr = 22 for simple mult
csrrw x0, 960, x0 # offset = 960, addr = 0 for MANDATORY TRIGGER
csrrs x4, 963, x0
bne x4, x0, 0x1FFC
addi x7, x0, 0
csrrw x0, 965, x7 # Clear first
csrrw x0, 976, x1 # offset = 960, addr = 16 for REG_ADDR_A = 0
csrrw x0, 977, x2 # offset = 960, addr = 17 for REG_ADDR_B = 80
csrrw x0, 979, x3 # offset = 960, addr = 19 for REG_ADDR_D = 168
csrrw x0, 980, x4  # offset = 960, addr = 20 for REG_NB_ITER = 1
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
csrrw x0, 981, x5 # offset = 960, addr = 21 for REG_LEN_ITER = 9 + 1 (the + 1 is always there)
csrrw x0, 982, x6 # offset = 960, addr = 22 for simple mult
csrrw x0, 960, x0 # offset = 960, addr = 0 for MANDATORY TRIGGER
csrrs x4, 963, x0
bne x4, x0, 0x1FFC
addi x7, x0, 0
csrrw x0, 965, x7 # Clear first
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