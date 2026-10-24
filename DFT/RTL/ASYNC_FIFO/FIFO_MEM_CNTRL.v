
module FIFO_MEM_CNTRL#(parameter DATA_WIDTH = 8, DEPTH = 16)(
    input wclken,
    input [DATA_WIDTH-1:0] wdata,
    input [$clog2(DEPTH)-1:0]waddr,raddr,
    input wclk,
    output[DATA_WIDTH-1:0] rdata
    );
    
    reg [DATA_WIDTH-1:0] Memory [DEPTH-1:0];
    assign rdata = Memory[raddr];
    always@(posedge wclk)begin 
        if(wclken)begin
            Memory[waddr] <= wdata;
        end
    end
endmodule 