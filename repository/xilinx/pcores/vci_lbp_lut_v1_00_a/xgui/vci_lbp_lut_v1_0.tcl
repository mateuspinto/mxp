# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set VCI_LANES [ipgui::add_param $IPINST -parent $Page0 -name VCI_LANES]
	set BYTES_RAM [ipgui::add_param $IPINST -parent $Page0 -name BYTES_RAM]
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

proc update_PARAM_VALUE.BYTES_RAM { PARAM_VALUE.BYTES_RAM } {
	# Procedure called to update BYTES_RAM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BYTES_RAM { PARAM_VALUE.BYTES_RAM } {
	# Procedure called to validate BYTES_RAM
	return true
}


proc update_MODELPARAM_VALUE.BYTES_RAM { MODELPARAM_VALUE.BYTES_RAM PARAM_VALUE.BYTES_RAM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BYTES_RAM}] ${MODELPARAM_VALUE.BYTES_RAM}
}
