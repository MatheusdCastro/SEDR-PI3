module ALU_8bit(
  input logic [7:0] a, b,
  input logic [1:0] sel,
  output logic [7:0] y
);
  
  always_comb begin
    case (sel)
      2'b00: y = a & b;
      2'b01: y = a | b;
      2'b10: y = a + b;
      2'b11: y = a - b;
      default: y = 8'b00000000;
    endcase
  end
  
endmodule
