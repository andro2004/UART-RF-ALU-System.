module SYS_CTRL #(
    parameter DATA_WIDTH = 8,
              REG_FILE_DEPTH = 16
) (
    // Inputs
    input  wire        CLK,
    input  wire        RST,
    input  wire [(2*DATA_WIDTH)-1:0]  ALU_OUT,
    input  wire        ALU_OUT_Valid,
    input  wire [DATA_WIDTH-1:0]   RF_RdData,
    input  wire        RF_RdData_Valid,
    input  wire [DATA_WIDTH-1:0]    RX_P_DATA,
    input  wire        RX_D_VLD,
    input  wire        FIFO_Full,

    // Outputs
    output wire [3:0]  ALU_FUN,
    output wire        EN,
    output wire        CLK_EN,
    output wire [$clog2(REG_FILE_DEPTH)-1:0]  Address,
    output wire        WrEn,
    output wire        RdEn,
    output wire [DATA_WIDTH-1:0]   RF_WrData,
    output wire [DATA_WIDTH-1:0]    FIFO_RF_WrData,
    output wire        clk_div_en,
    output  wire        Wr_inc
);
    localparam IDLE =4'b0000,
    RF_Wr_FRAM1 = 4'b0001,RF_Wr_FRAM2 = 4'b0010,
    RF_Rd_FRAM1 = 4'b0011,
    ALU_OP_FRAM1 = 4'b0100,ALU_OP_FRAM2 = 4'b0101,ALU_OP_FRAM3 = 4'b0110,
    ALU_NOP_FRAM1 = 4'b0111,
    FIFO_Wr_ALU_LSB = 4'b1000,
    FIFO_Wr_ALU_MSB = 4'b1001,
    FIFO_Wr_Rd_DATA = 4'b1010;

    localparam RF_Wr_CMD = 8'hAA,RF_Rd_CMD = 8'hBB,
    ALU_OPER_W_OP_CMD = 8'hCC,ALU_OPER_W_NOP_CMD = 8'hDD;

    reg [3:0] cur_state,next_state;

    wire Rd_CMD =  cur_state ==RF_Rd_FRAM1;

    reg ALU_CMD ;


    reg [$clog2(REG_FILE_DEPTH):0] save_addr1;
    reg [$clog2(REG_FILE_DEPTH):0] addr_q;
    

    //current state logic
    always @(posedge CLK or negedge RST) begin
        if(!RST)begin
            cur_state <= 'b0;
        end else begin
            cur_state <= next_state;
        end       
    end

    //next state logic
    always @(*) begin
        next_state = cur_state;
        case(cur_state)
            IDLE:begin
                if(RX_D_VLD) begin
                    case (RX_P_DATA)
                        RF_Wr_CMD: begin
                            next_state = RF_Wr_FRAM1;
                        end
                        RF_Rd_CMD: begin
                            next_state = RF_Rd_FRAM1;
                        end
                        ALU_OPER_W_OP_CMD: begin
                            next_state = ALU_OP_FRAM1;
                        end
                        ALU_OPER_W_NOP_CMD: begin
                            next_state = ALU_NOP_FRAM1;
                        end
                        default: next_state = IDLE;
                    endcase    
                end
            end
            RF_Wr_FRAM1:begin
                if(RX_D_VLD) next_state = RF_Wr_FRAM2;
            end
            RF_Wr_FRAM2:begin
                if(RX_D_VLD) next_state = IDLE;
            end
            RF_Rd_FRAM1:begin
                if(RX_D_VLD) next_state = FIFO_Wr_Rd_DATA;
            end
            ALU_OP_FRAM1:begin
                if(RX_D_VLD) next_state = ALU_OP_FRAM2;
            end
            ALU_OP_FRAM2:begin
                if(RX_D_VLD) next_state = ALU_OP_FRAM3;
            end
            ALU_OP_FRAM3:begin
                if(ALU_OUT_Valid) next_state = FIFO_Wr_ALU_LSB;
            end
            ALU_NOP_FRAM1:begin
                if(ALU_OUT_Valid) next_state = FIFO_Wr_ALU_LSB;
            end
            FIFO_Wr_ALU_LSB:begin
                next_state = FIFO_Full? FIFO_Wr_ALU_LSB:FIFO_Wr_ALU_MSB;
            end
            FIFO_Wr_ALU_MSB:begin
                next_state = FIFO_Full? FIFO_Wr_ALU_MSB:IDLE;
            end
            FIFO_Wr_Rd_DATA:begin
                if(RF_RdData_Valid) next_state = FIFO_Full? FIFO_Wr_Rd_DATA:IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

    //output logic
    
    always @(posedge CLK or negedge RST) begin
        if(!RST) begin
            ALU_CMD <= 1'b0;
            addr_q <= 'b0;
        end else begin
            if(cur_state == IDLE && RX_D_VLD)
                ALU_CMD <= (RX_P_DATA == ALU_OPER_W_OP_CMD || RX_P_DATA == ALU_OPER_W_NOP_CMD);
            if(cur_state == RF_Wr_FRAM1 && RX_D_VLD)
                addr_q <= RX_P_DATA;        
        end
    end


    assign ALU_FUN = RX_P_DATA[3:0];
    assign EN = RX_D_VLD && (cur_state == ALU_OP_FRAM3 || cur_state == ALU_NOP_FRAM1);
    assign CLK_EN = ALU_CMD;
    assign Address = (cur_state == RF_Wr_FRAM2) ? addr_q :
                     (cur_state == ALU_OP_FRAM1) ? 'd0   :
                     (cur_state == ALU_OP_FRAM2) ? 'd1   : RX_P_DATA;
    assign WrEn =  RX_D_VLD &&( cur_state ==RF_Wr_FRAM2 || cur_state ==ALU_OP_FRAM1 ||cur_state ==ALU_OP_FRAM2);
    assign RdEn = Rd_CMD;
    assign RF_WrData = RX_P_DATA;
    assign FIFO_RF_WrData = (cur_state == FIFO_Wr_Rd_DATA)? RF_RdData:
                            (cur_state == FIFO_Wr_ALU_LSB)? ALU_OUT[DATA_WIDTH-1:0]:
                            ALU_OUT[(DATA_WIDTH*2)-1:DATA_WIDTH];
    assign clk_div_en   = 1'b1;
    assign Wr_inc = (cur_state == FIFO_Wr_Rd_DATA ||cur_state == FIFO_Wr_ALU_LSB ||cur_state == FIFO_Wr_ALU_MSB);
    
endmodule
