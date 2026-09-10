`timescale 1ns / 1ps

module tb_filtro;
    logic clk;
    logic rst;
    logic enable;
    logic signed [15:0] signal_in;
    logic signed [15:0] signal_out;

    lowp6 uut (
        .signal_in  (signal_in),
        .signal_out (signal_out),
        .clk   (clk),
        .rst      (rst),
        .enable     (enable)
    );

    // Memória para armazenar as linhas do TXT
    logic [15:0] memoria_entrada [0:599999];
    int arquivo_saida;
    int arquivo_tempo;
    int i;

    always #10 clk = ~clk;

    initial begin
        clk  = 1'b0;
        rst     = 1'b1;
        enable    = 1'b0;
        signal_in = '0;

        for (i = 0; i < 600000; i = i + 1) begin
            memoria_entrada[i] = 16'bx;
        end

        $readmemb("../input.txt", memoria_entrada);
        arquivo_saida = $fopen("output.txt", "w");
        arquivo_tempo = $fopen("time.txt", "w");

        #100;
        
        rst  = 1'b0;
        enable = 1'b1;

        for (i = 0; i < 600000; i = i + 1) begin
            if (memoria_entrada[i] === 16'bx) begin
                $display("Fim do arquivo alcancado na linha %0d!", i);
                break;
            end else begin
                signal_in = memoria_entrada[i];

                @(posedge clk);
                $fdisplay(arquivo_saida, "%d %d", signal_in, signal_out);
                $fdisplay(arquivo_tempo, "%0d", $time);
            end
        end

        #10;

        $fclose(arquivo_saida);
        $fclose(arquivo_tempo);
        $display("Simulacao Concluida! Arquivos output.txt e time.txt gerados com sucesso.");
        $finish;
    end
endmodule
