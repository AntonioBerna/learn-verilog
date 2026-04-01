// Reference: https://hdlbits.01xz.net/wiki/7420

// The 7400-series integrated circuits are a series of digital chips with a few gates each.
// The 7420 is a chip with two 4-input NAND gates.
// Create a module with the same functionality as the 7420 chip. It has 8 inputs and 2 outputs.

module top_module(
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);
    wire left_and, right_and;
    
    assign left_and  = p1a & p1b & p1c & p1d;
    assign right_and = p2d & p2c & p2b & p2a;

    assign p1y = ~left_and;
    assign p2y = ~right_and;

endmodule
