# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set VCI_LANES [ipgui::add_param $IPINST -parent $Page0 -name VCI_LANES]
	set CONJOINED_MULTIPLIES [ipgui::add_param $IPINST -parent $Page0 -name CONJOINED_MULTIPLIES -widget checkBox]
	set MULTIPLIER_BITS [ipgui::add_param $IPINST -parent $Page0 -name MULTIPLIER_BITS]
	set DSP_MULTIPUMPING [ipgui::add_param $IPINST -parent $Page0 -name DSP_MULTIPUMPING]
	set INPUT_SIZE_BYTES [ipgui::add_param $IPINST -parent $Page0 -name INPUT_SIZE_BYTES]
	set OUTPUT_SIZE_BYTES [ipgui::add_param $IPINST -parent $Page0 -name OUTPUT_SIZE_BYTES]
	set COEFFICIENT_SIZE_BITS [ipgui::add_param $IPINST -parent $Page0 -name COEFFICIENT_SIZE_BITS]
	set FXP_BITS [ipgui::add_param $IPINST -parent $Page0 -name FXP_BITS]
	set ROUNDING [ipgui::add_param $IPINST -parent $Page0 -name ROUNDING -widget checkBox]
	set PARALLEL_KERNELS [ipgui::add_param $IPINST -parent $Page0 -name PARALLEL_KERNELS]
	set FILTER_COPIES [ipgui::add_param $IPINST -parent $Page0 -name FILTER_COPIES]
	set EXTRA_ACCUMULATOR_BITS [ipgui::add_param $IPINST -parent $Page0 -name EXTRA_ACCUMULATOR_BITS]
	set ACCUMULATORS [ipgui::add_param $IPINST -parent $Page0 -name ACCUMULATORS]
	set VCI_STAGES [ipgui::add_param $IPINST -parent $Page0 -name VCI_STAGES]
}

proc update_PARAM_VALUE.VCI_LANES { PARAM_VALUE.VCI_LANES } {
	# Procedure called to update VCI_LANES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VCI_LANES { PARAM_VALUE.VCI_LANES } {
	# Procedure called to validate VCI_LANES
	return true
}
proc update_PARAM_VALUE.CONJOINED_MULTIPLIES { PARAM_VALUE.CONJOINED_MULTIPLIES } {
	# Procedure called to update CONJOINED_MULTIPLIES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CONJOINED_MULTIPLIES { PARAM_VALUE.CONJOINED_MULTIPLIES } {
	# Procedure called to validate CONJOINED_MULTIPLIES
	return true
}

proc update_PARAM_VALUE.MULTIPLIER_BITS { PARAM_VALUE.MULTIPLIER_BITS } {
	# Procedure called to update MULTIPLIER_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MULTIPLIER_BITS { PARAM_VALUE.MULTIPLIER_BITS } {
	# Procedure called to validate MULTIPLIER_BITS
	return true
}

proc update_PARAM_VALUE.DSP_MULTIPUMPING { PARAM_VALUE.DSP_MULTIPUMPING } {
	# Procedure called to update DSP_MULTIPUMPING when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DSP_MULTIPUMPING { PARAM_VALUE.DSP_MULTIPUMPING } {
	# Procedure called to validate DSP_MULTIPUMPING
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

proc update_PARAM_VALUE.FXP_BITS { PARAM_VALUE.FXP_BITS } {
	# Procedure called to update FXP_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FXP_BITS { PARAM_VALUE.FXP_BITS } {
	# Procedure called to validate FXP_BITS
	return true
}

proc update_PARAM_VALUE.ROUNDING { PARAM_VALUE.ROUNDING } {
	# Procedure called to update ROUNDING when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ROUNDING { PARAM_VALUE.ROUNDING } {
	# Procedure called to validate ROUNDING
	return true
}

proc update_PARAM_VALUE.PARALLEL_KERNELS { PARAM_VALUE.PARALLEL_KERNELS } {
	# Procedure called to update PARALLEL_KERNELS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PARALLEL_KERNELS { PARAM_VALUE.PARALLEL_KERNELS } {
	# Procedure called to validate PARALLEL_KERNELS
	return true
}

proc update_PARAM_VALUE.FILTER_COPIES { PARAM_VALUE.FILTER_COPIES } {
	# Procedure called to update FILTER_COPIES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_COPIES { PARAM_VALUE.FILTER_COPIES } {
	# Procedure called to validate FILTER_COPIES
	return true
}

proc update_PARAM_VALUE.EXTRA_ACCUMULATOR_BITS { PARAM_VALUE.EXTRA_ACCUMULATOR_BITS } {
	# Procedure called to update EXTRA_ACCUMULATOR_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EXTRA_ACCUMULATOR_BITS { PARAM_VALUE.EXTRA_ACCUMULATOR_BITS } {
	# Procedure called to validate EXTRA_ACCUMULATOR_BITS
	return true
}

proc update_PARAM_VALUE.ACCUMULATORS { PARAM_VALUE.ACCUMULATORS } {
	# Procedure called to update ACCUMULATORS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ACCUMULATORS { PARAM_VALUE.ACCUMULATORS } {
	# Procedure called to validate ACCUMULATORS
	return true
}

proc update_PARAM_VALUE.VCI_STAGES { PARAM_VALUE.VCI_STAGES } {
	# Procedure called to update VCI_STAGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VCI_STAGES { PARAM_VALUE.VCI_STAGES } {
	# Procedure called to validate VCI_STAGES
	return true
}

proc update_MODELPARAM_VALUE.VCI_LANES { MODELPARAM_VALUE.VCI_LANES PARAM_VALUE.VCI_LANES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VCI_LANES}] ${MODELPARAM_VALUE.VCI_LANES}
}

