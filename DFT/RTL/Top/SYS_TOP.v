module SYS_TOP #(
    parameter DATA_WIDTH       = 8,
              REG_FILE_DEPTH   = 16,
              FIFO_DEPTH       = 16,
              PRESCALE_WIDTH   = 6,
              RST_SYNC_STAGES  = 2,
              DATA_SYNC_STAGES = 2
)(
    input  REF_CLK, UART_CLK,
    input  RST,
    input  RX_IN,
    output TX_OUT, RX_Stop_Error, RX_Parity_Error, TX_OUT_V,

    input  SI, SE, test_mode, scan_clk, scan_rst,
    output SO
);

//------------------------------------------------------------------
// Internal wires – declared only once
//------------------------------------------------------------------
wire scan_fun_ref_clk, scan_fun_uart_clk, scan_fun_rst;
wire scan_fun_tx_clk,  scan_fun_rx_clk;

wire [(2*DATA_WIDTH)-1:0] ALU_OUT;
wire [DATA_WIDTH-1:0]     ALU_OP_A, ALU_OP_B;
wire [3:0]                ALU_FUN;
wire ALU_OUT_Valid, ALU_EN, ALU_CLK_EN, ALU_CLK;
wire Carry_Flag, Arith_flag, Logic_flag, CMP_flag, Shift_flag;

wire [DATA_WIDTH-1:0] Ref_File_RdData, Ref_File_WrData, REG3;
wire [$clog2(REG_FILE_DEPTH)-1:0] Ref_File_Adrr;
wire Ref_File_RdData_Valid, Ref_File_WrEn, Ref_File_RdEn;

wire [DATA_WIDTH-1:0] FIFO_Wr_DATA, FIFO_Rd_DATA;
wire FIFO_Full, FIFO_Empty, Wr_inc, Rd_inc;

wire [DATA_WIDTH-1:0] UART_CONFIG, ASYNC_RX_OUT_P, SYNC_RX_OUT_P;
wire [PRESCALE_WIDTH-1:0] RX_Prescale;
wire PAR_EN, PAR_TYP, ASYNC_RX_OUT_V, SYNC_RX_OUT_V;

wire [PRESCALE_WIDTH-1:0] TX_DIV_RATHIO, RX_DIV_RATHIO;
wire clk_div_en;
wire TX_CLK, RX_CLK;

wire SYNC_RST1, SYNC_RST2;
wire test_rst1, test_rst2;   // NEW – controllable reset in test mode

//------------------------------------------------------------------
// Continuous assignments
//------------------------------------------------------------------
assign RX_Prescale   = UART_CONFIG[PRESCALE_WIDTH+1:2];
assign PAR_EN        = UART_CONFIG[0];
assign PAR_TYP       = UART_CONFIG[1];
assign TX_DIV_RATHIO = REG3[PRESCALE_WIDTH-1:0];

// Force reset to primary scan_rst when test_mode=1
assign test_rst1 = test_mode ? scan_rst : SYNC_RST1;
assign test_rst2 = test_mode ? scan_rst : SYNC_RST2;

//------------------------------------------------------------------
// Clock / Reset muxes
//------------------------------------------------------------------
mux2X1 ref_clk_mux (
    .IN_0 (REF_CLK),
    .IN_1 (scan_clk),
    .SEL  (test_mode),
    .OUT  (scan_fun_ref_clk)
);

mux2X1 uart_clk_mux (
    .IN_0 (UART_CLK),
    .IN_1 (scan_clk),
    .SEL  (test_mode),
    .OUT  (scan_fun_uart_clk)
);

mux2X1 rst_mux (
    .IN_0 (RST),
    .IN_1 (scan_rst),
    .SEL  (test_mode),
    .OUT  (scan_fun_rst)
);

mux2X1 tx_clk_mux (
    .IN_0 (TX_CLK),
    .IN_1 (scan_clk),
    .SEL  (test_mode),
    .OUT  (scan_fun_tx_clk)
);

