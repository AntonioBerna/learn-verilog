// Reference: https://hdlbits.01xz.net/wiki/Mt2015_q4

module top_module(
    input x,
    input y,
    output z
);
    wire o1, o2, o3, o4;

    A a1 ( .x(x), .y(y), .z(o1) );
    B b1 ( .x(x), .y(y), .z(o2) );
    A a2 ( .x(x), .y(y), .z(o3) );
    B b2 ( .x(x), .y(y), .z(o4) );

    assign z = (o1 | o2) ^ (o3 & o4);

endmodule

module A(
	input x,
	input y,
	output z
);

	assign z = (x ^ y) & x;
	
endmodule

module B(
	input x,
	input y,
	output z
);

	assign z = ~(x ^ y);

endmodule