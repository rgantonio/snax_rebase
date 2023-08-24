# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

.global tb_bootrom_start
.global tb_bootrom_end
tb_bootrom_start: .incbin "bootrom.bin"
tb_bootrom_end:
