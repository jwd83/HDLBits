/*

Design a 1-12 counter with the following inputs and outputs:

* Reset Synchronous active-high reset that forces the counter to 1
* Enable Set high for the counter to run
* Clk Positive edge-triggered clock input
* Q[3:0] The output of the counter
* c_enable, c_load, c_d[3:0] Control signals going to the provided 4-bit
  counter, so correct operation can be verified.

You have the following components available:

* the 4-bit binary counter (count4) below, which has Enable and synchronous
  parallel-load inputs (load has higher priority than enable). The count4 module
  is provided to you. Instantiate it in your circuit.

* logic gates

module count4(
	input clk,
	input enable,
	input load,
	input [3:0] d,
	output reg [3:0] Q
);

The c_enable, c_load, and c_d outputs are the signals that go to the internal
counter's enable, load, and d inputs, respectively. Their purpose is to allow
these signals to be checked for correctness.

---------------

results

# Hint: Output 'Q' has no mismatches.
# Hint: Output 'c_enable' has no mismatches.
# Hint: Output 'c_load' has 215 mismatches. First mismatch occurred at time 20.
# Hint: Output 'c_d' has 28 mismatches. First mismatch occurred at time 5.
# Hint: Total mismatched samples is 239 out of 445 samples

*/
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );

    always_comb begin
        c_enable = enable;
        c_load = c_enable;
        c_d = Q;

    end

    always_ff @(posedge clk ) begin
        if (reset)
            Q <= 1;
        else
            if (enable)
                if (Q == 12)
                    Q <= 1;
                else
                    Q <= Q + 1;

    end

endmodule
