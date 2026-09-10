# Sistemas Eletrônicos Digitais Reconfiguráveis e Projeto Integrador 3

Repositório com atividades e projetos desenvolvidos nas disciplinas de Sistemas
Eletrônicos Digitais Reconfiguráveis e Projeto Integrador 3. Os trabalhos cobrem
desde a descrição e simulação de circuitos digitais até a síntese, a validação
pós-síntese e atividades de projeto físico em tecnologia CMOS.

## Principais ferramentas

- **SystemVerilog** para descrição RTL, módulos combinacionais e sequenciais,
	máquinas de estados finitos e testbenches.
- **Xcelium / xrun** para compilação e simulação dos projetos RTL e gate-level.
- **Cadence Genus** para síntese lógica, mapeamento tecnológico, otimização e
	geração de netlists, constraints SDC e relatórios.
- **TCL e Shell Script** para automatizar síntese, simulação e organização dos
	arquivos de execução.
- **Cadence Virtuoso** para atividades de esquemático, layout e aplicação de
	estímulos em projetos de circuitos integrados.
- **Python/Jupyter e SciPy** para conversão e preparação de sinais de áudio.
- **MATLAB** para visualização e comparação dos sinais de entrada e saída.

## Habilidades desenvolvidas

- Modelagem de lógica combinacional com `always_comb`, `case`, multiplexadores,
	operadores lógicos e aritméticos.
- Projeto de lógica sequencial com clock, reset, registradores e `always_ff`.
- Desenvolvimento de máquinas de estados finitos, incluindo codificação de
	estados, lógica de próximo estado, registradores e lógica de saída.
- Criação de módulos parametrizados por largura de dados e integração de blocos
	digitais em projetos maiores.
- Elaboração de testbenches para aplicar estímulos, observar saídas e verificar
	o comportamento ciclo a ciclo.
- Implementação de um filtro FIR passa-baixa baseado em média móvel de 1024
	amostras, usando integração/diferenciação para reduzir o custo de hardware.
- Conversão de áudio `.wav` para amostras binárias de 16 bits com sinal e análise
	dos resultados no domínio do tempo.
- Aplicação de restrição de clock, atrasos de entrada e saída e análise de
	caminhos críticos, área, potência e células utilizadas.
- Comparação entre o comportamento RTL e a implementação sintetizada em nível
	de portas, utilizando os modelos da biblioteca tecnológica.
- Automação de fluxos de EDA por meio de scripts reprodutíveis e diretórios de
	resultados organizados por data de execução.

## Organização do repositório

### `SEDR/`

Reúne exercícios de fundamentos de projeto digital:

- **Trabalho 01:** multiplexadores de 4 bits descritos com `always_comb` e
	atribuição contínua.
- **Trabalho 02:** atividades de projeto digital e circuitos desenvolvidos na
	disciplina.
- **Trabalho 03:** portas lógicas e integração de módulos (`AND`, `OR`, `XOR`,
	`NAND`), com scripts de execução e testbenches.
- **Trabalho 04:** ULA de 8 bits com operações lógicas, soma e subtração.
- **Trabalho 05:** verificador de senha com comparação bit a bit e sinais de
	acesso e erro.
- **Projeto Machine:** máquina de refrigerante baseada em FSM, com acumulação de
	moedas, seleção de sabor e acionamento das saídas de entrega.
- **Virtuoso:** materiais relacionados às atividades de esquemático, layout e
	simulação em nível de circuito.

### `PI3/`

Contém os exercícios iniciais em TCL e o projeto final do filtro passa-baixa.
O diretório `PI3/projeto_final/` concentra:

- `rtl/`: código SystemVerilog do filtro;
- `tb/`: testbench e estímulos de simulação;
- `run_rtl/`: execução do fluxo RTL com Xcelium;
- `run_synt/`: simulação pós-síntese em nível de portas;
- `library/`: biblioteca tecnológica e modelos Verilog das células;
- `run_lowp6.tcl`: script de síntese no Genus;
- `reports_<DATA>/`: relatórios de área, potência, portas e timing;
- `outputs_<DATA>/`: netlist sintetizada e constraints SDC;
- `utils/`: notebook de conversão de áudio e script MATLAB;
- `figs/`: gráficos e formas de onda gerados durante a análise.

## Fluxo de desenvolvimento

1. Descrever o circuito em SystemVerilog e definir sua interface RTL.
2. Criar um testbench para aplicar estímulos e verificar o comportamento
	 funcional.
3. Executar a simulação RTL usando Xcelium e analisar os arquivos de saída.
4. Sintetizar o design no Cadence Genus usando a biblioteca de 45 nm e as
	 constraints de timing definidas em TCL.
5. Inspecionar os relatórios de área, potência, portas e timing.
6. Executar a simulação pós-síntese com a netlist e os modelos das células.
7. Comparar os resultados RTL e gate-level e visualizar os sinais no MATLAB.

## Projeto final: filtro passa-baixa

O projeto final implementa um filtro FIR passa-baixa baseado em média móvel. A
recorrência utilizada é:

```text
y[n] = y[n-1] + x[n] - x[n-N]
```

com `N = 1024`. Essa arquitetura evita a utilização de 1024 multiplicadores,
usando memória, somadores e subtratores para obter uma implementação mais
eficiente em área e potência.

O fluxo completo inclui a geração de amostras de áudio, simulação RTL, síntese
com mapeamento para células padrão, geração de relatórios e simulação
pós-síntese. As instruções detalhadas estão em
[`PI3/projeto_final/README.md`](PI3/projeto_final/README.md).
