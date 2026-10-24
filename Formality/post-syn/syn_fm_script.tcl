
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "$top_module.svf"


set SSLIB "/home/ICer/Labs/Final_system/Backend/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/Labs/Final_system/Backend/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/Labs/Final_system/Backend/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

## Read Reference technology libraries
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

# Read Reference Design Files
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/ALU/ALU.v

read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/ASYNC_FIFO/Async_FIFO.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/ASYNC_FIFO/FIFO_MEM_CNTRL.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/ASYNC_FIFO/FIFO_RD.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/ASYNC_FIFO/FIFO_WR.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/ASYNC_FIFO/DF_SYNC.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/ASYNC_FIFO/gray2bin.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/ASYNC_FIFO/bin2gray.v

read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/Clock_Divider/ClkDiv.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/Clock_Divider/CLK_DIV_Counter.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/CLKDIV_MUX/CLKDIV_MUX.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/Clock_Gating/CLK_GATE.v

read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/DATA_SYNC/DATA_SYNC.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/DATA_SYNC/Sync_chain.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/DATA_SYNC/Pulse_Gen.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/PULSE_GEN/PULSE_GEN.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/RST_SYNC/RST_SYNC.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/RegFile/RegFile.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/SYS_CTRL/SYS_CTRL.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/Top/SYS_TOP.v

read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_TOP/UART_TOP.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_RX/UART_RX.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_RX/FSM.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_RX/data_sampling.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_RX/deserializer.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_RX/edge_bit_counter.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_RX/parity_check.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_RX/start_check.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_RX/stop_check.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_TX/UART_TX.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_TX/TX_FSM.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_TX/serializer.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_TX/MUX_4to1.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_TX/parity_calc.v
read_verilog   -container Ref /home/ICer/Labs/Final_system/Backend/RTL/UART/UART_TX/TX_Counter.v


## set the top Reference Design 
set_reference_design $top_module
set_top $top_module

######################## Implementation Container #########################

## Read Implementation Design Files
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]
## Read Implementation technology libraries
read_ddc -container Imp /home/ICer/Labs/Final_system/Backend/DFT/netlists/SYS_TOP.ddc
## set the top Implementation Design
set_implementation_design $top_module
set_top $top_module


## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui

