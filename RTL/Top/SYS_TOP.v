

module SYS_TOP #(
    parameter DATA_WIDTH = 8,
              REG_FILE_DEPTH = 16,
              FIFO_DEPTH = 16,
              PRESCALE_WIDTH = 6,
              RST_SYNC_STAGES = 2,
              DATA_SYNC_STAGES = 2
)(
    input REF_CLK,UART_CLK,
    input RST,
    input RX_IN,
    output TX_OUT,RX_Stop_Error,RX_Parity_Error,TX_OUT_V
);

localparam ADDR_WIDTH =$clog2(REG_FILE_DEPTH) ;

//ALU wires
wire [(2*DATA_WIDTH)-1:0] ALU_OUT;
wire [DATA_WIDTH -1:0] ALU_OP_A,ALU_OP_B;
wire [3:0] ALU_FUN;
wire ALU_OUT_Valid,ALU_EN,ALU_CLK_EN,ALU_CLK,Carry_Flag,Arith_flag,Logic_flag,CMP_flag,Shift_flag;

//Reg_File wires
wire [DATA_WIDTH-1:0] Ref_File_RdData,Ref_File_WrData,REG3;
wire [ADDR_WIDTH-1:0] Ref_File_Adrr;
wire Ref_File_RdData_Valid,Ref_File_WrEn,Ref_File_RdEn;

//FIFO wires
wire [DATA_WIDTH-1:0] FIFO_Wr_DATA,FIFO_Rd_DATA;
wire FIFO_Full,FIFO_Empty,Wr_inc,Rd_inc;

//UART wires
wire [DATA_WIDTH-1:0] UART_CONFIG,ASYNC_RX_OUT_P,SYNC_RX_OUT_P;
wire [PRESCALE_WIDTH-1:0] RX_Prescale;
wire PAR_EN,PAR_TYP,ASYNC_RX_OUT_V,SYNC_RX_OUT_V;
assign RX_Prescale = UART_CONFIG[PRESCALE_WIDTH+1:2];
assign PAR_EN = UART_CONFIG[0];
assign PAR_TYP = UART_CONFIG[1];

//CLK_DIVS wires
wire [PRESCALE_WIDTH-1:0] TX_DIV_RATHIO,RX_DIV_RATHIO;
wire clk_div_en,TX_CLK,RX_CLK;
assign TX_DIV_RATHIO = REG3[PRESCALE_WIDTH-1:0];
//RST_SYNC wires
wire SYNC_RST1;
wire SYNC_RST2;


SYS_CTRL #(
    .DATA_WIDTH      (DATA_WIDTH),
    .REG_FILE_DEPTH (REG_FILE_DEPTH)
) Control_unit (
    // Inputs
    .CLK          (REF_CLK),
    .RST          (SYNC_RST1),
    .ALU_OUT      (ALU_OUT),
    .ALU_OUT_Valid    (ALU_OUT_Valid),
    .RF_RdData       (Ref_File_RdData),
    .RF_RdData_Valid (Ref_File_RdData_Valid),
    .RX_P_DATA    (SYNC_RX_OUT_P),
    .RX_D_VLD     (SYNC_RX_OUT_V),
    .FIFO_Full    (FIFO_Full),
    .Wr_inc       (Wr_inc),

    // Outputs
    .ALU_FUN      (ALU_FUN),
    .EN           (ALU_EN),
    .CLK_EN       (ALU_CLK_EN),
    .Address      (Ref_File_Adrr),
    .WrEn         (Ref_File_WrEn),
    .RdEn         (Ref_File_RdEn),
    .RF_WrData       (Ref_File_WrData),
    .FIFO_RF_WrData    (FIFO_Wr_DATA),
    .clk_div_en   (clk_div_en)
);

// Module Instantiation Template: DATA_SYNC
DATA_SYNC #(
    .BUS_WIDTH  (DATA_WIDTH),
    .NUM_STAGES (DATA_SYNC_STAGES)
) RX_PDATA_SYNC (
    // Inputs
    .unsync_bus  (ASYNC_RX_OUT_P),
    .bus_enable  (ASYNC_RX_OUT_V),
    .CLK         (REF_CLK),
    .RST         (SYNC_RST1),

    // Outputs
    .sync_bus    (SYNC_RX_OUT_P),
    .enable_pulse(SYNC_RX_OUT_V)
);

// Module Instantiation Template: UART_TOP
UART_TOP #(
    .DATA_WIDTH     (DATA_WIDTH),
    .PRESCALE_WIDTH (PRESCALE_WIDTH)
) UART (
    // Global Inputs
    .RST             (SYNC_RST2),
    .PAR_EN          (PAR_EN),
    .PAR_TYP         (PAR_TYP),

    // Transmitter (UART_TX) Ports
    .TX_CLK          (TX_CLK),
    .TX_IN_P         (FIFO_Rd_DATA),
    .TX_IN_V         (!FIFO_Empty),
    .TX_OUT_S        (TX_OUT),
    .TX_OUT_V        (TX_OUT_V),

    // Receiver (UART_RX) Ports
    .RX_CLK          (RX_CLK),
    .RX_IN_S         (RX_IN),
    .Prescale        (RX_Prescale),
    .RX_OUT_P        (ASYNC_RX_OUT_P),
    .RX_OUT_V        (ASYNC_RX_OUT_V),
    .RX_Parity_Error (RX_Parity_Error),
    .RX_Stop_Error   (RX_Stop_Error)
);

