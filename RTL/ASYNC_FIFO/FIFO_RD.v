module FIFO_RD#(parameter DEPTH = 8)(
    input rinc,rclk,rrst_n,
    input [$clog2(DEPTH):0]rq2_wptr,
    output rempty,
    output [$clog2(DEPTH):0] rptr,
    output [$clog2(DEPTH)-1:0]raddr
    );
    
    localparam ptr_width = $clog2(DEPTH);

    wire [ptr_width:0] bin_rq2_wptr;
    reg [ptr_width:0] bin_rptr;

    assign raddr = bin_rptr[ptr_width-1:0];
    assign rempty = (bin_rptr== bin_rq2_wptr);
    
    bin2gray #(.WIDTH(ptr_width+1)) b2g_RD(
    .bin(bin_rptr),
    .gray(rptr),
    .CLK(rclk),
    .RST(rrst_n)
    );

    gray2bin #(.WIDTH(ptr_width+1))g2b_RD(
    .gray(rq2_wptr),
    .bin(bin_rq2_wptr)
    );

    always @(posedge rclk or negedge rrst_n)begin
        if(!rrst_n)begin
            bin_rptr <='b0;
        end else begin
            if(rinc && !rempty)begin
                bin_rptr <= bin_rptr+1;
            end
        end
    end
endmodule 