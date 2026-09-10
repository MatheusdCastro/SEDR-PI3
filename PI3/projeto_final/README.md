# Filtro FIR Passa-Baixa (Média Móvel) — `lowp6`

Implementação em **SystemVerilog** de um filtro digital FIR passa-baixa baseado em média móvel de N pontos (N = 1024), utilizando a técnica de integração/diferenciação:

```
y[n] = y[n-1] + x[n] - x[n-N]
```

Essa abordagem elimina a necessidade de N multiplicadores, utilizando apenas operações de soma e subtração, resultando em um design eficiente em área e potência.

---

## Estrutura de Pastas

```
PI3/
├── rtl/                          # Código-fonte RTL (SystemVerilog)
│   └── lowp6.sv                  #   Módulo principal do filtro FIR
│
├── tb/                           # Testbenches
│   └── tb_filtro.sv              #   Testbench principal do filtro
│
├── library/                      # Bibliotecas de tecnologia (PDK)
│   ├── gscl45nm.lib              #   Liberty (.lib) — timing/área/potência
│   └── gscl45nm.v                #   Modelos Verilog das células
│
├── run_rtl/                      # Diretório de execução da simulação RTL
│   ├── run_xcelium.sh            #   Script para rodar a simulação RTL com xrun
│   ├── output.txt                #   Saída da simulação
│   ├── time.txt                  #   Timestamps da simulação
│   └── xcelium.d/                #   Artefatos gerados pelo Xcelium
│
├── run_synt/                     # Diretório de execução da simulação pós-síntese
│   ├── run_post_synth.sh         #   Script para rodar a simulação pós-síntese com xrun
│   ├── output.txt                #   Saída da simulação pós-síntese
│   ├── time.txt                  #   Timestamps da simulação pós-síntese
│   └── xcelium.d/                #   Artefatos gerados pelo Xcelium
│
├── outputs_<DATA>/               # Saídas da síntese (geradas automaticamente)
│   ├── lowp6_netlist.v           #   Netlist sintetizada (Verilog gate-level)
│   └── lowp6.sdc
│
├── reports_<DATA>/               # Relatórios da síntese (gerados automaticamente)
│   ├── lowp6_area.rpt            #   Relatório de área
│   ├── lowp6_power.rpt           #   Relatório de potência
│   ├── lowp6_gates.rpt           #   Relatório de portas/células
│   └── lowp6_timing.rpt          #   Relatório de timing
│
├── utils/                        # Utilitários (geração de entrada e visualização)
│   ├── conversor_audio_WavToBin.ipynb  # Notebook Python — converte .wav → .txt (16 bits)
│   └── filtro.m                  #   Script MATLAB — visualiza entrada vs. saída do filtro
│
├── figs/                         # Figuras e gráficos do projeto
│   └── lowpfilter_waveform.pdf   #   Formas de onda do filtro
│
├── fv/
│
├── run_lowp6.tcl                 # Script TCL para síntese no Cadence Genus
├── genus.cmd
├── genus.log
└── input.txt                     # Arquivo de entrada com amostras (formato binário 16 bits)
```

### Descrição dos Diretórios

| Diretório | Descrição |
|---|---|
| `rtl/` | Contém o código-fonte RTL em SystemVerilog. O módulo `lowp6.sv` implementa o filtro FIR passa-baixa com média móvel de 1024 pontos. |
| `tb/` | Contém o testbench `tb_filtro.sv`, responsável por carregar amostras de `input.txt`, injetá-las no filtro ciclo a ciclo, e gerar os arquivos `output.txt` e `time.txt` com os resultados. |
| `library/` | Bibliotecas de tecnologia FreePDK 45nm (GSCL). Inclui o arquivo Liberty (`.lib`) para síntese e o modelo Verilog (`.v`) das células para simulação pós-síntese. |
| `run_rtl/` | Diretório de trabalho para simulação RTL. Contém o script `run_xcelium.sh` e os arquivos de saída gerados após a simulação. |
| `run_synt/` | Diretório de trabalho para simulação pós-síntese. Contém o script `run_post_synth.sh` e os arquivos de saída gerados após a simulação gate-level. |
| `outputs_<DATA>/` | Diretório criado automaticamente pela síntese, contendo a netlist Verilog e as constraints SDC. O sufixo `<DATA>` é um timestamp no formato `MmmDD-HH-MM-SS`. |
| `reports_<DATA>/` | Diretório criado automaticamente pela síntese, contendo relatórios de área, potência, portas e timing. |
| `figs/` | Figuras e gráficos gerados a partir dos resultados das simulações. |
| `utils/` | Utilitários auxiliares do projeto. Contém o notebook Python para converter áudio `.wav` em amostras binárias de 16 bits (`input.txt`) e o script MATLAB para visualização dos resultados da simulação. |

---

## 1. Simulação RTL

A simulação RTL compila e executa o design original (antes da síntese) usando o Xcelium.

### Passos

```bash
# 1. Navegue até o diretório de simulação RTL
cd run_rtl/

# 2. Execute o script de simulação
./run_xcelium.sh
```

### O que o script faz

O script `run_xcelium.sh` executa o seguinte comando:

```bash
xrun -64bit -sv \
    ../rtl/lowp6.sv \
    ../tb/tb_filtro.sv \
    -access +rwc
```
### Arquivos Gerados

| Arquivo | Descrição |
|---|---|
| `output.txt` | Pares `(entrada, saída)` do filtro para cada ciclo de clock |
| `time.txt` | Tempo de simulação correspondente a cada amostra |

---

## 2. Síntese no Cadence Genus

