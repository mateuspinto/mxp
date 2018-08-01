# +-----------------------------------
# |
# | Copyright (C) 2012-2018 VectorBlox Computing, Inc.
# |
# +-----------------------------------

if {[catch {package require -exact qsys 12.0}]} {
    if {[catch {package require -exact qsys 11.1}]} {
        package require -exact sopc 11.0
    }
}

# +-----------------------------------
# | module vectorblox_mxp
# |
set_module_property NAME vectorblox_mxp
set_module_property VERSION 1.1
set_module_property DISPLAY_NAME "VectorBlox MXP"
set_module_property DESCRIPTION "Vector Coprocessor for Nios II or ARM"
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "VectorBlox Computing Inc."
set_module_property AUTHOR "VectorBlox Computing Inc."
set_module_property ICON_PATH vectorblox.png

set_module_property EDITABLE true
set_module_property ELABORATION_CALLBACK elaboration_callback

# |
# +-----------------------------------

# +-----------------------------------
# | documentation links
# |
add_documentation_link "Web Site" http://www.vectorblox.com
add_documentation_link "Quickstart Guide" "../../docs/mxp_quickstart_altera.pdf"
add_documentation_link "Programming Guide" "../../docs/mxp_guide_altera.pdf"
add_documentation_link "Programming Reference" "../../docs/mxp_reference.pdf"
# |
# +-----------------------------------

add_fileset fileset_synth       QUARTUS_SYNTH fileset_synth_callback
add_fileset fileset_sim_verilog SIM_VERILOG   fileset_sim_verilog_callback
add_fileset fileset_sim_vhdl    SIM_VHDL      fileset_sim_vhdl_callback

set_fileset_property fileset_synth TOP_LEVEL vectorblox_1
set_fileset_property fileset_sim_verilog TOP_LEVEL vectorblox_1
set_fileset_property fileset_sim_vhdl  TOP_LEVEL vectorblox_1

###########################################################################
# Assumes all required VHDL source files are already in tmp_output_dir.
proc ipfs_gen {entity_name fileset dest_subdir tmp_output_dir} {

    if {$fileset == "SIM_VERILOG"} {
        set lang VERILOG
        set ext vo
    } elseif {$fileset == "SIM_VHDL"} {
        set lang VHDL
        set ext vho
    }

    send_message Info "Generating $lang IP Functional Simulation model"

    set saved_wd [pwd]
    cd $tmp_output_dir

    set cmd [list quartus_map $entity_name \
                 --simgen \
                 --simgen_parameter=CBX_HDL_LANGUAGE=$lang]

    foreach f [glob *.vhd] {
        lappend cmd --source $f
    }
    puts $cmd
    eval exec $cmd

    # Expected name of generated .vo/.vho IPFS model.
    set ipfs_model $entity_name.$ext

    if {[file exists $tmp_output_dir/$ipfs_model]} {
        send_message Info "Generated simulation model $ipfs_model"
    }

    # Add the IPFS model to the fileset.
    add_fileset_file $dest_subdir/$ipfs_model $lang PATH \
        $tmp_output_dir/$ipfs_model

    cd $saved_wd
}

###########################################################################
proc fileset_synth_callback {entity_name} {
    common_add_files $entity_name QUARTUS_SYNTH
}

###########################################################################
proc fileset_sim_verilog_callback {entity_name} {
    common_add_files $entity_name SIM_VERILOG
}

###########################################################################
proc fileset_sim_vhdl_callback {entity_name} {
    common_add_files $entity_name SIM_VHDL
}

###########################################################################
proc common_add_files {entity_name fileset} {
    # puts "entity_name = $entity_name"

    set vector_lanes                 [get_parameter_value VECTOR_LANES]
    set unpopulated_alu_lanes        [get_parameter_value UNPOPULATED_ALU_LANES]
    set unpopulated_multiplier_lanes [get_parameter_value UNPOPULATED_MULTIPLIER_LANES]
    set vector_custom_instructions   [get_parameter_value VECTOR_CUSTOM_INSTRUCTIONS]
    set max_vci_depth_without_flush  [get_parameter_value MAX_VCI_DEPTH_WITHOUT_FLUSH]
    for {set opcode 0} {$opcode < 16} {incr opcode} {
		  set vcustom[set opcode]_depth 0
		  set vcustom[set opcode]_lanes 0
    }
    for {set vci 0} {$vci < 16} {incr vci} {
		  if {$vector_custom_instructions > $vci} {
				set vci_[set vci]_lanes              [get_parameter_value VCI_[set vci]_LANES]
				set vci_[set vci]_opcode_start       [get_parameter_value VCI_[set vci]_OPCODE_START]
				set vci_[set vci]_functions          [get_parameter_value VCI_[set vci]_FUNCTIONS]
				set vci_[set vci]_opcode_end         [expr [set vci_[set vci]_opcode_start] + [set vci_[set vci]_functions] - 1]
				set vci_[set vci]_modifies_dest_addr [get_parameter_value VCI_[set vci]_MODIFIES_DEST_ADDR]
				for {set function 0} {$function < [expr 16 - $vci]} {incr function} {
					 set vci_[set vci]_function_[set function]_depth [get_parameter_value VCI_[set vci]_FUNCTION_[set function]_DEPTH]
				}
				for {set opcode [set vci_[set vci]_opcode_start]} {$opcode <= [set vci_[set vci]_opcode_end]} {incr opcode} {
					 set function [expr $opcode - [set vci_[set vci]_opcode_start]]
					 set vcustom[set opcode]_depth [set vci_[set vci]_function_[set function]_depth]
					 set vcustom[set opcode]_lanes [set vci_[set vci]_lanes]
				}
		  } else {
				set vci_[set vci]_lanes             $vector_lanes
				for {set function 0} {$function < [expr 16 - $vci]} {incr function} {
					 set vci_[set vci]_function_[set function]_depth 0
				}
				set vci_[set vci]_opcode_start       $vci
				set vci_[set vci]_functions          1
				set vci_[set vci]_opcode_end         $vci
				set vci_[set vci]_modifies_dest_addr false
		  }
		  set vci_[set vci]_bytes        [expr 4 * [set vci_[set vci]_lanes]]
		  set vci_[set vci]_bits         [expr 32 * [set vci_[set vci]_lanes]]
    }


    set memory_width_lanes [get_parameter_value MEMORY_WIDTH_LANES]
    set slave_width_lanes  [get_parameter_value SLAVE_WIDTH_LANES]
    set scratchpad_kb      [get_parameter_value SCRATCHPAD_KB]
    set burstlength_bytes  [get_parameter_value BURSTLENGTH_BYTES]
    set min_multiplier_hw  [get_parameter_value MIN_MULTIPLIER_HW]
    set mulfxp_word_fraction_bits \
        [get_parameter_value MULFXP_WORD_FRACTION_BITS]
    set mulfxp_half_fraction_bits \
        [get_parameter_value MULFXP_HALF_FRACTION_BITS]
    set mulfxp_byte_fraction_bits \
        [get_parameter_value MULFXP_BYTE_FRACTION_BITS]
    # Convert true/false to 1/0.
    set max_masked_waves    [get_parameter_value MAX_MASKED_WAVES]
    set fixed_point_support [get_parameter_value FIXED_POINT_SUPPORT]

    foreach p [get_parameters] {
        send_message Info "$p = [get_parameter_value $p]"
    }

    set tmp_output_dir [ add_fileset_file dummy.txt OTHER TEMP "" ]
    # puts "tmp_output_dir = $tmp_output_dir"

    # Copy all files in Filelist to tmp output dir, where they can
    # be added to the fileset, or used for IPFS model generation.
    # Note that files have to be added to the simulation fileset in
    # dependency order for ModelSim compilation.
    set vhd_files [list]
    set f [open Filelist]
    while {[gets $f line] >= 0} {

        set line [string trim $line]
        if {[string index $line 0] != "#"} {
            lappend vhd_files $line
        }
    }
    close $f
    foreach f $vhd_files {
        file copy $f $tmp_output_dir
    }

    set burstcount_width [get_parameter_value BURSTCOUNT_WIDTH]
    set memory_bus_width [get_parameter_value MEMORY_BUS_WIDTH]
    set slave_addr_width [get_parameter_value SLAVE_ADDR_WIDTH]
    set vector_bytes     [expr 4*$vector_lanes]
    set vector_bits      [expr 32*$vector_lanes]



	 # Add new files to end of file list.
	 #lappend vhd_files ${entity_name}.vhd ${entity_name}_pkg.vhd

	 set ocp_files [glob -nocomplain *.ocp]
	 foreach f $ocp_files {
		  file copy $f $tmp_output_dir
	 }

	 # Files get copied to a subdirectory of synthesis/submodules or
	 # simulation/submodules.
	 set dest_subdir vbx/mxp

	 # Assume existence of this file means the unencrypted sources
	 # are available.
	 set unencrypted_src [file exists vectorblox_1.vhd]

	 if {($fileset == "QUARTUS_SYNTH") || \
				(($fileset == "SIM_VHDL") && $unencrypted_src)} {
		  # For SYNTH case, copy VHDL sources whether they are encrypted or not.
		  # For SIM_VHDL, only copy the VHDL sources if they are unencrypted.
		  foreach f $vhd_files {
				add_fileset_file $dest_subdir/$f VHDL PATH $tmp_output_dir/$f
		  }
	 } else {
		  # Generate IPFS model.
		  # (SIM_VHDL or SIM_VERILOG with encrypted sources, or
		  # SIM_VERILOG with unencrypted sources.)
		  ipfs_gen $entity_name $fileset $dest_subdir $tmp_output_dir
	 }

	 if {$fileset == "QUARTUS_SYNTH"} {
		  foreach f $ocp_files {
				add_fileset_file $dest_subdir/$f OTHER PATH $tmp_output_dir/$f
		  }
	 }
	 send_message Info "fileset = $fileset"
}

