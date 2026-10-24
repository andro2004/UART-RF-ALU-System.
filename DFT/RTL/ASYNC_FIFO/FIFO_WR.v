`timescale 1ns / 1ps


module FIFO_WR#(parameter DEPTH = 8)(
    input winc,wclk,wrst_n,
    input [$clog2(DEPTH):0]wq2_rptr,
    output wfull,
    output [$clog2(DEPTH):0] wptr,
    output [$clog2(DEPTH)-1:0]waddr
    );
    localparam ptr_width = $clog2(DEPTH);

    wire [ptr_width:0] bin_wq2_rptr;
    reg [ptr_width:0] bin_wptr;

    assign waddr = bin_wptr[ptr_width-1:0];
    assign wfull = (bin_wptr[ptr_width] != bin_wq2_rptr[ptr_width]) && (bin_wptr[ptr_width-1:0] == bin_wq2_rptr[ptr_width-1:0]);
    
    

    bin2gray #(.WIDTH(ptr_width+1))b2g_WR(
    .bin(bin_wptr),
    .gray(wptr),
    .CLK(wclk),
    .RST(wrst_n)
    );

    gray2bin #(.WIDTH(ptr_width+1))g2b_WR(
    .gray(wq2_rptr),
    .bin(bin_wq2_rptr)
    );
    
    always @(posedge wclk or negedge wrst_n)begin
        if(!wrst_n)begin
            bin_wptr <='b0;
        end else begin
            if(winc && !wfull)begin
                bin_wptr <= bin_wptr+1;
            end
        end
    end
    
    
endmodule
