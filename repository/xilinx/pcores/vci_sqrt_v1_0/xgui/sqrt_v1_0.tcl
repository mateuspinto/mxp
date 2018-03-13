
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/sqrt_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set PIPELINE_STAGES [ipgui::add_param $IPINST -parent $Page0 -name PIPELINE_STAGES]
	set FXP_BITS [ipgui::add_param $IPINST -parent $Page0 -name FXP_BITS]
	set VCI_LANES [ipgui::add_param $IPINST -parent $Page0 -name VCI_LANES]
}

proc update_PARAM_VALUE.PIPELINE_STAGES { PARAM_VALUE.PIPELINE_STAGES PARAM_VALUE.FXP_BITS } {
	# Procedure called to update PIPELINE_STAGES when any of the dependent parameters in the arguments change
	
	set PIPELINE_STAGES ${PARAM_VALUE.PIPELINE_STAGES}
	set FXP_BITS ${PARAM_VALUE.FXP_BITS}
	set values(FXP_BITS) [get_property value $FXP_BITS]
	set_property value [gen_USERPARAMETER_PIPELINE_STAGES_VALUE $values(FXP_BITS)] $PIPELINE_STAGES
}

proc validate_PARAM_VALUE.PIPELINE_STAGES { PARAM_VALUE.PIPELINE_STAGES } {
	# Procedure called to validate PIPELINE_STAGES
	return true
}

proc update_PARAM_VALUE.FXP_BITS { PARAM_VALUE.FXP_BITS } {
	# Procedure called to update FXP_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FXP_BITS { PARAM_VALUE.FXP_BITS } {
	# Procedure called to validate FXP_BITS
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

proc update_MODELPARAM_VALUE.FXP_BITS { MODELPARAM_VALUE.FXP_BITS PARAM_VALUE.FXP_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FXP_BITS}] ${MODELPARAM_VALUE.FXP_BITS}
}

