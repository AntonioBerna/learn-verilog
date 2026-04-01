// Implement the following circuit:
//              x[3]   y[3]    x[2]   y[2]    x[1]   y[1]    x[0]   y[0]
//               |      |       |      |       |      |       |      |
//               +------+       +------+       +------+       +------+
// sum[4] ------ |  FA  | ----- |  FA  | ----- |  FA  | ----- |  FA  |
//               +------+       +------+       +------+       +------+
//                   |              |              |              |
//                 sum[3]         sum[2]         sum[1]         sum[0]

module top_module(
    input  [3:0] x,
    input  [3:0] y,
    output [4:0] sum
);

    assign sum = x + y;

endmodule