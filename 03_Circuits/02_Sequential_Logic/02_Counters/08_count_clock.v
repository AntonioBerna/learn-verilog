// Create a set of counters suitable for use as a 12-hour clock (with am/pm indicator).
// Your counters are clocked by a fast-running clk, with a pulse on ena whenever your
// clock should increment (i.e., once per second).
// reset resets the clock to 12:00 AM. pm is 0 for AM and 1 for PM.
// hh, mm, and ss are two BCD (Binary-Coded Decimal) digits each for hours (01-12),
// minutes (00-59), and seconds (00-59). Reset has higher priority than enable,
// and can occur even when not enabled.
// Note that 11:59:59 PM advances to 12:00:00 AM, and 12:59:59 PM advances to 01:00:00 PM.
// There is no 00:00:00.

module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    always @(posedge clk) begin
        if (reset) begin
            ss <= 8'h00;
            mm <= 8'h00;
            hh <= 8'h12;
            pm <= 1'b0;
        end else if (ena) begin
            // Seconds
            if (ss == 8'h59) begin
                ss <= 8'h00;
                // Minutes
                if (mm == 8'h59) begin
                    mm <= 8'h00;
                    // Hours & PM
                    if (hh == 8'h12) begin
                        hh <= 8'h01;
                    end else if (hh == 8'h11) begin
                        hh <= 8'h12;
                        pm <= ~pm;
                    end else if (hh == 8'h09) begin
                        hh <= 8'h10;
                    end else begin
                        hh[3:0] <= hh[3:0] + 1;
                    end
                end else if (mm[3:0] == 4'h9) begin
                    mm[7:4] <= mm[7:4] + 1;
                    mm[3:0] <= 4'h0;
                end else begin
                    mm[3:0] <= mm[3:0] + 1;
                end
            end else if (ss[3:0] == 4'h9) begin
                ss[7:4] <= ss[7:4] + 1;
                ss[3:0] <= 4'h0;
            end else begin
                ss[3:0] <= ss[3:0] + 1;
            end
        end
    end

endmodule
