
module Sync_chin#(parameter NUM_STAGES=5)(
    input in_data,clk,rst,
    output  out_data 
    );
    
    reg [NUM_STAGES-1:0] flip_flops;
    assign out_data = flip_flops[0];
    integer i;
    always @(posedge clk,negedge rst)begin 
        if(!rst)
            flip_flops<='b0;
        else begin
            flip_flops[NUM_STAGES-1:0]<={in_data,flip_flops[NUM_STAGES-1:1]};
        end
    end
endmodule 