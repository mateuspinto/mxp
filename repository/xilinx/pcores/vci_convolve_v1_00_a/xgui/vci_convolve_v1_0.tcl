# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set CONJOINED_MULTIPLIES [ipgui::add_param $IPINST -parent $Page0 -name CONJOINED_MULTIPLIES]
	set FXP_BITS [ipgui::add_param $IPINST -parent $Page0 -name FXP_BITS]
	set INPUT_SIZE_BYTES [ipgui::add_param $IPINST -parent $Page0 -name INPUT_SIZE_BYTES]
	set OUTPUT_SIZE_BYTES [ipgui::add_param $IPINST -parent $Page0 -name OUTPUT_SIZE_BYTES]
	set COEFFICIENT_SIZE_BITS [ipgui::add_param $IPINST -parent $Page0 -name COEFFICIENT_SIZE_BITS]
	set MAX_COEFFICIENTS [ipgui::add_param $IPINST -parent $Page0 -name MAX_COEFFICIENTS]
	set FILTER_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name FILTER_WIDTH]
	set FILTER_HEIGHT [ipgui::add_param $IPINST -parent $Page0 -name FILTER_HEIGHT]
	set FILTER_COPIES [ipgui::add_param $IPINST -parent $Page0 -name FILTER_COPIES]
	set FILTER_STAGES [ipgui::add_param $IPINST -parent $Page0 -name FILTER_STAGES]
	set INPUT_REGISTER_STAGES [ipgui::add_param $IPINST -parent $Page0 -name INPUT_REGISTER_STAGES]
	set ADD_TREE_STAGES [ipgui::add_param $IPINST -parent $Page0 -name ADD_TREE_STAGES]
	set VCI_LANES [ipgui::add_param $IPINST -parent $Page0 -name VCI_LANES]
}

proc update_PARAM_VALUE.CONJOINED_MULTIPLIES { PARAM_VALUE.CONJOINED_MULTIPLIES } {
	# Procedure called to update CONJOINED_MULTIPLIES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CONJOINED_MULTIPLIES { PARAM_VALUE.CONJOINED_MULTIPLIES } {
	# Procedure called to validate CONJOINED_MULTIPLIES
	return true
}

proc update_PARAM_VALUE.FXP_BITS { PARAM_VALUE.FXP_BITS } {
	# Procedure called to update FXP_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FXP_BITS { PARAM_VALUE.FXP_BITS } {
	# Procedure called to validate FXP_BITS
	return true
}

proc update_PARAM_VALUE.INPUT_SIZE_BYTES { PARAM_VALUE.INPUT_SIZE_BYTES } {
	# Procedure called to update INPUT_SIZE_BYTES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INPUT_SIZE_BYTES { PARAM_VALUE.INPUT_SIZE_BYTES } {
	# Procedure called to validate INPUT_SIZE_BYTES
	return true
}

proc update_PARAM_VALUE.OUTPUT_SIZE_BYTES { PARAM_VALUE.OUTPUT_SIZE_BYTES } {
	# Procedure called to update OUTPUT_SIZE_BYTES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUTPUT_SIZE_BYTES { PARAM_VALUE.OUTPUT_SIZE_BYTES } {
	# Procedure called to validate OUTPUT_SIZE_BYTES
	return true
}

proc update_PARAM_VALUE.COEFFICIENT_SIZE_BITS { PARAM_VALUE.COEFFICIENT_SIZE_BITS } {
	# Procedure called to update COEFFICIENT_SIZE_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COEFFICIENT_SIZE_BITS { PARAM_VALUE.COEFFICIENT_SIZE_BITS } {
	# Procedure called to validate COEFFICIENT_SIZE_BITS
	return true
}

proc update_PARAM_VALUE.MAX_COEFFICIENTS { PARAM_VALUE.MAX_COEFFICIENTS } {
	# Procedure called to update MAX_COEFFICIENTS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_COEFFICIENTS { PARAM_VALUE.MAX_COEFFICIENTS } {
	# Procedure called to validate MAX_COEFFICIENTS
	return true
}

proc update_PARAM_VALUE.FILTER_WIDTH { PARAM_VALUE.FILTER_WIDTH } {
	# Procedure called to update FILTER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_WIDTH { PARAM_VALUE.FILTER_WIDTH } {
	# Procedure called to validate FILTER_WIDTH
	return true
}

proc update_PARAM_VALUE.FILTER_HEIGHT { PARAM_VALUE.FILTER_HEIGHT } {
	# Procedure called to update FILTER_HEIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_HEIGHT { PARAM_VALUE.FILTER_HEIGHT } {
	# Procedure called to validate FILTER_HEIGHT
	return true
}

proc update_PARAM_VALUE.FILTER_COPIES { PARAM_VALUE.FILTER_COPIES } {
	# Procedure called to update FILTER_COPIES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_COPIES { PARAM_VALUE.FILTER_COPIES } {
	# Procedure called to validate FILTER_COPIES
	return true
}