proc update_MODELPARAM_VALUE.CONJOINED_MULTIPLIES { MODELPARAM_VALUE.CONJOINED_MULTIPLIES PARAM_VALUE.CONJOINED_MULTIPLIES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CONJOINED_MULTIPLIES}] ${MODELPARAM_VALUE.CONJOINED_MULTIPLIES}
}

proc update_MODELPARAM_VALUE.MULTIPLIER_BITS { MODELPARAM_VALUE.MULTIPLIER_BITS PARAM_VALUE.MULTIPLIER_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MULTIPLIER_BITS}] ${MODELPARAM_VALUE.MULTIPLIER_BITS}
}

proc update_MODELPARAM_VALUE.DSP_MULTIPUMPING { MODELPARAM_VALUE.DSP_MULTIPUMPING PARAM_VALUE.DSP_MULTIPUMPING } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DSP_MULTIPUMPING}] ${MODELPARAM_VALUE.DSP_MULTIPUMPING}
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

proc update_MODELPARAM_VALUE.FXP_BITS { MODELPARAM_VALUE.FXP_BITS PARAM_VALUE.FXP_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FXP_BITS}] ${MODELPARAM_VALUE.FXP_BITS}
}

proc update_MODELPARAM_VALUE.ROUNDING { MODELPARAM_VALUE.ROUNDING PARAM_VALUE.ROUNDING } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ROUNDING}] ${MODELPARAM_VALUE.ROUNDING}
}

proc update_MODELPARAM_VALUE.PARALLEL_KERNELS { MODELPARAM_VALUE.PARALLEL_KERNELS PARAM_VALUE.PARALLEL_KERNELS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PARALLEL_KERNELS}] ${MODELPARAM_VALUE.PARALLEL_KERNELS}
}

proc update_MODELPARAM_VALUE.FILTER_COPIES { MODELPARAM_VALUE.FILTER_COPIES PARAM_VALUE.FILTER_COPIES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_COPIES}] ${MODELPARAM_VALUE.FILTER_COPIES}
}

proc update_MODELPARAM_VALUE.EXTRA_ACCUMULATOR_BITS { MODELPARAM_VALUE.EXTRA_ACCUMULATOR_BITS PARAM_VALUE.EXTRA_ACCUMULATOR_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EXTRA_ACCUMULATOR_BITS}] ${MODELPARAM_VALUE.EXTRA_ACCUMULATOR_BITS}
}

proc update_MODELPARAM_VALUE.ACCUMULATORS { MODELPARAM_VALUE.ACCUMULATORS PARAM_VALUE.ACCUMULATORS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ACCUMULATORS}] ${MODELPARAM_VALUE.ACCUMULATORS}
}

proc update_MODELPARAM_VALUE.VCI_STAGES { MODELPARAM_VALUE.VCI_STAGES PARAM_VALUE.VCI_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VCI_STAGES}] ${MODELPARAM_VALUE.VCI_STAGES}
}