# +-----------------------------------
# | parameters
# |

add_parameter VECTOR_LANES INTEGER 1
set_parameter_property VECTOR_LANES DISPLAY_NAME "Number of Vector Lanes"
set_parameter_property VECTOR_LANES DESCRIPTION [concat \
																	  "The number of vector lanes. This must be a power of 2. Each vector " \
																	  "lane requires about the same amount of resources as the Nios II/f " \
																	  "host CPU."]
set_parameter_property VECTOR_LANES ALLOWED_RANGES {1 2 4 8 16 32 64 128 256}
set_parameter_property VECTOR_LANES HDL_PARAMETER true

add_parameter UNPOPULATED_ALU_LANES INTEGER 0
set_parameter_property UNPOPULATED_ALU_LANES DISPLAY_NAME "Number of Unpopulated ALU Lanes"
set_parameter_property UNPOPULATED_ALU_LANES DESCRIPTION [concat \
                                                              "The number of unpopulated ALU Lanes (reduce to save LUTs at the expense of lower performance on non multiply/shift/VCI instructions). " \
                                                              "This must be less than the number of VECTOR_LANES, and when MAX_MASKED_WAVES is non-zero UNPOPULATED_ALU_LANES must be 0."]
set_parameter_property UNPOPULATED_ALU_LANES ALLOWED_RANGES 0:255
set_parameter_property UNPOPULATED_ALU_LANES HDL_PARAMETER true

add_parameter UNPOPULATED_MULTIPLIER_LANES INTEGER 0
set_parameter_property UNPOPULATED_MULTIPLIER_LANES DISPLAY_NAME "Number of Unpopulated MULTIPLIER Lanes"
set_parameter_property UNPOPULATED_MULTIPLIER_LANES DESCRIPTION [concat \
                                                              "The number of unpopulated MULTIPLIER Lanes (reduce to save DSPs at the expense of lower multiply/shift performance). " \
                                                              "This must be less than the number of VECTOR_LANES."]
set_parameter_property UNPOPULATED_MULTIPLIER_LANES ALLOWED_RANGES 0:255
set_parameter_property UNPOPULATED_MULTIPLIER_LANES HDL_PARAMETER true

add_parameter MEMORY_WIDTH_LANES INTEGER 1
set_parameter_property MEMORY_WIDTH_LANES DISPLAY_NAME "Number of Memory Lanes (DMA Bus Width)"
set_parameter_property MEMORY_WIDTH_LANES DESCRIPTION [concat \
																			  "The data bus width of the Avalon-MM master interface expressed in " \
																			  "terms of 32-bit lanes. " \
																			  "The number of memory lanes must be a power of two and no larger than " \
																			  "the number of vector lanes. " \
																			  "For best performance, the width of this interface should match the " \
																			  "width of the Avalon slave port of the external memory controller."]
# The maximum Avalon data bus width is 1024 bits, allowing at most 32 lanes.
set_parameter_property MEMORY_WIDTH_LANES ALLOWED_RANGES {1 2 4 8 16 32}
set_parameter_property MEMORY_WIDTH_LANES DISPLAY_UNITS "Words"
set_parameter_property MEMORY_WIDTH_LANES HDL_PARAMETER true

add_parameter SLAVE_WIDTH_LANES INTEGER 1
set_parameter_property SLAVE_WIDTH_LANES DISPLAY_NAME "Number of Slave Memory Lanes"
set_parameter_property SLAVE_WIDTH_LANES DESCRIPTION [concat \
																			  "The data bus width of the Avalon-MM slave interface expressed in " \
																			  "terms of 32-bit lanes. " \
																			  "The number of memory lanes must be a power of two and no larger than " \
																			  "the number of vector lanes. " \
																			  "For best performance, the width of this interface should match the " \
																			  "width of the Avalon master port of the external processor."]
# The maximum Avalon data bus width is 1024 bits, allowing at most 32 lanes.
set_parameter_property SLAVE_WIDTH_LANES ALLOWED_RANGES {1 2 4 8 16 32}
set_parameter_property SLAVE_WIDTH_LANES DISPLAY_UNITS "Words"
set_parameter_property SLAVe_WIDTH_LANES HDL_PARAMETER true

add_parameter BEATS_PER_BURST INTEGER 8
set_parameter_property BEATS_PER_BURST DISPLAY_NAME "Maximum Burst Size in Beats"
set_parameter_property BEATS_PER_BURST DESCRIPTION [concat \
																		  "The maximum number of beats per burst issued by the DMA Engine's " \
																		  "Avalon-MM master interface. " \
																		  "A beat is a clock cycle in which data is transferred between " \
																		  "a master and slave interface. Using a larger value can improve the " \
																		  "bandwidth between the MXP and slave devices. However, a very large " \
																		  "value could potentially starve other masters (such as the Nios II/f " \
																		  "host) from accessing a slave. Likewise, very small values will divide " \
																		  "long transfers int very short bursts, losing potential bandwidth " \
																		  "during the gaps."]
set_parameter_property BEATS_PER_BURST ALLOWED_RANGES \
    {1 2 4 8 16 32 64 128 256 512 1024}
set_parameter_property BEATS_PER_BURST DISPLAY_UNITS Beats

add_parameter SCRATCHPAD_KB INTEGER 8
set_parameter_property SCRATCHPAD_KB DISPLAY_NAME "Scratchpad Size"
set_parameter_property SCRATCHPAD_KB DESCRIPTION [concat \
																		"The Scratchpad RAM size in kilobytes. VectorBlox recommends 4KB per " \
																		"vector lane for most applications."]
set_parameter_property SCRATCHPAD_KB UNITS Kilobytes
set_parameter_property SCRATCHPAD_KB HDL_PARAMETER true

add_parameter INSTR_PORT_CHOICE integer 1
set_parameter_property INSTR_PORT_CHOICE DISPLAY_NAME "Instruction Port Type"
set_parameter_property INSTR_PORT_CHOICE HDL_PARAMETER true
set_parameter_property INSTR_PORT_CHOICE DESCRIPTION [concat \
																		  "The MXP can be controlled using several different instruction ports. To connect"\
																		  "an ARM host processor to the MXP use the AXI Memory Mapped Port. To connect A"\
																		  "NIOS II host processor to the MXP use the Nios Custom Instruction Port. The "\
																		  "Nios Custom Instruction (with shim) is provided as a workaround if the QSYS or"\
																		  "BSP generation tools fail while creating a multiprocessing system. "]


set_parameter_property INSTR_PORT_CHOICE ALLOWED_RANGES \
    {3:Vector\ Coprocessor\ Port\ (VCP), 2:AXI\ Memory\ Mapped\ (Beta) 1:Nios\ Custom\ Instruction }


add_parameter INSTR_PORT_ID_WIDTH INTEGER 12
set_parameter_property INSTR_PORT_ID_WIDTH HDL_PARAMETER true
set_parameter_property INSTR_PORT_ID_WIDTH DISPLAY_NAME "Instruction Port ID Width"
set_parameter_property INSTR_PORT_ID_WIDTH DESCRIPTION "Choose an appropriate width for the ID field on the AXI instruction Port"
set_parameter_property INSTR_PORT_ID_WIDTH VISIBLE false

add_parameter INSTR_ADDR_WIDTH INTEGER 6
set_parameter_property INSTR_ADDR_WIDTH HDL_PARAMETER true
set_parameter_property INSTR_ADDR_WIDTH VISIBLE false


add_parameter MIN_MULTIPLIER_HW integer 1
set_parameter_property MIN_MULTIPLIER_HW DISPLAY_NAME "Multiplier Performance"
set_parameter_property MIN_MULTIPLIER_HW DESCRIPTION [concat \
																			 "This sets the minimum multiplier size. This can be used to reduce the " \
																			 "number of hard multipliers used, at the cost of performance. " \
																			 "If set to Byte, then byte, halfword, " \
																			 "and word multipliers are instantiated and multiplication of any element " \
																			 "size runs at full speed. If set to Halfword, only word and " \
																			 "halfword multipliers are instantiated; byte-width " \
																			 "multiplication will be executed with the halfword multiplier and run at " \
																			 "half speed. If set to Word, only word multipliers are instantiated; " \
																			 "halfword-width multiplication will run at half speed and " \
																			 "byte-width multiplication will run at quarter speed."]
set_parameter_property MIN_MULTIPLIER_HW ALLOWED_RANGES \
    {0:Byte 1:Halfword 2:Word}
set_parameter_property MIN_MULTIPLIER_HW HDL_PARAMETER true



add_parameter MAX_MASKED_WAVES POSITIVE 128
set_parameter_property MAX_MASKED_WAVES DISPLAY_NAME "Maximum # of waves for masked instructions"
set_parameter_property MAX_MASKED_WAVES DESCRIPTION [concat \
																			"The number of waves supported by a masked vector instruction " \
																			"(when the element size is one byte). " \
																			"The maximum vector length for masked instructions will be this " \
																			"value multiplied by VECTOR_LANES*4."]
