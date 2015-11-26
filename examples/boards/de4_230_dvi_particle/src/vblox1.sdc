#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period 20 [get_ports OSC_50_Bank2]
create_clock -period 20 [get_ports OSC_50_Bank3]
create_clock -period 20 [get_ports OSC_50_Bank4]
create_clock -period 20 [get_ports OSC_50_Bank5]
create_clock -period 20 [get_ports OSC_50_Bank6]
create_clock -period 20 [get_ports OSC_50_Bank7]

# 148.5 MHz (1920x1080@60)
set rx_clk_period 6.734
# 74.25 MHz (1280x720@60)
## set rx_clk_period 13.468
# 27.027 MHz (720x480@60)
## set rx_clk_period 37
create_clock -period $rx_clk_period [get_ports DVI_RX_CLK]

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks

# vblox1_inst|mem_if_ddr2_emif_0|pll0|pll_mem_clk - 2x clock
# vblox1_inst|mem_if_ddr2_emif_0|pll0|pll_afi_clk - 1x clock

set dvi_tx_clk     {vblox1_inst|dvi_tx_pll|sd1|pll7|clk[0]}
set write_edid_clk {vblox1_inst|dvi_tx_pll|sd1|pll7|clk[1]}

# Create clock on DVI_TX_CLK output port so that output delay
# constraints can be specified wrt it.
create_generated_clock -name dvi_tx_clk_out \
    -source [get_pins $dvi_tx_clk] \
    -divide_by 1 \
    [get_ports DVI_TX_CLK]

set tx_clk_period [get_clock_info -period [get_clocks $dvi_tx_clk]]

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty


#**************************************************************
#
#**************************************************************

# When true, set DVI input and output delays to 0ns.
#   Useful for getting baseline slack values.
# When false, use constraints derived from working vfb build.
set zero_io_delays false

# When true, apply different constraints on each port in the group (RX/TX),
#  derived from slacks in working vfb build.
# When false, apply one set of constraints to all ports in group
#  (e.g. the least restrictive of the constraints over all ports in group).
set rx_per_port_constraints false
set tx_per_port_constraints false

#**************************************************************
#
#**************************************************************

# Setup/hold slack on DVI_RX inputs from working vfb build,
# assuming 0ns input delay.
# Should be able to delay the input at most by the setup slack amount
# or make the input precede the input clock by the hold slack amount.

# Slow 900mV 85C Model, Slow 900mV 0C Model, Fast 900mV 0C Model
array set rx_slack {
    DVI_RX_VS     {{4.653  1.564} {4.828  1.483} {5.105  1.015}}
    DVI_RX_HS     {{4.334  1.877} {4.500  1.760} {4.890  1.219}}
    DVI_RX_D[23]  {{4.312  1.869} {4.494  1.797} {4.872  1.221}}
    DVI_RX_D[22]  {{3.930  2.292} {4.121  2.107} {4.660  1.474}}
    DVI_RX_D[21]  {{4.114  2.072} {4.307  1.985} {4.756  1.341}}
    DVI_RX_D[20]  {{4.106  2.086} {4.314  1.989} {4.763  1.340}}
    DVI_RX_D[19]  {{4.467  1.739} {4.633  1.672} {4.964  1.153}}
    DVI_RX_D[18]  {{4.409  1.782} {4.587  1.705} {4.918  1.183}}
    DVI_RX_D[17]  {{4.260  1.939} {4.454  1.855} {4.874  1.234}}
    DVI_RX_D[16]  {{4.399  1.844} {4.548  1.698} {4.981  1.158}}
    DVI_RX_D[15]  {{4.486  1.724} {4.624  1.595} {5.048  1.097}}
    DVI_RX_D[14]  {{4.173  2.020} {4.378  1.929} {4.806  1.296}}
    DVI_RX_D[13]  {{4.288  1.891} {4.471  1.813} {4.859  1.234}}
    DVI_RX_D[12]  {{4.825  1.415} {4.953  1.304} {5.227  0.925}}
    DVI_RX_D[11]  {{4.238  1.969} {4.423  1.894} {4.832  1.280}}
    DVI_RX_D[10]  {{4.285  1.968} {4.428  1.825} {4.885  1.257}}
    DVI_RX_D[9]   {{4.208  1.994} {4.400  1.912} {4.820  1.289}}
    DVI_RX_D[8]   {{4.264  1.990} {4.419  1.840} {4.877  1.261}}
    DVI_RX_D[7]   {{4.485  1.746} {4.630  1.619} {5.014  1.121}}
    DVI_RX_D[6]   {{4.532  1.694} {4.714  1.607} {5.041  1.081}}
    DVI_RX_D[5]   {{4.230  1.985} {4.415  1.878} {4.843  1.268}}
    DVI_RX_D[4]   {{4.265  1.943} {4.451  1.854} {4.864  1.239}}
    DVI_RX_D[3]   {{4.265  1.929} {4.461  1.847} {4.875  1.227}}
    DVI_RX_D[2]   {{4.262  1.944} {4.455  1.853} {4.866  1.238}}
    DVI_RX_D[1]   {{4.528  1.702} {4.665  1.587} {5.047  1.090}}
    DVI_RX_D[0]   {{4.554  1.678} {4.731  1.594} {5.057  1.067}}
    DVI_RX_DE     {{4.710  1.535} {4.851  1.405} {5.153  0.981}}
}

