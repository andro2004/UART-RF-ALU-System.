`timescale 1ns / 1ps

module data_sampling(
    input [4:0]edge_cnt,
    input data_sample_en,
    input RX_IN,
    input [5:0] prescale,
    input CLK,RST,
    output sampled_bit
    );
    
    wire [4:0] half_sample_rate;
    assign half_sample_rate = prescale>> 1;
    
    reg [2:0] samples;
    
    //majority_out=(in0⋅in1)+(in1⋅in2)+(in0⋅in2)
    assign sampled_bit = data_sample_en? (samples[0]&samples[1]) | (samples[1]&samples[2]) | (samples[0]&samples[2]):0;
    always @(posedge CLK, negedge RST)begin
        if(!RST)begin
            samples <= 'b0;
        end else begin
            if(prescale != 2'b00)begin
                if(edge_cnt == (half_sample_rate-1))
                    samples[0] <= RX_IN;
                else if (edge_cnt == (half_sample_rate))
                    samples[1] <= RX_IN;
                else if (edge_cnt == (half_sample_rate+1))
                    samples[2] <= RX_IN;
            end else begin
                if (edge_cnt == (half_sample_rate))begin
                    samples[0] <= RX_IN;
                    samples[1] <= RX_IN;
                    samples[2] <= RX_IN;
                end
            end
        end
    end
    
endmodule
