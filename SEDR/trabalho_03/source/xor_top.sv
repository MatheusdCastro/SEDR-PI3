module xor_top (
	input logic a,b,
	output logic y
);
	logic inv_out1, inv_out2;
	inv_gate U1 (.a(b), .y(inv_out1)
);
	inv_gate U2 (.a(a), .y(inv_out2)
);

	logic and_out1, and_out2;
	and_gate U3 (.a(a), .b(inv_out1), .y(and_out1)
);
	and_gate U4 (.a(inv_out2), .b(b), .y(and_out2)
);

	or_gate U5 (.a(and_out1), .b(and_out2), .y(y)
);

endmodule