A síntese mapeia o design RTL para células da biblioteca tecnológica FreePDK 45nm.

### Passos

```bash
# 1. A partir da raiz do projeto (PI3/), execute o Genus com o script TCL:
genus -files run_lowp6.tcl

```

### O que o script faz

O script `run_lowp6.tcl` realiza as seguintes etapas:

1. **Carrega a biblioteca** tecnológica `gscl45nm.lib`
2. **Lê o RTL** (`rtl/lowp6.sv`) com suporte a SystemVerilog
3. **Elabora** o design, resolvendo a hierarquia e conexões
4. **Verifica** erros no design (`check_design -unresolved`)
5. **Define constraints de timing:**
   - Clock de 50 MHz (período de 20 ns)
   - Input delay de 1 ns
   - Output delay de 1 ns
6. **Sintetiza** o design em 3 etapas: `syn_gen` → `syn_map` → `syn_opt`
7. **Gera relatórios** de área, potência, portas e timing
8. **Exporta** a netlist sintetizada (`.v`) e constraints (`.sdc`)

### Arquivos Gerados

Os arquivos são criados em diretórios com timestamp automático:

```
outputs_<DATA>/
├── lowp6_netlist.v       # Netlist gate-level sintetizada
└── lowp6.sdc             # Constraints SDC

reports_<DATA>/
├── lowp6_area.rpt        # Relatório de área
├── lowp6_power.rpt       # Relatório de potência
├── lowp6_gates.rpt       # Relatório de portas utilizadas
└── lowp6_timing.rpt      # Relatório de timing (slack, caminhos críticos)
```

---

## 3. Simulação Pós-Síntese

A simulação pós-síntese verifica o comportamento da netlist sintetizada (gate-level) usando os modelos Verilog das células da biblioteca.

### Passos

```bash
# 1. Navegue até o diretório de simulação pós-síntese
cd run_synt/

# 2. Execute o script, passando o caminho da netlist gerada pelo Genus
./run_post_synth.sh ../outputs_<DATA>/lowp6_netlist.v
```

### O que o script faz

O script `run_post_synth.sh` executa o seguinte comando:

```bash
xrun -64bit -sv \
    ../tb/tb_filtro.sv \
    "$NETLIST" \
    ../library/gscl45nm.v
```

| Flag / Arquivo | Descrição |
|---|---|
| `../tb/tb_filtro.sv` | Testbench (o mesmo usado na simulação RTL) |
| `$NETLIST` | Netlist gate-level gerada pela síntese |
| `../library/gscl45nm.v` | Modelos Verilog das células padrão (necessário para simulação gate-level) |

> **Nota:** Diferente da simulação RTL, aqui **não** se usa o arquivo RTL original (`lowp6.sv`). O módulo `lowp6` agora é definido pela netlist sintetizada, e as células referenciadas são resolvidas pelo arquivo `gscl45nm.v`.

### Arquivos Gerados

| Arquivo | Descrição |
|---|---|
| `output.txt` | Pares `(entrada, saída)` do filtro pós-síntese |
| `time.txt` | Tempo de simulação correspondente a cada amostra |

---

## 4. Gerando Dados de Entrada

O arquivo `input.txt` contém amostras de áudio em formato **binário de 16 bits com sinal** (complemento de 2), com uma amostra por linha. Ele é gerado a partir de um arquivo de áudio `.wav` usando o notebook `utils/conversor_audio_WavToBin.ipynb`.

### Como usar

1. Abra o notebook `utils/conversor_audio_WavToBin.ipynb` no **Jupyter** ou **Google Colab**
2. Coloque o arquivo `.wav` desejado no mesmo diretório (ou ajuste o caminho no código)
3. Execute a célula — o arquivo `.txt` será gerado automaticamente

### O que o notebook faz

1. **Lê o arquivo `.wav`** usando `scipy.io.wavfile`
2. **Converte para mono** (caso o áudio seja estéreo, utiliza apenas o canal esquerdo)
3. **Normaliza** as amostras para o intervalo `[-1.0, 1.0]`
4. **Quantiza** para 16 bits com sinal (intervalo `[-32767, +32767]`)
5. **Escreve** cada amostra em representação binária de 16 bits (complemento de 2)

> **Nota:** Após gerar o arquivo, renomeie-o para `input.txt` e coloque-o na raiz do projeto (`PI3/`) para que o testbench consiga localizá-lo.

---

## 5. Visualização dos Resultados (MATLAB)

O script `utils/filtro.m` permite visualizar graficamente a atuação do filtro, comparando o sinal de entrada com o sinal filtrado (saída).

### Como usar

1. Copie os arquivos `output.txt` e `time.txt` gerados pela simulação (RTL ou pós-síntese) para o mesmo diretório do script, ou ajuste os caminhos no código
2. Abra o MATLAB e execute:

```bash
run('utils/filtro.m')
```

### O que o script faz

1. **Carrega os dados** — Importa `output.txt` (colunas: entrada e saída do filtro) e `time.txt` (timestamps)
2. **Normaliza as amplitudes** — Divide os valores por `2^24` para obter a escala normalizada
3. **Plota os sinais** — Gera um gráfico sobrepondo o sinal de entrada (`M1`) e o sinal filtrado (`M2`) no domínio do tempo
4. **Estima a frequência de corte** — Usa `stepinfo()` para calcular o *Rise Time* e estima a frequência de corte pela relação `fc = 0.35 / Rise Time`

### Saídas

| Variável | Descrição |
|---|---|
| `fc` | Frequência de corte estimada do filtro (Hz) |
| Gráfico | Plot com entrada (azul) e saída filtrada (laranja) sobrepostas |
