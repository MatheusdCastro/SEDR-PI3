#!/usr/bin/tclsh

puts "Digite uma lista de pelo menos 10 números:"
gets stdin input
set lista [split $input " "]
set tam [llength $lista]

while { $tam < 10} {
        puts "Digite novamente uma lista com pelo menos 10 números:"
        gets stdin lista
        set tam [llength $lista]
}

set newLista [lsort -real  $lista]

puts "Lista aleatória: $lista"
puts "Lista crescente: $newLista"