# Setup/hold slack on DVI_TX outputs from working vfb build,
# assuming 0ns output delay.
# Should be able to set output delay to at most the setup slack amount
# or have the output change earlier (or the latching clock delayed) by
# up to the hold slack amount.
array set tx_slack {
    DVI_TX_VS    {{3.533  2.547} {3.725  2.353} {4.752  1.589}}
    DVI_TX_HS    {{3.406  2.732} {3.624  2.532} {4.577  1.781}}
    DVI_TX_D[23] {{4.208  1.950} {4.353  1.817} {5.158  1.213}}
    DVI_TX_D[22] {{4.262  1.943} {4.403  1.813} {5.193  1.207}}
    DVI_TX_D[21] {{3.161  2.918} {3.390  2.684} {4.496  1.842}}
    DVI_TX_D[20] {{3.000  3.072} {3.260  2.802} {4.398  1.928}}
    DVI_TX_D[19] {{4.241  1.945} {4.388  1.821} {5.179  1.206}}
    DVI_TX_D[18] {{3.867  2.229} {4.047  2.058} {4.954  1.379}}
    DVI_TX_D[17] {{4.316  1.829} {4.455  1.705} {5.251  1.115}}
    DVI_TX_D[16] {{3.604  2.473} {3.793  2.278} {4.795  1.544}}
    DVI_TX_D[15] {{2.803  3.215} {3.062  2.935} {4.313  1.998}}
    DVI_TX_D[14] {{4.123  2.062} {4.256  1.915} {5.163  1.243}}
    DVI_TX_D[13] {{4.250  1.898} {4.386  1.762} {5.202  1.178}}
    DVI_TX_D[12] {{4.419  1.797} {4.534  1.681} {5.310  1.116}}
    DVI_TX_D[11] {{5.092  1.206} {5.160  1.141} {5.720  0.707}}
    DVI_TX_D[10] {{5.145  1.147} {5.198  1.101} {5.767  0.674}}
    DVI_TX_D[9]  {{4.564  1.667} {4.660  1.579} {5.378  1.054}}
    DVI_TX_D[8]  {{4.420  1.793} {4.538  1.675} {5.308  1.115}}
    DVI_TX_D[7]  {{3.719  2.409} {3.920  2.216} {4.826  1.545}}
    DVI_TX_D[6]  {{3.730  2.424} {3.914  2.240} {4.824  1.556}}
    DVI_TX_D[5]  {{4.782  1.456} {4.859  1.379} {5.535  0.903}}
    DVI_TX_D[4]  {{4.268  1.929} {4.395  1.806} {5.195  1.213}}
    DVI_TX_D[3]  {{4.244  1.914} {4.382  1.774} {5.198  1.193}}
    DVI_TX_D[2]  {{4.679  1.592} {4.777  1.494} {5.410  0.997}}
    DVI_TX_D[1]  {{4.414  1.833} {4.498  1.739} {5.268  1.121}}
    DVI_TX_D[0]  {{4.206  1.935} {4.327  1.814} {5.185  1.194}}
    DVI_TX_DE    {{4.270  1.908} {4.382  1.793} {5.218  1.194}}
}

