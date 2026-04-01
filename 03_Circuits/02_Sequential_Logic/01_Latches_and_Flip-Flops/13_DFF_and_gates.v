// Given the finite state machine circuit as shown, assume that the D flip-flops are initially
// reset to zero before the machine begins.
// Build this circuit.
//     +--------------------------------+
//     |    +-----+                     |
//     +--- |     |       +-------+     |
//          | XOR | ----- | D     |     |
// x --+--- |     |       |     Q | ----+-----------------+
//     |    +-----+       | >     |                       |
//     |                  +-------+                       |     +-----+
//     |         +-----+                                  +---- |     |
//     +-------- |     |       +------------+                   |     |
//     |         | AND | ----- | D        Q | ----------------- | NOR | ---- z
//     |    +--- |     |       |            |                   |     |
//     |    |    +-----+       | >       ~Q | ----+       +---- |     |
//     |    |                  +------------+     |       |     +-----+
//     |    +-------------------------------------+       |
//     |                                                  |
//     |    +----+                                        |
//     +--- |    |       +-------------+                  |
//          | OR | ----- | D         Q | -----------------+
//     +--- |    |       |             |
//     |    +----+       | >        ~Q | ----+
//     |                 +-------------+     |
//     +-------------------------------------+

module top_module(
    input clk,
    input x,
    output z
);

    reg q1 = 1'b0;
    reg q2 = 1'b0;
    reg q3 = 1'b0;

    always @(posedge clk) begin
        q1 <= x ^ q1;
        q2 <= x & ~q2;
        q3 <= x | ~q3;
    end

    assign z = ~(q1 | q2 | q3);

endmodule

