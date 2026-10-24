`timescale 1ns / 1ps
module TX_FSM#(parameter DATA_WIDTH = 8)(
    input DATA_VAILD,PAR_EN,CLK,RST,
    output reg ser_en,busy,
    output reg [1:0] mux_sel
    );
    
    parameter IDLE=3'b000,START=3'b001,TRANSMITING=3'b010,PARITY=3'b011,STOP=3'b111;
    reg [2:0] cur_state,next_state;
    wire [$clog2(DATA_WIDTH)-1:0]count;
    wire count_rst;
    reg ser_done;
    
    assign count_rst = (cur_state == TRANSMITING);
    TX_Counter#(.DATA_WIDTH(DATA_WIDTH))counter(.CLK(CLK),.RST(count_rst),.count(count));
    
    
    always@(posedge CLK,negedge RST)begin
        if(!RST)begin 
            cur_state <=IDLE;
            ser_done <= 0;
        end
        else begin
            cur_state <= next_state;
            ser_done <= (count == 3'b110);
            end
        
        
    end
    
    always@(*)begin
        case(cur_state)
            IDLE:begin
                if(DATA_VAILD == 0)
                    next_state = IDLE;
                else
                    next_state = START;
            end
            START:begin
                next_state = TRANSMITING;
            end
            TRANSMITING:begin
                if(ser_done == 0)
                    next_state = TRANSMITING;
                else
                    if(PAR_EN)
                        next_state = PARITY;
                    else
                        next_state = STOP;
            end
            PARITY:begin
                next_state=STOP;
            end
            STOP:begin
                next_state = IDLE;
            end
            default:next_state=IDLE;
        endcase
    end
    
    //Data_Vaild,PAR_EN,ser_done
    //mux_sel
    always @(*)begin
        ser_en = (cur_state == TRANSMITING);
        busy = (cur_state != IDLE);
        case(cur_state)
            IDLE: mux_sel = 2'b01;
            START: mux_sel = 2'b00;
            TRANSMITING:mux_sel = 2'b10;
            PARITY:mux_sel = 2'b11;
            STOP:mux_sel = 2'b01;
            default:mux_sel = 2'b01;
        endcase
    end
endmodule
