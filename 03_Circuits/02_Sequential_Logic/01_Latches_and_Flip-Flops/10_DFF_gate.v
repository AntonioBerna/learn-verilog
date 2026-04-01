// Implement the following circuit:
//    +-----------------------------------------+
//    |    +-----+                              |
//    +--- |     |               +---------+    |
//         | XOR | ----- D ----- |         |    |
// In ---- |     |               |   D FF  | ---+---- Q
//         +-----+      Clk ---- | >       |
//                               +---------+

module top_module(
    input clk,
    input in,
    output out
);

    reg d;
    always @(*) begin
        d <= in ^ out;
    end

    always @(posedge clk) begin
        out <= d;
    end

endmodule