// A JK flip-flop has the below truth table.
// Implement a JK flip-flop with only a D-type flip-flop and gates.
// Note: Q_old is the output of the D flip-flop before the positive clock edge.
// | J | K | Q     |
// |---|---|-------|
// | 0 | 0 | Q_old |
// | 0 | 1 | 0     |
// | 1 | 0 | 1     |
// | 1 | 1 | ~Q_old|

module top_module(
    input clk,
    input j,
    input k,
    output Q
);

    reg d;
    always @(*) begin
        case ({j, k})
            2'b00: d <= Q;
            2'b01: d <= 0;
            2'b10: d <= 1;
            2'b11: d <= ~Q;
        endcase
    end

    always @(posedge clk) begin
        Q <= d;
    end

endmodule