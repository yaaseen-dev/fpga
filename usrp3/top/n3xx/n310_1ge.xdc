#
# Copyright 2014 Ettus Research LLC
#

set_property PACKAGE_PIN   AF10             [get_ports {NETCLK_P}]
set_property PACKAGE_PIN   AF9              [get_ports {NETCLK_N}]

#IOSTANDARD not required because this is a GT terminal
#set_property IOSTANDARD    LVDS_25  [get_ports {ETH_CLK_*}]

create_clock -name NETCLK -period 8.000 -waveform {0.000 4.000} [get_ports NETCLK_P]

set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks NETCLK]
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks -of_objects [get_pins sfp_wrapper*/*network_interface_*/*sfpp_io_*/one_gige_phy_i/*/core_clocking_i/mmcm_*/CLKOUT0]]
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks -of_objects [get_pins sfp_wrapper*/*network_interface_*/*sfpp_io_*/one_gige_phy_i/*/core_clocking_i/mmcm_*/CLKOUT1]]

set_false_path -to [get_pins -hier -filter {NAME =~ sfp_wrapper*/*network_interface_*/*sfpp_io_*/one_gige_phy_i/*reset_sync*/PRE}]
set_false_path -to [get_pins -hier -filter {NAME =~ sfp_wrapper*/*network_interface_*/*sfpp_io_*/one_gige_phy_i/*/pma_reset_pipe_reg*/PRE}]
set_false_path -to [get_pins -hier -filter {NAME =~ sfp_wrapper*/*network_interface_*/*sfpp_io_*/one_gige_phy_i/*/pma_reset_pipe*[0]/D}]