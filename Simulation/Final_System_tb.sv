`timescale 1ns/1ps


module Final_System_tb ();

    parameter real UART_CLK_PERIOD = 271.267;
    parameter  real TX_CLK_PERIOD = 8680.544;
    
    parameter  REF_CLK_PERIOD = 20;
    parameter  DATA_WIDTH = 8;
    parameter  REG_FILE_DEPTH = 16;
    parameter  FIFO_DEPTH = 16;
    parameter  PRESCALE_WIDTH = 6;
    parameter  RST_SYNC_STAGES = 2;
    parameter  DATA_SYNC_STAGES = 2;

    parameter 
    ADD=8'h00,
    SUB=8'h01,
    MUL=8'h02,
    DIV=8'h03,
    AND=8'h04,
    OR=8'h05,
    NAND=8'h06,
    NOR=8'h07,
    XOR=8'h08,
    XNOR=8'h09,
    EQL=8'h0A,
    SML=8'h0B,
    GRT=8'h0C,
    RSH=8'h0D,
    LSH=8'h0E,
    NOP=8'h0F;

    logic REF_CLK_tb;
    logic UART_CLK_tb;
    logic RST_tb;
    logic RX_IN_tb;
    logic  TX_OUT_tb;
    logic  RX_Stop_Error_tb;
    logic  RX_Parity_Error_tb;
    logic  TX_OUT_V_tb; 

    logic  PAR_EN_tb,PAR_TYP_tb;
    logic [PRESCALE_WIDTH-1:0] RX_Prescale;

    assign RX_Prescale = 'b100000;

    parameter RF_Wr_CMD = 8'hAA,RF_Rd_CMD = 8'hBB,
    ALU_OPER_W_OP_CMD = 8'hCC,ALU_OPER_W_NOP_CMD = 8'hDD;

    logic [DATA_WIDTH+2:0] recived_frame = 'b0;
    logic [(DATA_WIDTH*2) -1:0] ALU_recived_data = 'b0;

    logic [2*DATA_WIDTH-1:0] ALU_expected_out;

    int passed=0,failed=0;

    always #(UART_CLK_PERIOD/2)  UART_CLK_tb = ~ UART_CLK_tb;
    always #(REF_CLK_PERIOD/2)  REF_CLK_tb = ~ REF_CLK_tb;

SYS_TOP #(
    .DATA_WIDTH (DATA_WIDTH),
    .REG_FILE_DEPTH(REG_FILE_DEPTH),
    .FIFO_DEPTH (FIFO_DEPTH),
    .PRESCALE_WIDTH(PRESCALE_WIDTH),
    .RST_SYNC_STAGES (RST_SYNC_STAGES),
    .DATA_SYNC_STAGES (DATA_SYNC_STAGES)
)DUT(
    .REF_CLK(REF_CLK_tb),
    .UART_CLK(UART_CLK_tb),
    .RST(RST_tb),
    .RX_IN(RX_IN_tb),
    .TX_OUT(TX_OUT_tb),
    .RX_Stop_Error(RX_Stop_Error_tb),
    .RX_Parity_Error(RX_Parity_Error_tb),
    .TX_OUT_V(TX_OUT_V_tb)
);

    logic testbench_RX,testbench_TX;
    assign testbench_RX = TX_OUT_tb;
    assign RX_IN_tb = testbench_TX ;

    task drive_tx;
        input logic [DATA_WIDTH+2:0]frame = 'b0;
        input logic PAR_EN = 1'b1;
        input logic PAR_TYP = 1'b0;
        int i;
        int frame_size;
        
        begin
            frame_size  = PAR_EN? DATA_WIDTH+3:DATA_WIDTH+2;
            for (i=0;i<frame_size;i++)begin
                #(TX_CLK_PERIOD);
                testbench_TX =frame[i] ;
            end
        end
    endtask

    task send_frame;
        input logic [DATA_WIDTH-1:0] test_data = 'b0;
        input logic PAR_EN = 1'b1, PAR_TYP = 1'b0;
        
        logic  [DATA_WIDTH+2:0] test_frame;
        
        begin
            PAR_EN_tb = PAR_EN;
            PAR_TYP_tb = PAR_TYP;
            test_frame[0] =1'b0;
            test_frame[DATA_WIDTH:1] = test_data;
            test_frame[DATA_WIDTH+1] = PAR_EN_tb? (PAR_TYP_tb? ~^test_data:^test_data):1'b1;
            test_frame[DATA_WIDTH+2] = 1'b1; 

            drive_tx(test_frame,PAR_EN,PAR_TYP);
        end
    endtask

    task recive_frame;
        input logic PAR_EN = 1'b1;
        output logic [DATA_WIDTH+2:0] recived_frame = 'b0;
        int frame_size;
        begin
            frame_size  = PAR_EN? DATA_WIDTH+3:DATA_WIDTH+2;
            @(negedge testbench_RX)
            #(TX_CLK_PERIOD/2);
            for (int i=0;i<frame_size;i++) begin
                recived_frame[i] = testbench_RX;
                #(TX_CLK_PERIOD);
            end
        end 
    endtask

    task initialize;
        testbench_TX = 1'b1;
        UART_CLK_tb = 'b0;
        REF_CLK_tb = 'b0;
        RST_tb = 'b0;

        PAR_EN_tb = 1'b1;
        PAR_TYP_tb = 1'b1;

        #(UART_CLK_PERIOD*2);
            RST_tb = 'b1;
    endtask

    task Test_ALU_OP;
        //Test ALU with operators
        input logic [DATA_WIDTH-1:0] op_A = 'b0;
        input logic [DATA_WIDTH-1:0] op_B = 'b0;
        input logic [DATA_WIDTH-1:0] ALU_FUN = 'b0;
        begin
            $display("@time:%0t Testing ALU_OP:",$time());
            $display("op_A:%h,op_B:%h,ALU_FUN:%h",op_A,op_B,ALU_FUN);      
            send_frame(ALU_OPER_W_OP_CMD,1'b1,1'b0);
            $display("@time:%0t frame0 sent",$time());
            send_frame(op_A,1'b1,1'b0);
            $display("@time:%0t frame1 sent",$time());
            send_frame(op_B,1'b1,1'b0);
            $display("@time:%0t frame2 sent",$time());
            send_frame(ALU_FUN,1'b1,1'b0);
            $display("@time:%0t frame3 sent",$time());
            recive_frame(1'b1,recived_frame);
            ALU_recived_data [DATA_WIDTH-1:0] = recived_frame[DATA_WIDTH:1];
            recive_frame(1'b1,recived_frame);
            ALU_recived_data [(DATA_WIDTH*2) -1 : DATA_WIDTH] = recived_frame[DATA_WIDTH:1];
            case (ALU_FUN)
                4'b0000: ALU_expected_out = op_A + op_B;
                4'b0001: ALU_expected_out = op_A - op_B;
                4'b0010: ALU_expected_out = op_A * op_B;
                4'b0011: ALU_expected_out = (op_B == 0) ? 'bx : op_A / op_B;
                4'b0100: ALU_expected_out = op_A & op_B;
                4'b0101: ALU_expected_out = op_A | op_B;
                4'b0110: ALU_expected_out = ~(op_A & op_B);
                4'b0111: ALU_expected_out = ~(op_A | op_B);
                4'b1000: ALU_expected_out = op_A ^ op_B;
                4'b1001: ALU_expected_out = ~(op_A ^ op_B);
                4'b1010: ALU_expected_out = (op_A == op_B) ? 'd1 : 'd0;
                4'b1011: ALU_expected_out = (op_A >  op_B) ? 'd2 : 'd0;
                4'b1100: ALU_expected_out = (op_A <  op_B) ? 'd3 : 'd0;
                4'b1101: ALU_expected_out = op_A >> 1;
                4'b1110: ALU_expected_out = op_A << 1;
                default: ALU_expected_out = 'd0;
            endcase
            $display("data recived:%h", ALU_recived_data);

            if(ALU_recived_data == ALU_expected_out)begin
                $display("ALU Command passed");
                passed++; 
            end else begin
                $display("ALU Command failed");
                failed++; 
            end
                
        end

    endtask


    task Test_ALU_NO_OP;
        //Test ALU with operators
        input logic [DATA_WIDTH-1:0] ALU_FUN = 'b0;
        
        begin
            $display("@time:%0t Testing ALU_NO_OP",$time());
            $display("ALU_FUN:%h",ALU_FUN);
            send_frame(ALU_OPER_W_NOP_CMD,1'b1,1'b0);
            $display("@time:%0t frame0 sent",$time());
            send_frame(ALU_FUN,1'b1,1'b0);
            $display("@time:%0t frame1 sent",$time());
            recive_frame(1'b1,recived_frame);
            ALU_recived_data [DATA_WIDTH-1:0] = recived_frame[DATA_WIDTH:1];
            recive_frame(1'b1,recived_frame);
            ALU_recived_data [(DATA_WIDTH*2) -1 : DATA_WIDTH] = recived_frame[DATA_WIDTH:1];
            $display("data recived:%h", ALU_recived_data);
            if(ALU_recived_data == '0)begin
                $display("ALU Command passed");
                passed++; 
            end else begin
                $display("ALU Command failed");
                failed++; 
            end
        end

    endtask

    task Test_RF_Rd;
        //Test RegFile read
        input logic [DATA_WIDTH-1:0] addr = 'b0;
        begin
            $display("@time:%0t Testing RF_Rd:",$time());
            $display("Address:%h",addr);
            send_frame(RF_Rd_CMD,1'b1,1'b0);
            $display("@time:%0t frame0 sent",$time());
            send_frame(addr,1'b1,1'b0);
            $display("@time:%0t frame1 sent",$time());
            recive_frame(1'b1,recived_frame);
            $display("data recived:%h", recived_frame[DATA_WIDTH:1]);    
        end

        if(recived_frame[DATA_WIDTH:1] == DUT.Reg_File.Reg_arr[addr])begin
                $display("Read Command passed");
                passed++; 
        end else begin
                $display("Read Command failed");
                failed++; 
        end

    endtask

    task Test_RF_Wr;
        //Test RegFile write
        input logic [DATA_WIDTH-1:0] addr = 'b0;
        input logic [DATA_WIDTH-1:0] data = 'b0;
        begin
            $display("Testing RF_Wr");
            $display("Address:%h,Data:%h",addr,data);
            send_frame(RF_Wr_CMD,1'b1,1'b0);
            $display("@time:%0t frame0 sent",$time());
            send_frame(addr,1'b1,1'b0);
            $display("@time:%0t frame1 sent",$time());
            send_frame(data,1'b1,1'b0);
            $display("@time:%0t frame2 sent",$time());
        end
        
    endtask

    initial begin
        
        
        initialize();

        //Test_RF_Wr
        //Test_RF_Rd
        //Test_ALU_NO_OP
        //Test_ALU_OP
        Test_RF_Wr(8'h05,8'hff);

        Test_RF_Rd(8'h05);

        //Test ALU arithmatic operations
        Test_ALU_OP(8'h05,8'h03,ADD);
        Test_ALU_OP(8'h09,8'h04,SUB);
        Test_ALU_OP(8'h02,8'h05,MUL);
        Test_ALU_OP(8'h0f,8'h03,DIV);

        //Test ALU logic operations
        Test_ALU_OP(8'h05,8'h03,AND);
        Test_ALU_OP(8'h09,8'h04,OR);
        Test_ALU_OP(8'h02,8'h05,NAND);
        Test_ALU_OP(8'h0f,8'h03,NOR);
        Test_ALU_OP(8'h02,8'h05,XOR);
        Test_ALU_OP(8'h0f,8'h03,XNOR);

        //Test ALU comparator operations
        Test_ALU_OP(8'h05,8'h03,EQL);
        Test_ALU_OP(8'h09,8'h04,SML);
        Test_ALU_OP(8'h09,8'h04,GRT);

        //Test ALU shift operations
        Test_ALU_OP(8'h05,8'h03,RSH);
        Test_ALU_OP(8'h09,8'h04,LSH);

        //Test ALU NOP
        Test_ALU_NO_OP(NOP);

        $display("passed tests:%d",passed);
        $display("failed tests:%d",failed);
        $finish();

    end

    
endmodule