#!/bin/bash

echo "===================================="
echo "Simulacao pos-sintese com Xcelium"
echo "===================================="

# Uso:
# ./run_post_synth.sh ../outputs_Jun30-20-27-29/lowp6_netlist.v

if [ -z "$1" ]; then
    echo "ERRO: informe o caminho da netlist gerada pelo Genus."
    echo "Exemplo: ./scripts/run_post_synth.sh outputs/outputs_Apr28-10-30-00/counter_netlist.v"
    exit 1
fi

NETLIST=$1

xrun -64bit -sv  \
    ../tb/tb_filtro.sv \
    "$NETLIST" \
    ../library/gscl45nm.v
