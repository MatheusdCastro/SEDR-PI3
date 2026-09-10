// vending_controller.sv
// ARQUIVO A SER IMPLEMENTADO PELO ALUNO
module vending_controller (
    input  logic clk,
    input  logic rst,
    input  logic moeda,
    input  logic [1:0] sabor,
    input  logic sabor_valido,
    output logic [1:0] credito,
    output logic [2:0] estado_debug,
    output logic entregar,
    output logic cola,
    output logic guarana,
    output logic laranja
);

    // TODO 1: criar enum com os estados:

    typedef enum logic [2:0] {
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        ESCOLHA = 3'b011,
        ENTREGA = 3'b100
    } estado_t;
 
    // TODO 2: criar estado e prox_estado

   estado_t estado, prox_estado;
   logic [1:0] sabor_reg, prox_sabor_reg;
 
    // TODO 3: BLOCO 1 - always_ff para registrar o estado

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            estado <= S0;
            sabor_reg <= 2'b00;
        end else begin
            estado <= prox_estado;
            sabor_reg <= prox_sabor_reg;
        end
    end
 
    // TODO 4: BLOCO 2 - always_comb para calcular o próximo estado

    always_comb begin
        prox_estado = estado;
        prox_sabor_reg = sabor_reg;
 
        case (estado)
            S0: begin
                if (moeda) prox_estado = S1;
            end

            S1: begin
                if (moeda) prox_estado = S2;
            end
 
            S2: begin
                if (moeda) prox_estado = ESCOLHA;
            end
 
            ESCOLHA: begin
                if (sabor_valido) begin
                    prox_estado = ENTREGA;
                    prox_sabor_reg = sabor;
                end
            end
 
            ENTREGA: begin
                prox_estado = S0;
                prox_sabor_reg = 2'b00;
            end
 
            default: prox_estado = S0;
        endcase
    end
 
    // TODO 5: BLOCO 3 - always_comb para calcular as saídas

    always_comb begin
        credito = 2'b00;
        estado_debug = 3'b000;
        entregar = 1'b0;
        cola = 1'b0;
        guarana = 1'b0;
        laranja = 1'b0;
 
        case (estado)
            S0: begin
                credito = 2'b00;
                estado_debug = 3'b000;
            end
 
            S1: begin
                credito = 2'b01;
                estado_debug = 3'b001;
            end
 
            S2: begin
                credito = 2'b10;
                estado_debug = 3'b010;
            end
 
            ESCOLHA: begin
                credito = 2'b11;
                estado_debug = 3'b011;
            end
 
            ENTREGA: begin
                credito = 2'b00;
                estado_debug = 3'b100;
                entregar = 1'b1;
                cola = (sabor_reg == 2'b00);
                guarana = (sabor_reg == 2'b01);
                laranja = (sabor_reg == 2'b10);
            end
 
            default: begin
                credito = 2'b00;
                estado_debug = 3'b000;
            end
        endcase
    end

endmodule