set_parameter_property MAX_MASKED_WAVES ALLOWED_RANGES {0 128 256 512 1024}
set_parameter_property MAX_MASKED_WAVES HDL_PARAMETER true


###########################################################################
set vci_grp "Vector Custom Instruction (VCI) Options"

add_parameter VECTOR_CUSTOM_INSTRUCTIONS NATURAL 0
set_parameter_property VECTOR_CUSTOM_INSTRUCTIONS DISPLAY_NAME "Vector Custom Instruction Ports"
set_parameter_property VECTOR_CUSTOM_INSTRUCTIONS DEFAULT_VALUE 0
set_parameter_property VECTOR_CUSTOM_INSTRUCTIONS DESCRIPTION [concat \
																						 "Number of Vector Custom Instructions (VCIs) to be attached."]
set_parameter_property VECTOR_CUSTOM_INSTRUCTIONS ALLOWED_RANGES \
    {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16}
set_parameter_property VECTOR_CUSTOM_INSTRUCTIONS GROUP $vci_grp
set_parameter_property VECTOR_CUSTOM_INSTRUCTIONS HDL_PARAMETER true

add_parameter MAX_VCI_DEPTH_WITHOUT_FLUSH NATURAL 4
set_parameter_property MAX_VCI_DEPTH_WITHOUT_FLUSH DISPLAY_NAME "Max VCI Depth Without Pipeline Flush"
set_parameter_property MAX_VCI_DEPTH_WITHOUT_FLUSH DEFAULT_VALUE 4
set_parameter_property MAX_VCI_DEPTH_WITHOUT_FLUSH DESCRIPTION [concat \
																						 "Maximum Vector Custom Instruction (VCI) depth without pipeline flush.  Any longer pipeline VCIs will cause a pipeline flush after each execution."]
set_parameter_property MAX_VCI_DEPTH_WITHOUT_FLUSH ALLOWED_RANGES 2:256
set_parameter_property MAX_VCI_DEPTH_WITHOUT_FLUSH GROUP $vci_grp
set_parameter_property MAX_VCI_DEPTH_WITHOUT_FLUSH HDL_PARAMETER true


for {set vci 0} {$vci < 16} {incr vci} {
    set vci_[set vci]_grp "VCI $vci"

    add_parameter VCI_[set vci]_UID integer -1
    set_parameter_property VCI_[set vci]_UID DISPLAY_NAME "Unique ID"
    set_parameter_property VCI_[set vci]_UID DESCRIPTION [concat "Unique ID that matches connected Custom Instruction"]
    set_parameter_property VCI_[set vci]_UID GROUP [set vci_[set vci]_grp]
	 set_display_item_property VCI_[set vci]_UID DISPLAY_HINT hexadecimal


	 add_parameter VCUSTOM[set vci]_DEPTH integer 0
	 set_parameter_property  VCUSTOM[set vci]_DEPTH HDL_PARAMETER true
	 set_parameter_property  VCUSTOM[set vci]_DEPTH VISIBLE false
	 set_parameter_property  VCUSTOM[set vci]_DEPTH DERIVED true

    add_parameter VCI_[set vci]_LANES POSITIVE 1
	 set_parameter_property  VCI_[set vci]_LANES HDL_PARAMETER true
    set_parameter_property VCI_[set vci]_LANES DISPLAY_NAME "Lanes"
    set_parameter_property VCI_[set vci]_LANES DESCRIPTION [concat \
																					 "The number of lanes of data to/from custom instruction port 0. " \
																					 "Must be no larger than the number of vector lanes."]
    set_parameter_property VCI_[set vci]_LANES ALLOWED_RANGES 1:256
    set_parameter_property VCI_[set vci]_LANES GROUP [set vci_[set vci]_grp]

    add_parameter VCI_[set vci]_OPCODE_START NATURAL $vci
	 set_parameter_property  VCI_[set vci]_OPCODE_START HDL_PARAMETER true
    set_parameter_property VCI_[set vci]_OPCODE_START DISPLAY_NAME "Opcode Start"
    set_parameter_property VCI_[set vci]_OPCODE_START DESCRIPTION [concat \
																							  "The start of the VCI opcode space used by the VCI " \
																							  "attached on custom instruction port 0."]
    set_parameter_property VCI_[set vci]_OPCODE_START ALLOWED_RANGES \
		  {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15}
    set_parameter_property VCI_[set vci]_OPCODE_START GROUP [set vci_[set vci]_grp]

    add_parameter VCI_[set vci]_FUNCTIONS POSITIVE 1
    set_parameter_property VCI_[set vci]_FUNCTIONS DISPLAY_NAME "Internal Functions (Opcodes)"
    set_parameter_property VCI_[set vci]_FUNCTIONS DESCRIPTION [concat \
																						  "The number of internal functions within the VCI " \
																						  "attached on custom instruction port 0. " \
																						  "Each function will get a separate VCUSTOM opcode."]
    #Create a list of valid # of functions, port N can have 16-N functions
    set functions_range {}
    for {set functions 1} {$functions <= [expr 16 - $vci]} {incr functions} {
		  lappend functions_range $functions
    }
    set_parameter_property VCI_[set vci]_FUNCTIONS ALLOWED_RANGES $functions_range
    set_parameter_property VCI_[set vci]_FUNCTIONS GROUP [set vci_[set vci]_grp]


	 add_parameter VCI_[set vci]_OPCODE_END NATURAL $vci
	 set_parameter_property VCI_[set vci]_OPCODE_END VISIBLE false
	 set_parameter_property VCI_[set vci]_OPCODE_END HDL_PARAMETER true
	 set_parameter_property VCI_[set vci]_OPCODE_END DERIVED true

    for {set function 0} {$function < [expr 16 - $vci]} {incr function} {

		  add_parameter VCI_[set vci]_FUNCTION_[set function]_DEPTH NATURAL 0
		  set_parameter_property VCI_[set vci]_FUNCTION_[set function]_DEPTH DISPLAY_NAME "Function $function Pipeline Depth"
		  set_parameter_property VCI_[set vci]_FUNCTION_[set function]_DEPTH DESCRIPTION [concat \
																														  "The number of pipeline stages internal to VCI $vci function number $function " \
																														  "(visible to software at VCUSTOM\{VCI_[set vci]_OPCODE_START+[set function]\})."]
		  set_parameter_property VCI_[set vci]_FUNCTION_[set function]_DEPTH ALLOWED_RANGES 0:256
		  set_parameter_property VCI_[set vci]_FUNCTION_[set function]_DEPTH GROUP [set vci_[set vci]_grp]
    }

    add_parameter VCI_[set vci]_MODIFIES_DEST_ADDR integer 0
set_parameter_property  VCI_[set vci]_MODIFIES_DEST_ADDR HDL_PARAMETER true
    set_parameter_property VCI_[set vci]_MODIFIES_DEST_ADDR DISPLAY_NAME "Modifies Destination Address"
    set_parameter_property VCI_[set vci]_MODIFIES_DEST_ADDR DESCRIPTION [concat \
																									  "Check if the VCI attached on custom instruction port $vci modifies " \
																									  "the destination address.  This forces a pipeline flush after " \
																									  "executing this VCI to ensure correct operation."]
    set_parameter_property VCI_[set vci]_MODIFIES_DEST_ADDR GROUP [set vci_[set vci]_grp]
	 set_display_item_property VCI_[set vci]_MODIFIES_DEST_ADDR DISPLAY_HINT boolean
}


###########################################################################
set fxp_grp "Fixed-Point Multiply Format"

add_parameter FIXED_POINT_SUPPORT integer 1
set_parameter_property  FIXED_POINT_SUPPORT HDL_PARAMETER true
set_parameter_property FIXED_POINT_SUPPORT DISPLAY_NAME "Fixed Point Support"
set_parameter_property FIXED_POINT_SUPPORT DESCRIPTION "Support fixed-point operations (VMULFXP, VADDFXP, VSUBFXP)."
set_parameter_property FIXED_POINT_SUPPORT GROUP $fxp_grp
set_display_item_property FIXED_POINT_SUPPORT DISPLAY_HINT boolean

add_parameter MULFXP_WORD_FRACTION_BITS INTEGER 25
set_parameter_property  MULFXP_WORD_FRACTION_BITS HDL_PARAMETER true
set_parameter_property MULFXP_WORD_FRACTION_BITS DISPLAY_NAME \
    "Number of fractional bits in a word"
set_parameter_property MULFXP_WORD_FRACTION_BITS DESCRIPTION [concat \
																						"Specifies the number of least-significant bits that will be used to " \
																						"represent the fractional part of a 32-bit fixed-point number."]
set_parameter_property MULFXP_WORD_FRACTION_BITS ALLOWED_RANGES 1:31
set_parameter_property MULFXP_WORD_FRACTION_BITS UNITS Bits
set_parameter_property MULFXP_WORD_FRACTION_BITS GROUP $fxp_grp

add_parameter MULFXP_HALF_FRACTION_BITS INTEGER 15
set_parameter_property  MULFXP_HALF_FRACTION_BITS HDL_PARAMETER true
set_parameter_property MULFXP_HALF_FRACTION_BITS DISPLAY_NAME \
    "Number of fractional bits in a halfword"
set_parameter_property MULFXP_HALF_FRACTION_BITS DESCRIPTION [concat \
																						"Specifies the number of least-significant bits that will be used to " \
																						"represent the fractional part of a 16-bit fixed-point number."]
