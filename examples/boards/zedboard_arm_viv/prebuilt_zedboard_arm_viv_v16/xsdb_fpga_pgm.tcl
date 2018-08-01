#Connect
connect
source /nfs/opt/xilinx/SDK/2018.1/scripts/sdk/util/zynqmp_utils.tcl

#Reset the PS
target -set -filter {name =~ "*APU*"}
rst

#Program the bitstream
set bit_file [lindex $argv 0]
set ps_init_tcl  [lindex $argv 1]

fpga -file $bit_file
#loadhw -hw [lindex $argv 1] -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}]
configparams force-mem-access 1
#Initialize processing system
#Normally this is ps7_init.tcl

source $ps_init_tcl
[info procs ps?_init]
[info procs ps7_post_config]
[info procs psu_ps_pl_isolation_removal]
[info procs ps?_ps_pl_reset_config]
