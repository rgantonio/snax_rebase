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
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 0
csrrw x0, 960, x1 # offset = 960, addr = 0 for REG_ADDR_A = 0
lui x1, 65536
addi x1, x1, 80
csrrw x0, 961, x1 # offset = 960, addr = 1 for REG_ADDR_B = 80
lui x1, 65536
addi x1, x1, 160  
csrrw x0, 962, x1 # offset = 960, addr = 2 for REG_ADDR_D = 160
nop
nop
nop
nop
nop
csrrs x6, 960, x0
csrrs x6, 961, x0
csrrs x6, 962, x0
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
addi x1, x1, 0
addi x2, x0, 0
sw x2, 0(x1)
addi x2, x0, 1
sw x2, 4(x1)
addi x2, x0, 2
sw x2, 8(x1)
addi x2, x0, 3
sw x2, 12(x1)
addi x2, x0, 4
sw x2, 16(x1)
addi x2, x0, 5
sw x2, 20(x1)
addi x2, x0, 6
sw x2, 24(x1)
addi x2, x0, 7
sw x2, 28(x1)
addi x2, x0, 8
sw x2, 32(x1)
addi x2, x0, 9
sw x2, 36(x1)
addi x2, x0, 10
sw x2, 40(x1)
addi x2, x0, 11
sw x2, 44(x1)
addi x2, x0, 12
sw x2, 48(x1)
addi x2, x0, 13
sw x2, 52(x1)
addi x2, x0, 14
sw x2, 56(x1)
addi x2, x0, 15
sw x2, 60(x1)
addi x2, x0, 16
sw x2, 64(x1)
addi x2, x0, 17
sw x2, 68(x1)
addi x2, x0, 18
sw x2, 72(x1)
addi x2, x0, 19
sw x2, 76(x1)
addi x2, x0, 20
sw x2, 80(x1)
addi x2, x0, 21
sw x2, 84(x1)
addi x2, x0, 22
sw x2, 88(x1)
addi x2, x0, 23
sw x2, 92(x1)
addi x2, x0, 24
sw x2, 96(x1)
addi x2, x0, 25
sw x2, 100(x1)
addi x2, x0, 26
sw x2, 104(x1)
addi x2, x0, 27
sw x2, 108(x1)
addi x2, x0, 28
sw x2, 112(x1)
addi x2, x0, 29
sw x2, 116(x1)
addi x2, x0, 30
sw x2, 120(x1)
addi x2, x0, 31
sw x2, 124(x1)
addi x2, x0, 32
sw x2, 128(x1)
addi x2, x0, 33
sw x2, 132(x1)
addi x2, x0, 34
sw x2, 136(x1)
addi x2, x0, 35
sw x2, 140(x1)
addi x2, x0, 36
sw x2, 144(x1)
addi x2, x0, 37
sw x2, 148(x1)
addi x2, x0, 38
sw x2, 152(x1)
addi x2, x0, 39
sw x2, 156(x1)
addi x2, x0, 40
sw x2, 160(x1)
addi x2, x0, 41
sw x2, 164(x1)
addi x2, x0, 42
sw x2, 168(x1)
addi x2, x0, 43
sw x2, 172(x1)
addi x2, x0, 44
sw x2, 176(x1)
addi x2, x0, 45
sw x2, 180(x1)
addi x2, x0, 46
sw x2, 184(x1)
addi x2, x0, 47
sw x2, 188(x1)
addi x2, x0, 48
sw x2, 192(x1)
addi x2, x0, 49
sw x2, 196(x1)
addi x2, x0, 50
sw x2, 200(x1)
addi x2, x0, 51
sw x2, 204(x1)
addi x2, x0, 52
sw x2, 208(x1)
addi x2, x0, 53
sw x2, 212(x1)
addi x2, x0, 54
sw x2, 216(x1)
addi x2, x0, 55
sw x2, 220(x1)
addi x2, x0, 56
sw x2, 224(x1)
addi x2, x0, 57
sw x2, 228(x1)
addi x2, x0, 58
sw x2, 232(x1)
addi x2, x0, 59
sw x2, 236(x1)
addi x2, x0, 60
sw x2, 240(x1)
addi x2, x0, 61
sw x2, 244(x1)
addi x2, x0, 62
sw x2, 248(x1)
addi x2, x0, 63
sw x2, 252(x1)
nop
nop
nop
nop
nop
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
sw x2, 80(x1)
sw x2, 84(x1)
sw x2, 88(x1)
sw x2, 92(x1)
sw x2, 96(x1)
sw x2, 100(x1)
sw x2, 104(x1)
sw x2, 108(x1)
sw x2, 112(x1)
sw x2, 116(x1)
sw x2, 120(x1)
sw x2, 124(x1)
sw x2, 128(x1)
sw x2, 132(x1)
sw x2, 136(x1)
sw x2, 140(x1)
sw x2, 144(x1)
sw x2, 148(x1)
sw x2, 152(x1)
sw x2, 156(x1)
sw x2, 160(x1)
sw x2, 164(x1)
sw x2, 168(x1)
sw x2, 172(x1)
sw x2, 176(x1)
sw x2, 180(x1)
sw x2, 184(x1)
sw x2, 188(x1)
sw x2, 192(x1)
sw x2, 196(x1)
sw x2, 200(x1)
sw x2, 204(x1)
sw x2, 208(x1)
sw x2, 212(x1)
sw x2, 216(x1)
sw x2, 220(x1)
sw x2, 224(x1)
sw x2, 228(x1)
sw x2, 232(x1)
sw x2, 236(x1)
sw x2, 240(x1)
sw x2, 244(x1)
sw x2, 248(x1)
sw x2, 252(x1)
nop
nop
nop
nop
addi x1, x0, 0
lui x1, 65536
addi x1, x1, 0
csrrw x0, 960, x1 # offset = 960, addr = 0 for REG_ADDR_A = 0
lui x1, 65536
addi x1, x1, 80
csrrw x0, 961, x1 # offset = 960, addr = 1 for REG_ADDR_B = 80
lui x1, 65536
addi x1, x1, 160  
csrrw x0, 962, x1 # offset = 960, addr = 2 for REG_ADDR_D = 160
nop
nop
nop
nop
nop
csrrs x6, 960, x0
csrrs x6, 961, x0
csrrs x6, 962, x0
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
csrrw x0, 963, x0 # offset = 960, addr = 3 for MANDATORY TRIGGER
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
addi x1, x0, 0 # Read data for clarity
lui x1, 65536
addi x1, x1, 160
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
lw x5, 80(x1)
lw x5, 84(x1)
lw x5, 88(x1)
lw x5, 92(x1)
lw x5, 96(x1)
lw x5, 100(x1)
lw x5, 104(x1)
lw x5, 108(x1)
lw x5, 112(x1)
lw x5, 116(x1)
lw x5, 120(x1)
lw x5, 124(x1)
lw x5, 128(x1)
lw x5, 132(x1)
lw x5, 136(x1)
lw x5, 140(x1)
lw x5, 144(x1)
lw x5, 148(x1)
lw x5, 152(x1)
lw x5, 156(x1)
lw x5, 160(x1)
lw x5, 164(x1)
lw x5, 168(x1)
lw x5, 172(x1)
lw x5, 176(x1)
lw x5, 180(x1)
lw x5, 184(x1)
lw x5, 188(x1)
lw x5, 192(x1)
lw x5, 196(x1)
lw x5, 200(x1)
lw x5, 204(x1)
lw x5, 208(x1)
lw x5, 212(x1)
lw x5, 216(x1)
lw x5, 220(x1)
lw x5, 224(x1)
lw x5, 228(x1)
lw x5, 232(x1)
lw x5, 236(x1)
lw x5, 240(x1)
lw x5, 244(x1)
lw x5, 248(x1)
lw x5, 252(x1)
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