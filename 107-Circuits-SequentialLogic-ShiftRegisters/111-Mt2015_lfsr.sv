/*

Taken from 2015 midterm question 5. See also the first part of this question:
mt2015_muxdff

Write the Verilog code for this sequential circuit (Submodules are ok, but the
top-level must be named top_module). Assume that you are going to implement the
circuit on the DE1-SoC board. Connect the R inputs to the SW switches, connect
Clock to KEY[0], and L to KEY[1]. Connect the Q outputs to the red lights LEDR.

The first part of this question is here in this repo:
------------------------------------------------------------------------------
	091-Mt2015_muxdff.sv :
------------------------------------------------------------------------------

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

	always_ff @(posedge clk) begin
        if (L) begin
            // r_in is latched when L is 1
            Q = r_in; // 0
        end else begin
            // q_in is latched when L is 0

            Q = q_in;
        end
    end

endmodule


*/

module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q


endmodule
