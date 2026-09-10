`timescale 1ns / 1ps

module lowp6 (
    input  logic clk,
    input  logic rst,
    input  logic enable,
    input  logic signed [15:0] signal_in,
    output logic signed [15:0] signal_out
);

    // Função para calcular log2
    function automatic int log2(input int v);
        log2 = 0;
        while (v >> log2)
            log2 = log2 + 1;
    endfunction

    parameter int N  = 1024;
    localparam int N2 = log2(N) - 1;
    logic signed [15+N2:0] signal_out_tmp_3;
    logic signed [15:0] data [0:N-1];

    // propaga as amostras a cada ciclo de clock
    genvar i;
    generate
        for (i = 0; i < N-1; i = i + 1) begin : gd
            always_ff @(posedge clk) begin
                if (rst)
                    data[i+1] <= '0;
                else
                    data[i+1] <= data[i];
            end
        end
    endgenerate

    // carrega a nova amostra na posição 0
    always_ff @(posedge clk) begin
        if (rst)
            data[0] <= '0;
        else
            data[0] <= signal_in;
    end

    logic signed [15+N2:0] signal_out_tmp_2;
    assign signal_out_tmp_2 = signal_out_tmp_3 + signal_in - data[N-1];

    // registra a saída filtrada
    always_ff @(posedge clk) begin
        if (rst) begin
            signal_out     <= '0;
            signal_out_tmp_3 <= '0;
        end else begin
            signal_out     <= signal_out_tmp_2[15+N2 : N2];
            signal_out_tmp_3 <= signal_out_tmp_2;
        end
    end

endmodule