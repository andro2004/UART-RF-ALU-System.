module CLK_GATE (
    input  CLK_EN,
    input  CLK,
    input  test_mode,
    input  SE,
    output GATED_CLK
);

wire enable = CLK_EN | test_mode | SE;

reg Latch_Out;
always @(CLK or enable) begin
    if (!CLK)
        Latch_Out <= enable;
end

assign GATED_CLK = CLK & Latch_Out;

endmodule