# For each port, get smallest setup and hold slack over all corners.
# Then get smallest setup and hold slacks over all ports.
array set min_rx_slack {}
set min_rx_setup_slack 9999
set min_rx_hold_slack  9999
foreach {port vals} [array get rx_slack] {
    # min slack values for this port
    set min_setup_slack 9999
    set min_hold_slack  9999
    foreach pair $vals {
        set setup_slack [lindex $pair 0]
        set hold_slack  [lindex $pair 1]
        set min_setup_slack [expr min($setup_slack, $min_setup_slack)]
        set min_hold_slack  [expr min($hold_slack,  $min_hold_slack)]
    }
    set min_rx_slack($port) [list $min_setup_slack $min_hold_slack]

    set min_rx_setup_slack [expr min($min_setup_slack, $min_rx_setup_slack)]
    set min_rx_hold_slack  [expr min($min_hold_slack,  $min_rx_hold_slack)]
}

array set min_tx_slack {}
set min_tx_setup_slack 9999
set min_tx_hold_slack  9999
foreach {port vals} [array get tx_slack] {
    set min_setup_slack 9999
    set min_hold_slack  9999
    foreach pair $vals {
        set setup_slack [lindex $pair 0]
        set hold_slack  [lindex $pair 1]
        set min_setup_slack [expr min($setup_slack, $min_setup_slack)]
        set min_hold_slack  [expr min($hold_slack,  $min_hold_slack)]
    }
    set min_tx_slack($port) [list $min_setup_slack $min_hold_slack]

    set min_tx_setup_slack [expr min($min_setup_slack, $min_tx_setup_slack)]
    set min_tx_hold_slack  [expr min($min_hold_slack,  $min_tx_hold_slack)]
}

#**************************************************************

set sdc_verbose false

foreach port [lsort [array names min_rx_slack]] {
    set pair $min_rx_slack($port)
    set setup_slack [lindex $pair 0]
    set hold_slack  [lindex $pair 1]
    set window_size [expr $rx_clk_period - $setup_slack - $hold_slack]
    if {$sdc_verbose} {
        puts "$port $setup_slack $hold_slack ($window_size)"
    }
}
if {$sdc_verbose} {
    set window_size [expr $rx_clk_period - $min_rx_setup_slack - $min_rx_hold_slack]
    puts "Min rx slacks: $min_rx_setup_slack $min_rx_hold_slack ($window_size)"
}

foreach port [lsort [array names min_tx_slack]] {
    set pair $min_tx_slack($port)
    set setup_slack [lindex $pair 0]
    set hold_slack  [lindex $pair 1]
    set window_size [expr $rx_clk_period - $setup_slack - $hold_slack]
    if {$sdc_verbose} {
        puts "$port $setup_slack $hold_slack ($window_size)"
    }
}
if {$sdc_verbose} {
    set window_size [expr $tx_clk_period - $min_tx_setup_slack - $min_tx_hold_slack]
    puts "Min tx slacks: $min_tx_setup_slack $min_tx_hold_slack ($window_size)"
}

#**************************************************************
# Set Input Delay
#**************************************************************

set dvi_rx_ports [get_ports [list DVI_RX_D\[*\] DVI_RX_DE DVI_RX_HS DVI_RX_VS]]

# TFP401A DVI RX PHY on HSMC-DVI daughercard has OCK_INV tied to ground,
# so it specifies setup/hold times for its outputs relative the falling
# edge of clk.
#
# set_input_delay -clock [get_clocks DVI_RX_CLK] -clock_fall -max \
#     [expr $rx_clk_period - 1.8] $dvi_rx_ports
# set_input_delay -clock [get_clocks DVI_RX_CLK] -clock_fall -min \
#     0.6 $dvi_rx_ports
#
# However, the alt_vipcti clocked video input component samples the DVI RX
# signals on the POSITIVE edge of the clock. We can convert the constraints
# to be wrt posedge clk, or add false/multicycle paths, or add a level
# of negedge sampling flops before the cti, but, regardless, RX at 1080p
# doesn't work with the RX PHY datasheet numbers on the DE4 board.
# The clock and data lines from the PHY to the FPGA seem to not be
# delay-matched.
#
# Instead, a set of constraints that work have been determined by trial and error
# based on an vfb design with unconstrained I/O that just happened to work
# correctly at 1080p.

