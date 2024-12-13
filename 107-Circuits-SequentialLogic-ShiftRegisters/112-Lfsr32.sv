/*

Taken from 2015 midterm question 5. See also the first part of this question:
mt2015_muxdff

Write the Verilog code for this sequential circuit (Submodules are ok, but the
top-level must be named top_module). Assume that you are going to implement the
circuit on the DE1-SoC board. Connect the R inputs to the SW switches, connect
Clock to KEY[0], and L to KEY[1]. Connect the Q outputs to the red lights LEDR.

*/



module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
);

endmodule