mux2X1 rx_clk_mux (
    .IN_0 (RX_CLK),
    .IN_1 (scan_clk),
    .SEL  (test_mode),
    .OUT  (scan_fun_rx_clk)
);

//------------------------------------------------------------------
// Control Unit
//------------------------------------------------------------------
SYS_CTRL #(
    .DATA_WIDTH     (DATA_WIDTH),
    .REG_FILE_DEPTH (REG_FILE_DEPTH)
) Control_unit (
    .CLK             (scan_fun_ref_clk),
    .RST             (test_rst1),          // CHANGED
    .ALU_OUT         (ALU_OUT),
    .ALU_OUT_Valid   (ALU_OUT_Valid),
    .RF_RdData       (Ref_File_RdData),
    .RF_RdData_Valid (Ref_File_RdData_Valid),
    .RX_P_DATA       (SYNC_RX_OUT_P),
    .RX_D_VLD        (SYNC_RX_OUT_V),
    .FIFO_Full       (FIFO_Full),
    .Wr_inc          (Wr_inc),

    .ALU_FUN         (ALU_FUN),
    .EN              (ALU_EN),
    .CLK_EN          (ALU_CLK_EN),
    .Address         (Ref_File_Adrr),
    .WrEn            (Ref_File_WrEn),
    .RdEn            (Ref_File_RdEn),
    .RF_WrData       (Ref_File_WrData),
    .FIFO_RF_WrData  (FIFO_Wr_DATA),
    .clk_div_en      (clk_div_en)
);

//------------------------------------------------------------------
// DATA_SYNC
//------------------------------------------------------------------
DATA_SYNC #(
    .BUS_WIDTH  (DATA_WIDTH),
    .NUM_STAGES (DATA_SYNC_STAGES)
) RX_PDATA_SYNC (
    .unsync_bus   (ASYNC_RX_OUT_P),
    .bus_enable   (ASYNC_RX_OUT_V),
    .CLK          (scan_fun_ref_clk),
    .RST          (test_rst1),         // CHANGED
    .sync_bus     (SYNC_RX_OUT_P),
    .enable_pulse (SYNC_RX_OUT_V)
);

//------------------------------------------------------------------
// UART
//------------------------------------------------------------------
UART_TOP #(
    .DATA_WIDTH     (DATA_WIDTH),
    .PRESCALE_WIDTH (PRESCALE_WIDTH)
) UART (
    .RST             (test_rst2),      // CHANGED
    .PAR_EN          (PAR_EN),
    .PAR_TYP         (PAR_TYP),

    .TX_CLK          (scan_fun_tx_clk),
    .TX_IN_P         (FIFO_Rd_DATA),
    .TX_IN_V         (!FIFO_Empty),
    .TX_OUT_S        (TX_OUT),
    .TX_OUT_V        (TX_OUT_V),

    .RX_CLK          (scan_fun_rx_clk),
    .RX_IN_S         (RX_IN),
    .Prescale        (RX_Prescale),
    .RX_OUT_P        (ASYNC_RX_OUT_P),
    .RX_OUT_V        (ASYNC_RX_OUT_V),
    .RX_Parity_Error (RX_Parity_Error),
    .RX_Stop_Error   (RX_Stop_Error)
);

//------------------------------------------------------------------
// Register File
//------------------------------------------------------------------
RegFile #(
    .DATA_WIDTH (DATA_WIDTH),
    .DEPTH      (REG_FILE_DEPTH)
) Reg_File (
    .CLK        (scan_fun_ref_clk),
    .RST        (test_rst1),           // CHANGED
    .WrEn       (Ref_File_WrEn),
    .RdEn       (Ref_File_RdEn),
    .Address    (Ref_File_Adrr),
    .WrData     (Ref_File_WrData),
    .RdData_VLD (Ref_File_RdData_Valid),
    .RdData     (Ref_File_RdData),
    .REG0       (ALU_OP_A),
    .REG1       (ALU_OP_B),
    .REG2       (UART_CONFIG),
    .REG3       (REG3)
);

