// Conway's Game of Life is a two-dimensional cellular automaton.
// The "game" is played on a two-dimensional grid of cells, where each cell is
// either 1 (alive) or 0 (dead). At each time step, each cell changes state depending
// on how many neighbours it has:
// - 0-1 neighbour: Cell becomes 0.
// - 2 neighbours: Cell state does not change.
// - 3 neighbours: Cell becomes 1.
// - 4+ neighbours: Cell becomes 0.
// The game is formulated for an infinite grid.
// In this circuit, we will use a 16x16 grid.
// To make things more interesting, we will use a 16x16 toroid, where the sides wrap around
// to the other side of the grid.
// For example, the corner cell (0,0) has 8 neighbours:
// (15,1), (15,0), (15,15), (0,1), (0,15), (1,1), (1,0), and (1,15).
// The 16x16 grid is represented by a length 256 vector, where each row
// of 16 cells is represented by a sub-vector: q[15:0] is row 0, q[31:16] is row 1, etc.
// - load: Loads data into q at the next clock edge, for loading initial state.
// - q: The 16x16 current state of the game, updated every clock cycle.
// The game state should advance by one timestep every clock cycle.
// A test case that's easily understandable and tests some boundary conditions is the blinker 256'h7.
// It is 3 cells in row 0 columns 0-2.
// It oscillates between a row of 3 cells and a column of 3 cells (in column 1, rows 15, 0, and 1).
// 
// John Conway, mathematician and creator of the Game of Life cellular automaton,
// passed away from COVID-19 on April 11, 2020.
// 
// Bibliography:
// - https://en.wikipedia.org/wiki/Conway's_Game_of_Life

module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

    reg [255:0] q_next;
    reg [3:0] sum;
    integer i, r, c;
    integer r_up, r_down, c_left, c_right;

    always @(*) begin
        for (i = 0; i < 256; i = i + 1) begin
            r = i / 16;
            c = i % 16;
            
            r_up = (r == 15) ? 0 : r + 1;
            r_down = (r == 0) ? 15 : r - 1;
            c_left = (c == 0) ? 15 : c - 1;
            c_right = (c == 15) ? 0 : c + 1;
            
            sum = q[r_up * 16 + c_left] + q[r_up * 16 + c] + q[r_up * 16 + c_right] +
                  q[r    * 16 + c_left] +                    q[r    * 16 + c_right] +
                  q[r_down * 16 + c_left] + q[r_down * 16 + c] + q[r_down * 16 + c_right];
                  
            if (sum == 3)
                q_next[i] = 1'b1;
            else if (sum == 2)
                q_next[i] = q[i];
            else
                q_next[i] = 1'b0;
        end
    end

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            q <= q_next;
    end

endmodule
