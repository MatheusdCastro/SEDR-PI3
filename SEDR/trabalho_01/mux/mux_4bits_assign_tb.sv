module tb_mux_4bits();
  logic [3:0] a,b,c,d;
  logic [1:0] sel;
  logic [3:0] y;
  
  mux_4bits dut(
    .a(a), .b(b), .c(c), .d(d),
    .sel(sel),
    .y(y)
  );
  
  initial begin
    $display("==============================================");
    $display(" A		 B		 C		 D		SEL	|	 Y");
    $display("==============================================");
    
    a=4'b0011;
    b=4'b1100;
    c=4'b0001;
    d=4'b0010;
    
    sel=2'b00;
    #10;
    $display("%b	%b	%b	%b	%b	| 	%b",a ,b, c, d, sel, y);
    
    a=4'b0011;
    b=4'b1100;
    c=4'b0001;
    d=4'b0010;
    
    sel=2'b01;
    #10;
    $display("%b	%b	%b	%b	%b	| 	%b",a ,b, c, d, sel, y);
    
    a=4'b0011;
    b=4'b1100;
    c=4'b0001;
    d=4'b0010;
    
    sel=2'b10;
    #10;
    $display("%b	%b	%b	%b	%b	| 	%b",a ,b, c, d, sel, y);
    
    a=4'b0011;
    b=4'b1100;
    c=4'b0001;
    d=4'b0010;
    
    sel=2'b11;
    #10;
    $display("%b	%b	%b	%b	%b	| 	%b",a ,b, c, d, sel, y);
    
    $display("==============================================");
    $finish;
  end
endmodule