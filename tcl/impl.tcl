
open_checkpoint overlay.dcp
read_checkpoint -cell design_1/vadd_bw_0/inst ./vad_bw.dcp
opt_design
place_design
phys_opt_design
route_design
write_checkpoint -force routed.dcp
update_design -cell design_1/vadd_bw_0/inst -black_box
write_checkpoint -force pr_overlay.dcp
