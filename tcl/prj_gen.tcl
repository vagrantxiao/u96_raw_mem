proc add_src_to_project { dir } {
  set contents [glob -nocomplain -directory $dir *]
  foreach item $contents {
    if { [regexp {.*\.tcl} $item] } {
      source $item
    } else {
      add_files $item
    }
  }
}

set _prj_name_ "project_1"
create_project -force ${_prj_name_} ${_prj_name_} -part xcvc1902-vsvd1760-2MP-e-S
set_property board_part xilinx.com:vck5000:part0:1.0 [current_project]
#add_src_to_project ../v/vadd_bandwidth28r28w_placeholder
add_src_to_project ../v/vadd_bandwidth1r1w
source ../tcl/design_1_addr_noc_250MHz.tcl
update_compile_order -fileset sources_1
make_wrapper -files [get_files ${_prj_name_}/${_prj_name_}.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ${_prj_name_}/${_prj_name_}.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
update_compile_order -fileset sources_1
set_property top design_1_wrapper [current_fileset]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y0}] [get_bd_intf_pins /axi_noc_0/S00_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y1}] [get_bd_intf_pins /axi_noc_0/S01_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y1}] [get_bd_intf_pins /axi_noc_0/M00_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y2}] [get_bd_intf_pins /axi_noc_0/S02_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y2}] [get_bd_intf_pins /axi_noc_0/M01_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y3}] [get_bd_intf_pins /axi_noc_0/S03_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y3}] [get_bd_intf_pins /axi_noc_0/M02_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y4}] [get_bd_intf_pins /axi_noc_0/S04_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y4}] [get_bd_intf_pins /axi_noc_0/M03_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y5}] [get_bd_intf_pins /axi_noc_0/S05_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y5}] [get_bd_intf_pins /axi_noc_0/M04_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y6}] [get_bd_intf_pins /axi_noc_0/S06_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y6}] [get_bd_intf_pins /axi_noc_0/M05_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y1}] [get_bd_intf_pins /axi_noc_0/S07_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y1}] [get_bd_intf_pins /axi_noc_0/M06_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y2}] [get_bd_intf_pins /axi_noc_0/S08_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y2}] [get_bd_intf_pins /axi_noc_0/M07_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y3}] [get_bd_intf_pins /axi_noc_0/S09_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y3}] [get_bd_intf_pins /axi_noc_0/M08_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y4}] [get_bd_intf_pins /axi_noc_0/S10_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y4}] [get_bd_intf_pins /axi_noc_0/M09_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y5}] [get_bd_intf_pins /axi_noc_0/S11_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y5}] [get_bd_intf_pins /axi_noc_0/M10_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y6}] [get_bd_intf_pins /axi_noc_0/S12_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y6}] [get_bd_intf_pins /axi_noc_0/M11_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y0}] [get_bd_intf_pins /axi_noc_0/S13_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y0}] [get_bd_intf_pins /axi_noc_0/M12_AXI]



set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y0}] [get_bd_intf_pins /axi_noc_1/S00_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y1}] [get_bd_intf_pins /axi_noc_1/S01_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y1}] [get_bd_intf_pins /axi_noc_1/M00_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y2}] [get_bd_intf_pins /axi_noc_1/S02_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y2}] [get_bd_intf_pins /axi_noc_1/M01_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y3}] [get_bd_intf_pins /axi_noc_1/S03_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y3}] [get_bd_intf_pins /axi_noc_1/M02_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y4}] [get_bd_intf_pins /axi_noc_1/S04_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y4}] [get_bd_intf_pins /axi_noc_1/M03_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y5}] [get_bd_intf_pins /axi_noc_1/S05_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y5}] [get_bd_intf_pins /axi_noc_1/M04_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y6}] [get_bd_intf_pins /axi_noc_1/S06_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y6}] [get_bd_intf_pins /axi_noc_1/M05_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y0}] [get_bd_intf_pins /axi_noc_1/S07_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y0}] [get_bd_intf_pins /axi_noc_1/M06_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y1}] [get_bd_intf_pins /axi_noc_1/S08_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y1}] [get_bd_intf_pins /axi_noc_1/M07_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y2}] [get_bd_intf_pins /axi_noc_1/S09_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y2}] [get_bd_intf_pins /axi_noc_1/M08_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y3}] [get_bd_intf_pins /axi_noc_1/S10_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y3}] [get_bd_intf_pins /axi_noc_1/M09_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y4}] [get_bd_intf_pins /axi_noc_1/S11_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y4}] [get_bd_intf_pins /axi_noc_1/M10_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y5}] [get_bd_intf_pins /axi_noc_1/S12_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y5}] [get_bd_intf_pins /axi_noc_1/M11_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y6}] [get_bd_intf_pins /axi_noc_1/S13_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y6}] [get_bd_intf_pins /axi_noc_1/M12_AXI]






add_files -fileset constrs_1 ../xdc/pdef2.xdc
set_property target_constrs_file ../xdc/pdef2.xdc [current_fileset -constrset]

launch_runs synth_1 -jobs 16
wait_on_run synth_1

#open_run synth_1 -name synth_1
#write_checkpoint -force overlay.dcp

launch_runs impl_1 -to_step write_device_image -jobs 16
wait_on_run impl_1
#write_hw_platform -fixed -include_bit -force -file$ {_prj_name_}/design_1_wrapper.xsa
