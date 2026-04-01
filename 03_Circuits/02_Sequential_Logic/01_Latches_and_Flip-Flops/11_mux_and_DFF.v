// Consider the sequential circuit below:
//   +------------------------------------------------------------------------------------+----------------------------------------------------------+
//   |     +--------+                                                                     |                                                          |
//   +---- | 0      |           +---------+                                               |                                                          |
//         |    MUX | --------- | D       |          +--------+                           |    +-----+                                               |
// r_0 --- | 1      |           |     Q_0 | -------- | 0      |           +---------+     +--- |     |           +--------+                          |
//         +--------+   Clk --- | >       |          |   MUX  | --------- | D       |          | XOR | --------- | 0      |           +---------+    |
//              |               +---------+  r_1 --- | 1      |           |     Q_1 | -------- |     |           |    MUX | --------- | D       |    |
//              L                                    +--------+   Clk --- | >       |          +-----+   r_2 --- | 1      |           |     Q_2 | ---+
//                                                        |               +---------+                            +--------+   Clk --- | >       |
//                                                        L                                                           |               +---------+
//                                                                                                                    L
// Assume that you want to implement hierarchical Verilog code for this circuit, using three
// instantiations of a submodule that has a flip-flop and multiplexer in it.
// Write a Verilog module (containing one flip-flop and multiplexer) named top_module for this submodule.

module top_module(
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q
);

    always @(posedge clk) begin
        Q <= L ? r_in : q_in;
    end

endmodule

