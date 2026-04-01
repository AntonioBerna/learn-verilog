// Reference: https://hdlbits.01xz.net/wiki/Mt2015_q4b

// From the above link we obtain the following truth table:
// | x | y | z |
// |---|---|---|
// | 0 | 0 | 1 |
// | 0 | 1 | 0 |
// | 1 | 0 | 0 |
// | 1 | 1 | 1 |

module top_module(
    input x,
    input y,
    output z
);

    assign z = ~(x ^ y);

endmodule