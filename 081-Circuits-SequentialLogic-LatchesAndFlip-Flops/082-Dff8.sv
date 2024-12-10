module top_module (
    input clk,
    input logic [7:0] d,
    output logic [7:0] q
);

    always_ff @(posedge clk) begin

        q <= d;

    end

endmodule