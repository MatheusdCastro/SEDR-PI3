module passwd_verifier (
  input logic [3:0] passwd,
  output logic access, error
);
  
  logic [3:0] bits_correct;
  logic [3:0] passwd_correct = 4'b1010;
  integer i;
  
  always_comb begin
    for(i = 0; i < 4; i++) begin
      if (passwd[i] == passwd_correct[i]) begin
        bits_correct[i] = 1;
      end else begin
        bits_correct[i] = 0;
      end
    end
  end
  
  always_comb begin
    if (bits_correct == 4'b1111) begin
      access = 1'b1;
      error = 1'b0;
    end else begin
      access = 1'b0;
      error = 1'b1;
    end
  end
 
endmodule
