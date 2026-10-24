`timescale 1ns / 1ps

module parity_check#(parameter DATA_WIDTH = 8)(
    input par_chk_en, PAR_TYP, sampled_bit,
    input [DATA_WIDTH-1:0] P_DATA,
    input CLK, RST,
    output reg par_err
    );

    wire exp_bit = PAR_TYP ? ~^P_DATA : ^P_DATA;

    always @(posedge CLK or negedge RST) begin
        if(!RST)
            par_err <= 1'b0;
        else if(par_chk_en)
            par_err <= (sampled_bit != exp_bit);
    end
endmodule
