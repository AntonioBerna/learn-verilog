// Build a 4-bit binary counter that counts from 0 through 15, inclusive, with a period of 16.
// The reset input is synchronous, and should reset the counter to 0.

module top_module(
    input clk,
    input reset,
    output [3:0] q
);

    reg [3:0] q_reg = 4'b0;
    always @(posedge clk) begin
        if (reset) begin
            q_reg <= 4'b0;
        end else begin
            q_reg <= q_reg + 1;
        end
    end

    assign q = q_reg;

endmodule