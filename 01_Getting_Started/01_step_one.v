// This module drives a constant logic high (1) on the output.
// No inputs are required for this circuit.

module top_module(output one);
  assign one = 1'b1; // '1'b1' represents a single-bit logic high
endmodule