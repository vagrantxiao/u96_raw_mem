#!/usr/bin/env python3

NUM=30
with open('out.log', 'w') as f:
    for i in range(NUM):
        f.write(f"connect_bd_intf_net [get_bd_intf_pins smartconnect_{i}/M00_AXI] [get_bd_intf_pins vadd_bw_{i}/s_axi_control]\n")
