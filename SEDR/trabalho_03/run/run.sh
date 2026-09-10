#!/bin/bash

echo "Limpando simulação anterior..."
rm -rf xrun.*

echo "Executando simulação..."

xrun -64bit -sv \
     -f files.txt \
     -access +rwc \
     -l xrun.log

echo "Finalizado!"
