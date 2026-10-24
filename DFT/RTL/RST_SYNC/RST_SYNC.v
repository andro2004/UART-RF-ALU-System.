`timescale 1ns / 1ps



module RST_SYNC#(parameter NUM_STAGES=2)(
    input RST,CLK,
    output SYNC_RST
    );
    integer i;
    reg [NUM_STAGES-1:0] flops;
    assign SYNC_RST =flops[NUM_STAGES-1];
    always @(posedge CLK,negedge RST)begin
        if(!RST)begin
            flops <='b0;
        end else begin
            flops[0]<=1'b1;
            for (i=0;i<NUM_STAGES-1;i=i+1)begin 
                flops[i+1]<=flops[i];
            end
        end
    end
endmodule
