quit -sim
if {[file exists work]} {vdel -lib work -all}
vlib work

if {[catch {vlog -sv +incdir+../include_dir +incdir+../RTL -f filelist.f} err]} {
    puts "Compilation failed:\n$err"
    return
}

vsim -voptargs=+acc work.Final_System_tb
do wave.do
run -all