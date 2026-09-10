module tb_xor;
    logic a, b;
    logic y;

    xor_top dut (.a(a), .b(b), .y(y) );

    initial begin
        $display("Tempo | a b | y (XOR)");
        $display("----------------------");
        a=0; b=0;
        #5; 
	$display("%4t  | %0d %0d | %0d", $time, a, b, y);
        a=0; b=1;
        #5; 
	$display("%4t  | %0d %0d | %0d", $time, a, b, y);
        a=1; b=0;
        #5; 
	$display("%4t  | %0d %0d | %0d", $time, a, b, y);
        a=1; b=1;
        #5; 
	$display("%4t  | %0d %0d | %0d", $time, a, b, y);
        #5; 
	$finish;
    end
endmodule

