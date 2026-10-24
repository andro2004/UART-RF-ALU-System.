module RegFile#
(
  parameter DATA_WIDTH =16,
            DEPTH = 16
) (
    input  wire         CLK,
    input  wire         RST,
    input  wire         WrEn,
    input  wire         RdEn,
    output reg          RdData_VLD,
    input  wire [$clog2(DEPTH)-1:0]   Address,
    input  wire [DATA_WIDTH-1:0]  WrData,
    output reg  [DATA_WIDTH-1:0]  RdData,
    output wire [DATA_WIDTH-1:0]  REG0,
    output wire [DATA_WIDTH-1:0]  REG1,
    output wire [DATA_WIDTH-1:0]  REG2,
    output wire [DATA_WIDTH-1:0]  REG3
);

    reg [DATA_WIDTH-1:0] Reg_arr [0:15];
    integer i;
    assign REG0 = Reg_arr[0];
    assign REG1 = Reg_arr[1];
    assign REG2 = Reg_arr[2];
    assign REG3 = Reg_arr[3];
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            for(i = 0;i<DEPTH;i = i+1)begin
                if (i==2) Reg_arr[i] <= 'b10000001;
                else if (i==3) Reg_arr[i] <= 'b00100000;
                else Reg_arr[i] <= 'b0;
            end
            RdData_VLD <= 1'b0;
            RdData      <= 1'b0;
        end else begin
            RdData_VLD <= 1'b0;
            if (WrEn && !RdEn)begin
                Reg_arr[Address] <= WrData;
            end
            else if (RdEn && !WrEn) begin
                RdData <= Reg_arr[Address];
                RdData_VLD <= 1'b1;
            end
                
        end
    end

endmodule