set_parameter_property MULFXP_HALF_FRACTION_BITS ALLOWED_RANGES 1:15
set_parameter_property MULFXP_HALF_FRACTION_BITS UNITS Bits
set_parameter_property MULFXP_HALF_FRACTION_BITS GROUP $fxp_grp

add_parameter MULFXP_BYTE_FRACTION_BITS INTEGER 4
set_parameter_property  MULFXP_BYTE_FRACTION_BITS HDL_PARAMETER true
set_parameter_property MULFXP_BYTE_FRACTION_BITS DISPLAY_NAME \
    "Number of fractional bits in a byte"
set_parameter_property MULFXP_BYTE_FRACTION_BITS DESCRIPTION [concat \
																						"Specifies the number of least-significant bits that will be used to " \
																						"represent the fractional part of an 8-bit fixed-point number."]
set_parameter_property MULFXP_BYTE_FRACTION_BITS ALLOWED_RANGES 1:7
set_parameter_property MULFXP_BYTE_FRACTION_BITS UNITS Bits
set_parameter_property MULFXP_BYTE_FRACTION_BITS GROUP $fxp_grp

###########################################################################
if {![catch {package require -exact qsys 12.0}]} {
    if {$tcl_platform(os) == "Linux"} {
        set w 225
    } else {
        set w 192
    }
    add_display_item $fxp_grp fxp_formats text [concat \
																	 "<html><table>" \
																	 "<tr><td width=$w>32-bit fixed-point format:</td><td>Q7.25</td></tr>" \
																	 "<tr><td width=$w>16-bit fixed-point format:</td><td>Q1.15</td></tr>" \
																	 "<tr><td width=$w>8-bit fixed-point format:</td><td>Q4.4</td></tr>" \
																	 "</table></html>" ]
}

add_parameter MULFXP_WORD_FORMAT STRING "Q7.25"
set_parameter_property MULFXP_WORD_FORMAT DERIVED true
if {[catch {package require -exact qsys 12.0}]} {
    set_parameter_property MULFXP_WORD_FORMAT VISIBLE true
} else {
    set_parameter_property MULFXP_WORD_FORMAT VISIBLE false
}
set_parameter_property MULFXP_WORD_FORMAT DISPLAY_NAME "32-bit fixed-point format"
set_parameter_property MULFXP_WORD_FORMAT DESCRIPTION [concat \
																			  "32-bit fixed-point format in Q notation, where the first number " \
																			  "specifies the number of integer bits and the second number "  \
																			  "specifies the number of fractional bits."]
set_parameter_property MULFXP_WORD_FORMAT GROUP $fxp_grp
set_parameter_property MULFXP_WORD_FORMAT WIDTH 5

add_parameter MULFXP_HALF_FORMAT STRING "Q1.15"
set_parameter_property MULFXP_HALF_FORMAT DERIVED true
if {[catch {package require -exact qsys 12.0}]} {
    set_parameter_property MULFXP_HALF_FORMAT VISIBLE true
} else {
    set_parameter_property MULFXP_HALF_FORMAT VISIBLE false
}
set_parameter_property MULFXP_HALF_FORMAT DISPLAY_NAME "16-bit fixed-point format"
set_parameter_property MULFXP_HALF_FORMAT DESCRIPTION [concat \
																			  "16-bit fixed-point format in Q notation, where the first number " \
																			  "specifies the number of integer bits and the second number "  \
																			  "specifies the number of fractional bits."]
set_parameter_property MULFXP_HALF_FORMAT GROUP $fxp_grp

add_parameter MULFXP_BYTE_FORMAT STRING "Q4.4"
set_parameter_property MULFXP_BYTE_FORMAT DERIVED true
if {[catch {package require -exact qsys 12.0}]} {
    set_parameter_property MULFXP_BYTE_FORMAT VISIBLE true
} else {
    set_parameter_property MULFXP_BYTE_FORMAT VISIBLE false
}
set_parameter_property MULFXP_BYTE_FORMAT DISPLAY_NAME "8-bit fixed-point format"
set_parameter_property MULFXP_BYTE_FORMAT DESCRIPTION [concat \
																			  "8-bit fixed-point format in Q notation, where the first number " \
																			  "specifies the number of integer bits and the second number "  \
																			  "specifies the number of fractional bits."]
set_parameter_property MULFXP_BYTE_FORMAT GROUP $fxp_grp

###########################################################################
# Derived parameters (displayed, but not editable)
set derived_grp "Derived Avalon Parameters"

add_parameter MEMORY_BUS_WIDTH INTEGER
set_parameter_property MEMORY_BUS_WIDTH DERIVED true
set_parameter_property MEMORY_BUS_WIDTH DISPLAY_NAME "DMA Master Data Bus Width"
set_parameter_property MEMORY_BUS_WIDTH DESCRIPTION [concat \
																			"The data bus width of the Avalon-MM master interface in bits."]
set_parameter_property MEMORY_BUS_WIDTH ALLOWED_RANGES 0:1024
set_parameter_property MEMORY_BUS_WIDTH UNITS Bits
set_parameter_property MEMORY_BUS_WIDTH GROUP $derived_grp

add_parameter BURSTLENGTH_BYTES INTEGER
set_parameter_property  BURSTLENGTH_BYTES HDL_PARAMETER true
set_parameter_property BURSTLENGTH_BYTES DERIVED true
set_parameter_property BURSTLENGTH_BYTES DISPLAY_NAME "DMA Master Burst Size"
set_parameter_property BURSTLENGTH_BYTES ALLOWED_RANGES 0:131072
set_parameter_property BURSTLENGTH_BYTES DESCRIPTION [concat \
																			 "The Avalon-MM master interface's maximum burst size in bytes, " \
																			 "as determined by the " \
																			 "memory bus width and the maximum number of beats per burst."]
set_parameter_property BURSTLENGTH_BYTES UNITS Bytes
set_parameter_property BURSTLENGTH_BYTES GROUP $derived_grp

add_parameter BURSTCOUNT_WIDTH INTEGER
set_parameter_property BURSTCOUNT_WIDTH DERIVED true
set_parameter_property BURSTCOUNT_WIDTH DISPLAY_NAME "DMA Master Burstcount Width"
set_parameter_property BURSTCOUNT_WIDTH ALLOWED_RANGES 0:11
set_parameter_property BURSTCOUNT_WIDTH UNITS Bits
set_parameter_property BURSTCOUNT_WIDTH DESCRIPTION [concat \
																			"The Avalon-MM master interface's burstcount width as determined by the " \
																			"maximum burst size and the memory bus width."]
set_parameter_property BURSTCOUNT_WIDTH GROUP $derived_grp

add_parameter SLAVE_ADDR_WIDTH INTEGER
set_parameter_property SLAVE_ADDR_WIDTH DERIVED true
set_parameter_property SLAVE_ADDR_WIDTH DISPLAY_NAME "Scratchpad Slave Address Width"
set_parameter_property SLAVE_ADDR_WIDTH ALLOWED_RANGES 0:32
set_parameter_property SLAVE_ADDR_WIDTH UNITS Bits
set_parameter_property SLAVE_ADDR_WIDTH DESCRIPTION \
    "Avalon-MM slave address width as determined by the scratchpad size."
set_parameter_property SLAVE_ADDR_WIDTH GROUP $derived_grp



##########################################################################
# system_INFO parameters

add_parameter CI_CLK_RATE INTEGER
set_parameter_property CI_CLK_RATE VISIBLE false
set_parameter_property CI_CLK_RATE SYSTEM_INFO {CLOCK_RATE "ci_clk"}

add_parameter CORE_CLK_RATE INTEGER
set_parameter_property CORE_CLK_RATE VISIBLE false
set_parameter_property CORE_CLK_RATE SYSTEM_INFO {CLOCK_RATE "core_clk"}

add_parameter CORE_CLK_2X_RATE INTEGER
set_parameter_property CORE_CLK_2X_RATE VISIBLE false
set_parameter_property CORE_CLK_2X_RATE SYSTEM_INFO {CLOCK_RATE "core_clk_2x"}

add_parameter CI_CLK_DOMAIN INTEGER
set_parameter_property CI_CLK_DOMAIN VISIBLE false
set_parameter_property CI_CLK_DOMAIN SYSTEM_INFO {CLOCK_DOMAIN "ci_clk"}

add_parameter CORE_CLK_DOMAIN INTEGER
set_parameter_property CORE_CLK_DOMAIN VISIBLE false
set_parameter_property CORE_CLK_DOMAIN SYSTEM_INFO {CLOCK_DOMAIN "core_clk"}

add_parameter CORE_CLK_2X_DOMAIN INTEGER
set_parameter_property CORE_CLK_2X_DOMAIN VISIBLE false
set_parameter_property CORE_CLK_2X_DOMAIN SYSTEM_INFO {CLOCK_DOMAIN "core_clk_2x"}

add_parameter DEVICE_FAMILY STRING
set_parameter_property DEVICE_FAMILY VISIBLE false
set_parameter_property DEVICE_FAMILY SYSTEM_INFO {DEVICE_FAMILY}

add_parameter UNIQUE_ID STRING
set_parameter_property UNIQUE_ID VISIBLE false
set_parameter_property UNIQUE_ID SYSTEM_INFO {UNIQUE_ID}

###########################################################################

# +-----------------------------------
# | connection point instr_conduit
# |
add_interface instr_conduit conduit end

