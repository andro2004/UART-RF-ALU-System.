`timescale 1ns / 1ps

module edge_bit_counter#(parameter DATA_WIDTH = 8)(
    input enable,CLK,RST,
    input [5:0] prescale,
    output reg [$clog2(DATA_WIDTH + 3) - 1 : 0]bit_cnt,
    output reg [4:0] edge_cnt,
    output bit_tick
    );
    localparam edge_counter_size = 5;
    localparam bit_counter_size = $clog2(DATA_WIDTH + 3);
    
    wire counter_rst;
    assign counter_rst = RST & enable;
    
    wire [4:0] sample_rate;
    assign sample_rate = prescale -1;
    
    assign bit_tick = (edge_cnt == sample_rate);
    
    always @(posedge CLK or negedge counter_rst)begin
        if(!counter_rst)begin
            edge_cnt <='b0;
            bit_cnt <= 'b0;
        end else begin
            if(edge_cnt == sample_rate) begin
                edge_cnt <= 'b0;
                bit_cnt <= bit_cnt+1;
            end else
                edge_cnt <= edge_cnt+1;
        end
    end
endmodule


