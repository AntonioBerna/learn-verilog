// In this exercise, create one instance of module mod_a, then connect the module's three
// pins (in1, in2, and out) to your top-level module's three ports (wires a, b, and out).
// The module mod_a is provided for you — you must instantiate it.

module top_module(
    input a,
    input b,
    output out
);
    mod_a instance_name (
        .in1(a),
        .in2(b),
        .out(out)
    );

    // or
    // mod_a instance_name2 ( a, b, out );
endmodule
