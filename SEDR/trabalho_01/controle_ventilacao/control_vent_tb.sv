module tb_control_vent();
  logic [7:0] temp;
  logic ocupado;
  logic [1:0] vel;
  
  control_vent dut(
    .temp(temp),
    .ocupado(ocupado),
    .vel(vel)
  );
  
  initial begin
    $display("=========================================");
    $display("Occupied	 Temperature	|  Velocity");
    $display("=========================================");

    ocupado = 1'b0;
    temp = 15;
    #10;
    $display("	%b			%d			|	%b	", ocupado, temp, vel);
    
    ocupado = 1'b1;
    temp = 15;
    #10;
    $display("	%b			%d			|	%b	", ocupado, temp, vel);
    
    ocupado = 1'b1;
    temp = 28;
    #10;
    $display("	%b			%d			|	%b	", ocupado, temp, vel);
    
    ocupado = 1'b1;
    temp = 36;
    #10;
    $display("	%b			%d			|	%b	", ocupado, temp, vel);
    
    ocupado = 1'b1;
    temp = 43;
    #10;
    $display("	%b			%d			|	%b	", ocupado, temp, vel);
    
    $display("=========================================");
    $finish;
  end
endmodule