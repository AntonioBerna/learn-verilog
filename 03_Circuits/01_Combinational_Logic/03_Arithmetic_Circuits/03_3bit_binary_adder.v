// Make 3 instances of full adder to create a 3-bit binary ripple-carry adder.
// The adder adds two 3-bit numbers and a carry-in to produce a 3-bit sum and carry out.
// To encourage you to actually instantiate full adders, also output the carry-out from each
// full adder in the ripple-carry adder. cout[2] is the final carry-out from the last full adder,
// and is the carry-out you usually see.

module top_module(
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum
);

    genvar i;
    generate
        for (i = 0; i < 3; i++) begin : gen_add
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(i == 0 ? cin : cout[i-1]),
                .sum(sum[i]),
                .cout(cout[i])
            );
        end
    endgenerate

endmodule

module full_adder(
    input a, b, cin,
    output cout, sum
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule