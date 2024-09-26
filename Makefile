
TEMP_DIR := $(CURDIR)/build
VPP      := vivado -source 

m=$(shell date)

all:
	mkdir -p $(TEMP_DIR)
	cd $(TEMP_DIR) && $(VPP) ../tcl/prj_gen.tcl

git:
	git add .
	git commit -m "$(m)"
	git push origin ylxiao/u96

clean:
	rm -rf $(TEMP_DIR)
