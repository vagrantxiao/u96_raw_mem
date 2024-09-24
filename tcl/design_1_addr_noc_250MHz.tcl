
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2022.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# addr_config, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw, vadd_bw

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvc1902-vsvd1760-2MP-e-S
   set_property BOARD_PART xilinx.com:vck5000:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:axi_noc:1.0\
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:versal_cips:3.3\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
addr_config\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
vadd_bw\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: pr_region
proc create_hier_cell_pr_region { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_pr_region() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI3

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI4

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI5

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI6

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI7

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI8

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI9

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI10

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI11

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI12

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI13

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI14

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI15

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI16

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI17

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI18

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI19

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI20

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI21

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI22

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI23

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI24

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI25

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI26

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem0

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem1

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem4

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem5

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem6

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem7

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem8

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem9

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem10

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem11

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem12

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem13

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem14

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem15

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem16

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem17

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem18

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem19

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem20

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem21

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem22

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem23

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem24

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem25

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem26

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_rmem27


  # Create pins
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -type rst ext_reset_in

  # Create instance: pr_reset, and set properties
  set pr_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 pr_reset ]

  # Create instance: smartconnect_1, and set properties
  set smartconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_1 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_1


  # Create instance: smartconnect_2, and set properties
  set smartconnect_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_2 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_2


  # Create instance: smartconnect_3, and set properties
  set smartconnect_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_3 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_3


  # Create instance: smartconnect_4, and set properties
  set smartconnect_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_4 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_4


  # Create instance: smartconnect_5, and set properties
  set smartconnect_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_5 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_5


  # Create instance: smartconnect_6, and set properties
  set smartconnect_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_6 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_6


  # Create instance: smartconnect_7, and set properties
  set smartconnect_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_7 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_7


  # Create instance: smartconnect_8, and set properties
  set smartconnect_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_8 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_8


  # Create instance: smartconnect_9, and set properties
  set smartconnect_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_9 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_9


  # Create instance: smartconnect_10, and set properties
  set smartconnect_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_10 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_10


  # Create instance: smartconnect_11, and set properties
  set smartconnect_11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_11 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_11


  # Create instance: smartconnect_12, and set properties
  set smartconnect_12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_12 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_12


  # Create instance: smartconnect_13, and set properties
  set smartconnect_13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_13 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_13


  # Create instance: smartconnect_14, and set properties
  set smartconnect_14 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_14 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_14


  # Create instance: smartconnect_15, and set properties
  set smartconnect_15 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_15 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_15


  # Create instance: smartconnect_16, and set properties
  set smartconnect_16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_16 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_16


  # Create instance: smartconnect_17, and set properties
  set smartconnect_17 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_17 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_17


  # Create instance: smartconnect_18, and set properties
  set smartconnect_18 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_18 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_18


  # Create instance: smartconnect_19, and set properties
  set smartconnect_19 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_19 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_19


  # Create instance: smartconnect_20, and set properties
  set smartconnect_20 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_20 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_20


  # Create instance: smartconnect_21, and set properties
  set smartconnect_21 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_21 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_21


  # Create instance: smartconnect_22, and set properties
  set smartconnect_22 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_22 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_22


  # Create instance: smartconnect_23, and set properties
  set smartconnect_23 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_23 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_23


  # Create instance: smartconnect_24, and set properties
  set smartconnect_24 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_24 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_24


  # Create instance: smartconnect_25, and set properties
  set smartconnect_25 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_25 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_25


  # Create instance: smartconnect_26, and set properties
  set smartconnect_26 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_26 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_26


  # Create instance: vadd_bw_1, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_1
  if { [catch {set vadd_bw_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_1/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_1/s_axi_control]

  # Create instance: vadd_bw_2, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_2
  if { [catch {set vadd_bw_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_2/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_2/s_axi_control]

  # Create instance: vadd_bw_3, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_3
  if { [catch {set vadd_bw_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_3 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_3/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_3/s_axi_control]

  # Create instance: vadd_bw_4, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_4
  if { [catch {set vadd_bw_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_4 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_4/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_4/s_axi_control]

  # Create instance: vadd_bw_5, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_5
  if { [catch {set vadd_bw_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_5 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_5/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_5/s_axi_control]

  # Create instance: vadd_bw_6, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_6
  if { [catch {set vadd_bw_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_6 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_6/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_6/s_axi_control]

  # Create instance: vadd_bw_7, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_7
  if { [catch {set vadd_bw_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_7 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_7/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_7/s_axi_control]

  # Create instance: vadd_bw_8, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_8
  if { [catch {set vadd_bw_8 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_8 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_8/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_8/s_axi_control]

  # Create instance: vadd_bw_9, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_9
  if { [catch {set vadd_bw_9 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_9 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_9/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_9/s_axi_control]

  # Create instance: vadd_bw_10, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_10
  if { [catch {set vadd_bw_10 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_10 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_10/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_10/s_axi_control]

  # Create instance: vadd_bw_11, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_11
  if { [catch {set vadd_bw_11 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_11 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_11/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_11/s_axi_control]

  # Create instance: vadd_bw_12, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_12
  if { [catch {set vadd_bw_12 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_12 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_12/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_12/s_axi_control]

  # Create instance: vadd_bw_13, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_13
  if { [catch {set vadd_bw_13 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_13 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_13/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_13/s_axi_control]

  # Create instance: vadd_bw_14, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_14
  if { [catch {set vadd_bw_14 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_14 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_14/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_14/s_axi_control]

  # Create instance: vadd_bw_15, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_15
  if { [catch {set vadd_bw_15 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_15 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_15/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_15/s_axi_control]

  # Create instance: vadd_bw_16, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_16
  if { [catch {set vadd_bw_16 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_16 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_16/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_16/s_axi_control]

  # Create instance: vadd_bw_17, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_17
  if { [catch {set vadd_bw_17 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_17 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_17/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_17/s_axi_control]

  # Create instance: vadd_bw_18, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_18
  if { [catch {set vadd_bw_18 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_18 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_18/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_18/s_axi_control]

  # Create instance: vadd_bw_19, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_19
  if { [catch {set vadd_bw_19 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_19 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_19/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_19/s_axi_control]

  # Create instance: vadd_bw_20, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_20
  if { [catch {set vadd_bw_20 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_20 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_20/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_20/s_axi_control]

  # Create instance: vadd_bw_21, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_21
  if { [catch {set vadd_bw_21 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_21 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_21/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_21/s_axi_control]

  # Create instance: vadd_bw_22, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_22
  if { [catch {set vadd_bw_22 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_22 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_22/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_22/s_axi_control]

  # Create instance: vadd_bw_23, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_23
  if { [catch {set vadd_bw_23 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_23 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_23/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_23/s_axi_control]

  # Create instance: vadd_bw_24, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_24
  if { [catch {set vadd_bw_24 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_24 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_24/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_24/s_axi_control]

  # Create instance: vadd_bw_25, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_25
  if { [catch {set vadd_bw_25 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_25 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_25/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_25/s_axi_control]

  # Create instance: vadd_bw_26, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_26
  if { [catch {set vadd_bw_26 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_26 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_26/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /pr_region/vadd_bw_26/s_axi_control]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins m_axi_rmem5] [get_bd_intf_pins vadd_bw_13/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S00_AXI4] [get_bd_intf_pins smartconnect_13/S00_AXI]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins m_axi_rmem6] [get_bd_intf_pins vadd_bw_14/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins m_axi_rmem7] [get_bd_intf_pins vadd_bw_15/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins m_axi_rmem8] [get_bd_intf_pins vadd_bw_16/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins m_axi_rmem9] [get_bd_intf_pins vadd_bw_17/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins m_axi_rmem10] [get_bd_intf_pins vadd_bw_18/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn8 [get_bd_intf_pins m_axi_rmem11] [get_bd_intf_pins vadd_bw_19/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn9 [get_bd_intf_pins m_axi_rmem12] [get_bd_intf_pins vadd_bw_20/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn10 [get_bd_intf_pins m_axi_rmem13] [get_bd_intf_pins vadd_bw_21/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn11 [get_bd_intf_pins m_axi_rmem14] [get_bd_intf_pins vadd_bw_22/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn12 [get_bd_intf_pins m_axi_rmem15] [get_bd_intf_pins vadd_bw_23/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn13 [get_bd_intf_pins m_axi_rmem16] [get_bd_intf_pins vadd_bw_24/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn14 [get_bd_intf_pins m_axi_rmem17] [get_bd_intf_pins vadd_bw_25/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn15 [get_bd_intf_pins m_axi_rmem18] [get_bd_intf_pins vadd_bw_26/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn16 [get_bd_intf_pins m_axi_rmem19] [get_bd_intf_pins vadd_bw_1/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn17 [get_bd_intf_pins m_axi_rmem20] [get_bd_intf_pins vadd_bw_2/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn18 [get_bd_intf_pins m_axi_rmem21] [get_bd_intf_pins vadd_bw_3/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn19 [get_bd_intf_pins m_axi_rmem22] [get_bd_intf_pins vadd_bw_4/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn20 [get_bd_intf_pins m_axi_rmem23] [get_bd_intf_pins vadd_bw_5/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn21 [get_bd_intf_pins m_axi_rmem24] [get_bd_intf_pins vadd_bw_6/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn22 [get_bd_intf_pins m_axi_rmem25] [get_bd_intf_pins vadd_bw_10/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn23 [get_bd_intf_pins m_axi_rmem26] [get_bd_intf_pins vadd_bw_11/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn24 [get_bd_intf_pins m_axi_rmem27] [get_bd_intf_pins vadd_bw_12/m_axi_rmem0]
  connect_bd_intf_net -intf_net Conn25 [get_bd_intf_pins S00_AXI5] [get_bd_intf_pins smartconnect_17/S00_AXI]
  connect_bd_intf_net -intf_net Conn26 [get_bd_intf_pins S00_AXI6] [get_bd_intf_pins smartconnect_18/S00_AXI]
  connect_bd_intf_net -intf_net Conn27 [get_bd_intf_pins S00_AXI7] [get_bd_intf_pins smartconnect_19/S00_AXI]
  connect_bd_intf_net -intf_net Conn28 [get_bd_intf_pins S00_AXI8] [get_bd_intf_pins smartconnect_20/S00_AXI]
  connect_bd_intf_net -intf_net Conn29 [get_bd_intf_pins S00_AXI9] [get_bd_intf_pins smartconnect_21/S00_AXI]
  connect_bd_intf_net -intf_net Conn30 [get_bd_intf_pins S00_AXI10] [get_bd_intf_pins smartconnect_22/S00_AXI]
  connect_bd_intf_net -intf_net Conn31 [get_bd_intf_pins S00_AXI11] [get_bd_intf_pins smartconnect_23/S00_AXI]
  connect_bd_intf_net -intf_net Conn32 [get_bd_intf_pins S00_AXI12] [get_bd_intf_pins smartconnect_24/S00_AXI]
  connect_bd_intf_net -intf_net Conn33 [get_bd_intf_pins S00_AXI13] [get_bd_intf_pins smartconnect_25/S00_AXI]
  connect_bd_intf_net -intf_net Conn34 [get_bd_intf_pins S00_AXI14] [get_bd_intf_pins smartconnect_26/S00_AXI]
  connect_bd_intf_net -intf_net Conn35 [get_bd_intf_pins S00_AXI15] [get_bd_intf_pins smartconnect_14/S00_AXI]
  connect_bd_intf_net -intf_net Conn36 [get_bd_intf_pins S00_AXI16] [get_bd_intf_pins smartconnect_15/S00_AXI]
  connect_bd_intf_net -intf_net Conn37 [get_bd_intf_pins S00_AXI17] [get_bd_intf_pins smartconnect_16/S00_AXI]
  connect_bd_intf_net -intf_net Conn38 [get_bd_intf_pins S00_AXI18] [get_bd_intf_pins smartconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net Conn39 [get_bd_intf_pins S00_AXI19] [get_bd_intf_pins smartconnect_2/S00_AXI]
  connect_bd_intf_net -intf_net Conn40 [get_bd_intf_pins S00_AXI20] [get_bd_intf_pins smartconnect_3/S00_AXI]
  connect_bd_intf_net -intf_net Conn41 [get_bd_intf_pins S00_AXI21] [get_bd_intf_pins smartconnect_4/S00_AXI]
  connect_bd_intf_net -intf_net Conn42 [get_bd_intf_pins S00_AXI22] [get_bd_intf_pins smartconnect_5/S00_AXI]
  connect_bd_intf_net -intf_net Conn43 [get_bd_intf_pins S00_AXI23] [get_bd_intf_pins smartconnect_6/S00_AXI]
  connect_bd_intf_net -intf_net Conn44 [get_bd_intf_pins S00_AXI24] [get_bd_intf_pins smartconnect_10/S00_AXI]
  connect_bd_intf_net -intf_net Conn45 [get_bd_intf_pins S00_AXI25] [get_bd_intf_pins smartconnect_11/S00_AXI]
  connect_bd_intf_net -intf_net Conn46 [get_bd_intf_pins S00_AXI26] [get_bd_intf_pins smartconnect_12/S00_AXI]
  connect_bd_intf_net -intf_net axi_noc_0_M06_AXI [get_bd_intf_pins S00_AXI] [get_bd_intf_pins smartconnect_7/S00_AXI]
  connect_bd_intf_net -intf_net axi_noc_0_M07_AXI [get_bd_intf_pins S00_AXI1] [get_bd_intf_pins smartconnect_8/S00_AXI]
  connect_bd_intf_net -intf_net axi_noc_0_M08_AXI [get_bd_intf_pins S00_AXI3] [get_bd_intf_pins smartconnect_9/S00_AXI]
  connect_bd_intf_net -intf_net smartconnect_10_M00_AXI [get_bd_intf_pins smartconnect_10/M00_AXI] [get_bd_intf_pins vadd_bw_10/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_11_M00_AXI [get_bd_intf_pins smartconnect_11/M00_AXI] [get_bd_intf_pins vadd_bw_11/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_12_M00_AXI [get_bd_intf_pins smartconnect_12/M00_AXI] [get_bd_intf_pins vadd_bw_12/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_13_M00_AXI [get_bd_intf_pins smartconnect_13/M00_AXI] [get_bd_intf_pins vadd_bw_13/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_14_M00_AXI [get_bd_intf_pins smartconnect_14/M00_AXI] [get_bd_intf_pins vadd_bw_14/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_15_M00_AXI [get_bd_intf_pins smartconnect_15/M00_AXI] [get_bd_intf_pins vadd_bw_15/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_16_M00_AXI [get_bd_intf_pins smartconnect_16/M00_AXI] [get_bd_intf_pins vadd_bw_16/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_17_M00_AXI [get_bd_intf_pins smartconnect_17/M00_AXI] [get_bd_intf_pins vadd_bw_17/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_18_M00_AXI [get_bd_intf_pins smartconnect_18/M00_AXI] [get_bd_intf_pins vadd_bw_18/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_19_M00_AXI [get_bd_intf_pins smartconnect_19/M00_AXI] [get_bd_intf_pins vadd_bw_19/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_1_M00_AXI [get_bd_intf_pins smartconnect_1/M00_AXI] [get_bd_intf_pins vadd_bw_1/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_20_M00_AXI [get_bd_intf_pins smartconnect_20/M00_AXI] [get_bd_intf_pins vadd_bw_20/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_21_M00_AXI [get_bd_intf_pins smartconnect_21/M00_AXI] [get_bd_intf_pins vadd_bw_21/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_22_M00_AXI [get_bd_intf_pins smartconnect_22/M00_AXI] [get_bd_intf_pins vadd_bw_22/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_23_M00_AXI [get_bd_intf_pins smartconnect_23/M00_AXI] [get_bd_intf_pins vadd_bw_23/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_24_M00_AXI [get_bd_intf_pins smartconnect_24/M00_AXI] [get_bd_intf_pins vadd_bw_24/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_25_M00_AXI [get_bd_intf_pins smartconnect_25/M00_AXI] [get_bd_intf_pins vadd_bw_25/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_26_M00_AXI [get_bd_intf_pins smartconnect_26/M00_AXI] [get_bd_intf_pins vadd_bw_26/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_2_M00_AXI [get_bd_intf_pins smartconnect_2/M00_AXI] [get_bd_intf_pins vadd_bw_2/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_3_M00_AXI [get_bd_intf_pins smartconnect_3/M00_AXI] [get_bd_intf_pins vadd_bw_3/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_4_M00_AXI [get_bd_intf_pins smartconnect_4/M00_AXI] [get_bd_intf_pins vadd_bw_4/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_5_M00_AXI [get_bd_intf_pins smartconnect_5/M00_AXI] [get_bd_intf_pins vadd_bw_5/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_6_M00_AXI [get_bd_intf_pins smartconnect_6/M00_AXI] [get_bd_intf_pins vadd_bw_6/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_7_M00_AXI [get_bd_intf_pins smartconnect_7/M00_AXI] [get_bd_intf_pins vadd_bw_7/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_8_M00_AXI [get_bd_intf_pins smartconnect_8/M00_AXI] [get_bd_intf_pins vadd_bw_8/s_axi_control]
  connect_bd_intf_net -intf_net smartconnect_9_M00_AXI [get_bd_intf_pins smartconnect_9/M00_AXI] [get_bd_intf_pins vadd_bw_9/s_axi_control]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem7 [get_bd_intf_pins m_axi_rmem0] [get_bd_intf_pins vadd_bw_7/m_axi_rmem0]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem8 [get_bd_intf_pins m_axi_rmem4] [get_bd_intf_pins vadd_bw_8/m_axi_rmem0]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem9 [get_bd_intf_pins m_axi_rmem1] [get_bd_intf_pins vadd_bw_9/m_axi_rmem0]

  # Create port connections
  connect_bd_net -net pr_reset_interconnect_aresetn [get_bd_pins pr_reset/interconnect_aresetn] [get_bd_pins smartconnect_1/aresetn] [get_bd_pins smartconnect_10/aresetn] [get_bd_pins smartconnect_11/aresetn] [get_bd_pins smartconnect_12/aresetn] [get_bd_pins smartconnect_13/aresetn] [get_bd_pins smartconnect_14/aresetn] [get_bd_pins smartconnect_15/aresetn] [get_bd_pins smartconnect_16/aresetn] [get_bd_pins smartconnect_17/aresetn] [get_bd_pins smartconnect_18/aresetn] [get_bd_pins smartconnect_19/aresetn] [get_bd_pins smartconnect_2/aresetn] [get_bd_pins smartconnect_20/aresetn] [get_bd_pins smartconnect_21/aresetn] [get_bd_pins smartconnect_22/aresetn] [get_bd_pins smartconnect_23/aresetn] [get_bd_pins smartconnect_24/aresetn] [get_bd_pins smartconnect_25/aresetn] [get_bd_pins smartconnect_26/aresetn] [get_bd_pins smartconnect_3/aresetn] [get_bd_pins smartconnect_4/aresetn] [get_bd_pins smartconnect_5/aresetn] [get_bd_pins smartconnect_6/aresetn] [get_bd_pins smartconnect_7/aresetn] [get_bd_pins smartconnect_8/aresetn] [get_bd_pins smartconnect_9/aresetn]
  connect_bd_net -net pr_reset_peripheral_aresetn [get_bd_pins pr_reset/peripheral_aresetn] [get_bd_pins vadd_bw_1/ap_rst_n] [get_bd_pins vadd_bw_10/ap_rst_n] [get_bd_pins vadd_bw_11/ap_rst_n] [get_bd_pins vadd_bw_12/ap_rst_n] [get_bd_pins vadd_bw_13/ap_rst_n] [get_bd_pins vadd_bw_14/ap_rst_n] [get_bd_pins vadd_bw_15/ap_rst_n] [get_bd_pins vadd_bw_16/ap_rst_n] [get_bd_pins vadd_bw_17/ap_rst_n] [get_bd_pins vadd_bw_18/ap_rst_n] [get_bd_pins vadd_bw_19/ap_rst_n] [get_bd_pins vadd_bw_2/ap_rst_n] [get_bd_pins vadd_bw_20/ap_rst_n] [get_bd_pins vadd_bw_21/ap_rst_n] [get_bd_pins vadd_bw_22/ap_rst_n] [get_bd_pins vadd_bw_23/ap_rst_n] [get_bd_pins vadd_bw_24/ap_rst_n] [get_bd_pins vadd_bw_25/ap_rst_n] [get_bd_pins vadd_bw_26/ap_rst_n] [get_bd_pins vadd_bw_3/ap_rst_n] [get_bd_pins vadd_bw_4/ap_rst_n] [get_bd_pins vadd_bw_5/ap_rst_n] [get_bd_pins vadd_bw_6/ap_rst_n] [get_bd_pins vadd_bw_7/ap_rst_n] [get_bd_pins vadd_bw_8/ap_rst_n] [get_bd_pins vadd_bw_9/ap_rst_n]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins ext_reset_in] [get_bd_pins pr_reset/ext_reset_in]
  connect_bd_net -net versal_cips_0_pl0_ref_clk [get_bd_pins ap_clk] [get_bd_pins pr_reset/slowest_sync_clk] [get_bd_pins smartconnect_1/aclk] [get_bd_pins smartconnect_10/aclk] [get_bd_pins smartconnect_11/aclk] [get_bd_pins smartconnect_12/aclk] [get_bd_pins smartconnect_13/aclk] [get_bd_pins smartconnect_14/aclk] [get_bd_pins smartconnect_15/aclk] [get_bd_pins smartconnect_16/aclk] [get_bd_pins smartconnect_17/aclk] [get_bd_pins smartconnect_18/aclk] [get_bd_pins smartconnect_19/aclk] [get_bd_pins smartconnect_2/aclk] [get_bd_pins smartconnect_20/aclk] [get_bd_pins smartconnect_21/aclk] [get_bd_pins smartconnect_22/aclk] [get_bd_pins smartconnect_23/aclk] [get_bd_pins smartconnect_24/aclk] [get_bd_pins smartconnect_25/aclk] [get_bd_pins smartconnect_26/aclk] [get_bd_pins smartconnect_3/aclk] [get_bd_pins smartconnect_4/aclk] [get_bd_pins smartconnect_5/aclk] [get_bd_pins smartconnect_6/aclk] [get_bd_pins smartconnect_7/aclk] [get_bd_pins smartconnect_8/aclk] [get_bd_pins smartconnect_9/aclk] [get_bd_pins vadd_bw_1/ap_clk] [get_bd_pins vadd_bw_10/ap_clk] [get_bd_pins vadd_bw_11/ap_clk] [get_bd_pins vadd_bw_12/ap_clk] [get_bd_pins vadd_bw_13/ap_clk] [get_bd_pins vadd_bw_14/ap_clk] [get_bd_pins vadd_bw_15/ap_clk] [get_bd_pins vadd_bw_16/ap_clk] [get_bd_pins vadd_bw_17/ap_clk] [get_bd_pins vadd_bw_18/ap_clk] [get_bd_pins vadd_bw_19/ap_clk] [get_bd_pins vadd_bw_2/ap_clk] [get_bd_pins vadd_bw_20/ap_clk] [get_bd_pins vadd_bw_21/ap_clk] [get_bd_pins vadd_bw_22/ap_clk] [get_bd_pins vadd_bw_23/ap_clk] [get_bd_pins vadd_bw_24/ap_clk] [get_bd_pins vadd_bw_25/ap_clk] [get_bd_pins vadd_bw_26/ap_clk] [get_bd_pins vadd_bw_3/ap_clk] [get_bd_pins vadd_bw_4/ap_clk] [get_bd_pins vadd_bw_5/ap_clk] [get_bd_pins vadd_bw_6/ap_clk] [get_bd_pins vadd_bw_7/ap_clk] [get_bd_pins vadd_bw_8/ap_clk] [get_bd_pins vadd_bw_9/ap_clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ddr4_c0_sysclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ddr4_c0_sysclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $ddr4_c0_sysclk

  set ddr4_sdram_c0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c0 ]


  # Create ports

  # Create instance: addr_config_0, and set properties
  set block_name addr_config
  set block_cell_name addr_config_0
  if { [catch {set addr_config_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $addr_config_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /addr_config_0/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
 ] [get_bd_intf_pins /addr_config_0/m_axi_rmem1]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {249997498} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /addr_config_0/s_axi_control]

  # Create instance: axi_noc_0, and set properties
  set axi_noc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc:1.0 axi_noc_0 ]
  set_property -dict [list \
    CONFIG.NUM_MI {13} \
    CONFIG.NUM_NMI {1} \
    CONFIG.NUM_SI {14} \
  ] $axi_noc_0


  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y1} \
   CONFIG.APERTURES {{0x201_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M00_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y2} \
   CONFIG.APERTURES {{0x201_8000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M01_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y3} \
   CONFIG.APERTURES {{0x201_C000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M02_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y4} \
   CONFIG.APERTURES {{0x202_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M03_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y5} \
   CONFIG.APERTURES {{0x202_4000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M04_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X0Y6} \
   CONFIG.APERTURES {{0x202_8000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M05_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y1} \
   CONFIG.APERTURES {{0x202_C000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M06_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y2} \
   CONFIG.APERTURES {{0x203_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M07_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y3} \
   CONFIG.APERTURES {{0x203_4000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M08_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y4} \
   CONFIG.APERTURES {{0x203_8000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M09_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y5} \
   CONFIG.APERTURES {{0x203_C000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M10_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X1Y6} \
   CONFIG.APERTURES {{0x204_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M11_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y0} \
   CONFIG.APERTURES {{0x204_4000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M12_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y0} \
   CONFIG.CONNECTIONS {M03_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M08_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M01_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M06_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M12_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M10_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M04_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M02_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M00_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M05_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M11_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M07_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M09_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M03_AXI:0x500:M08_AXI:0x740:M01_AXI:0x900:M06_AXI:0xb40:M12_AXI:0xd00:M10_AXI:0x340:M04_AXI:0x300:M02_AXI:0x700:M00_AXI:0xb00:M05_AXI:0x100:M11_AXI:0x140:M07_AXI:0x940:M09_AXI:0x540} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S00_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y1} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S01_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y2} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S02_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y3} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S03_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y4} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S04_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y5} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S05_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y6} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S06_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y1} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S07_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y2} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S08_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y3} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S09_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y4} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S10_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y5} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S11_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y6} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S12_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y0} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/S13_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M00_AXI:M01_AXI:M02_AXI:M03_AXI:M04_AXI:M05_AXI:M06_AXI:M07_AXI:M08_AXI:M09_AXI:M10_AXI:M11_AXI:M12_AXI:S00_AXI:S01_AXI:S02_AXI:S03_AXI:S04_AXI:S05_AXI:S06_AXI:S07_AXI:S08_AXI:S09_AXI:S10_AXI:S11_AXI:S12_AXI:S13_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk0]

  # Create instance: axi_noc_1, and set properties
  set axi_noc_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc:1.0 axi_noc_1 ]
  set_property -dict [list \
    CONFIG.NUM_MI {13} \
    CONFIG.NUM_NMI {1} \
    CONFIG.NUM_SI {14} \
  ] $axi_noc_1


  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y1} \
   CONFIG.APERTURES {{0x205_8000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M00_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y2} \
   CONFIG.APERTURES {{0x205_C000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M01_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y3} \
   CONFIG.APERTURES {{0x206_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M02_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y4} \
   CONFIG.APERTURES {{0x206_4000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M03_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y5} \
   CONFIG.APERTURES {{0x206_8000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M04_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X2Y6} \
   CONFIG.APERTURES {{0x206_C000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M05_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y0} \
   CONFIG.APERTURES {{0x207_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M06_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y1} \
   CONFIG.APERTURES {{0x207_4000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M07_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y2} \
   CONFIG.APERTURES {{0x207_8000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M08_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y3} \
   CONFIG.APERTURES {{0x207_C000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M09_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y4} \
   CONFIG.APERTURES {{0x208_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M10_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y5} \
   CONFIG.APERTURES {{0x208_4000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M11_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NSU512_X3Y6} \
   CONFIG.APERTURES {{0x208_8000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/M12_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y0} \
   CONFIG.CONNECTIONS {M03_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M08_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M01_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M06_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M12_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M10_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M04_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M02_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M00_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M05_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M11_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M07_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}} M09_AXI {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M03_AXI:0x580:M08_AXI:0x9c0:M01_AXI:0x980:M06_AXI:0xd40:M12_AXI:0x1c0:M10_AXI:0x5c0:M04_AXI:0x380:M02_AXI:0x780:M00_AXI:0xb80:M05_AXI:0x180:M11_AXI:0x3c0:M07_AXI:0xbc0:M09_AXI:0x7c0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S00_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y1} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S01_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y2} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S02_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y3} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S03_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y4} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S04_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y5} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S05_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y6} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S06_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y0} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S07_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y1} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S08_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y2} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S09_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y3} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S10_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y4} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S11_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y5} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S12_AXI]

  set_property -dict [ list \
   CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y6} \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S13_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M00_AXI:M01_AXI:M02_AXI:M03_AXI:M04_AXI:M05_AXI:M06_AXI:M07_AXI:M08_AXI:M09_AXI:M10_AXI:M11_AXI:M12_AXI:S00_AXI:S01_AXI:S02_AXI:S03_AXI:S04_AXI:S05_AXI:S06_AXI:S07_AXI:S08_AXI:S09_AXI:S10_AXI:S11_AXI:S12_AXI:S13_AXI} \
 ] [get_bd_pins /axi_noc_1/aclk0]

  # Create instance: axi_noc_cips, and set properties
  set axi_noc_cips [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc:1.0 axi_noc_cips ]
  set_property -dict [list \
    CONFIG.CH0_DDR4_0_BOARD_INTERFACE {ddr4_sdram_c0} \
    CONFIG.NUM_CLKS {5} \
    CONFIG.NUM_MI {0} \
    CONFIG.NUM_NSI {2} \
    CONFIG.NUM_SI {5} \
    CONFIG.SI_SIDEBAND_PINS {0,0,0,0,0} \
    CONFIG.sys_clk0_BOARD_INTERFACE {ddr4_c0_sysclk} \
  ] $axi_noc_cips


  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_cips/S00_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
 ] [get_bd_intf_pins /axi_noc_cips/S00_INI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_cips/S01_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
 ] [get_bd_intf_pins /axi_noc_cips/S01_INI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_cips/S02_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_cips/S03_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_pmc} \
 ] [get_bd_intf_pins /axi_noc_cips/S04_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI} \
 ] [get_bd_pins /axi_noc_cips/aclk0]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S01_AXI} \
 ] [get_bd_pins /axi_noc_cips/aclk1]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S02_AXI} \
 ] [get_bd_pins /axi_noc_cips/aclk2]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S03_AXI} \
 ] [get_bd_pins /axi_noc_cips/aclk3]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S04_AXI} \
 ] [get_bd_pins /axi_noc_cips/aclk4]

  # Create instance: lpd2noc, and set properties
  set lpd2noc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 lpd2noc ]
  set_property -dict [list \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI {1} \
  ] $lpd2noc


  # Create instance: pr_region
  create_hier_cell_pr_region [current_bd_instance .] pr_region

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: versal_cips_0, and set properties
  set versal_cips_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:versal_cips:3.3 versal_cips_0 ]
  set_property -dict [list \
    CONFIG.BOOT_MODE {Custom} \
    CONFIG.CLOCK_MODE {Custom} \
    CONFIG.DDR_MEMORY_MODE {Custom} \
    CONFIG.DEBUG_MODE {JTAG} \
    CONFIG.DESIGN_MODE {1} \
    CONFIG.PS_PL_CONNECTIVITY_MODE {Custom} \
    CONFIG.PS_PMC_CONFIG { \
      CLOCK_MODE {Custom} \
      DDR_MEMORY_MODE {Custom} \
      DEBUG_MODE {JTAG} \
      PMC_CRP_PL0_REF_CTRL_FREQMHZ {250} \
      PMC_USE_PMC_NOC_AXI0 {1} \
      PS_HSDP_EGRESS_TRAFFIC {JTAG} \
      PS_HSDP_INGRESS_TRAFFIC {JTAG} \
      PS_HSDP_MODE {None} \
      PS_M_AXI_FPD_DATA_WIDTH {128} \
      PS_M_AXI_LPD_DATA_WIDTH {32} \
      PS_NUM_FABRIC_RESETS {1} \
      PS_PL_CONNECTIVITY_MODE {Custom} \
      PS_USE_FPD_CCI_NOC {1} \
      PS_USE_M_AXI_FPD {0} \
      PS_USE_M_AXI_LPD {1} \
      PS_USE_NOC_FPD_CCI0 {0} \
      PS_USE_PMCPL_CLK0 {1} \
      PS_USE_PMCPL_CLK1 {0} \
      PS_USE_PMCPL_CLK2 {0} \
      PS_USE_PMCPL_CLK3 {0} \
      SMON_ALARMS {Set_Alarms_On} \
      SMON_ENABLE_TEMP_AVERAGING {0} \
      SMON_TEMP_AVERAGING_SAMPLES {0} \
    } \
  ] $versal_cips_0


  # Create interface connections
  connect_bd_intf_net -intf_net addr_config_0_m_axi_rmem0 [get_bd_intf_pins addr_config_0/m_axi_rmem0] [get_bd_intf_pins axi_noc_0/S00_AXI]
  connect_bd_intf_net -intf_net addr_config_0_m_axi_rmem1 [get_bd_intf_pins addr_config_0/m_axi_rmem1] [get_bd_intf_pins axi_noc_1/S00_AXI]
  connect_bd_intf_net -intf_net axi_noc_0_CH0_DDR4_0 [get_bd_intf_ports ddr4_sdram_c0] [get_bd_intf_pins axi_noc_cips/CH0_DDR4_0]
  connect_bd_intf_net -intf_net axi_noc_0_M00_AXI [get_bd_intf_pins axi_noc_0/M00_AXI] [get_bd_intf_pins pr_region/S00_AXI18]
  connect_bd_intf_net -intf_net axi_noc_0_M01_AXI [get_bd_intf_pins axi_noc_0/M01_AXI] [get_bd_intf_pins pr_region/S00_AXI19]
  connect_bd_intf_net -intf_net axi_noc_0_M02_AXI [get_bd_intf_pins axi_noc_0/M02_AXI] [get_bd_intf_pins pr_region/S00_AXI20]
  connect_bd_intf_net -intf_net axi_noc_0_M03_AXI [get_bd_intf_pins axi_noc_0/M03_AXI] [get_bd_intf_pins pr_region/S00_AXI21]
  connect_bd_intf_net -intf_net axi_noc_0_M04_AXI [get_bd_intf_pins axi_noc_0/M04_AXI] [get_bd_intf_pins pr_region/S00_AXI22]
  connect_bd_intf_net -intf_net axi_noc_0_M05_AXI [get_bd_intf_pins axi_noc_0/M05_AXI] [get_bd_intf_pins pr_region/S00_AXI23]
  connect_bd_intf_net -intf_net axi_noc_0_M06_AXI [get_bd_intf_pins axi_noc_0/M06_AXI] [get_bd_intf_pins pr_region/S00_AXI]
  connect_bd_intf_net -intf_net axi_noc_0_M07_AXI [get_bd_intf_pins axi_noc_0/M07_AXI] [get_bd_intf_pins pr_region/S00_AXI1]
  connect_bd_intf_net -intf_net axi_noc_0_M08_AXI [get_bd_intf_pins axi_noc_0/M08_AXI] [get_bd_intf_pins pr_region/S00_AXI3]
  connect_bd_intf_net -intf_net axi_noc_0_M09_AXI [get_bd_intf_pins axi_noc_0/M09_AXI] [get_bd_intf_pins pr_region/S00_AXI24]
  connect_bd_intf_net -intf_net axi_noc_0_M10_AXI [get_bd_intf_pins axi_noc_0/M10_AXI] [get_bd_intf_pins pr_region/S00_AXI25]
  connect_bd_intf_net -intf_net axi_noc_0_M11_AXI [get_bd_intf_pins axi_noc_0/M11_AXI] [get_bd_intf_pins pr_region/S00_AXI26]
  connect_bd_intf_net -intf_net axi_noc_0_M12_AXI [get_bd_intf_pins axi_noc_0/M12_AXI] [get_bd_intf_pins pr_region/S00_AXI4]
  connect_bd_intf_net -intf_net axi_noc_1_M00_AXI [get_bd_intf_pins axi_noc_1/M00_AXI] [get_bd_intf_pins pr_region/S00_AXI15]
  connect_bd_intf_net -intf_net axi_noc_1_M00_INI [get_bd_intf_pins axi_noc_0/M00_INI] [get_bd_intf_pins axi_noc_cips/S00_INI]
  connect_bd_intf_net -intf_net axi_noc_1_M00_INI1 [get_bd_intf_pins axi_noc_1/M00_INI] [get_bd_intf_pins axi_noc_cips/S01_INI]
  connect_bd_intf_net -intf_net axi_noc_1_M01_AXI [get_bd_intf_pins axi_noc_1/M01_AXI] [get_bd_intf_pins pr_region/S00_AXI16]
  connect_bd_intf_net -intf_net axi_noc_1_M02_AXI [get_bd_intf_pins axi_noc_1/M02_AXI] [get_bd_intf_pins pr_region/S00_AXI17]
  connect_bd_intf_net -intf_net axi_noc_1_M03_AXI [get_bd_intf_pins axi_noc_1/M03_AXI] [get_bd_intf_pins pr_region/S00_AXI5]
  connect_bd_intf_net -intf_net axi_noc_1_M04_AXI [get_bd_intf_pins axi_noc_1/M04_AXI] [get_bd_intf_pins pr_region/S00_AXI6]
  connect_bd_intf_net -intf_net axi_noc_1_M05_AXI [get_bd_intf_pins axi_noc_1/M05_AXI] [get_bd_intf_pins pr_region/S00_AXI7]
  connect_bd_intf_net -intf_net axi_noc_1_M06_AXI [get_bd_intf_pins axi_noc_1/M06_AXI] [get_bd_intf_pins pr_region/S00_AXI8]
  connect_bd_intf_net -intf_net axi_noc_1_M07_AXI [get_bd_intf_pins axi_noc_1/M07_AXI] [get_bd_intf_pins pr_region/S00_AXI9]
  connect_bd_intf_net -intf_net axi_noc_1_M08_AXI [get_bd_intf_pins axi_noc_1/M08_AXI] [get_bd_intf_pins pr_region/S00_AXI10]
  connect_bd_intf_net -intf_net axi_noc_1_M09_AXI [get_bd_intf_pins axi_noc_1/M09_AXI] [get_bd_intf_pins pr_region/S00_AXI11]
  connect_bd_intf_net -intf_net axi_noc_1_M10_AXI [get_bd_intf_pins axi_noc_1/M10_AXI] [get_bd_intf_pins pr_region/S00_AXI12]
  connect_bd_intf_net -intf_net axi_noc_1_M11_AXI [get_bd_intf_pins axi_noc_1/M11_AXI] [get_bd_intf_pins pr_region/S00_AXI13]
  connect_bd_intf_net -intf_net axi_noc_1_M12_AXI [get_bd_intf_pins axi_noc_1/M12_AXI] [get_bd_intf_pins pr_region/S00_AXI14]
  connect_bd_intf_net -intf_net ddr4_c0_sysclk_1 [get_bd_intf_ports ddr4_c0_sysclk] [get_bd_intf_pins axi_noc_cips/sys_clk0]
  connect_bd_intf_net -intf_net lpd2noc_M00_AXI [get_bd_intf_pins addr_config_0/s_axi_control] [get_bd_intf_pins lpd2noc/M00_AXI]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem5 [get_bd_intf_pins axi_noc_0/S13_AXI] [get_bd_intf_pins pr_region/m_axi_rmem5]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem6 [get_bd_intf_pins axi_noc_1/S01_AXI] [get_bd_intf_pins pr_region/m_axi_rmem6]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem7 [get_bd_intf_pins axi_noc_1/S02_AXI] [get_bd_intf_pins pr_region/m_axi_rmem7]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem8 [get_bd_intf_pins axi_noc_1/S03_AXI] [get_bd_intf_pins pr_region/m_axi_rmem8]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem9 [get_bd_intf_pins axi_noc_1/S04_AXI] [get_bd_intf_pins pr_region/m_axi_rmem9]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem10 [get_bd_intf_pins axi_noc_1/S05_AXI] [get_bd_intf_pins pr_region/m_axi_rmem10]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem11 [get_bd_intf_pins axi_noc_1/S06_AXI] [get_bd_intf_pins pr_region/m_axi_rmem11]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem12 [get_bd_intf_pins axi_noc_1/S07_AXI] [get_bd_intf_pins pr_region/m_axi_rmem12]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem13 [get_bd_intf_pins axi_noc_1/S08_AXI] [get_bd_intf_pins pr_region/m_axi_rmem13]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem14 [get_bd_intf_pins axi_noc_1/S09_AXI] [get_bd_intf_pins pr_region/m_axi_rmem14]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem15 [get_bd_intf_pins axi_noc_1/S10_AXI] [get_bd_intf_pins pr_region/m_axi_rmem15]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem16 [get_bd_intf_pins axi_noc_1/S11_AXI] [get_bd_intf_pins pr_region/m_axi_rmem16]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem17 [get_bd_intf_pins axi_noc_1/S12_AXI] [get_bd_intf_pins pr_region/m_axi_rmem17]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem18 [get_bd_intf_pins axi_noc_1/S13_AXI] [get_bd_intf_pins pr_region/m_axi_rmem18]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem19 [get_bd_intf_pins axi_noc_0/S01_AXI] [get_bd_intf_pins pr_region/m_axi_rmem19]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem20 [get_bd_intf_pins axi_noc_0/S02_AXI] [get_bd_intf_pins pr_region/m_axi_rmem20]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem21 [get_bd_intf_pins axi_noc_0/S03_AXI] [get_bd_intf_pins pr_region/m_axi_rmem21]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem22 [get_bd_intf_pins axi_noc_0/S04_AXI] [get_bd_intf_pins pr_region/m_axi_rmem22]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem23 [get_bd_intf_pins axi_noc_0/S05_AXI] [get_bd_intf_pins pr_region/m_axi_rmem23]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem24 [get_bd_intf_pins axi_noc_0/S06_AXI] [get_bd_intf_pins pr_region/m_axi_rmem24]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem25 [get_bd_intf_pins axi_noc_0/S10_AXI] [get_bd_intf_pins pr_region/m_axi_rmem25]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem26 [get_bd_intf_pins axi_noc_0/S11_AXI] [get_bd_intf_pins pr_region/m_axi_rmem26]
  connect_bd_intf_net -intf_net pr_region_m_axi_rmem27 [get_bd_intf_pins axi_noc_0/S12_AXI] [get_bd_intf_pins pr_region/m_axi_rmem27]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem7 [get_bd_intf_pins axi_noc_0/S07_AXI] [get_bd_intf_pins pr_region/m_axi_rmem0]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem8 [get_bd_intf_pins axi_noc_0/S08_AXI] [get_bd_intf_pins pr_region/m_axi_rmem4]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem9 [get_bd_intf_pins axi_noc_0/S09_AXI] [get_bd_intf_pins pr_region/m_axi_rmem1]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_0 [get_bd_intf_pins axi_noc_cips/S00_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_0]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_1 [get_bd_intf_pins axi_noc_cips/S01_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_1]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_2 [get_bd_intf_pins axi_noc_cips/S02_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_2]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_3 [get_bd_intf_pins axi_noc_cips/S03_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_3]
  connect_bd_intf_net -intf_net versal_cips_0_M_AXI_LPD [get_bd_intf_pins lpd2noc/S00_AXI] [get_bd_intf_pins versal_cips_0/M_AXI_LPD]
  connect_bd_intf_net -intf_net versal_cips_0_PMC_NOC_AXI_0 [get_bd_intf_pins axi_noc_cips/S04_AXI] [get_bd_intf_pins versal_cips_0/PMC_NOC_AXI_0]

  # Create port connections
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins lpd2noc/aresetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins addr_config_0/ap_rst_n] [get_bd_pins pr_region/ext_reset_in] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi0_clk [get_bd_pins axi_noc_cips/aclk0] [get_bd_pins versal_cips_0/fpd_cci_noc_axi0_clk]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi1_clk [get_bd_pins axi_noc_cips/aclk1] [get_bd_pins versal_cips_0/fpd_cci_noc_axi1_clk]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi2_clk [get_bd_pins axi_noc_cips/aclk2] [get_bd_pins versal_cips_0/fpd_cci_noc_axi2_clk]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi3_clk [get_bd_pins axi_noc_cips/aclk3] [get_bd_pins versal_cips_0/fpd_cci_noc_axi3_clk]
  connect_bd_net -net versal_cips_0_pl0_ref_clk [get_bd_pins addr_config_0/ap_clk] [get_bd_pins axi_noc_0/aclk0] [get_bd_pins axi_noc_1/aclk0] [get_bd_pins lpd2noc/aclk] [get_bd_pins pr_region/ap_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins versal_cips_0/m_axi_lpd_aclk] [get_bd_pins versal_cips_0/pl0_ref_clk]
  connect_bd_net -net versal_cips_0_pl0_resetn [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins versal_cips_0/pl0_resetn]
  connect_bd_net -net versal_cips_0_pmc_axi_noc_axi0_clk [get_bd_pins axi_noc_cips/aclk4] [get_bd_pins versal_cips_0/pmc_axi_noc_axi0_clk]

  # Create address segments
  assign_bd_address -offset 0x020380000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_10/s_axi_control/reg0] -force
  assign_bd_address -offset 0x0203C0000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_11/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020400000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_12/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020440000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_13/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020100000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_1/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020180000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_2/s_axi_control/reg0] -force
  assign_bd_address -offset 0x0201C0000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_3/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020200000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_4/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020240000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_5/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020280000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_6/s_axi_control/reg0] -force
  assign_bd_address -offset 0x0202C0000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_7/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020300000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_8/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020340000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem0] [get_bd_addr_segs pr_region/vadd_bw_9/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020580000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_14/s_axi_control/reg0] -force
  assign_bd_address -offset 0x0205C0000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_15/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020600000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_16/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020640000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_17/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020680000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_18/s_axi_control/reg0] -force
  assign_bd_address -offset 0x0206C0000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_19/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020700000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_20/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020740000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_21/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020780000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_22/s_axi_control/reg0] -force
  assign_bd_address -offset 0x0207C0000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_23/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020800000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_24/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020840000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_25/s_axi_control/reg0] -force
  assign_bd_address -offset 0x020880000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces addr_config_0/m_axi_rmem1] [get_bd_addr_segs pr_region/vadd_bw_26/s_axi_control/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_0] [get_bd_addr_segs axi_noc_cips/S00_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_1] [get_bd_addr_segs axi_noc_cips/S01_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_2] [get_bd_addr_segs axi_noc_cips/S02_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_3] [get_bd_addr_segs axi_noc_cips/S03_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x80000000 -range 0x00000080 -target_address_space [get_bd_addr_spaces versal_cips_0/M_AXI_LPD] [get_bd_addr_segs addr_config_0/s_axi_control/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/PMC_NOC_AXI_0] [get_bd_addr_segs axi_noc_cips/S04_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_1/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_2/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_3/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_4/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_5/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_6/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_7/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_8/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_9/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_10/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_11/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_12/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_13/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_14/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_15/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_16/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_17/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_18/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_19/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_20/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_21/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_22/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_23/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_24/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_25/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces pr_region/vadd_bw_26/m_axi_rmem0] [get_bd_addr_segs axi_noc_cips/S01_INI/C0_DDR_LOW0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


