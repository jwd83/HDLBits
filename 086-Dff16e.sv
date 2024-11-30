module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);

    always_ff @(posedge clk) begin
        if (~resetn) begin
            // if reset asserted clear q
            q <= 16'd0; // 16 bit representation of decimal 0
        end else begin
            // otherwise store d in q
            if (byteena[0]) begin
                q[7:0] <= d[7:0];
            end

            if (byteena[1]) begin
                q[15:8] <= d[15:8];
            end

        end
    end
endmodule