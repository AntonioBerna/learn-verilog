// Consider the n-bit shift register circuit shown below:
// Reference: https://hdlbits.01xz.net/wiki/Exams/2014_q4a
// Write a Verilog module named top_module for one stage of this circuit,
// including both the flip-flop and multiplexers.

module top_module(
    input clk,
    input w, R, E, L,
    output reg Q
);

    always @(posedge clk) begin
        Q <= L ? R : (E ? w : Q);
    end

endmodule