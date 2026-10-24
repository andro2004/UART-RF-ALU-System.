###################################################################

# Created by write_sdc on Sat Oct 10 02:31:19 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RST]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RX_IN]
set_load -pin_load 0.1 [get_ports TX_OUT]
set_load -pin_load 0.1 [get_ports RX_Stop_Error]
set_load -pin_load 0.1 [get_ports RX_Parity_Error]
set_load -pin_load 0.1 [get_ports TX_OUT_V]
set_load -pin_load 0.1 [get_ports SO]
set_case_analysis 1 [get_ports test_mode]
create_clock [get_ports REF_CLK]  -period 20  -waveform {0 10}
set_clock_latency 0  [get_clocks REF_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks REF_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks REF_CLK]
set_clock_transition -min -fall 0.05 [get_clocks REF_CLK]
set_clock_transition -max -fall 0.05 [get_clocks REF_CLK]
set_clock_transition -min -rise 0.05 [get_clocks REF_CLK]
set_clock_transition -max -rise 0.05 [get_clocks REF_CLK]
create_clock [get_ports UART_CLK]  -period 271.267  -waveform {0 135.633}
set_clock_latency 0  [get_clocks UART_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks UART_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_CLK]
set_clock_transition -min -fall 0.05 [get_clocks UART_CLK]
set_clock_transition -max -fall 0.05 [get_clocks UART_CLK]
set_clock_transition -min -rise 0.05 [get_clocks UART_CLK]
set_clock_transition -max -rise 0.05 [get_clocks UART_CLK]
create_generated_clock [get_pins TX_ClkDiv/o_div_clk]  -name TX_CLK  -source [get_ports UART_CLK]  -divide_by 32
set_clock_latency 0  [get_clocks TX_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks TX_CLK]
set_clock_transition -min -fall 0.05 [get_clocks TX_CLK]
set_clock_transition -max -fall 0.05 [get_clocks TX_CLK]
set_clock_transition -min -rise 0.05 [get_clocks TX_CLK]
set_clock_transition -max -rise 0.05 [get_clocks TX_CLK]
create_generated_clock [get_pins RX_ClkDiv/o_div_clk]  -name RX_CLK  -source [get_ports UART_CLK]  -divide_by 1
set_clock_latency 0  [get_clocks RX_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks RX_CLK]
set_clock_transition -min -fall 0.05 [get_clocks RX_CLK]
set_clock_transition -max -fall 0.05 [get_clocks RX_CLK]
set_clock_transition -min -rise 0.05 [get_clocks RX_CLK]
set_clock_transition -max -rise 0.05 [get_clocks RX_CLK]
create_generated_clock [get_pins ALU_CLK_GATE/GATED_CLK]  -name ALU_CLK  -source [get_ports REF_CLK]  -divide_by 1
set_clock_latency 0  [get_clocks ALU_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]
set_clock_transition -min -fall 0.05 [get_clocks ALU_CLK]
set_clock_transition -max -fall 0.05 [get_clocks ALU_CLK]
set_clock_transition -min -rise 0.05 [get_clocks ALU_CLK]
set_clock_transition -max -rise 0.05 [get_clocks ALU_CLK]
create_clock [get_ports scan_clk]  -period 100  -waveform {0 50}
set_clock_uncertainty -setup 0.2  [get_clocks scan_clk]
set_clock_uncertainty -hold 0.1  [get_clocks scan_clk]
set_clock_transition -min -fall 0.05 [get_clocks scan_clk]
set_clock_transition -max -fall 0.05 [get_clocks scan_clk]
set_clock_transition -min -rise 0.05 [get_clocks scan_clk]
set_clock_transition -max -rise 0.05 [get_clocks scan_clk]
set_false_path   -from [get_ports RST]
set_input_delay -clock RX_CLK  54.2534  [get_ports RX_IN]
set_input_delay -clock scan_clk  20  [get_ports test_mode]
set_input_delay -clock scan_clk  20  [get_ports SI]
set_input_delay -clock scan_clk  20  [get_ports SE]
set_output_delay -clock TX_CLK  1736.11  [get_ports TX_OUT]
set_output_delay -clock TX_CLK  1736.11  [get_ports TX_OUT_V]
set_output_delay -clock RX_CLK  54.2534  [get_ports RX_Stop_Error]
set_output_delay -clock RX_CLK  54.2534  [get_ports RX_Parity_Error]
set_output_delay -clock scan_clk  20  [get_ports SO]
set_clock_groups -asynchronous -name UART_CLK_1 -group [list [get_clocks UART_CLK] [get_clocks RX_CLK] [get_clocks TX_CLK]] -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]]
set_clock_groups -asynchronous -name scan_clk_1 -group [get_clocks scan_clk] -group [list [get_clocks UART_CLK] [get_clocks RX_CLK] [get_clocks TX_CLK]] -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]]
