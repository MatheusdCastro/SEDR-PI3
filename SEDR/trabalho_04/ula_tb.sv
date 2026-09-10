module tb_ALU_8bit();
  logic [7:0] a, b;
  logic [1:0] sel;
  logic [7:0] y;
  
  ALU_8bit dut(
    .a(a), .b(b), .sel(sel), .y(y)
  );
  
  integer i;
  logic [7:0] expected;
  
  initial begin
    $display("====================================================");
    $display("	 A		 B	SEL	|	Y	Y_Expected");
    
    a = 220;
    b = 30;
    
    for (i = 0; i < 4; i = i + 1) begin
      sel = i[1:0];
      case(sel)
     	2'b00: expected = a & b;
        2'b01: expected = a | b;
      	2'b10: expected = a + b;
      	2'b11: expected = a - b;
      endcase

      #10;
      $display(" %b\t%b\t%b\t|\t%b\t%b", a, b, sel, y, expected);
      
      if(y == expected) begin
        $display("Correct!\n");
      end else begin
        $display("Incorrect!\n");
      end
      
      a = a - 30;
      b = b + 20;
    end

    $display("====================================================");
    $finish;
  end
endmodule
      
