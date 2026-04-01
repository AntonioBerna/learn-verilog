// Create a combinational circuit that implements the above truth table.
// Row	      Inputs    Outputs
// number	x3	x2	x1	   f
//   0	    0	0	0	   0
//   1	    0	0	1	   0
//   2	    0	1	0	   1
//   3	    0	1	1	   1
//   4	    1	0	0	   0
//   5	    1	0	1	   1
//   6	    1	1	0	   0
//   7	    1	1	1	   1

module top_module( 
    input x3,
    input x2,
    input x1,
    output f
);
    
    // SOP (Sum of Products) form:
    // f(x3, x2, x1) = (~x3 & x2 & ~x1) | (~x3 & x2 & x1) | (x3 & ~x2 & x1) | (x3 & x2 & x1)
    assign f = (~x3 & x2 & ~x1) | (~x3 & x2 & x1) | (x3 & ~x2 & x1) | (x3 & x2 & x1);
    
    // POS (Product of Sums) form:
    // f(x3, x2, x1) = (x3 + x2 + x1)(x3 + x2 + ~x1)(~x3 + ~x2 + x1)(~x3 + x2 + x1)
    // assign f = (x3 | x2 | x1) & (x3 | x2 | ~x1) & (~x3 | ~x2 | x1) & (~x3 | x2 | x1);


endmodule
