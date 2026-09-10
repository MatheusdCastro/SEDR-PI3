// vending_top.sv
// ARQUIVO A SER IMPLEMENTADO PELO ALUNO
module vending_top (
    input  logic clk,
    input  logic rst,
    input  logic botao_moeda,
    input  logic [1:0] chave_sabor,
    output logic motor_cola,
    output logic motor_guarana,
    output logic motor_laranja,
    output logic [3:0] display_credito,
    output logic [2:0] display_estado
);

    // TODO:
    // 1. Criar sinais internos

    logic moeda;
    logic [1:0] sabor;
    logic sabor_valido;
    logic [1:0] credito;
    logic [2:0] estado_debug;
    logic entregar;
    logic cola_int;
    logic guarana_int;
    logic laranja_int;

    // 2. Instanciar coin_input

    coin_input u_coin_input (
        .clk(clk),
        .rst(rst),
        .botao_moeda(botao_moeda),
        .moeda(moeda)
    );
 
    // 3. Instanciar flavor_input

    flavor_input u_flavor_input (
        .chave_sabor (chave_sabor),
        .sabor(sabor),
        .sabor_valido(sabor_valido)
    );
 
    // 4. Instanciar vending_controller

    vending_controller u_controller (
        .clk(clk),
        .rst(rst),
        .moeda(moeda),
        .sabor(sabor),
        .sabor_valido(sabor_valido),
        .credito(credito),
        .estado_debug(estado_debug),
        .entregar(entregar),
        .cola(cola_int),
        .guarana(guarana_int),
        .laranja(laranja_int)
    );
 
    // 5. Instanciar dispenser_output

    dispenser_output u_dispenser (
        .entregar(entregar),
        .cola(cola_int),
        .guarana(guarana_int),
        .laranja(laranja_int),
        .motor_cola(motor_cola),
        .motor_guarana(motor_guarana),
        .motor_laranja(motor_laranja)
    );
 
    // 6. Instanciar display_output

    display_output u_display (
        .credito(credito),
        .estado(estado_debug),
        .display_credito(display_credito),
        .display_estado(display_estado)
    );
 
endmodule
