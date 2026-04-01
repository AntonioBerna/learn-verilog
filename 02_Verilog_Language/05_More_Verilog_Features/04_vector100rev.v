// Given a 100-bit input vector [99:0], reverse its bit ordering.

module top_module( 
    input [99:0] in,
    output [99:0] out
);

    always @(*) begin
        for (int i = 0; i < $bits(in); i++) begin
            out[i] = in[$bits(in) - i - 1];
        end
    end

endmodule
