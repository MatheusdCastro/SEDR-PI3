# Projeto: Máquina de Refrigerante Modular

## Breve Explicação sobre a FSM

A Máquina de Estados Finitos (FSM) deste projeto foi concebida com 5 estados no total, implementados com 3 blocos `always`. A lógica leva em consideração a lógica de acúmulo de moedas de R$1 para compra de um refrigerante que custa R$3. Os estados são descritos a seguir:
 - **S0 (Estado Inicial)**: Nenhuma moeda foi inserida. O crédito é igual a zero, os motores estão desligados e a FSM aguarda um pulso de inserção de moeda.
 - **S1**: Uma moeda inserida. O crédito sobe para 1 e o sistema continua aguardando.
 - **S2**: Duas moedas inseridas. O crédito sobe para 2 e o sistema continua aguardando.
 - **ESCOLHA**: O crédito atinge R$3,00. A FSM permanece em "espera" ativa enquanto a chave seletora mantiver o sinal de sabor inválido (2'b11). Assim que um sabor válido (00, 01 ou 10) for detectado, o estado transita.
 - **ENTREGA**: O sinal de dispensa e o respectivo motor são ativados simultaneamente. Essa liberação ocorre por um ciclo de clock e, no pulso de clock seguinte, a máquina retorna para o estado S0, zerando os créditos de forma automática e ficando pronta para um novo ciclo de compra.

