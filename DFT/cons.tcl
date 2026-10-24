####################################################################################
#### Section 1 : Clock Definition
####################################################################################
# >>> CHECK THESE VALUES AGAINST YOUR SPEC <<<
set ref_clk_name   REF_CLK
set uart_clk_name  UART_CLK

set REF_CLK_PER    20        ;# ns (50 MHz)
set UART_CLK_PER   271.267   ;# ns (3.6864 MHz)
set TX_DIV         32        ;# TX_CLK = UART_CLK / 32
set RX_DIV         1         ;# fastest RX_CLK (largest prescale) = worst case

set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW  0.1
set CLK_LAT        0
set CLK_RISE       0.05
set CLK_FALL       0.05

set TX_CLK_PER [expr $UART_CLK_PER*$TX_DIV]
set RX_CLK_PER [expr $UART_CLK_PER*$RX_DIV]

# Master clocks
create_clock -name $ref_clk_name  -period $REF_CLK_PER  -waveform "0 [expr $REF_CLK_PER/2]"  [get_ports REF_CLK]
create_clock -name $uart_clk_name -period $UART_CLK_PER -waveform "0 [expr $UART_CLK_PER/2]" [get_ports UART_CLK]

# Generated clocks (clock dividers and the ALU clock gate)
create_generated_clock -name TX_CLK  -source [get_ports UART_CLK] -divide_by $TX_DIV [get_pins TX_ClkDiv/o_div_clk]
create_generated_clock -name RX_CLK  -source [get_ports UART_CLK] -divide_by $RX_DIV [get_pins RX_ClkDiv/o_div_clk]
create_generated_clock -name ALU_CLK -source [get_ports REF_CLK]  -divide_by 1       [get_pins ALU_CLK_GATE/GATED_CLK]

foreach c [list $ref_clk_name $uart_clk_name TX_CLK RX_CLK ALU_CLK] {
    set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $c]
    set_clock_uncertainty -hold  $CLK_HOLD_SKEW  [get_clocks $c]
    set_clock_transition -rise $CLK_RISE [get_clocks $c]
    set_clock_transition -fall $CLK_FALL [get_clocks $c]
    set_clock_latency $CLK_LAT [get_clocks $c]
}

set_dont_touch_network [get_clocks "$ref_clk_name $uart_clk_name"]
set_dont_touch_network [get_ports RST]

####################################################################################
#### Section 2 : Clock Relationships
####################################################################################
set_clock_groups -asynchronous -group [get_clocks "$uart_clk_name RX_CLK TX_CLK"] \
                               -group [get_clocks "$ref_clk_name ALU_CLK"]

# RST is asynchronous and goes through the reset synchronizers
set_false_path -from [get_ports RST]

####################################################################################
#### Section 3 : Input / Output delays
####################################################################################
set_input_delay  [expr 0.2*$RX_CLK_PER] -clock RX_CLK [get_ports RX_IN]

set_output_delay [expr 0.2*$TX_CLK_PER] -clock TX_CLK [get_ports {TX_OUT TX_OUT_V}]
set_output_delay [expr 0.2*$RX_CLK_PER] -clock RX_CLK [get_ports {RX_Stop_Error RX_Parity_Error}]

####################################################################################
#### Section 4 : Driving cells
####################################################################################
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports {RX_IN RST}]

####################################################################################
#### Section 5 : Output load
####################################################################################
set_load 0.1 [get_ports {TX_OUT TX_OUT_V RX_Stop_Error RX_Parity_Error}]

####################################################################################
#### Section 6 : Operating Condition
####################################################################################
set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
                         -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
#### Section 7 : Wireload Model
####################################################################################
set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