set_interface_property instr_conduit ENABLED true

add_interface_port instr_conduit ci_clk export Input 1
add_interface_port instr_conduit ci_clk_en export Input 1
add_interface_port instr_conduit ci_reset export Input 1
add_interface_port instr_conduit ci_start export Input 1
add_interface_port instr_conduit ci_done export Output 1
add_interface_port instr_conduit ci_dataa export Input 32
add_interface_port instr_conduit ci_datab export Input 32
add_interface_port instr_conduit ci_writerc export Input 1
add_interface_port instr_conduit ci_result export Output 32
# |
# +-----------------------------------

#
# connection point conduit_end
#
add_interface vcp conduit end
set_interface_property vcp associatedClock core_clk
set_interface_property vcp associatedReset core_reset
set_interface_property vcp ENABLED true

add_interface_port vcp vcp_data0            data0             Input  32
add_interface_port vcp vcp_data1            data1             Input  32
add_interface_port vcp vcp_data2            data2             Input  32
add_interface_port vcp vcp_instruction      instruction       Input  41
add_interface_port vcp vcp_valid_instr      valid_instr       Input  1
add_interface_port vcp vcp_ready            ready             Output 1
add_interface_port vcp vcp_illegal          illegal           Output 1
add_interface_port vcp vcp_writeback_data   writeback_data    Output 32
add_interface_port vcp vcp_writeback_en     writeback_en      Output 1
add_interface_port vcp vcp_alu_data1        alu_data1         Output 32
add_interface_port vcp vcp_alu_data2        alu_data2         Output 32
add_interface_port vcp vcp_alu_source_valid alu_source_valid  Output 1
add_interface_port vcp vcp_alu_result       alu_result        Input  32
add_interface_port vcp vcp_alu_result_valid alu_result_valid  Input  1

###########################################################################
# Nios II Custom Instruction Slave interface
add_interface ncs nios_custom_instruction slave
set_interface_property ncs clockCycle 0
set_interface_property ncs operands 2

set_interface_property ncs ENABLED false

add_interface_port ncs ncs_clk clk Input 1
add_interface_port ncs ncs_clk_en clk_en Input 1
add_interface_port ncs ncs_reset reset Input 1
add_interface_port ncs ncs_start start Input 1
add_interface_port ncs ncs_done done Output 1
add_interface_port ncs ncs_dataa dataa Input 32
add_interface_port ncs ncs_datab datab Input 32
add_interface_port ncs ncs_writerc writerc Input 1
add_interface_port ncs ncs_result result Output 32



# Axi instruction port
add_interface axi_instr_slave axi slave
set_interface_property axi_instr_slave associatedClock core_clk
set_interface_property axi_instr_slave associatedReset core_reset
set_interface_property axi_instr_slave readAcceptanceCapability 1
set_interface_property axi_instr_slave writeAcceptanceCapability 1
set_interface_property axi_instr_slave combinedAcceptanceCapability 1
set_interface_property axi_instr_slave ENABLED false


add_interface_port axi_instr_slave axs_awaddr   awaddr    Input  INSTR_ADDR_WIDTH
add_interface_port axi_instr_slave axs_awvalid  awvalid	  Input  1
add_interface_port axi_instr_slave axs_awready  awready	  Output 1
add_interface_port axi_instr_slave axs_awid     awid   	  Input 1
#   add_interface_port axi_instr_slave axs_awlen    awlen  	  Input  8
add_interface_port axi_instr_slave axs_awlen    awlen  	  Input  4
add_interface_port axi_instr_slave axs_awsize   awsize 	  Input  3
#    add_interface_port axi_instr_slave axs_awburst  awburst	  Input  2
add_interface_port axi_instr_slave axs_awburst  awburst	  Input  2
add_interface_port axi_instr_slave axs_awlock   awlock    Input  2
add_interface_port axi_instr_slave axs_awcache  awcache   Input  4
add_interface_port axi_instr_slave axs_awprot   awprot    Input  3


add_interface_port axi_instr_slave axs_wdata  	 wdata  	  Input  32
add_interface_port axi_instr_slave axs_wstrb  	 wstrb  	  Input  4
add_interface_port axi_instr_slave axs_wvalid 	 wvalid 	  Input  1
add_interface_port axi_instr_slave axs_wlast  	 wlast  	  Input  1
add_interface_port axi_instr_slave axs_wready 	 wready 	  Output 1
add_interface_port axi_instr_slave axs_wid    	 wid    	  Input 1


add_interface_port axi_instr_slave axs_bready 	 bready 	  Input  1
add_interface_port axi_instr_slave axs_bresp  	 bresp  	  Output 2
add_interface_port axi_instr_slave axs_bvalid 	 bvalid 	  Output 1
add_interface_port axi_instr_slave axs_bid    	 bid    	  Output 1

add_interface_port axi_instr_slave axs_araddr   araddr 	  Input  INSTR_ADDR_WIDTH
add_interface_port axi_instr_slave axs_arvalid  arvalid	  Input  1
add_interface_port axi_instr_slave axs_arready  arready	  Output 1
add_interface_port axi_instr_slave axs_arid     arid   	  Input 1
#   add_interface_port axi_instr_slave axs_arlen    arlen  	  Input  8
add_interface_port axi_instr_slave axs_arlen    arlen  	  Input  4
add_interface_port axi_instr_slave axs_arsize   arsize 	  Input  3
add_interface_port axi_instr_slave axs_arburst  arburst	  Input  2
add_interface_port axi_instr_slave axs_arlock   arlock    Input  2
add_interface_port axi_instr_slave axs_arcache  arcache	  Input  4
add_interface_port axi_instr_slave axs_arprot   arprot    Input  3

add_interface_port axi_instr_slave axs_rready 	 rready 	  Input  1
add_interface_port axi_instr_slave axs_rdata  	 rdata  	  Output 32
add_interface_port axi_instr_slave axs_rresp  	 rresp  	  Output 2
add_interface_port axi_instr_slave axs_rvalid 	 rvalid 	  Output 1
add_interface_port axi_instr_slave axs_rlast  	 rlast  	  Output 1
add_interface_port axi_instr_slave axs_rid    	 rid    	  Output 1

# +-----------------------------------
# | connection point dma_master
# |
add_interface dma_master avalon master
set_interface_property dma_master addressUnits SYMBOLS
set_interface_property dma_master associatedClock core_clk
set_interface_property dma_master associatedReset core_reset
set_interface_property dma_master bitsPerSymbol 8
set_interface_property dma_master burstOnBurstBoundariesOnly false
set_interface_property dma_master burstcountUnits WORDS
set_interface_property dma_master constantBurstBehavior false
set_interface_property dma_master doStreamReads false
set_interface_property dma_master doStreamWrites false
set_interface_property dma_master holdTime 0
set_interface_property dma_master linewrapBursts false
set_interface_property dma_master maximumPendingReadTransactions 0
set_interface_property dma_master readLatency 0
set_interface_property dma_master readWaitTime 1
set_interface_property dma_master setupTime 0
set_interface_property dma_master timingUnits Cycles
set_interface_property dma_master writeWaitTime 0

set_interface_property dma_master ENABLED true

add_interface_port dma_master master_address address Output 32
add_interface_port dma_master master_read read Output 1
add_interface_port dma_master master_write write Output 1
add_interface_port dma_master master_waitrequest waitrequest Input 1
add_interface_port dma_master master_readdatavalid readdatavalid Input 1
# Port widths will be set by elaboration callback:
add_interface_port dma_master master_byteenable byteenable Output
add_interface_port dma_master master_writedata writedata Output
add_interface_port dma_master master_readdata readdata Input
add_interface_port dma_master master_burstcount burstcount Output
# |
# +-----------------------------------


# +-----------------------------------
# | connection point scratchpad_slave
# |
add_interface scratchpad_slave avalon end
set_interface_property scratchpad_slave addressUnits WORDS
set_interface_property scratchpad_slave associatedClock core_clk
set_interface_property scratchpad_slave associatedReset core_reset
set_interface_property scratchpad_slave bitsPerSymbol 8
set_interface_property scratchpad_slave burstOnBurstBoundariesOnly false
set_interface_property scratchpad_slave burstcountUnits WORDS
set_interface_property scratchpad_slave explicitAddressSpan 0
set_interface_property scratchpad_slave holdTime 0
set_interface_property scratchpad_slave linewrapBursts false
# Slave with readdatavalid signal must support at least 1 pending read
set_interface_property scratchpad_slave maximumPendingReadTransactions 8
set_interface_property scratchpad_slave readLatency 0
set_interface_property scratchpad_slave readWaitTime 1
set_interface_property scratchpad_slave setupTime 0
set_interface_property scratchpad_slave timingUnits Cycles
set_interface_property scratchpad_slave writeWaitTime 0
set_interface_property scratchpad_slave ENABLED true

add_interface_port scratchpad_slave slave_read read Input 1
add_interface_port scratchpad_slave slave_write write Input 1
add_interface_port scratchpad_slave slave_waitrequest waitrequest Output 1
add_interface_port scratchpad_slave slave_readdatavalid readdatavalid Output 1
# Width will be set in elaboration callback.
add_interface_port scratchpad_slave slave_writedata writedata Input
add_interface_port scratchpad_slave slave_byteenable byteenable Input
add_interface_port scratchpad_slave slave_readdata readdata Output
add_interface_port scratchpad_slave slave_address address Input
# |
# +-----------------------------------

