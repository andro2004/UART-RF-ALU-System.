`timescale 1ns / 1ps


module TX_Counter#(parameter DATA_WIDTH = 8)(
    input CLK,RST,
    output reg [$clog2(DATA_WIDTH)-1:0] count
    );
    
    always @(posedge CLK or negedge RST)begin
        if(!RST)
            count <='b0;
        else
            count <= count+1;
    end
endmodule
