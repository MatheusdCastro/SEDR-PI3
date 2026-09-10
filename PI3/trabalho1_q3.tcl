#!/usr/bin/tclsh

set fp [open "instructions.txt" w]
puts $fp "Arquitetura FPGA ASIC Circuito Integrado VLSI Microelectronics CMOS SystemVerilog"
close $fp

set fp [open "instructions.txt" r]
gets $fp data
close $fp

set data_list [split $data]
set data_ord [lsort -nocase $data_list]
puts "Conteúdo do arquivo ordenado crescentemente:"
puts $data_ord