# +-----------------------------------
# | connection point core_clk
# |
add_interface core_clk clock end

set_interface_property core_clk ENABLED true

add_interface_port core_clk core_clk clk Input 1
# |
# +-----------------------------------

# +-----------------------------------
# | connection point core_clk_2x
# |
add_interface core_clk_2x clock end

set_interface_property core_clk_2x ENABLED true

add_interface_port core_clk_2x core_clk_2x clk Input 1
# |
# +-----------------------------------

# +-----------------------------------
# | connection point core_reset
# |
add_interface core_reset reset end
set_interface_property core_reset associatedClock core_clk
set_interface_property core_reset synchronousEdges DEASSERT

set_interface_property core_reset ENABLED true

add_interface_port core_reset core_reset reset Input 1
# |
# +-----------------------------------

for {set vci 0} {$vci < 16} {incr vci} {
    # +-----------------------------------
    # | connection point vci_[set vci]_conduit
    # |
    add_interface vci_[set vci]_conduit conduit end

    set_interface_property vci_[set vci]_conduit ENABLED true

    add_interface_port vci_[set vci]_conduit vci_[set vci]_clk           export Output 1
    add_interface_port vci_[set vci]_conduit vci_[set vci]_reset         export Output 1
    add_interface_port vci_[set vci]_conduit vci_[set vci]_valid         export Output vci_[set vci]_functions
    add_interface_port vci_[set vci]_conduit vci_[set vci]_signed        export Output 1
    add_interface_port vci_[set vci]_conduit vci_[set vci]_opsize        export Output 2
    add_interface_port vci_[set vci]_conduit vci_[set vci]_vector_start  export Output 1
    add_interface_port vci_[set vci]_conduit vci_[set vci]_vector_end    export Output 1
    add_interface_port vci_[set vci]_conduit vci_[set vci]_byte_valid    export Output VCI_[set vci]_LANES*4
    add_interface_port vci_[set vci]_conduit vci_[set vci]_data_a        export Output VCI_[set vci]_LANES*32
    add_interface_port vci_[set vci]_conduit vci_[set vci]_flag_a        export Output VCI_[set vci]_LANES*4
    add_interface_port vci_[set vci]_conduit vci_[set vci]_data_b        export Output VCI_[set vci]_LANES*32
    add_interface_port vci_[set vci]_conduit vci_[set vci]_flag_b        export Output VCI_[set vci]_LANES*4
    add_interface_port vci_[set vci]_conduit vci_[set vci]_data_out      export Input  VCI_[set vci]_LANES*32
    add_interface_port vci_[set vci]_conduit vci_[set vci]_flag_out      export Input  VCI_[set vci]_LANES*4
    add_interface_port vci_[set vci]_conduit vci_[set vci]_byteenable    export Input  VCI_[set vci]_LANES*4

    #Make sure that even when only 1 bit it still shows up as slv
    set_port_property vci_[set vci]_valid VHDL_TYPE std_logic_vector
    # |
    # +-----------------------------------
}


###########################################################################
# Return ceil(log2(x)) for an integer x > 0.
proc ceil_log2 {x} {
    set i 0
    # n = 2**i
    set n 1
    while {$n < $x} {
        incr i
        set n [expr 2*$n]
    }
    return $i
}

###########################################################################
# Return 1 if n is a power of 2, else 0.
proc is_pow2 {n} {
    if {$n <= 0} {
        return 0
    }
    set p 1
    while {$p < $n} {
        set p [expr 2*$p]
    }
    if {$p == $n} {
        return 1
    } else {
        return 0
    }
}