if {$zero_io_delays} {
    set_input_delay -clock [get_clocks DVI_RX_CLK] -max 0 $dvi_rx_ports
    set_input_delay -clock [get_clocks DVI_RX_CLK] -min 0 $dvi_rx_ports
} else {
    if {$rx_per_port_constraints} {
        foreach {port vals} [array get min_rx_slack] {
            set setup_slack [lindex $vals 0]
            set hold_slack  [lindex $vals 1]
            set_input_delay -clock [get_clocks DVI_RX_CLK] -max $setup_slack $port
            set_input_delay -clock [get_clocks DVI_RX_CLK] -min [expr -$hold_slack] $port
        }
    } else {
        # Use same constraints for all ports
        if {0} {
            # Min over all RX ports: setup slack 3.930ns, hold slack 0.925ns
            set max_in_delay $min_rx_setup_slack
            set min_in_delay [expr -$min_rx_hold_slack]
        } elseif {0} {
            # From RX PHY Datasheet:
            # Tsu=1.8ns, Th=0.6ns wrt clk fall (2.4ns window)
            # These constraints DO NOT work on the DE4!
            #  (probably because clock and data are skewed)
            # 6.734/2-1.8 = 1.567
            set max_in_delay [expr $rx_clk_period/2.0 - 1.8]
            # 6.734/2-0.6 = 2.767
            set min_in_delay [expr -($rx_clk_period/2.0 - 0.6)]
        } else {
            # The constraints derived from the working vfb build appear
            # to be hard to meet; plus the resulting builds show artifacts
            # on a greyscale gradient (16x9_test_pattern.gif).
            # Guessing that the input delay needs to be increased...
            #
            # Try average over all rx ports? setup 4.355, hold 1.196.
            #
            # Guesstimate: provide a 2.4ns window (as in RX PHY datasheet)
            # but move it just before posedge of clock.
            # This appears to work. Don't know if it's possible to relax the
            # constraints some more...
            set max_in_delay [expr $rx_clk_period - 2.4]
            set min_in_delay 0
        }
        set_input_delay -clock [get_clocks DVI_RX_CLK] -max \
            $max_in_delay $dvi_rx_ports
        set_input_delay -clock [get_clocks DVI_RX_CLK] -min \
            $min_in_delay $dvi_rx_ports
    }
}

#**************************************************************
# Set Output Delay
#**************************************************************

set dvi_tx_ports [get_ports [list DVI_TX_D\[*\] DVI_TX_DE DVI_TX_VS DVI_TX_HS]]

if {$zero_io_delays} {
    if {1} {
        set_output_delay -clock [get_clocks dvi_tx_clk_out] -max 0 $dvi_tx_ports
        set_output_delay -clock [get_clocks dvi_tx_clk_out] -min 0 $dvi_tx_ports
    } else {
        # use reference_pin instead of generated div-by-1 clock
        set_output_delay -clock [get_clocks $dvi_tx_clk] -max \
            -reference_pin DVI_TX_CLK 0 $dvi_tx_ports
        set_output_delay -clock [get_clocks $dvi_tx_clk] -min \
            -reference_pin DVI_TX_CLK 0 $dvi_tx_ports
    }
} else {
    if {$tx_per_port_constraints} {
        foreach {port vals} [array get min_tx_slack] {
            set setup_slack [lindex $vals 0]
            set hold_slack  [lindex $vals 1]
            set_output_delay -clock [get_clocks dvi_tx_clk_out] -max $setup_slack $port
            set_output_delay -clock [get_clocks dvi_tx_clk_out] -min [expr -$hold_slack] $port
        }
    } else {
        if {0} {
            # Min over all TX ports: setup slack 2.803ns, hold slack 0.674ns
            set max_out_delay $min_tx_setup_slack
            set min_out_delay [expr -$min_tx_hold_slack]
        } elseif {0} {
            # From TX PHY datasheet: Tsu = 1.2ns, Th = 1.3ns
            set max_out_delay 1.2
            set min_out_delay -1.3
        } else {
            # 2.5ns window; reduce hold to help with routing; seems to work
            set max_out_delay 2.5
            set min_out_delay 0
        }
        set_output_delay -clock [get_clocks dvi_tx_clk_out] -max \
            $max_out_delay $dvi_tx_ports
        set_output_delay -clock [get_clocks dvi_tx_clk_out] -min \
            $min_out_delay $dvi_tx_ports
    }
}

#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks [list $dvi_tx_clk dvi_tx_clk_out]]
set_clock_groups -asynchronous -group [get_clocks DVI_RX_CLK]
# set_clock_groups -asynchronous -group [get_clocks $write_edid_clk]

#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



