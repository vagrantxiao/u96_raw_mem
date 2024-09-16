
TEMP_DIR := $(CURDIR)/build
VPP      := vivado -mode batch -source 
OVERLAY  := $(TEMP_DIR)/overlay.dcp
m=$(shell date)

all:

overlay: $(OVERLAY)

$(OVERLAY): $(CURDIR)/tcl/prj_gen.tcl
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VPP) $<

ooc:
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VPP) ../tcl/ooc_syn.tcl
    

git:
	git add .
	git commit -m "$(m)"
	git push origin main

clean:
	rm -rf $(TEMP_DIR)
