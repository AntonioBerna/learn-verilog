// A "population count" circuit counts the number of '1's in an input vector.
// Build a population count circuit for a 3-bit input vector.

module top_module( 
    input  [2:0] in,
    output [1:0] out
);

    always @(*) begin
        out = 0;
        for (int i = 0; i < 3; i++) begin
            out = out + in[i];
        end
    end

endmodule
