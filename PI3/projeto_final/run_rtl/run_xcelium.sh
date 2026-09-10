#!/bin/bash
xrun -64bit -sv \
../rtl/lowp6.sv \
../tb/tb_filtro.sv \
-access +rwc
