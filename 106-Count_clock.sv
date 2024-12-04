/*
Create a set of counters suitable for use as a 12-hour clock (with am/pm
indicator). Your counters are clocked by a fast-running clk, with a pulse on ena
whenever your clock should increment (i.e., once per second).

reset resets the clock to 12:00 AM. pm is 0 for AM and 1 for PM. hh, mm, and ss
are two BCD (Binary-Coded Decimal) digits each for hours (01-12), minutes
(00-59), and seconds (00-59). Reset has higher priority than enable, and can
occur even when not enabled.
*/
module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

    logic [2:0] pulse;

    sixty_counter  seconds (clk, reset, pulse[0], ss);
    sixty_counter  minutes (clk, reset, pulse[1], mm);
    twelve_counter hours   (clk, reset, pulse[2], hh);

    // b01011001 is 59 in bcd
    // b00010010 is 12 in bcd
    // b00010001 is 11 in bcd

    always_ff @(posedge clk) begin
        if (reset) begin
            pulse <= 3'b000;
            pm <= 0;
        end else begin
            if (enable) begin
                casez ({hh, mm, ss})
                    // 11:59:59
                    //     1   1   5   9   5   9
                    24'b000100010101100101011001: begin
                        pulse <= 3'b111;
                        pm <= ~pm;
                    end
                    // z:59:59
                    //     z   z   5   9   5   9
                    24'bzzzzzzzz0101100101011001: begin
                        pulse <= 3'b111;
                    end
                    // any:any:59
                    //     z   z   z   z   5   9
                    24'bzzzzzzzzzzzzzzzz01011001: begin
                        pulse <= 3'b011;
                    end
                    default: begin
                        pulse <= 3'b001;
                    end
                endcase
            end
        end
    end

endmodule

module sixty_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    input enable,
    output [7:0] q);

    logic [3:0] lower, upper;

    always_comb begin
        q = {upper, lower};
    end


    always_ff @(posedge clk ) begin
        if (reset) begin
            upper <= 0;
            lower <= 0;
        end else begin
            casez (q)
                // 59 in bcd
                8'b01011001: begin
                    upper <= 0;
                    lower <= 0;
                end
                // z9 in bcd (any other 9)
                8'bzzzz1001: begin
                    upper <= upper + 1;
                    lower <= 0;
                end
                // default
                default: begin
                    lower <= lower + 1;
                end
            endcase
        end
    end
endmodule

module twelve_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    input enable,
    output [7:0] q);


    logic [3:0] lower, upper;

    always_comb begin
        q = {upper, lower};
    end

    always_ff @(posedge clk ) begin
        if (reset) begin
            upper <= 4'b0001;
            lower <= 4'b0010;
        end else begin
            if (enable) begin
                casez (q)
                    // 12 in bcd (0001 0010) loop back to zero
                    8'b00010010: begin
                        upper <= 0;
                        lower <= 0;
                    end
                    // z9 in bcd increment upper and reset lower
                    8'bzzzz1001: begin
                        upper <= upper + 1;
                        lower <= 0;
                    end
                    // default
                    default: begin
                        lower <= lower + 1;
                    end
                endcase
            end
        end
    end
endmodule
