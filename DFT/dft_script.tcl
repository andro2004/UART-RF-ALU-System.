########################### Define Top Module ############################
set top_module SYS_TOP

foreach d {reports netlists sdf sdc work} { file mkdir $d }

################## Design Compiler Library Files #setup ######################
puts "###########################################"
puts "#      #setting Design Libraries          #"
puts "###########################################"

lappend search_path /home/ICer/Labs/Final_system/Backend/std_cells

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

set target_library [list $SSLIB $TTLIB $FFLIB]
set link_library   [list * $SSLIB $TTLIB $FFLIB]

set_svf ./netlists/$top_module.svf

######################## Reading RTL Files #################################
puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set file_formats "verilog"

set rtl_files [list]
set fh [open filelist.f r]
while {[gets $fh line] >= 0} {
    set line [string trim $line]
    if {$line eq "" || [string match "//*" $line] || [string match "#*" $line]} { continue }
    if {[string match -nocase "*_tb.*" $line]} { continue }
    lappend rtl_files $line
}
close $fh

define_design_lib WORK -path ./work

analyze -format $file_formats -library WORK $rtl_files
elaborate $top_module -library WORK

current_design $top_module

#################### Linking All The Design Parts ##########################
puts "###############################################"
puts "######## Linking All The Design Parts #########"
puts "###############################################"
link

#################### Checking design consistency ###########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"
check_design

set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

#################### Define Design Constraints #############################
puts "###############################################"
puts "############ Design Constraints ###############"
puts "###############################################"

set fh [open ./cons.tcl r]
set cons_text [read $fh]
close $fh
if {[string match "*source ./cons.tcl*" $cons_text]} {
    error "cons.tcl sources itself - it is a copy of the flow script, not the constraints file."
}

source ./cons.tcl

foreach v {CLK_SETUP_SKEW CLK_HOLD_SKEW CLK_RISE CLK_FALL uart_clk_name ref_clk_name} {
    if {![info exists $v]} { error "cons.tcl did not define \$$v" }
}

#################### [DFT] Scan clock constraints ##########################
set SCAN_CLK_PER 100
create_clock -name scan_clk -period $SCAN_CLK_PER [get_ports scan_clk]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks scan_clk]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW  [get_clocks scan_clk]
set_clock_transition -rise $CLK_RISE [get_clocks scan_clk]
set_clock_transition -fall $CLK_FALL [get_clocks scan_clk]
set_dont_touch_network [get_clocks scan_clk]

set_clock_groups -asynchronous \
    -group [get_clocks scan_clk] \
    -group [get_clocks "$uart_clk_name RX_CLK TX_CLK"] \
    -group [get_clocks "$ref_clk_name ALU_CLK"]

set_input_delay [expr 0.2*$SCAN_CLK_PER] -clock scan_clk [get_ports test_mode]
set_case_analysis 1 [get_ports test_mode]

#################### [DFT] Scan configuration ##############################
puts "###############################################"
puts "############# DFT Configuration ###############"
puts "###############################################"

set_scan_configuration -style multiplexed_flip_flop
set_scan_configuration -chain_count 1
set_scan_configuration -clock_mixing mix_clocks

set_dft_insertion_configuration -synthesis_optimization all
set_dft_insertion_configuration -unscan false

set_dft_signal -view existing_dft -type ScanClock -port scan_clk -timing {45 55}
set_dft_signal -view existing_dft -type Reset     -port scan_rst -active_state 0
set_dft_signal -view existing_dft -type Constant  -port test_mode -active_state 1
set_dft_signal -view existing_dft -type ScanEnable -port SE -active_state 1 -usage clock_gating

set_dft_signal -view spec -type ScanEnable  -port SE  -active_state 1
set_dft_signal -view spec -type ScanDataIn  -port SI
set_dft_signal -view spec -type ScanDataOut -port SO

###################### Mapping and optimization ############################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"
compile -scan

#################### [DFT] Protocol, DRC, insertion ########################
create_test_protocol
dft_drc -verbose > reports/dft_drc_pre.rpt

preview_dft > reports/preview_dft.rpt
insert_dft

set scan_in_ports  [get_ports -quiet {SI SE}]
set scan_out_ports [get_ports -quiet {SO}]

if {[sizeof_collection $scan_in_ports] != 2 || [sizeof_collection $scan_out_ports] != 1} {
    error "Scan ports not found after insert_dft - check reports/preview_dft.rpt"
}

set_input_delay  [expr 0.2*$SCAN_CLK_PER] -clock scan_clk $scan_in_ports
set_output_delay [expr 0.2*$SCAN_CLK_PER] -clock scan_clk $scan_out_ports
set_load 0.1 $scan_out_ports

compile -scan -incremental
dft_drc -verbose -coverage_estimate > reports/coverage_estimate.rpt
dft_drc -verbose > reports/dft_drc_post.rpt

#############################################################################
# Write out files
#############################################################################
change_names -hierarchy -rules verilog

write_file -format ddc     -hierarchy -output netlists/$top_module.ddc
write_file -format verilog -hierarchy -output netlists/$top_module.v
write_sdf  sdf/$top_module.sdf
write_sdc  -nosplit sdc/$top_module.sdc

write_test_protocol -output netlists/$top_module.spf
write_scan_def      -output netlists/$top_module.scandef

set_svf -off

####################### reporting ##########################################
report_area -hierarchy                    > reports/area.rpt
report_power -hierarchy                   > reports/power.rpt
report_timing -delay_type min             > reports/hold.rpt
report_timing -delay_type max             > reports/setup.rpt
report_clock -attributes                  > reports/clocks.rpt
report_constraint -all_violators -nosplit > reports/constraints.rpt

report_scan_configuration                      > reports/scan_config.rpt
report_dft_signal -view existing_dft           > reports/dft_signals.rpt
report_dft_signal -view spec                   > reports/dft_signals_spec.rpt
report_scan_path -view existing_dft -chain all > reports/scan_chains.rpt
report_scan_path -view existing_dft -cell all  > reports/scan_cells.rpt
report_unscannable_cells                       > reports/unscannable.rpt

exit
