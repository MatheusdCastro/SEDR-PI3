#!/usr/bin/tclsh

proc list_size {lista} {
	set i 0
	foreach l $lista {
		incr i
	}
	return $i
}

puts "Digite os elementos da lista separados por espacos:"
gets stdin input
set lista [split $input " "]
set tam [list_size $lista]

puts "Número de elementos na lista: $tam"


