module mux_4bits(
  input logic [3:0] a,b,c,d,
  input logic [1:0] sel,
  output logic [3:0] y
);
  
  always_comb begin
    if (sel==2'b00) begin
      y = a;
    end else if (sel==2'b01) begin
      y = b;
    end else if (sel==2'b10) begin
      y = c;
    end else begin
      y = d;
    end
  end
   
endmodule