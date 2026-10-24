`timescale 1ns / 1ps


module ClkDiv#(
    parameter DATA_DIV_WIDTH =8
    )(
    input i_ref_clk,i_rst_n,i_clk_en,
    input [DATA_DIV_WIDTH-1:0] i_div_ratio,
    output o_div_clk
    );
    
    wire [DATA_DIV_WIDTH-1:0] count;
    wire [DATA_DIV_WIDTH-1:0] half_div_ratio;
    wire bypass;
	reg div_clk_r;
    assign bypass = (i_clk_en == 1'b0) || (i_div_ratio ==8'b0)|| (i_div_ratio ==8'b1) ;
    assign half_div_ratio = i_div_ratio >>1;
    assign o_div_clk = bypass ? i_ref_clk : div_clk_r;
    CLK_DIV_Counter#(.WIDTH(DATA_DIV_WIDTH))counter
    (.clk(i_ref_clk),.rst_n(i_rst_n),.count(count),.rst_value(i_div_ratio));
    
       
   always @(posedge i_ref_clk or negedge i_rst_n)
       if (!i_rst_n) div_clk_r <= 1'b1;
       else          div_clk_r <= (count <= half_div_ratio);

   
endmodule
