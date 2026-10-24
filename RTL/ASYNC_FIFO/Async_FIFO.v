`timescale 1ns / 1ps



module ASYNC_FIFO#(parameter DATA_WIDTH = 8,DEPTH = 16)(
    input w_clk,w_rst,w_inc,
    input r_clk,r_rst,r_inc,
    input [DATA_WIDTH-1:0] w_data,
    output empty,full,
    output [DATA_WIDTH-1:0] rd_data
    );
    localparam ptr_width = $clog2(DEPTH);
    
    
    wire wclken,wfull,rempty;
    wire [ptr_width:0] wptr,rptr;
    wire [ptr_width:0] sync_wq2_rptr,sync_rq2_wptr;
    wire [ptr_width-1:0] waddr,raddr;
    
    assign full = wfull;
    assign empty = rempty;
    assign wclken =  w_inc & ~wfull;
    FIFO_MEM_CNTRL#(.DATA_WIDTH(DATA_WIDTH),.DEPTH(DEPTH)) Memory
    (.wclken(wclken),.wdata(w_data),.waddr(waddr),.raddr(raddr),.wclk(w_clk),.rdata(rd_data)
    );
    
    FIFO_WR#(.DEPTH(DEPTH))wr_logic
    (.winc(w_inc),.wclk(w_clk),.wrst_n(w_rst),
    .wq2_rptr(sync_wq2_rptr),.wfull(wfull),.wptr(wptr),.waddr(waddr));

    
    DF_SYNC#(.DATA_WIDTH(ptr_width+1))wq2_rptr_sync
    (.ASync_data(rptr),.clk(w_clk),.rst(w_rst),.Sync_data(sync_wq2_rptr));
    
    FIFO_RD#(.DEPTH(DEPTH))rd_logic
    (.rinc(r_inc),.rclk(r_clk),.rrst_n(r_rst),
    .rq2_wptr(sync_rq2_wptr),.rempty(rempty),.rptr(rptr),.raddr(raddr));
    
    DF_SYNC#(.DATA_WIDTH(ptr_width+1))rq2_wptr_sync
    (.ASync_data(wptr),.clk(r_clk),.rst(r_rst),.Sync_data(sync_rq2_wptr));

    
endmodule
