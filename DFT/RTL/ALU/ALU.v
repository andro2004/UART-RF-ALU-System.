`timescale 1ns / 1ps
module ALU#(parameter DATA_WIDTH = 8)(
    input [DATA_WIDTH-1:0] A,B,
    input [3:0] ALU_FUN,
    input CLK,EN,
    output reg [(2*DATA_WIDTH)-1:0] ALU_OUT,
    output reg Shift_flag,CMP_flag,Logic_flag,Arith_flag,Carry_Flag,ALU_OUT_Valid
    );
    
    

    always @(posedge CLK)begin 
        ALU_OUT_Valid<=1'b0;
        if(EN)begin
            case(ALU_FUN)
                4'b0000:begin//add
                    {Carry_Flag,ALU_OUT}<=  A+B;
                    Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b0;Arith_flag<= 1'b1;ALU_OUT_Valid<=1'b1;
                end
                4'b0001:begin//sub
                    {Carry_Flag,ALU_OUT}<=  A-B;
                    Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b0;Arith_flag<= 1'b1;ALU_OUT_Valid<=1'b1;
                end
                4'b0010:begin//mull
                    ALU_OUT<= A*B;
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b0;Arith_flag<= 1'b1;ALU_OUT_Valid<=1'b1;
                end
                4'b0011:begin//div
                    ALU_OUT<= A/B;
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b0;Arith_flag<= 1'b1;ALU_OUT_Valid<=1'b1;
                end
                4'b0100:begin//AND
                    ALU_OUT<= A&B;
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b1;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b0101:begin//OR
                    ALU_OUT<= A|B;
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b1;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b0110:begin//NAND
                    ALU_OUT<= ~(A&B);
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b1;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b0111:begin//NOR
                    ALU_OUT<= ~(A|B);
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b1;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b1000:begin//XOR
                    ALU_OUT<= A^B;
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b1;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b1001:begin//XNOR
                    ALU_OUT<= ~(A^B);
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b1;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b1010:begin//Equal
                    ALU_OUT<= (A==B)? 16'b1:16'b0;
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b1;Logic_flag<= 1'b0;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b1011:begin//Greater than
                    ALU_OUT<= (A>B)? 16'b10:16'b0;
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b1;Logic_flag<= 1'b0;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b1100:begin//smaller than
                    ALU_OUT<= (A<B)? 16'b11:16'b0;
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b1;Logic_flag<= 1'b0;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b1101:begin//right shift
                    ALU_OUT<= (A>>1);
                    Carry_Flag<=1'b0;Shift_flag <= 1'b1;CMP_flag<= 1'b0;Logic_flag<= 1'b0;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                4'b1110:begin//left shift
                    ALU_OUT<= (A<<1);
                    Carry_Flag<=1'b0;Shift_flag <= 1'b1;CMP_flag<= 1'b0;Logic_flag<= 1'b0;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
                default:begin
                    ALU_OUT<= 16'b0;
                    Carry_Flag<=1'b0;Shift_flag <= 1'b0;CMP_flag<= 1'b0;Logic_flag<= 1'b0;Arith_flag<= 1'b0;ALU_OUT_Valid<=1'b1;
                end
            endcase
        end
        
    end
endmodule
