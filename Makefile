
TEMP_DIR := $(CURDIR)/build
VPP      := vivado -mode batch -source 
OVERLAY  := $(TEMP_DIR)/overlay.dcp
OOC      := $(TEMP_DIR)/vadd_bw.dcp
PROVERLAY:= $(TEMP_DIR)/proverlay.dcp
m=$(shell date)

all:$(PROVERLAY)

$(PROVERLAY): $(CURDIR)/tcl/impl.tcl $(OVERLAY) $(OOC)
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VPP) $<

overlay: $(OVERLAY)

$(OVERLAY): $(CURDIR)/tcl/prj_gen.tcl
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VPP) $<

ooc: $(OOC)

$(OOC): $(CURDIR)/tcl/ooc_syn.tcl
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VPP) $<

proverlay:$(PROVERLAY)


git:
	git add .
	git commit -m "$(m)"
	git push origin main

clean:
	rm -rf $(TEMP_DIR)
