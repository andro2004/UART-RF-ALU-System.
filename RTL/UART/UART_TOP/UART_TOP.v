`timescale 1ns/1ps

module UART_TOP #(
    parameter DATA_WIDTH = 8,
    parameter PRESCALE_WIDTH = 2
)(
    // Global Inputs
    input  wire                    RST,
    input  wire                    PAR_EN,
    input  wire                    PAR_TYP,

    // Transmitter (UART_TX) Inputs & Outputs
    input  wire                    TX_CLK,
    input  wire [DATA_WIDTH-1:0]   TX_IN_P,
    input  wire                    TX_IN_V,
    output wire                    TX_OUT_S,
    output wire                    TX_OUT_V,

    // Receiver (UART_RX) Inputs & Outputs
    input  wire                    RX_CLK,
    input  wire                    RX_IN_S,
    input  wire [PRESCALE_WIDTH-1:0] Prescale,
    output wire [DATA_WIDTH-1:0]   RX_OUT_P,
    output wire                    RX_OUT_V,
    output wire                    RX_Parity_Error,
    output wire                    RX_Stop_Error
);
    
    UART_TX#(.DATA_WIDTH(DATA_WIDTH))TX 
    (.CLK(TX_CLK),.RST(RST),.PAR_EN(PAR_EN),.PAR_TYP(PAR_TYP),.P_DATA(TX_IN_P),
    .DATA_VAILD(TX_IN_V),.TX_OUT(TX_OUT_S),.busy(TX_OUT_V));

    UART_RX#(.DATA_WIDTH(DATA_WIDTH))RX
    (.CLK(RX_CLK),.RST(RST),.RX_IN(RX_IN_S),.prescale(Prescale),.PAR_EN(PAR_EN),.PAR_TYP(PAR_TYP),
    .P_DATA(RX_OUT_P),.data_valid(RX_OUT_V),.Parity_Error(RX_Parity_Error),.Stop_Error(RX_Stop_Error));

endmodule