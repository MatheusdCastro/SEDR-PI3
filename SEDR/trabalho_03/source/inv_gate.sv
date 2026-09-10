// inv_gate.sv
module inv_gate (
    input  logic a,
    output logic y
);
    assign y = ~a;
endmodule

