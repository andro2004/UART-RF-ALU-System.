`timescale 1ns / 1ps

module UART_TX#(parameter DATA_WIDTH = 8)(
    input CLK,RST,
    input PAR_EN,PAR_TYP,
    input [DATA_WIDTH-1:0] P_DATA,
    input DATA_VAILD,
    output TX_OUT,busy
    );
    
    wire par_bit,ser_data,ser_enable,mux_out;
    wire [1:0] mux_sel; 
    
    assign TX_OUT  = mux_out;
    
    TX_FSM#(.DATA_WIDTH(8))control_unit
    (.DATA_VAILD(DATA_VAILD),.PAR_EN(PAR_EN),.CLK(CLK),.RST(RST),
    .ser_en(ser_enable),.mux_sel(mux_sel),.busy(busy));
    
    serializer#(.DATA_WIDTH(8))ser
    (.P_DATA(P_DATA),.CLK(CLK),.RST(RST),.ser_enable(ser_enable),.ser_data(ser_data));
    reg [DATA_WIDTH-1:0] data_q;
    always @(posedge CLK or negedge RST)
        if(!RST)       data_q <= 'b0;
        else if(!busy) data_q <= P_DATA;
    parity_calc#(.DATA_WIDTH(8))parity_calc_unit
    (.P_DATA(data_q),.PAR_TYP(PAR_TYP),.PAR_BIT(par_bit));
    
    MUX_4to1 #(.DATA_WIDTH(1)) TX_MUX 
    (.I0(1'b0),.I1(1'b1),.I2(ser_data),.I3(par_bit),.sel(mux_sel),.Y(mux_out));
    
endmodule
