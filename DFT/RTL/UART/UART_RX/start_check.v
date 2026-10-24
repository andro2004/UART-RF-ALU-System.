`timescale 1ns / 1ps

module start_check(
    input start_chk_en,
    input sampled_bit,
    output start_glitch
    );
    
    assign start_glitch = (start_chk_en)? (sampled_bit != 1'b0):0;
endmodule
