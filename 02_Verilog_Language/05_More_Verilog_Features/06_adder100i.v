// Create a 100-bit binary ripple-carry adder by instantiating 100 full adders.
// The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out.
// To encourage you to actually instantiate full adders, also output the carry-out from each full
// adder in the ripple-carry adder. cout[99] is the final carry-out from the last full adder,
// and is the carry-out you usually see.

module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);

    wire [100:0] c;
    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : gen_add
            add1 fa (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(c[i+1])
            );
            assign cout[i] = c[i+1];
        end
    endgenerate

endmodule

module add1(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
