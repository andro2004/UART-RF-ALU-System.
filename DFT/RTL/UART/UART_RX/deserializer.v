`timescale 1ns / 1ps

module deserializer#(parameter DATA_WIDTH = 8)(
    input deser_en,
    input sampled_bit,
    input CLK,RST,
    output reg [DATA_WIDTH-1:0] P_DATA,
    input bit_tick
    );
    localparam count_size = $clog2(DATA_WIDTH);
    integer i ;

    always @(posedge CLK,negedge RST)begin
        if(!RST)begin
            P_DATA <='b0;
        end else if(deser_en&& bit_tick) begin
            P_DATA[DATA_WIDTH-1] <= sampled_bit; 
            for(i=DATA_WIDTH-2;i>=0;i=i-1)begin
                P_DATA[i] <= P_DATA[i+1];
            end
        end
    end
endmodule

