`timescale 1ns / 1ps



module UART_RX#(parameter DATA_WIDTH=8)(
    input RX_IN,
    input [5:0] prescale,
    input PAR_EN,PAR_TYP,
    input CLK,RST,
    output [DATA_WIDTH-1:0] P_DATA,
    output data_valid,
    output Parity_Error,Stop_Error
    );
    
    
    wire par_err,start_glitch,stp_err;
    wire data_sample_en,edge_counter_en,deser_en;
    wire [4:0]edge_cnt;
    wire [3:0] bit_cnt;
    wire stp_chk_en,start_chk_en,par_chk_en;
    
    assign Parity_Error = par_err&PAR_EN; 
    assign Stop_Error = stp_err;
    FSM control_unit(.PAR_EN(PAR_EN),.RX_IN(RX_IN),.CLK(CLK),.RST(RST),
    .edge_cnt(edge_cnt),.bit_cnt(bit_cnt),
    .parity_error(par_err),.start_glitch(start_glitch),.stp_error(stp_err),
    .data_sample_en(data_sample_en),.edge_counter_en(edge_counter_en),.deser_en(deser_en),
    .data_valid(data_valid),
    .stp_chk_en(stp_chk_en),.start_chk_en(start_chk_en),.par_chk_en(par_chk_en));
    
    wire bit_tick;
    edge_bit_counter edge_counting_unit
    (.CLK(CLK),.RST(RST),.enable(edge_counter_en),.prescale(prescale),
    .bit_cnt(bit_cnt),.edge_cnt(edge_cnt),.bit_tick(bit_tick));
    
    wire sampled_bit;
    data_sampling data_sampling_unit
    (.CLK(CLK),.RST(RST),.edge_cnt(edge_cnt),.data_sample_en(data_sample_en),
    .RX_IN(RX_IN),.prescale(prescale),.sampled_bit(sampled_bit));
    
deserializer#(.DATA_WIDTH(DATA_WIDTH)) deserializing_unit
    (.CLK(CLK),.RST(RST),.deser_en(deser_en),
    .sampled_bit(sampled_bit),.P_DATA(P_DATA),.bit_tick(bit_tick));
    
    parity_check#(.DATA_WIDTH(DATA_WIDTH)) parity_check_unit
    (.CLK(CLK),.RST(RST),.par_chk_en(par_chk_en),.sampled_bit(sampled_bit),.P_DATA(P_DATA),.par_err(par_err),.PAR_TYP(PAR_TYP));
    
    start_check start_check_unit
    (.start_chk_en(start_chk_en),.sampled_bit(sampled_bit),.start_glitch(start_glitch));
    
    stop_check stop_check_unit
    (.stp_chk_en(stp_chk_en),.sampled_bit(sampled_bit),.stp_err(stp_err));
endmodule
