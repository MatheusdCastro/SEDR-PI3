# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.10-p002_1 on Tue Jun 30 22:49:25 -03 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design lowp6

create_clock -name "clk" -period 20.0 -waveform {0.0 10.0} [get_ports clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports enable]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[15]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[14]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[13]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[12]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[11]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[10]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[9]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[8]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[15]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[0]}]
set_wire_load_mode "enclosed"
