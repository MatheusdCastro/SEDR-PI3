module control_vent(
  input logic [7:0] temp,
  input logic ocupado,
  output logic [1:0] vel
);
  
  always_comb begin
    if (!ocupado) begin
      vel = 2'b00;
    end else begin
      if (temp < 20) begin
        vel = 2'b00;
      end else if (temp >= 20 && temp < 30) begin
        vel = 2'b01;
      end else if (temp >= 30 && temp < 40) begin
        vel = 2'b10;
      end else begin
        vel = 2'b11;
      end
    end
  end
  
endmodule