###########################################################################
proc elaboration_callback {} {

    set params_valid true

    set vector_lanes [get_parameter_value VECTOR_LANES]
    if {![is_pow2 $vector_lanes]} {
        send_message Error "The number of vector lanes is not a power of two."
        set params_valid false
    }

    set unpopulated_alu_lanes [get_parameter_value UNPOPULATED_ALU_LANES]
    if {$unpopulated_alu_lanes >= $vector_lanes} {
        send_message Error "The number of unpopulated ALU lanes must be less than the number of vector lanes."
        set params_valid false
    }

    set unpopulated_multiplier_lanes [get_parameter_value UNPOPULATED_MULTIPLIER_LANES]
    if {$unpopulated_multiplier_lanes >= $vector_lanes} {
        send_message Error "The number of unpopulated MULTIPLIER lanes must be less than the number of vector lanes."
        set params_valid false
    }

    # Ideally the ALLOWED_RANGE property of MEMORY_WIDTH_LANES would change
    # when the number of vector lanes changes, but there are a couple of
    # reasons why this isn't done:
    # 1) There is a GUI glitch and the pull-down dropbox doesn't display
    #    properly until the second time time it is clicked.
    # 2) If the number of vector lanes is reduced and the currently selected
    #    number of memory lanes is out-of-range for the new number of vector
    #    lanes, there will be an out-of-range error message.
    #    It is not possible to use "set_parameter_value" within the
    #    elaboration callback to change the value of MEMORY_WIDTH_LANES
    #    before changing the ALLOWED_RANGE. There will be an error message
    #    about this only being allowed for DERIVED parameters.
    set memory_width_lanes [get_parameter_value MEMORY_WIDTH_LANES]
    if {![is_pow2 $memory_width_lanes]} {
        send_message Error "The number of memory lanes is not a power of two."
        set params_valid false
    } elseif {$params_valid && ($memory_width_lanes > $vector_lanes)} {
        send_message Error [concat \
										  "The number of memory lanes cannot be larger than the number of " \
										  "vector lanes. Reduce the number of memory lanes or increase " \
										  "the number of vector lanes."]
        set params_valid false
    }
    set slave_width_lanes [get_parameter_value SLAVE_WIDTH_LANES]
    if {![is_pow2 $slave_width_lanes]} {
        send_message Error "The number of memory lanes is not a power of two."
        set params_valid false
    } elseif {$params_valid && ($slave_width_lanes > $vector_lanes)} {
        send_message Error [concat \
										  "The number of slave memory lanes cannot be larger than the number of " \
										  "vector lanes. Reduce the number of memory lanes or increase " \
										  "the number of vector lanes."]
        set params_valid false
    }

    #Track if VCI opcode is used by a previous VCI port, -1 standing for unused
    set opcode_used_by {-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1}
    set vector_custom_instructions [get_parameter_value VECTOR_CUSTOM_INSTRUCTIONS]

    for {set vci 0} {$vci < 16} {incr vci} {
		  #For now disable everything; valid parameters will get enabled
		  for {set function 0} {$function < [expr 16 - $vci]} {incr function} {
				set_parameter_property VCI_[set vci]_FUNCTION_[set function]_DEPTH ENABLED false
				set_parameter_property VCI_[set vci]_FUNCTION_[set function]_DEPTH VISIBLE false
		  }
    }
    for {set opcode 0} {$opcode < 16} {incr opcode} {
		  #Will get set later for valid opcodes
		  set vcustom[set opcode]_depth 0
		  set vcustom[set opcode]_lanes 0
		  set vcustom[set opcode]_uid -1
    }

    set total_functions 0
    for {set vci 0} {$vci < 16} {incr vci} {
		  if {$vector_custom_instructions > $vci} {
				set vci_[set vci]_lanes              [get_parameter_value VCI_[set vci]_LANES]
				set vci_[set vci]_uid                [get_parameter_value VCI_[set vci]_UID]
				set vci_[set vci]_opcode_start       [get_parameter_value VCI_[set vci]_OPCODE_START]
				set vci_[set vci]_functions          [get_parameter_value VCI_[set vci]_FUNCTIONS]
				set total_functions                  [expr $total_functions + [set vci_[set vci]_functions]]
				set vci_[set vci]_opcode_end         [expr [set vci_[set vci]_opcode_start] + [set vci_[set vci]_functions] - 1]
				set vci_[set vci]_modifies_dest_addr [get_parameter_value VCI_[set vci]_MODIFIES_DEST_ADDR]

				set_parameter_value VCI_[set vci]_OPCODE_END [set vci_[set vci]_opcode_end]
				if { [set vci_[set vci]_uid] == -1 } {
					 send_message WARNING [concat \
													 "The UID for VCI$vci has not been set. It must match "\
													 "the UID that is connected on that conduit" ]
				}
				for {set function 0} {$function < [expr 16 - $vci]} {incr function} {
					 set vci_[set vci]_function_[set function]_depth [get_parameter_value VCI_[set vci]_FUNCTION_[set function]_DEPTH]
					 if {$function < [set vci_[set vci]_functions]} {
						  set opcode [expr [set vci_[set vci]_opcode_start] + $function]
						  set_parameter_property VCI_[set vci]_FUNCTION_[set function]_DEPTH ENABLED true
						  set_parameter_property VCI_[set vci]_FUNCTION_[set function]_DEPTH VISIBLE true
						  set_parameter_value VCUSTOM[set opcode]_DEPTH [set vci_[set vci]_function_[set function]_depth]
						  set vcustom[set opcode]_lanes [set vci_[set vci]_lanes]
						  set vcustom[set opcode]_uid [set vci_[set vci]_uid]
					 }
				}


				if {[set vci_[set vci]_modifies_dest_addr]} {
					 add_interface_port vci_[set vci]_conduit vci_[set vci]_dest_addr_in  export Output 32
					 add_interface_port vci_[set vci]_conduit vci_[set vci]_dest_addr_out export Input  32
				} else {
					 #Connect them to a disabled dummy conduit; this way they show up (unconnected) at the top level
					 add_interface vci_[set vci]_dummy conduit end
					 add_interface_port vci_[set vci]_dummy vci_[set vci]_dest_addr_in  export Output 32
					 add_interface_port vci_[set vci]_dummy vci_[set vci]_dest_addr_out export Input  32
					 set_interface_property vci_[set vci]_dummy ENABLED false
				}


				if {$params_valid} {
					 if {[set vci_[set vci]_lanes] > $vector_lanes} {
						  send_message Error [concat \
														  "The number of custom instruction lanes cannot be larger than the number of " \
														  "vector lanes. Reduce VCI $vci Lanes or increase " \
														  "the number of vector lanes."]
						  set params_valid false
					 } elseif {$total_functions > 16} {
						  send_message Error [concat \
														  "The total number of opcodes (functions) used by the selected VCIs " \
														  "is greater than the available opcode space (16)."]
						  set params_valid false
					 } elseif {[set vci_[set vci]_opcode_start] > [set vci_[set vci]_opcode_end]} {
						  send_message Error [concat \
														  "The opcode range for VCI $vci is incorrect. " \
														  "VCI $vci Opcode End must be greater than or equal to  " \
														  "VCI $vci Opcode Start."]
						  set params_valid false
					 } elseif {[set vci_[set vci]_opcode_end] > 15} {
						  send_message Error [concat \
														  "VCI $vci Opcode End is greater than 15.  With [set vci_[set vci]_functions] functions " \
														  "VCI $vci Opcode Start must be [expr 16 - [set vci_[set vci]_functions]] or lower."]
						  set params_valid false
					 } else {
						  for {set opcode [set vci_[set vci]_opcode_start]} {$opcode <= [set vci_[set vci]_opcode_end]} {incr opcode} {
								set this_opcode_used_by [lindex $opcode_used_by $opcode]
								if {$params_valid && ($this_opcode_used_by != -1)} {
									 send_message Error [concat \
																	 "Opcode conflict for VCI $vci and VCI $this_opcode_used_by, " \
																	 "Both use opcode $opcode.  Change the start opcodes " \
																	 "so that their opcode ranges do not overlap."]
									 set params_valid false
								}
								set opcode_used_by [lreplace $opcode_used_by $opcode 1 $vci]
						  }
					 }
				}

				set_interface_property vci_[set vci]_conduit ENABLED true
				set_parameter_property VCI_[set vci]_LANES ENABLED true
				set_parameter_property VCI_[set vci]_LANES VISIBLE true
				set_parameter_property VCI_[set vci]_UID ENABLED true
				set_parameter_property VCI_[set vci]_UID VISIBLE true
				set_parameter_property VCI_[set vci]_OPCODE_START ENABLED true
				set_parameter_property VCI_[set vci]_OPCODE_START VISIBLE true
				set_parameter_property VCI_[set vci]_FUNCTIONS ENABLED true
				set_parameter_property VCI_[set vci]_FUNCTIONS VISIBLE true
				set_parameter_property VCI_[set vci]_MODIFIES_DEST_ADDR ENABLED true
				set_parameter_property VCI_[set vci]_MODIFIES_DEST_ADDR VISIBLE true
		  } else {
				set vci_[set vci]_lanes              $vector_lanes


				set_port_property vci_[set vci]_data_a     WIDTH_EXPR [expr 32]
				set_port_property vci_[set vci]_flag_a     WIDTH_EXPR [expr 4]
				set_port_property vci_[set vci]_data_b     WIDTH_EXPR [expr 32]
				set_port_property vci_[set vci]_flag_b     WIDTH_EXPR [expr 4]
				set_port_property vci_[set vci]_data_out   WIDTH_EXPR [expr 32]
				set_port_property vci_[set vci]_flag_out   WIDTH_EXPR [expr 4]
				set_port_property vci_[set vci]_byteenable WIDTH_EXPR [expr 4]
				set_port_property vci_[set vci]_byte_valid WIDTH_EXPR [expr 4]
				set vci_[set vci]_opcode_start       $vci
				set vci_[set vci]_functions          1
				set_port_property vci_[set vci]_valid WIDTH_EXPR 1
				set vci_[set vci]_opcode_end         $vci
				set vci_[set vci]_modifies_dest_addr false

				for {set function 0} {$function < [expr 16 - $vci]} {incr function} {
					 set vci_[set vci]_function_[set function]_depth 0
				}

				#These are optional; add to conduit so they show up (unconnected) at top level
				add_interface_port vci_[set vci]_conduit vci_[set vci]_dest_addr_in  export Output 32
				add_interface_port vci_[set vci]_conduit vci_[set vci]_dest_addr_out export Input  32

				set_interface_property vci_[set vci]_conduit ENABLED false
				set_parameter_property VCI_[set vci]_LANES ENABLED false
				set_parameter_property VCI_[set vci]_LANES VISIBLE false
				set_parameter_property VCI_[set vci]_UID ENABLED false
				set_parameter_property VCI_[set vci]_UID VISIBLE false
				set_parameter_property VCI_[set vci]_OPCODE_START ENABLED false
				set_parameter_property VCI_[set vci]_OPCODE_START VISIBLE false
				set_parameter_property VCI_[set vci]_FUNCTIONS ENABLED false
				set_parameter_property VCI_[set vci]_FUNCTIONS VISIBLE false
				set_parameter_property VCI_[set vci]_MODIFIES_DEST_ADDR ENABLED false
				set_parameter_property VCI_[set vci]_MODIFIES_DEST_ADDR VISIBLE false
		  }
    }


    # This determines the allowed range of memory lane values given
    # the number of vector lanes.
    # It's not used because of reasons above.
    if {0} {
        set max_bus_width 1024
        set max_mem_lanes [expr $max_bus_width/32]
        if {$vector_lanes < $max_mem_lanes} {
            set max_mem_lanes $vector_lanes
        }
        set allowed_widths [list]
        set mem_lanes 1
        while {$mem_lanes <= $max_mem_lanes} {
            lappend allowed_widths [expr $mem_lanes]
            set mem_lanes [expr $mem_lanes*2]
        }
        # send_message Info "V=$vector_lanes, $allowed_widths"
        set_parameter_property MEMORY_WIDTH_LANES ALLOWED_RANGES $allowed_widths
    }

    # Derive Avalon master port widths that are a function of
    # MEMORY_WIDTH_LANES.
    set bus_width [expr $memory_width_lanes*32]
    # Bit-width should be legal by construction, but do a sanity check.
    # Allowed values are set by the Avalon spec.
    # (Avalon also allows widths of 8 or 16 bits, but we don't allow these.)
    set allowed_values [list 32 64 128 256 512 1024]
    if {[lsearch $allowed_values $bus_width] == -1} {
        send_message Error [concat \
										  "Memory bus width of $bus_width bits is not allowed. " \
										  "Must be one of $allowed_values."]
        set params_valid false
    } else {
        set byte_enable_width [expr $memory_width_lanes*4]
        set_port_property master_writedata WIDTH_EXPR $bus_width
        set_port_property master_readdata WIDTH_EXPR $bus_width
        set_port_property master_byteenable WIDTH_EXPR $byte_enable_width
        set_parameter_value MEMORY_BUS_WIDTH $bus_width
    }

    # Derive Avalon slave port widths that are a function of
    # SLAVE_WIDTH_LANES.
    set_port_property slave_writedata WIDTH_EXPR [expr $slave_width_lanes*32]
    set_port_property slave_readdata WIDTH_EXPR [expr $slave_width_lanes*32]
    set_port_property slave_byteenable WIDTH_EXPR [expr $slave_width_lanes*4]

    set beats_per_burst [get_parameter_value BEATS_PER_BURST]
    # Allowed range guarantees that beats per burst is a power of two
    # between 1 and 1024, but just check again...
    set allowed_values [list 1 2 4 8 16 32 64 128 256 512 1024]
    if {[lsearch $allowed_values $beats_per_burst] == -1} {
        send_message Error [concat \
										  "Burst size of $beat_per_burst beats is not allowed. " \
										  "Must be one of $allowed_values."]
        set params_valid false
    }
    # beats_per_burst and bus_width are valid.
    set burstlength_bytes [expr $beats_per_burst*$bus_width/8]
    set_parameter_value BURSTLENGTH_BYTES $burstlength_bytes
    set burstcount_w [expr [ceil_log2 $beats_per_burst]+1]
    set_port_property master_burstcount WIDTH_EXPR $burstcount_w
    set_parameter_value BURSTCOUNT_WIDTH $burstcount_w


    # The following is only needed if we allow the user to specify the
    # burstlength in bytes instead of beats.
    if {0} {
        # Avalon master burstcount width is determined by the max burst size.
        # The max burst size must be a power of 2 multiple of the bus width.
        # The maximum Avalon burstcount width of 11 bits supports a maximum burst
        # length of 1024 beats, or up to 131072 bytes for a 1024-bit (128-byte)
        # data bus width.
        set burstlength_bytes [get_parameter_value BURSTLENGTH_BYTES]
        set max_avalon_burstcount_w 11
        if {$params_valid} {
            # bus_width is valid and thus a power of two.
            if {$burstlength_bytes*8 < $bus_width} {
                send_message Error [concat "Maximum burst size cannot be " \
													 "smaller than the memory bus width."]
					 set params_valid false
            } elseif {![is_pow2 $burstlength_bytes]} {
                send_message Error "Maximum burst size must be a power of two."
                set params_valid false
            } else {
                set max_beats [expr $burstlength_bytes*8/$bus_width]
                set burstcount_w [expr [ceil_log2 $max_beats]+1]
                if {$burstcount_w > $max_avalon_burstcount_w} {
                    send_message Error [concat \
														  "The maximum burst size for a $bus_width-bit bus is " \
														  "[expr int(pow(2,$max_avalon_burstcount_w-1))*$bus_width/8] " \
														  "bytes."]
                    set params_valid false
                } else {
                    set_port_property master_burstcount WIDTH_EXPR $burstcount_w
                    set_parameter_value BURSTCOUNT_WIDTH $burstcount_w
                }
            }
        }
    }

	 # only enable one instruction port
	 set id_width [ get_parameter_value INSTR_PORT_ID_WIDTH ]
	 set_port_property axs_awid WIDTH_EXPR [expr $id_width ]
	 set_port_property axs_wid WIDTH_EXPR  [expr $id_width ]
	 set_port_property axs_bid WIDTH_EXPR  [expr $id_width ]
	 set_port_property axs_arid WIDTH_EXPR [expr $id_width ]
	 set_port_property axs_rid WIDTH_EXPR  [expr $id_width ]

	 set ipc [ get_parameter_value INSTR_PORT_CHOICE ]
	 if { $ipc >3 } {
		  send_message Error "Invalid Instruction Port Type \"$ipc\""
	 }
	 set_interface_property instr_conduit ENABLED [expr $ipc == 0]
	 set_interface_property ncs ENABLED [expr $ipc == 1]
	 set_interface_property axi_instr_slave ENABLED [expr $ipc == 2]
	 set_interface_property vcp ENABLED [expr $ipc == 3]

	 set_parameter_property INSTR_PORT_ID_WIDTH VISIBLE [get_interface_property axi_instr_slave ENABLED]

	 if { [get_interface_property instr_conduit ENABLED] } {
		  send_message Warning "Nios Custom Instruction (With Shim) is deprecated, will be removed in future versions"
	 }

    # Avalon slave address port width is determined by scratchpad size.
    # Slave interface is word-addressable;
    # word size = slave data bus width = 32 bits
    set scratchpad_kb [get_parameter_value SCRATCHPAD_KB]
    set scratchpad_size [expr $scratchpad_kb*1024]
    set slave_bus_width_bytes [expr [get_parameter_value SLAVE_WIDTH_LANES]*4]
    set max_avalon_addr_w 32
    # Exponentiation operator ** only works in Tcl 8.5 and later...
    set max_scratchpad_size [expr pow(2, $max_avalon_addr_w)]
    if {$scratchpad_size > $max_scratchpad_size} {
        send_message Error [concat "Scratchpad is larger than " \
										  "the 32-bit Avalon-MM slave address space!"]
        set params_valid false
    } else {
        if {![is_pow2 $scratchpad_kb]} {
            send_message Warning [concat "Scratchpad size is not a power " \
												  "of 2. The scratchpad may not map efficiently to BRAMs."]
        }
        set scratchpad_words [expr $scratchpad_size/$slave_bus_width_bytes]
        set slave_addr_w [ceil_log2 $scratchpad_words]
        set_port_property slave_address WIDTH_EXPR $slave_addr_w
        set_parameter_value SLAVE_ADDR_WIDTH $slave_addr_w
    }

    # Check that core_clk_2x frequency is 2x core_clk frequency.
    set clk_rate    [get_parameter_value CORE_CLK_RATE]
    set clk_2x_rate [get_parameter_value CORE_CLK_2X_RATE]
    # puts "clk_rate = $clk_rate, clk_2x_rate = $clk_2x_rate"
    if {2.0*$clk_rate != 1.0*$clk_2x_rate} {
        send_message Error [concat "core_clk_2x rate ($clk_2x_rate) " \
										  "is not double the core_clk rate ($clk_rate)"]
        # set params_valid false
    }

	 # Can't get ci_clk_rate value from interface currently
	 #    # Check that core_clk frequency is the same as ci_clk frequency.
	 #    set ci_clk_rate    [get_parameter_value CI_CLK_RATE]
	 #    if {$clk_rate != $ci_clk_rate} {
	 #        send_message Error [concat "core_clk rate ($clk_rate) " \
		  #            "is not the same as the Nios custom instruction clock (ci_clk) rate ($ci_clk_rate)"]
	 #        # set params_valid false
	 #    }

    # Update fixed-point Qm.n notation.
    set word_qn [get_parameter_value MULFXP_WORD_FRACTION_BITS]
    set half_qn [get_parameter_value MULFXP_HALF_FRACTION_BITS]
    set byte_qn [get_parameter_value MULFXP_BYTE_FRACTION_BITS]
    if {($word_qn > 0 ) && ($word_qn < 32)} {
        set_parameter_value MULFXP_WORD_FORMAT \
            [format "Q%d.%d" [expr 32-$word_qn] $word_qn]
    }
    if {($half_qn > 0 ) && ($half_qn < 16)} {
        set_parameter_value MULFXP_HALF_FORMAT \
            [format "Q%d.%d" [expr 16-$half_qn] $half_qn]
    }
    if {($byte_qn > 0 ) && ($byte_qn < 8)} {
        set_parameter_value MULFXP_BYTE_FORMAT \
            [format "Q%d.%d" [expr 8-$byte_qn] $byte_qn]
    }

    if {![catch {package require -exact qsys 12.0}]} {
        set_display_item_property fxp_formats text [concat \
																		  "<html><table>" \
																		  "<tr><td width=$::w>32-bit fixed-point format:</td><td>" \
																		  [get_parameter_value MULFXP_WORD_FORMAT] "</td></tr>" \
																		  "<tr><td width=$::w>16-bit fixed-point format:</td><td>" \
																		  [get_parameter_value MULFXP_HALF_FORMAT] "</td></tr>" \
																		  "<tr><td width=$::w>8-bit fixed-point format:</td><td>" \
																		  [get_parameter_value MULFXP_BYTE_FORMAT] "</td></tr>" \
																		  "</table></html>" ]
    }

    set scratchpad_waves [expr $scratchpad_size/($vector_lanes*4)]
    set max_masked_waves [get_parameter_value MAX_MASKED_WAVES]
    if {($max_masked_waves > 0) && (![is_pow2 $max_masked_waves])} {
        send_message Error "The number of masked waves is not a power of two."
        set params_valid false
    }
    if {$max_masked_waves > $scratchpad_waves} {
        send_message Error [concat "MAX_MASKED_WAVES ($max_masked_waves) " \
										  "is larger than the depth of the scratchpad ($scratchpad_waves waves)."]
        set params_valid false
    }
    if {($max_masked_waves > 0) && ($unpopulated_alu_lanes > 0)} {
        send_message Error [concat "UNPOPULATED_ALU_LANES ($unpopulated_alu_lanes) must be 0 when MAX_MASKED_WAVES ($max_masked_waves) " \
                                "is non-zero."]
        set params_valid false
    }
    

    set vector_bytes [expr $vector_lanes * 4]

    set fixed_point_support [get_parameter_value FIXED_POINT_SUPPORT]

    ######################################################################
    # Set CMacros.
    set_module_assignment embeddedsw.CMacro.VECTOR_LANES $vector_lanes
    set_module_assignment embeddedsw.CMacro.UNPOPULATED_ALU_LANES $unpopulated_alu_lanes
    set_module_assignment embeddedsw.CMacro.UNPOPULATED_MULTIPLIER_LANES $unpopulated_multiplier_lanes
    # Convert true/false to 1/0.
    set_module_assignment embeddedsw.CMacro.VECTOR_CUSTOM_INSTRUCTIONS $vector_custom_instructions
    for {set opcode 0} {$opcode < 16} {incr opcode} {
		  set_module_assignment embeddedsw.CMacro.VCUSTOM[set opcode]_LANES [set vcustom[set opcode]_lanes]
		  set_module_assignment embeddedsw.CMacro.VCUSTOM[set opcode]_UID [set vcustom[set opcode]_uid]
    }
    set_module_assignment embeddedsw.CMacro.MEMORY_WIDTH_LANES \
        $memory_width_lanes
    set_module_assignment embeddedsw.CMacro.SLAVE_WIDTH_LANES \
        $slave_width_lanes
    set_module_assignment embeddedsw.CMacro.BURSTLENGTH_BYTES \
        $burstlength_bytes
    set_module_assignment embeddedsw.CMacro.SCRATCHPAD_KB $scratchpad_kb
    # Convert true/false to 1/0.
    set_module_assignment embeddedsw.CMacro.MAX_MASKED_VECTOR_LENGTH [expr $max_masked_waves * $vector_lanes * 4]
    set_module_assignment embeddedsw.CMacro.FIXED_POINT_SUPPORT [string is true -strict $fixed_point_support]
    set_module_assignment embeddedsw.CMacro.MULFXP_WORD_FRACTION_BITS $word_qn
    set_module_assignment embeddedsw.CMacro.MULFXP_HALF_FRACTION_BITS $half_qn
    set_module_assignment embeddedsw.CMacro.MULFXP_BYTE_FRACTION_BITS $byte_qn

    # Not an HDL parameter, just for reference/cycle counting
    set_module_assignment embeddedsw.CMacro.CORE_FREQ \
        [get_parameter_value CORE_CLK_RATE]
}