proc update_PARAM_VALUE.FILTER_STAGES { PARAM_VALUE.FILTER_STAGES } {
	# Procedure called to update FILTER_STAGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_STAGES { PARAM_VALUE.FILTER_STAGES } {
	# Procedure called to validate FILTER_STAGES
	return true
}

proc update_PARAM_VALUE.INPUT_REGISTER_STAGES { PARAM_VALUE.INPUT_REGISTER_STAGES } {
	# Procedure called to update INPUT_REGISTER_STAGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INPUT_REGISTER_STAGES { PARAM_VALUE.INPUT_REGISTER_STAGES } {
	# Procedure called to validate INPUT_REGISTER_STAGES
	return true
}

proc update_PARAM_VALUE.ADD_TREE_STAGES { PARAM_VALUE.ADD_TREE_STAGES } {
	# Procedure called to update ADD_TREE_STAGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADD_TREE_STAGES { PARAM_VALUE.ADD_TREE_STAGES } {
	# Procedure called to validate ADD_TREE_STAGES
	return true
}

proc update_PARAM_VALUE.VCI_LANES { PARAM_VALUE.VCI_LANES } {
	# Procedure called to update VCI_LANES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VCI_LANES { PARAM_VALUE.VCI_LANES } {
	# Procedure called to validate VCI_LANES
	return true
}


proc update_MODELPARAM_VALUE.VCI_LANES { MODELPARAM_VALUE.VCI_LANES PARAM_VALUE.VCI_LANES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VCI_LANES}] ${MODELPARAM_VALUE.VCI_LANES}
}

proc update_MODELPARAM_VALUE.FILTER_COPIES { MODELPARAM_VALUE.FILTER_COPIES PARAM_VALUE.FILTER_COPIES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_COPIES}] ${MODELPARAM_VALUE.FILTER_COPIES}
}

proc update_MODELPARAM_VALUE.FILTER_STAGES { MODELPARAM_VALUE.FILTER_STAGES PARAM_VALUE.FILTER_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_STAGES}] ${MODELPARAM_VALUE.FILTER_STAGES}
}

proc update_MODELPARAM_VALUE.INPUT_REGISTER_STAGES { MODELPARAM_VALUE.INPUT_REGISTER_STAGES PARAM_VALUE.INPUT_REGISTER_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INPUT_REGISTER_STAGES}] ${MODELPARAM_VALUE.INPUT_REGISTER_STAGES}
}

proc update_MODELPARAM_VALUE.ADD_TREE_STAGES { MODELPARAM_VALUE.ADD_TREE_STAGES PARAM_VALUE.ADD_TREE_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADD_TREE_STAGES}] ${MODELPARAM_VALUE.ADD_TREE_STAGES}
}

proc update_MODELPARAM_VALUE.FILTER_WIDTH { MODELPARAM_VALUE.FILTER_WIDTH PARAM_VALUE.FILTER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_WIDTH}] ${MODELPARAM_VALUE.FILTER_WIDTH}
}

proc update_MODELPARAM_VALUE.FILTER_HEIGHT { MODELPARAM_VALUE.FILTER_HEIGHT PARAM_VALUE.FILTER_HEIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_HEIGHT}] ${MODELPARAM_VALUE.FILTER_HEIGHT}
}

proc update_MODELPARAM_VALUE.INPUT_SIZE_BYTES { MODELPARAM_VALUE.INPUT_SIZE_BYTES PARAM_VALUE.INPUT_SIZE_BYTES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INPUT_SIZE_BYTES}] ${MODELPARAM_VALUE.INPUT_SIZE_BYTES}
}

proc update_MODELPARAM_VALUE.OUTPUT_SIZE_BYTES { MODELPARAM_VALUE.OUTPUT_SIZE_BYTES PARAM_VALUE.OUTPUT_SIZE_BYTES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUTPUT_SIZE_BYTES}] ${MODELPARAM_VALUE.OUTPUT_SIZE_BYTES}
}

proc update_MODELPARAM_VALUE.COEFFICIENT_SIZE_BITS { MODELPARAM_VALUE.COEFFICIENT_SIZE_BITS PARAM_VALUE.COEFFICIENT_SIZE_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COEFFICIENT_SIZE_BITS}] ${MODELPARAM_VALUE.COEFFICIENT_SIZE_BITS}
}

proc update_MODELPARAM_VALUE.MAX_COEFFICIENTS { MODELPARAM_VALUE.MAX_COEFFICIENTS PARAM_VALUE.MAX_COEFFICIENTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_COEFFICIENTS}] ${MODELPARAM_VALUE.MAX_COEFFICIENTS}
}

proc update_MODELPARAM_VALUE.CONJOINED_MULTIPLIES { MODELPARAM_VALUE.CONJOINED_MULTIPLIES PARAM_VALUE.CONJOINED_MULTIPLIES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CONJOINED_MULTIPLIES}] ${MODELPARAM_VALUE.CONJOINED_MULTIPLIES}
}

proc update_MODELPARAM_VALUE.FXP_BITS { MODELPARAM_VALUE.FXP_BITS PARAM_VALUE.FXP_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FXP_BITS}] ${MODELPARAM_VALUE.FXP_BITS}
}

