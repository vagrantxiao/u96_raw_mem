# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
create_pblock tapa_region
add_cells_to_pblock [get_pblocks tapa_region] [get_cells -quiet [list design_1_i/pr_region]]
resize_pblock [get_pblocks tapa_region] -add {SLICE_X124Y0:SLICE_X357Y327 SLICE_X52Y44:SLICE_X123Y327 SLICE_X12Y140:SLICE_X51Y327}
resize_pblock [get_pblocks tapa_region] -add {DSP58_CPLX_X2Y0:DSP58_CPLX_X5Y163 DSP58_CPLX_X0Y22:DSP58_CPLX_X1Y163}
resize_pblock [get_pblocks tapa_region] -add {DSP_X4Y0:DSP_X11Y163 DSP_X0Y22:DSP_X3Y163}
resize_pblock [get_pblocks tapa_region] -add {HDIOLOGIC_X0Y0:HDIOLOGIC_X1Y10}
resize_pblock [get_pblocks tapa_region] -add {HDIO_BIAS_X0Y0:HDIO_BIAS_X1Y0}
resize_pblock [get_pblocks tapa_region] -add {IRI_QUAD_X9Y1356:IRI_QUAD_X215Y1367 IRI_QUAD_X7Y1340:IRI_QUAD_X222Y1355 IRI_QUAD_X9Y588:IRI_QUAD_X215Y1339 IRI_QUAD_X36Y204:IRI_QUAD_X215Y587 IRI_QUAD_X82Y16:IRI_QUAD_X215Y203 IRI_QUAD_X78Y0:IRI_QUAD_X222Y15}
resize_pblock [get_pblocks tapa_region] -add {RAMB18_X1Y166:RAMB18_X10Y167 RAMB18_X0Y72:RAMB18_X11Y165 RAMB18_X1Y24:RAMB18_X11Y71 RAMB18_X3Y0:RAMB18_X11Y23}
resize_pblock [get_pblocks tapa_region] -add {RAMB36_X1Y83:RAMB36_X10Y83 RAMB36_X0Y36:RAMB36_X11Y82 RAMB36_X1Y12:RAMB36_X11Y35 RAMB36_X3Y0:RAMB36_X11Y11}
resize_pblock [get_pblocks tapa_region] -add {RPI_HD_APB_X0Y0:RPI_HD_APB_X1Y0}
resize_pblock [get_pblocks tapa_region] -add {URAM288_X3Y0:URAM288_X5Y82 URAM288_X2Y12:URAM288_X2Y82 URAM288_X1Y12:URAM288_X1Y83 URAM288_X0Y36:URAM288_X0Y82}
resize_pblock [get_pblocks tapa_region] -add {URAM_CAS_DLY_X2Y0:URAM_CAS_DLY_X5Y2 URAM_CAS_DLY_X1Y0:URAM_CAS_DLY_X1Y3 URAM_CAS_DLY_X0Y1:URAM_CAS_DLY_X0Y2}
set_property SNAPPING_MODE ON [get_pblocks tapa_region]
set_property DONT_TOUCH true [get_cells design_1_i/pr_region]
set_property HD.RECONFIGURABLE true [get_cells design_1_i/pr_region]

