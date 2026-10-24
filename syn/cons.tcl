
#################### Section 0 : DC Variables ####################
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

#################### Section 1 : Clock Definition ####################
set uart_clk_name UART_CLK
set ref_clk_name  REF_CLK
set UART_CLK_PER  271.267
set REF_CLK_PER   20
set UART_TX_CLK_PER  [expr $UART_CLK_PER * 32]
set UART_RX_CLK_PER  [expr $UART_CLK_PER * 1]
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW  0.1
set CLK_LAT  0
set CLK_RISE 0.05
set CLK_FALL 0.05

# 1. Master clocks
create_clock -name $uart_clk_name -period $UART_CLK_PER [get_ports UART_CLK]
create_clock -name $ref_clk_name  -period $REF_CLK_PER  [get_ports REF_CLK]

# 2. Generated clocks
# FIX: tx_clk / rx_clk are NETS, not pins. Use the output pin of the divider instance.
create_generated_clock -master_clock $uart_clk_name -source [get_ports UART_CLK] \
                       -name "TX_CLK" [get_pins TX_ClkDiv/o_div_clk] \
                       -divide_by 32

create_generated_clock -master_clock $uart_clk_name -source [get_ports UART_CLK] \
                       -name "RX_CLK" [get_pins RX_ClkDiv/o_div_clk] \
                       -divide_by 1

create_generated_clock -master_clock $ref_clk_name -source [get_ports REF_CLK] \
                       -name "ALU_CLK" [get_pins ALU_CLK_GATE/GATED_CLK] \
                       -divide_by 1

set all_clks [get_clocks "$uart_clk_name $ref_clk_name RX_CLK TX_CLK ALU_CLK"]

# 3. Clock latencies
set_clock_latency $CLK_LAT $all_clks

# 4. Clock uncertainties
set_clock_uncertainty -setup $CLK_SETUP_SKEW $all_clks
set_clock_uncertainty -hold  $CLK_HOLD_SKEW  $all_clks

# 5. Clock transitions
set_clock_transition -rise $CLK_RISE $all_clks
set_clock_transition -fall $CLK_FALL $all_clks

# 6. Dont touch network
set_dont_touch_network $all_clks
set_dont_touch_network [get_ports RST]

#################### Section 2 : Clocks Relationship ####################
set_clock_groups -asynchronous -group [get_clocks "$uart_clk_name RX_CLK TX_CLK"] \
                               -group [get_clocks "$ref_clk_name ALU_CLK"]

#################### Section 3 : Input/Output delay ####################
set uart_rx_in_delay  [expr 0.2*$UART_RX_CLK_PER]
set uart_tx_out_delay [expr 0.2*$UART_TX_CLK_PER]
set uart_rx_out_delay [expr 0.2*$UART_RX_CLK_PER]

# FIX: -clock is required, and multiple ports must be wrapped in braces
set_input_delay  $uart_rx_in_delay  -clock "RX_CLK" [get_ports RX_IN]
set_output_delay $uart_rx_out_delay -clock "RX_CLK" [get_ports {RX_Parity_Error RX_Stop_Error}]
set_output_delay $uart_tx_out_delay -clock "TX_CLK" [get_ports TX_OUT]
set_output_delay $uart_tx_out_delay -clock "TX_CLK" [get_ports TX_OUT_V]


#################### Section 4 : Driving cells ####################
# FIX: there was a space after the backslash, which broke the line continuation
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c \
                 -lib_cell BUFX2M -pin Y \
                 [get_ports RX_IN]

#################### Section 5 : Output load ####################
# FIX: braces around the port list
set_load 0.1 [get_ports {TX_OUT RX_Parity_Error RX_Stop_Error}]

#################### Section 6 : Operating Condition ####################
# Worst library for max (setup), best library for min (hold)
set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
                         -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

#################### Section 7 : Premapped cells ####################
set_dont_touch [get_cells ALU_CLK_GATE]

