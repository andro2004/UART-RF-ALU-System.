`timescale 1ns / 1ps



module FSM#(parameter DATA_WIDTH = 8)(
    input PAR_EN,
    input RX_IN,
    input CLK,RST,
    input [4:0]edge_cnt,
    input [3:0]bit_cnt,
    input parity_error, start_glitch,stp_error,
    
    output data_sample_en,
    output edge_counter_en,
    output deser_en,
    output reg data_valid,
    output stp_chk_en, start_chk_en, par_chk_en
    
    );
    
    localparam IDLE = 3'b000,START = 3'b001,RECIVING = 3'b010,
    PARITY = 3'b011, STOP = 3'b100;
    
    reg [2:0] cur_state,next_state;
    
    reg [3:0] prev_bit_cnt;
    wire bit_done;
    wire data_valid_comb;
    assign bit_done = (prev_bit_cnt != bit_cnt);
    
    always@(posedge CLK,negedge RST)begin
        if(!RST)begin
            cur_state <= 3'b0;
            prev_bit_cnt <= 4'b0;
        end else begin
            cur_state <=next_state;
            prev_bit_cnt <=bit_cnt;
        end
    end
    
    always @(*)begin
        next_state = cur_state;
        case(cur_state)
            IDLE: begin
                if(RX_IN == 1'b0)
                    next_state = START;
                else 
                    next_state = IDLE;
            end
            START: begin
                if(!start_glitch && bit_done)
                    next_state = RECIVING;
                else if(start_glitch && bit_done)
                    next_state = IDLE;
            end
            RECIVING: begin
                if (bit_cnt == DATA_WIDTH+1 && bit_done)
                    next_state = PAR_EN? PARITY:STOP;
                else if(bit_cnt != DATA_WIDTH+1 && bit_done)
                    next_state = RECIVING;
            end
            PARITY: begin
                if (bit_done)next_state = STOP;
            end
            STOP: begin
                if(bit_done)
                    next_state =  IDLE;
                end
            default: next_state = IDLE;
        endcase
    end
    
    always@(posedge CLK,negedge RST)begin
        if(!RST)begin
            data_valid <= 'b0;
            end else begin
            data_valid <= data_valid_comb;
        end
    end

    
    assign data_sample_en = cur_state != IDLE;
    assign edge_counter_en = cur_state != IDLE;
    assign deser_en = (cur_state == RECIVING);
    assign data_valid_comb = (cur_state == STOP && bit_done && !(PAR_EN && parity_error) && !stp_error);
    assign stp_chk_en = (cur_state == STOP);
    assign start_chk_en = (cur_state == START) ;
    assign par_chk_en = (cur_state == PARITY && PAR_EN);
endmodule
