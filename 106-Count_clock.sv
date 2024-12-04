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

    logic [5:0] pulse;

    logic [3:0] s_l, s_h, m_l, m_h, h_l, h_h;

    bcd_counter second_low  (clk, reset, pulse[0], s_l);
    bcd_counter second_high (clk, reset, pulse[1], s_h);
    bcd_counter minute_low  (clk, reset, pulse[2], m_l);
    bcd_counter minute_high (clk, reset, pulse[3], m_h);
    bcd_counter hour_low    (clk, reset, pulse[4], h_l);
    bcd_counter hour_high   (clk, reset, pulse[5], h_h);

    // this seems messy... scrap it and maybe make a
    // sixty counter and twelve counter and do
    // twelve, sixty, sixty

    always_ff @(posedge clk) begin

        pos_clock <= pos_clock + 1;

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
