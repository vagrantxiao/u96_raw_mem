1)Validate that the xcvc1902-vsvd1760-2MP-e-S is available in your Vivado installation.  Please see details in the board lounge or in user guide UG973: Vivado Release Notes, Installation, and Licensing.

2) Copy the contents from the zip for into local Vivado install.
Vivado\2021.1\data\boards\board_files\vck5000\

Alternative to step 2) 
Copy the contents from the zip into a local directory <path_to_board_files_dir>.
Set  the following parameter either in your Vivado_init.tcl or on the Vivado TCL console before project creation.
>>  set_param board.repoPaths <path_to_board_files_dir>

For more information please refer to user guide UG895: Vivado System-Level Design Guide, Appendix A.

3)Verified with 2021.1


