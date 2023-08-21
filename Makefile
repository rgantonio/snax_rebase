# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

REGGEN = $(shell bender path register_interface)/vendor/lowrisc_opentitan/util/regtool.py

GENERATED_DOCS_DIR = docs/generated

.PHONY: all docs
.PHONY: clean clean-docs

all: docs
clean: clean-docs

docs: docs/generated/peripherals.md

clean-docs:
	rm -rf $(GENERATED_DOCS_DIR)

$(GENERATED_DOCS_DIR):
	mkdir -p $@

docs/generated/peripherals.md: hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral_reg.hjson | $(GENERATED_DOCS_DIR)
	$(REGGEN) -d $< > $@
