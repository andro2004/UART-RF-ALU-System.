module DF_SYNC#(parameter DATA_WIDTH = 8)(
    input [DATA_WIDTH-1:0] ASync_data,
    input clk,rst,
    output [DATA_WIDTH-1:0] Sync_data
    );
    
    reg [DATA_WIDTH-1:0] ff1,ff2;
    assign Sync_data = ff2;
    
    always@(posedge clk or negedge rst)begin 
        if(!rst)begin
            ff1 <= 'b00;
            ff2 <= 'b00;
        end else begin
            ff1 <= ASync_data;
            ff2 <= ff1;
        end
    end
endmodule 