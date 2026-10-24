`timescale 1ns / 1ps



module DATA_SYNC#(parameter BUS_WIDTH = 8,NUM_STAGES=2)(
    input [BUS_WIDTH-1:0] unsync_bus,
    input bus_enable,CLK,RST,
    output reg [BUS_WIDTH-1:0] sync_bus,
    output reg enable_pulse
    );
    
    wire enabel_sync_out,en_pulse;
    Sync_chin#(.NUM_STAGES(NUM_STAGES))Multi_flops
       (.in_data(bus_enable),.clk(CLK),.rst(RST),.out_data(enabel_sync_out));
       
    Pulse_Gen Pulse_Gen(.en(enabel_sync_out),.clk(CLK),.rst(RST),.en_pulse(en_pulse));
    
    always@(posedge CLK or negedge RST)begin
        if(!RST)begin
            enable_pulse<=1'b0;
            sync_bus<='b0;
        end else begin
            enable_pulse<=en_pulse;
            if(en_pulse)
                sync_bus<= unsync_bus;
        end 
    end
    

endmodule
