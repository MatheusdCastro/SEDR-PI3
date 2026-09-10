module mux_4bits(
  input logic [3:0] a,b,c,d,
  input logic [1:0] sel,
  output logic [3:0] y
);
  
  assign y = (sel == 2'b00) ? a :
    		 (sel == 2'b01) ? b :
    		 (sel == 2'b10) ? c :
    						  d;
   
endmodule