`timescale 1ns / 1ps

module Pulse_Gen(
    input en,clk,rst,
    output en_pulse
    );
    reg en_reg;
    assign en_pulse = ~en_reg & en;
    always@(posedge clk or negedge rst)begin
        if(!rst)
            en_reg<=1'b0;
        else 
            en_reg <= en;
    end
endmodule
