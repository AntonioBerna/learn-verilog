// Suppose you are designing a circuit to control a cellphone's ringer and vibration motor.
// Whenever the phone needs to ring from an incoming call (input ring),
// your circuit must either turn on the ringer (output ringer = 1) or the motor (output motor = 1),
// but not both. If the phone is in vibrate mode (input vibrate_mode = 1), turn on the motor.
// Otherwise, turn on the ringer.
// Design hint: When designing circuits, one often has to think of the problem "backwards",
// starting from the outputs then working backwards towards the inputs. This is often the opposite
// of how one would think about a (sequential, imperative) programming problem, where one would look
// at the inputs first then decide on an action (or output). For sequential programs, one would often
// think "If (inputs are ___ ) then (output should be ___ )". On the other hand, hardware designers
// often think "The (output should be ___ ) when (inputs are ___ )".

module top_module(
    input ring,
    input vibrate_mode,
    output ringer,
    output motor
);

    assign ringer = ring & ~vibrate_mode;
    assign motor = ring & vibrate_mode;

endmodule