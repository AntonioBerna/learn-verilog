// Write a top-level Verilog module (named top_module) for the shift register,
// assuming that n = 4. Instantiate four copies of your MUXDFF subcircuit in your top-level module.
// Assume that you are going to implement the circuit on the DE2 board.
// - Connect the R inputs to the SW switches,
// - clk to KEY[0],
// - E to KEY[1],
// - L to KEY[2], and
// - w to KEY[3].
// - Connect the outputs to the red lights LEDR[3:0].

module top_module(
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : gen_muxdff
            MUXDFF m (
                .clk(KEY[0]),
                .E(KEY[1]),
                .L(KEY[2]),
                .w( (i == 3) ? KEY[3] : LEDR[i+1] ),
                .R(SW[i]),
                .Q(LEDR[i])
            );
        end
    endgenerate

endmodule

module MUXDFF (
    input clk,
    input E,
    input L,
    input w,
    input R,
    output reg Q
);
    always @(posedge clk) begin
        Q <= L ? R : (E ? w : Q);
    end
endmodule
