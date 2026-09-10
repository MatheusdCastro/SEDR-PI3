module tb_passwd_verifier();

  logic [3:0] passwd;
  logic access;
  logic error;

  passwd_verifier dut(
    .passwd(passwd),
    .access(access), .error(error)
  );

  integer i;
  logic [3:0] test_vectors [0:4];

  initial begin
    test_vectors[0] = 4'b1010;
    test_vectors[1] = 4'b1111;
    test_vectors[2] = 4'b0000;
    test_vectors[3] = 4'b1000;
    test_vectors[4] = 4'b1011;

    $display("============================");
    $display(" PASSWD\t|\tACCESS\tERROR");
    $display("============================");

    for(i = 0; i < 5; i++) begin
      passwd = test_vectors[i];
      
      #10;
      $display(" %b\t|	%b\t%b", passwd, access, error);
    end

    $display("============================");
    $finish;
  end
endmodule
