// top_module: connects 3 inputs to 4 outputs like wires
// Connections:
//   a -> w
//   b -> x, y
//   c -> z

module top_module(
  input  a, b, c,
  output w, x, y, z
);
  assign w = a;  // pass input 'a' to output 'w'
  assign x = b;  // pass input 'b' to output 'x'
  assign y = b;  // pass input 'b' to output 'y'
  assign z = c;  // pass input 'c' to output 'z'
endmodule