RegFile #(
    .DATA_WIDTH      (DATA_WIDTH),
    .DEPTH (REG_FILE_DEPTH)
) Reg_File (
    // Inputs
    .CLK        (REF_CLK),
    .RST        (SYNC_RST1),
    .WrEn       (Ref_File_WrEn),
    .RdEn       (Ref_File_RdEn),
    .Address    (Ref_File_Adrr),
    .WrData     (Ref_File_WrData),

    // Outputs
    .RdData_VLD (Ref_File_RdData_Valid),
    .RdData     (Ref_File_RdData),
    .REG0       (ALU_OP_A),
    .REG1       (ALU_OP_B),
    .REG2       (UART_CONFIG),
    .REG3       (REG3)
);

// Module Instantiation Template: ASYNC_FIFO
ASYNC_FIFO #(
    .DATA_WIDTH (DATA_WIDTH),
    .DEPTH      (FIFO_DEPTH)
) ASYNC_FIFO_unit (
    // Write Domain Inputs
    .w_clk   (REF_CLK),
    .w_rst   (SYNC_RST1),
    .w_inc   (Wr_inc),
    .w_data  (FIFO_Wr_DATA),

    // Read Domain Inputs
    .r_clk   (TX_CLK),
    .r_rst   (SYNC_RST2),
    .r_inc   (Rd_inc),

    // Outputs
    .empty   (FIFO_Empty),
    .full    (FIFO_Full),
    .rd_data (FIFO_Rd_DATA)
);

// Module Instantiation Template: ALU
ALU #(
    .DATA_WIDTH (DATA_WIDTH)
) Processing_unit (
    // Inputs
    .A          (ALU_OP_A),
    .B          (ALU_OP_B),
    .ALU_FUN    (ALU_FUN),
    .CLK        (ALU_CLK),
    .EN         (ALU_EN),

    // Outputs
    .ALU_OUT    (ALU_OUT),
    .ALU_OUT_Valid (ALU_OUT_Valid),
    .Shift_flag (Shift_flag),
    .CMP_flag   (CMP_flag),
    .Logic_flag (Logic_flag),
    .Arith_flag (Arith_flag),
    .Carry_Flag (Carry_Flag)
);



// Module Instantiation Template: PULSE_GEN
PULSE_GEN Pulse_Generator (
    // Inputs
    .clk       (TX_CLK),
    .rst       (SYNC_RST2),
    .lvl_sig   (TX_OUT_V),

    // Outputs
    .pulse_sig (Rd_inc)
);

// Module Instantiation Template: RST_SYNC
RST_SYNC #(
    .NUM_STAGES (RST_SYNC_STAGES)
) Domain1_RST_SYNC (
    // Inputs
    .CLK      (REF_CLK),
    .RST      (RST),

    // Outputs
    .SYNC_RST (SYNC_RST1)
);

RST_SYNC #(
    .NUM_STAGES (RST_SYNC_STAGES)
) Domain2_RST_SYNC (
    // Inputs
    .CLK      (UART_CLK),
    .RST      (RST),

    // Outputs
    .SYNC_RST (SYNC_RST2)
);

// Module Instantiation Template: CLK_GATE
CLK_GATE ALU_CLK_GATE (
    // Inputs
    .CLK_EN    (ALU_CLK_EN),
    .CLK       (REF_CLK),

    // Outputs
    .GATED_CLK (ALU_CLK)
);

// Module Instantiation Template: ClkDiv
ClkDiv #(
    .DATA_DIV_WIDTH (PRESCALE_WIDTH)
) TX_ClkDiv (
    // Inputs
    .i_ref_clk   (UART_CLK),
    .i_rst_n     (SYNC_RST2),
    .i_clk_en    (clk_div_en),
    .i_div_ratio (TX_DIV_RATHIO),

    // Outputs
    .o_div_clk   (TX_CLK)
);

// Module Instantiation Template: CLKDIV_MUX
CLKDIV_MUX #(
    .WIDTH (PRESCALE_WIDTH)
) Prescale_CLKDIV_MUX (
    // Inputs
    .IN  (RX_Prescale),

    // Outputs
    .OUT (RX_DIV_RATHIO)
);

// Module Instantiation Template: ClkDiv
ClkDiv #(
    .DATA_DIV_WIDTH (PRESCALE_WIDTH)
) RX_ClkDiv (
    // Inputs
    .i_ref_clk   (UART_CLK),
    .i_rst_n     (SYNC_RST2),
    .i_clk_en    (clk_div_en),
    .i_div_ratio (RX_DIV_RATHIO),

    // Outputs
    .o_div_clk   (RX_CLK)
);




endmodule
 