// Write the Verilog code for this sequential circuit
// (Submodules are ok, but the top-level must be named top_module).
// Assume that you are going to implement the circuit on the DE1-SoC board.
// Connect the R inputs to the SW switches, connect Clock to KEY[0], and L to KEY[1].
// Connect the Q outputs to the red lights LEDR.

module top_module (
	input [2:0] SW,   // R
	input [1:0] KEY,  // L and clk
	output [2:0] LEDR // Q
);

    reg [2:0] q;
    always @(posedge KEY[0]) begin
        if (KEY[1]) begin
            q <= SW;
        end else begin
            q <= {q[1] ^ q[2], q[0], q[2]};
        end
    end

    assign LEDR = q;

endmodule
