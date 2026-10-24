

module bin2gray #(parameter WIDTH = 5)(
    input  [WIDTH-1:0] bin,
    output reg [WIDTH-1:0] gray,
    input CLK,RST
);
    always @(posedge CLK or negedge RST) begin
        if(!RST)
            gray <= 'b0;
        else
            gray <= bin ^ (bin >> 1);
    end 
endmodule