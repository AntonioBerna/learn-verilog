// Build a decade counter that counts from 0 through 9, inclusive, with a period of 10.
// The reset input is synchronous, and should reset the counter to 0.
// We want to be able to pause the counter rather than always incrementing every clock cycle,
// so the slowena input indicates when the counter should increment.

module top_module(
    input clk,
    input slowena,
    input reset,
    output [3:0] q
);

    reg [3:0] q_reg = 4'b0;
    always @(posedge clk) begin
        if (reset) begin
            q_reg <= 4'b0;
        end else if (slowena) begin
            if (q_reg == 4'b1001) begin
                q_reg <= 4'b0;
            end else begin
                q_reg <= q_reg + 1;
            end
        end
    end

    assign q = q_reg;

endmodule
