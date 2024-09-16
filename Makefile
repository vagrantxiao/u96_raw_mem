
TEMP_DIR := $(CURDIR)/build
VPP      := vivado -source 

m=$(shell date)

all:
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VPP) ../tcl/prj_gen.tcl

ooc:
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VPP) ../tcl/ooc_syn.tcl
    

git:
	git add .
	git commit -m "$(m)"
	git push origin main

clean:
	rm -rf $(TEMP_DIR)
