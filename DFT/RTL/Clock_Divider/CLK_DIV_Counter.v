`timescale 1ns / 1ps



module CLK_DIV_Counter#(parameter WIDTH=8)(
    input clk,rst_n,
    input [WIDTH-1:0] rst_value,
    output reg [WIDTH-1:0] count
    );
    
    always @(posedge clk or negedge rst_n)begin 
        if(!rst_n)
            count <= 'b1;
        else begin
            if(count == rst_value || count > rst_value)
               count <= 'b1;
            else 
               count <= count +'b1;
        end

            
    end
endmodule

