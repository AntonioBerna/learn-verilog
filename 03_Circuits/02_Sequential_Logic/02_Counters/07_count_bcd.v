// Build a 4-digit BCD (binary-coded decimal) counter.
// Each decimal digit is encoded using 4 bits: q[3:0] is the ones digit, q[7:4] is the tens digit, etc.
// For digits [3:1], also output an enable signal indicating when each of the upper three digits
// should be incremented.
// You may want to instantiate or modify some one-digit decade counters:
// ```verilog
// module top_module(
//     input clk,
//     input reset,
//     output [3:0] q
// );

//     reg [3:0] q_reg = 4'b0;
//     always @(posedge clk) begin
//         if (reset) begin
//             q_reg <= 4'b0;
//         end else if (q_reg == 4'b1001) begin
//             q_reg <= 4'b0;
//         end else begin
//             q_reg <= q_reg + 1;
//         end
//     end

//     assign q = q_reg;

// endmodule
// ```

module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q
);

    assign ena[1] = (q[3:0] == 4'b1001);
    assign ena[2] = (q[7:4] == 4'b1001) && ena[1];
    assign ena[3] = (q[11:8] == 4'b1001) && ena[2];

    decade_counter d0 (clk, reset, 1'b1,   q[3:0]);
    decade_counter d1 (clk, reset, ena[1], q[7:4]);
    decade_counter d2 (clk, reset, ena[2], q[11:8]);
    decade_counter d3 (clk, reset, ena[3], q[15:12]);

endmodule

module decade_counter (
    input clk,
    input reset,
    input ena,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0;
        else if (ena)
            q <= (q == 4'b1001) ? 4'b0 : q + 1;
    end
endmodule