//------------------------------------------------------------------
// Async FIFO
//------------------------------------------------------------------
ASYNC_FIFO #(
    .DATA_WIDTH (DATA_WIDTH),
    .DEPTH      (FIFO_DEPTH)
) ASYNC_FIFO_unit (
    .w_clk   (scan_fun_ref_clk),
    .w_rst   (test_rst1),              // CHANGED
    .w_inc   (Wr_inc),
    .w_data  (FIFO_Wr_DATA),

    .r_clk   (scan_fun_tx_clk),
    .r_rst   (test_rst2),              // CHANGED
    .r_inc   (Rd_inc),

    .empty   (FIFO_Empty),
    .full    (FIFO_Full),
    .rd_data (FIFO_Rd_DATA)
);

//------------------------------------------------------------------
// ALU
//------------------------------------------------------------------
ALU #(
    .DATA_WIDTH (DATA_WIDTH)
) Processing_unit (
    .A             (ALU_OP_A),
    .B             (ALU_OP_B),
    .ALU_FUN       (ALU_FUN),
    .CLK           (ALU_CLK),
    .EN            (ALU_EN),
    .ALU_OUT       (ALU_OUT),
    .ALU_OUT_Valid (ALU_OUT_Valid),
    .Shift_flag    (Shift_flag),
    .CMP_flag      (CMP_flag),
    .Logic_flag    (Logic_flag),
    .Arith_flag    (Arith_flag),
    .Carry_Flag    (Carry_Flag)
);

//------------------------------------------------------------------
// Pulse Generator
//------------------------------------------------------------------
PULSE_GEN Pulse_Generator (
    .clk       (scan_fun_tx_clk),
    .rst       (test_rst2),            // CHANGED
    .lvl_sig   (TX_OUT_V),
    .pulse_sig (Rd_inc)
);

//------------------------------------------------------------------
// Reset Synchronizers (still use scan_fun_rst)
//------------------------------------------------------------------
RST_SYNC #(
    .NUM_STAGES (RST_SYNC_STAGES)
) Domain1_RST_SYNC (
    .CLK      (scan_fun_ref_clk),
    .RST      (scan_fun_rst),
    .SYNC_RST (SYNC_RST1)
);

RST_SYNC #(
    .NUM_STAGES (RST_SYNC_STAGES)
) Domain2_RST_SYNC (
    .CLK      (scan_fun_uart_clk),
    .RST      (scan_fun_rst),
    .SYNC_RST (SYNC_RST2)
);

//------------------------------------------------------------------
// Clock Gate (DFT-aware)
//------------------------------------------------------------------
CLK_GATE ALU_CLK_GATE (
    .CLK_EN    (ALU_CLK_EN),
    .CLK       (scan_fun_ref_clk),
    .test_mode (test_mode),
    .SE        (SE),
    .GATED_CLK (ALU_CLK)
);

//------------------------------------------------------------------
// Clock Dividers
//------------------------------------------------------------------
ClkDiv #(
    .DATA_DIV_WIDTH (PRESCALE_WIDTH)
) TX_ClkDiv (
    .i_ref_clk   (scan_fun_uart_clk),
    .i_rst_n     (test_rst2),          // CHANGED
    .i_clk_en    (clk_div_en),
    .i_div_ratio (TX_DIV_RATHIO),
    .o_div_clk   (TX_CLK)
);

CLKDIV_MUX #(
    .WIDTH (PRESCALE_WIDTH)
) Prescale_CLKDIV_MUX (
    .IN  (RX_Prescale),
    .OUT (RX_DIV_RATHIO)
);

ClkDiv #(
    .DATA_DIV_WIDTH (PRESCALE_WIDTH)
) RX_ClkDiv (
    .i_ref_clk   (scan_fun_uart_clk),
    .i_rst_n     (test_rst2),          // CHANGED
    .i_clk_en    (clk_div_en),
    .i_div_ratio (RX_DIV_RATHIO),
    .o_div_clk   (RX_CLK)
);

endmodule
