// nand_top.sv
module nand_top (
    input  logic a,
    input  logic b,
    output logic y
);
    logic and_out;
    // instância do AND
    and_gate U1 ( .a(a), .b(b), .y(and_out)
    );

    // instância do INV
    inv_gate U2 ( .a(and_out), .y(y)
    );
endmodule

