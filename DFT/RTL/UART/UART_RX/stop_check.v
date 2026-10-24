`timescale 1ns / 1ps

module stop_check(
    input stp_chk_en,
    input sampled_bit,
    output stp_err
    );
    
    assign stp_err = (stp_chk_en)? (sampled_bit != 1'b1):0;
endmodule
