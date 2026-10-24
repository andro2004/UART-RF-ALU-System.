module serializer#(parameter DATA_WIDTH = 8)(
    input [DATA_WIDTH-1:0] P_DATA,
    input CLK,RST,ser_enable,
    output ser_data
    );
    reg [DATA_WIDTH-1:0] DATA;
    assign ser_data = DATA[0];
    //wire [$clog2(DATA_WIDTH)-1:0]count;
    integer i;
    //assign ser_done = (count == 3'b111);
    always @(posedge CLK or negedge RST) begin
        if(!RST) begin 
            DATA <= 'b0;
        end
        else begin
            if(ser_enable)begin
                
                for(i=0;i<DATA_WIDTH-1;i = i+1)
                    DATA[i] <= DATA[i+1];
            end
            else
                DATA<=P_DATA;
        end
    end
    
    //Counter#(.DATA_WIDTH(DATA_WIDTH))counter(.CLK(CLK),.RST(internal_rst),.count(count));
endmodule