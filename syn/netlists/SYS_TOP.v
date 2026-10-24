/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Oct 10 00:18:06 2026
/////////////////////////////////////////////////////////////


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;
  wire   N0, Latch_Out;

  \**SEQGEN**  Latch_Out_reg ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(1'b0), .data_in(CLK_EN), .enable(N0), .Q(Latch_Out), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b0) );
  GTECH_NOT I_0 ( .A(CLK), .Z(N0) );
  GTECH_AND2 C17 ( .A(CLK), .B(Latch_Out), .Z(GATED_CLK) );
endmodule


module SYS_CTRL_DATA_WIDTH8_REG_FILE_DEPTH16 ( CLK, RST, ALU_OUT, 
        ALU_OUT_Valid, RF_RdData, RF_RdData_Valid, RX_P_DATA, RX_D_VLD, 
        FIFO_Full, ALU_FUN, EN, CLK_EN, Address, WrEn, RdEn, RF_WrData, 
        FIFO_RF_WrData, clk_div_en, Wr_inc );
  input [15:0] ALU_OUT;
  input [7:0] RF_RdData;
  input [7:0] RX_P_DATA;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] RF_WrData;
  output [7:0] FIFO_RF_WrData;
  input CLK, RST, ALU_OUT_Valid, RF_RdData_Valid, RX_D_VLD, FIFO_Full;
  output EN, CLK_EN, WrEn, RdEn, clk_div_en, Wr_inc;
  wire   N147, n2, n3, n4, n8, n15, n19, n20, n21, n22, n23, n24, n26, n27,
         n28, n30, n31, n32, n34, n35, n36, n38, n39, n40, n41, n42, n43, n44,
         n46, n47, n49, n50, n52, n53, n54, n55, n56, n57, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n29, n33, n37, n45, n48, n51, n58, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92;
  wire   [3:0] cur_state;
  wire   [3:0] addr_q;
  assign RdEn = N147;

  DFFRQX2M \addr_q_reg[3]  ( .D(n74), .CK(CLK), .RN(RST), .Q(addr_q[3]) );
  DFFRQX2M \addr_q_reg[2]  ( .D(n73), .CK(CLK), .RN(RST), .Q(addr_q[2]) );
  DFFRQX2M \addr_q_reg[1]  ( .D(n72), .CK(CLK), .RN(RST), .Q(addr_q[1]) );
  DFFRQX2M \addr_q_reg[0]  ( .D(n71), .CK(CLK), .RN(RST), .Q(addr_q[0]) );
  DFFRQX2M \cur_state_reg[2]  ( .D(n76), .CK(CLK), .RN(RST), .Q(cur_state[2])
         );
  DFFRQX2M \cur_state_reg[1]  ( .D(n77), .CK(CLK), .RN(RST), .Q(cur_state[1])
         );
  DFFRQX2M \cur_state_reg[0]  ( .D(n78), .CK(CLK), .RN(RST), .Q(cur_state[0])
         );
  DFFRQX2M \cur_state_reg[3]  ( .D(n75), .CK(CLK), .RN(RST), .Q(cur_state[3])
         );
  DFFRQX2M ALU_CMD_reg ( .D(n70), .CK(CLK), .RN(RST), .Q(CLK_EN) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  OAI22X1M U5 ( .A0(n91), .A1(n55), .B0(n79), .B1(n67), .Y(Address[1]) );
  OAI22X1M U6 ( .A0(n89), .A1(n55), .B0(n51), .B1(n67), .Y(Address[3]) );
  OAI22X1M U7 ( .A0(n90), .A1(n55), .B0(n58), .B1(n67), .Y(Address[2]) );
  OAI21X2M U8 ( .A0(n92), .A1(n55), .B0(n69), .Y(Address[0]) );
  NOR3X2M U9 ( .A(cur_state[0]), .B(cur_state[1]), .C(n46), .Y(n21) );
  NAND2X2M U10 ( .A(n27), .B(n55), .Y(n67) );
  INVX2M U11 ( .A(n68), .Y(n84) );
  INVX2M U12 ( .A(n39), .Y(N147) );
  NAND2X2M U13 ( .A(n66), .B(n87), .Y(n55) );
  NOR2X2M U14 ( .A(n36), .B(n84), .Y(n27) );
  NAND3X2M U15 ( .A(n85), .B(n86), .C(n54), .Y(n68) );
  NOR2X2M U16 ( .A(n83), .B(n21), .Y(n57) );
  INVX2M U17 ( .A(n28), .Y(n33) );
  OAI21X2M U18 ( .A0(n29), .A1(n38), .B0(n39), .Y(n24) );
  NOR2X2M U19 ( .A(n86), .B(n85), .Y(n52) );
  OAI211X2M U20 ( .A0(n33), .A1(n87), .B0(n19), .C0(n20), .Y(n75) );
  OAI2B1X2M U21 ( .A1N(n23), .A0(n24), .B0(n33), .Y(n19) );
  NOR2X2M U22 ( .A(n21), .B(n22), .Y(n20) );
  OAI21X2M U23 ( .A0(n33), .A1(n88), .B0(n26), .Y(n76) );
  AO21XLM U24 ( .A0(n2), .A1(n27), .B0(n28), .Y(n26) );
  NOR2X2M U25 ( .A(n52), .B(n46), .Y(Wr_inc) );
  NAND2X2M U26 ( .A(n52), .B(n15), .Y(n39) );
  NAND3X2M U27 ( .A(n85), .B(n86), .C(n15), .Y(n4) );
  INVX2M U28 ( .A(n38), .Y(n83) );
  INVX2M U29 ( .A(FIFO_Full), .Y(n29) );
  NOR2X2M U30 ( .A(n53), .B(n82), .Y(WrEn) );
  AOI21BX2M U31 ( .A0(n54), .A1(n86), .B0N(n55), .Y(n53) );
  NOR2X2M U32 ( .A(n82), .B(n23), .Y(EN) );
  OAI22X1M U33 ( .A0(n81), .A1(n91), .B0(n8), .B1(n79), .Y(n72) );
  OAI22X1M U34 ( .A0(n81), .A1(n92), .B0(n80), .B1(n8), .Y(n71) );
  OAI22X1M U35 ( .A0(n81), .A1(n90), .B0(n58), .B1(n8), .Y(n73) );
  OAI22X1M U36 ( .A0(n81), .A1(n89), .B0(n51), .B1(n8), .Y(n74) );
  NAND4X2M U37 ( .A(n80), .B(n58), .C(n48), .D(n37), .Y(n50) );
  INVX2M U38 ( .A(n8), .Y(n81) );
  OAI211X2M U39 ( .A0(n36), .A1(RX_P_DATA[0]), .B0(n55), .C0(n68), .Y(n69) );
  NOR3X2M U40 ( .A(cur_state[0]), .B(cur_state[2]), .C(n86), .Y(n66) );
  NOR2X2M U41 ( .A(n88), .B(cur_state[3]), .Y(n54) );
  INVX2M U42 ( .A(cur_state[1]), .Y(n86) );
  AND3X2M U43 ( .A(n54), .B(cur_state[0]), .C(n86), .Y(n36) );
  INVX2M U44 ( .A(cur_state[0]), .Y(n85) );
  INVX2M U45 ( .A(cur_state[3]), .Y(n87) );
  INVX2M U46 ( .A(cur_state[2]), .Y(n88) );
  INVX2M U47 ( .A(RX_P_DATA[1]), .Y(n79) );
  OAI222X1M U48 ( .A0(ALU_OUT_Valid), .A1(n23), .B0(RX_D_VLD), .B1(n47), .C0(
        RF_RdData_Valid), .C1(n38), .Y(n28) );
  NOR2BX2M U49 ( .AN(n27), .B(n15), .Y(n47) );
  NOR3BX2M U50 ( .AN(RX_P_DATA[7]), .B(n51), .C(n4), .Y(n30) );
  NOR2X2M U51 ( .A(cur_state[2]), .B(cur_state[3]), .Y(n15) );
  NOR3X2M U52 ( .A(n46), .B(cur_state[1]), .C(n29), .Y(n22) );
  OAI221X1M U53 ( .A0(n34), .A1(n28), .B0(n33), .B1(n86), .C0(n35), .Y(n77) );
  AOI211X2M U54 ( .A0(cur_state[0]), .A1(n15), .B0(n24), .C0(n36), .Y(n34) );
  NAND4X2M U55 ( .A(n33), .B(n30), .C(n42), .D(n43), .Y(n35) );
  NOR2X2M U56 ( .A(n48), .B(n80), .Y(n42) );
  AOI221XLM U57 ( .A0(n79), .A1(n37), .B0(RX_P_DATA[1]), .B1(RX_P_DATA[2]), 
        .C0(n44), .Y(n43) );
  OAI22X1M U58 ( .A0(n37), .A1(n45), .B0(RX_P_DATA[5]), .B1(RX_P_DATA[2]), .Y(
        n44) );
  OAI2BB1X2M U59 ( .A0N(ALU_OUT[0]), .A1N(n21), .B0(n65), .Y(FIFO_RF_WrData[0]) );
  AOI22X1M U60 ( .A0(ALU_OUT[8]), .A1(n57), .B0(RF_RdData[0]), .B1(n83), .Y(
        n65) );
  OAI2BB1X2M U61 ( .A0N(ALU_OUT[1]), .A1N(n21), .B0(n64), .Y(FIFO_RF_WrData[1]) );
  AOI22X1M U62 ( .A0(ALU_OUT[9]), .A1(n57), .B0(RF_RdData[1]), .B1(n83), .Y(
        n64) );
  OAI2BB1X2M U63 ( .A0N(ALU_OUT[2]), .A1N(n21), .B0(n63), .Y(FIFO_RF_WrData[2]) );
  AOI22X1M U64 ( .A0(ALU_OUT[10]), .A1(n57), .B0(RF_RdData[2]), .B1(n83), .Y(
        n63) );
  OAI2BB1X2M U65 ( .A0N(ALU_OUT[3]), .A1N(n21), .B0(n62), .Y(FIFO_RF_WrData[3]) );
  AOI22X1M U66 ( .A0(ALU_OUT[11]), .A1(n57), .B0(RF_RdData[3]), .B1(n83), .Y(
        n62) );
  OAI2BB1X2M U67 ( .A0N(ALU_OUT[4]), .A1N(n21), .B0(n61), .Y(FIFO_RF_WrData[4]) );
  AOI22X1M U68 ( .A0(ALU_OUT[12]), .A1(n57), .B0(RF_RdData[4]), .B1(n83), .Y(
        n61) );
  OAI2BB1X2M U69 ( .A0N(ALU_OUT[5]), .A1N(n21), .B0(n60), .Y(FIFO_RF_WrData[5]) );
  AOI22X1M U70 ( .A0(ALU_OUT[13]), .A1(n57), .B0(RF_RdData[5]), .B1(n83), .Y(
        n60) );
  OAI2BB1X2M U71 ( .A0N(ALU_OUT[6]), .A1N(n21), .B0(n59), .Y(FIFO_RF_WrData[6]) );
  AOI22X1M U72 ( .A0(ALU_OUT[14]), .A1(n57), .B0(RF_RdData[6]), .B1(n83), .Y(
        n59) );
  OAI2BB1X2M U73 ( .A0N(ALU_OUT[7]), .A1N(n21), .B0(n56), .Y(FIFO_RF_WrData[7]) );
  AOI22X1M U74 ( .A0(ALU_OUT[15]), .A1(n57), .B0(RF_RdData[7]), .B1(n83), .Y(
        n56) );
  OAI211X2M U75 ( .A0(n40), .A1(n28), .B0(n41), .C0(n35), .Y(n78) );
  AOI211X2M U76 ( .A0(n21), .A1(n29), .B0(n84), .C0(n49), .Y(n40) );
  OAI21X2M U77 ( .A0(n22), .A1(n28), .B0(cur_state[0]), .Y(n41) );
  NOR4BX1M U78 ( .AN(n30), .B(n50), .C(n45), .D(n79), .Y(n49) );
  NAND4X2M U79 ( .A(n79), .B(n45), .C(n30), .D(n31), .Y(n2) );
  NOR3X2M U80 ( .A(n32), .B(n58), .C(n37), .Y(n31) );
  CLKXOR2X2M U81 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .Y(n32) );
  NAND2X2M U82 ( .A(cur_state[3]), .B(n88), .Y(n46) );
  NAND2X2M U83 ( .A(n66), .B(cur_state[3]), .Y(n38) );
  OAI21X2M U84 ( .A0(n82), .A1(n2), .B0(n3), .Y(n70) );
  OAI21X2M U85 ( .A0(n4), .A1(n82), .B0(CLK_EN), .Y(n3) );
  NAND2X2M U86 ( .A(cur_state[1]), .B(n54), .Y(n23) );
  INVX2M U87 ( .A(RX_P_DATA[2]), .Y(n58) );
  INVX2M U88 ( .A(RX_D_VLD), .Y(n82) );
  INVX2M U89 ( .A(RX_P_DATA[3]), .Y(n51) );
  INVX2M U90 ( .A(addr_q[1]), .Y(n91) );
  INVX2M U91 ( .A(addr_q[2]), .Y(n90) );
  INVX2M U92 ( .A(addr_q[3]), .Y(n89) );
  INVX2M U93 ( .A(addr_q[0]), .Y(n92) );
  NAND4X2M U94 ( .A(cur_state[0]), .B(RX_D_VLD), .C(n15), .D(n86), .Y(n8) );
  INVX2M U95 ( .A(RX_P_DATA[0]), .Y(n80) );
  INVX2M U96 ( .A(RX_P_DATA[6]), .Y(n37) );
  INVX2M U97 ( .A(RX_P_DATA[5]), .Y(n45) );
  INVX2M U98 ( .A(RX_P_DATA[4]), .Y(n48) );
  BUFX2M U99 ( .A(RX_P_DATA[7]), .Y(RF_WrData[7]) );
  BUFX2M U100 ( .A(RX_P_DATA[6]), .Y(RF_WrData[6]) );
  BUFX2M U101 ( .A(RX_P_DATA[5]), .Y(RF_WrData[5]) );
  BUFX2M U102 ( .A(RX_P_DATA[4]), .Y(RF_WrData[4]) );
  BUFX2M U103 ( .A(RX_P_DATA[3]), .Y(ALU_FUN[3]) );
  BUFX2M U104 ( .A(RX_P_DATA[3]), .Y(RF_WrData[3]) );
  BUFX2M U105 ( .A(RX_P_DATA[2]), .Y(ALU_FUN[2]) );
  BUFX2M U106 ( .A(RX_P_DATA[2]), .Y(RF_WrData[2]) );
  BUFX2M U107 ( .A(RX_P_DATA[1]), .Y(ALU_FUN[1]) );
  BUFX2M U108 ( .A(RX_P_DATA[1]), .Y(RF_WrData[1]) );
  BUFX2M U109 ( .A(RX_P_DATA[0]), .Y(ALU_FUN[0]) );
  BUFX2M U110 ( .A(RX_P_DATA[0]), .Y(RF_WrData[0]) );
endmodule


module Sync_chin_NUM_STAGES2 ( in_data, clk, rst, out_data );
  input in_data, clk, rst;
  output out_data;
  wire   \flip_flops[1] ;

  DFFRQX2M \flip_flops_reg[0]  ( .D(\flip_flops[1] ), .CK(clk), .RN(rst), .Q(
        out_data) );
  DFFRQX2M \flip_flops_reg[1]  ( .D(in_data), .CK(clk), .RN(rst), .Q(
        \flip_flops[1] ) );
endmodule


module Pulse_Gen ( en, clk, rst, en_pulse );
  input en, clk, rst;
  output en_pulse;
  wire   en_reg;

  DFFRQX2M en_reg_reg ( .D(en), .CK(clk), .RN(rst), .Q(en_reg) );
  NOR2BX2M U3 ( .AN(en), .B(en_reg), .Y(en_pulse) );
endmodule


module DATA_SYNC_BUS_WIDTH8_NUM_STAGES2 ( unsync_bus, bus_enable, CLK, RST, 
        sync_bus, enable_pulse );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, CLK, RST;
  output enable_pulse;
  wire   enabel_sync_out, en_pulse, n2, n3, n4, n5, n6, n7, n8, n9, n1;

  Sync_chin_NUM_STAGES2 Multi_flops ( .in_data(bus_enable), .clk(CLK), .rst(
        RST), .out_data(enabel_sync_out) );
  Pulse_Gen Pulse_Gen ( .en(enabel_sync_out), .clk(CLK), .rst(RST), .en_pulse(
        en_pulse) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M enable_pulse_reg ( .D(en_pulse), .CK(CLK), .RN(RST), .Q(
        enable_pulse) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  INVX2M U3 ( .A(en_pulse), .Y(n1) );
  AO22X1M U4 ( .A0(unsync_bus[0]), .A1(en_pulse), .B0(sync_bus[0]), .B1(n1), 
        .Y(n2) );
  AO22X1M U5 ( .A0(unsync_bus[1]), .A1(en_pulse), .B0(sync_bus[1]), .B1(n1), 
        .Y(n3) );
  AO22X1M U6 ( .A0(unsync_bus[2]), .A1(en_pulse), .B0(sync_bus[2]), .B1(n1), 
        .Y(n4) );
  AO22X1M U7 ( .A0(unsync_bus[3]), .A1(en_pulse), .B0(sync_bus[3]), .B1(n1), 
        .Y(n5) );
  AO22X1M U8 ( .A0(unsync_bus[4]), .A1(en_pulse), .B0(sync_bus[4]), .B1(n1), 
        .Y(n6) );
  AO22X1M U9 ( .A0(unsync_bus[5]), .A1(en_pulse), .B0(sync_bus[5]), .B1(n1), 
        .Y(n7) );
  AO22X1M U10 ( .A0(unsync_bus[6]), .A1(en_pulse), .B0(sync_bus[6]), .B1(n1), 
        .Y(n8) );
  AO22X1M U11 ( .A0(unsync_bus[7]), .A1(en_pulse), .B0(sync_bus[7]), .B1(n1), 
        .Y(n9) );
endmodule


module TX_Counter_DATA_WIDTH8 ( CLK, RST, count );
  output [2:0] count;
  input CLK, RST;
  wire   N2, N3, n1, n2;

  DFFRQX2M \count_reg[2]  ( .D(N3), .CK(CLK), .RN(RST), .Q(count[2]) );
  DFFRQX2M \count_reg[1]  ( .D(N2), .CK(CLK), .RN(RST), .Q(count[1]) );
  DFFRQX2M \count_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(count[0]) );
  XNOR2X2M U3 ( .A(count[1]), .B(n2), .Y(N2) );
  INVX2M U4 ( .A(count[0]), .Y(n2) );
  XNOR2X2M U5 ( .A(count[2]), .B(n1), .Y(N3) );
  NAND2X2M U6 ( .A(count[1]), .B(count[0]), .Y(n1) );
endmodule


module TX_FSM_DATA_WIDTH8 ( DATA_VAILD, PAR_EN, CLK, RST, ser_en, busy, 
        mux_sel );
  output [1:0] mux_sel;
  input DATA_VAILD, PAR_EN, CLK, RST;
  output ser_en, busy;
  wire   ser_done, N56, N58, n6, n7, n8, n9, n10, n11, n1, n2, n3, n4, n5;
  wire   [2:0] cur_state;
  wire   [2:0] count;
  wire   [2:0] next_state;
  assign ser_en = N56;
  assign busy = N58;

  TX_Counter_DATA_WIDTH8 counter ( .CLK(CLK), .RST(N56), .count(count) );
  DFFRQX2M ser_done_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(ser_done) );
  DFFRQX2M \cur_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        cur_state[1]) );
  DFFRQX2M \cur_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        cur_state[2]) );
  DFFRQX2M \cur_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        cur_state[0]) );
  NOR2X2M U3 ( .A(n3), .B(cur_state[0]), .Y(N56) );
  NAND2X2M U4 ( .A(n11), .B(n5), .Y(mux_sel[0]) );
  NAND2X2M U5 ( .A(n7), .B(n5), .Y(N58) );
  INVX2M U6 ( .A(mux_sel[1]), .Y(n3) );
  XNOR2X2M U7 ( .A(cur_state[1]), .B(n2), .Y(n11) );
  INVX2M U8 ( .A(cur_state[0]), .Y(n2) );
  NOR2X2M U9 ( .A(n11), .B(cur_state[0]), .Y(n7) );
  NOR2X2M U10 ( .A(n4), .B(cur_state[2]), .Y(mux_sel[1]) );
  INVX2M U11 ( .A(cur_state[2]), .Y(n5) );
  INVX2M U12 ( .A(cur_state[1]), .Y(n4) );
  OAI21X2M U13 ( .A0(n8), .A1(n3), .B0(n9), .Y(next_state[0]) );
  NOR2X2M U14 ( .A(cur_state[0]), .B(ser_done), .Y(n8) );
  NAND4X2M U15 ( .A(DATA_VAILD), .B(n2), .C(n4), .D(n5), .Y(n9) );
  NOR2X2M U16 ( .A(cur_state[2]), .B(n7), .Y(next_state[1]) );
  NOR2X2M U17 ( .A(n6), .B(n3), .Y(next_state[2]) );
  AOI2B1X1M U18 ( .A1N(PAR_EN), .A0(ser_done), .B0(cur_state[0]), .Y(n6) );
  INVX2M U19 ( .A(n10), .Y(n1) );
  NAND3BX2M U20 ( .AN(count[0]), .B(count[1]), .C(count[2]), .Y(n10) );
endmodule


module serializer_DATA_WIDTH8 ( P_DATA, CLK, RST, ser_enable, ser_data );
  input [7:0] P_DATA;
  input CLK, RST, ser_enable;
  output ser_data;
  wire   N4, N5, N6, N7, N8, N9, N10, n3, n1, n2;
  wire   [7:1] DATA;

  DFFRQX2M \DATA_reg[6]  ( .D(N10), .CK(CLK), .RN(RST), .Q(DATA[6]) );
  DFFRQX2M \DATA_reg[5]  ( .D(N9), .CK(CLK), .RN(RST), .Q(DATA[5]) );
  DFFRQX2M \DATA_reg[4]  ( .D(N8), .CK(CLK), .RN(RST), .Q(DATA[4]) );
  DFFRQX2M \DATA_reg[3]  ( .D(N7), .CK(CLK), .RN(RST), .Q(DATA[3]) );
  DFFRQX2M \DATA_reg[2]  ( .D(N6), .CK(CLK), .RN(RST), .Q(DATA[2]) );
  DFFRQX2M \DATA_reg[1]  ( .D(N5), .CK(CLK), .RN(RST), .Q(DATA[1]) );
  DFFRQX2M \DATA_reg[7]  ( .D(n3), .CK(CLK), .RN(RST), .Q(DATA[7]) );
  DFFRQX2M \DATA_reg[0]  ( .D(N4), .CK(CLK), .RN(RST), .Q(ser_data) );
  OAI2BB2X1M U3 ( .B0(n1), .B1(n2), .A0N(P_DATA[6]), .A1N(n2), .Y(N10) );
  OAI2BB2X1M U4 ( .B0(n1), .B1(n2), .A0N(P_DATA[7]), .A1N(n2), .Y(n3) );
  INVX2M U5 ( .A(ser_enable), .Y(n2) );
  AO22X1M U6 ( .A0(P_DATA[0]), .A1(n2), .B0(DATA[1]), .B1(ser_enable), .Y(N4)
         );
  AO22X1M U7 ( .A0(P_DATA[1]), .A1(n2), .B0(DATA[2]), .B1(ser_enable), .Y(N5)
         );
  AO22X1M U8 ( .A0(P_DATA[2]), .A1(n2), .B0(DATA[3]), .B1(ser_enable), .Y(N6)
         );
  AO22X1M U9 ( .A0(P_DATA[3]), .A1(n2), .B0(DATA[4]), .B1(ser_enable), .Y(N7)
         );
  AO22X1M U10 ( .A0(P_DATA[4]), .A1(n2), .B0(DATA[5]), .B1(ser_enable), .Y(N8)
         );
  AO22X1M U11 ( .A0(P_DATA[5]), .A1(n2), .B0(DATA[6]), .B1(ser_enable), .Y(N9)
         );
  INVX2M U12 ( .A(DATA[7]), .Y(n1) );
endmodule


module parity_calc_DATA_WIDTH8 ( P_DATA, PAR_TYP, PAR_BIT );
  input [7:0] P_DATA;
  input PAR_TYP;
  output PAR_BIT;
  wire   n1, n2, n3, n4;

  XNOR2X2M U1 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n4) );
  XOR3XLM U2 ( .A(PAR_TYP), .B(n1), .C(n2), .Y(PAR_BIT) );
  XOR3XLM U3 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n3), .Y(n2) );
  XOR3XLM U4 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n4), .Y(n1) );
  XNOR2X2M U5 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n3) );
endmodule


module MUX_4to1_DATA_WIDTH1 ( I0, I1, I2, I3, sel, Y );
  input [1:0] sel;
  input I0, I1, I2, I3;
  output Y;
  wire   n2, n3, n1;

  OAI2B2X4M U1 ( .A1N(sel[1]), .A0(n2), .B0(sel[1]), .B1(n3), .Y(Y) );
  AOI22X1M U2 ( .A0(I0), .A1(n1), .B0(sel[0]), .B1(I1), .Y(n3) );
  AOI22X1M U3 ( .A0(I2), .A1(n1), .B0(I3), .B1(sel[0]), .Y(n2) );
  INVX2M U4 ( .A(sel[0]), .Y(n1) );
endmodule


module UART_TX_DATA_WIDTH8 ( CLK, RST, PAR_EN, PAR_TYP, P_DATA, DATA_VAILD, 
        TX_OUT, busy );
  input [7:0] P_DATA;
  input CLK, RST, PAR_EN, PAR_TYP, DATA_VAILD;
  output TX_OUT, busy;
  wire   ser_enable, ser_data, par_bit, n2, n3, n4, n5, n6, n7, n8, n9, n1,
         n10, n11;
  wire   [1:0] mux_sel;
  wire   [7:0] data_q;

  TX_FSM_DATA_WIDTH8 control_unit ( .DATA_VAILD(DATA_VAILD), .PAR_EN(PAR_EN), 
        .CLK(CLK), .RST(n1), .ser_en(ser_enable), .busy(busy), .mux_sel(
        mux_sel) );
  serializer_DATA_WIDTH8 ser ( .P_DATA(P_DATA), .CLK(CLK), .RST(n1), 
        .ser_enable(ser_enable), .ser_data(ser_data) );
  parity_calc_DATA_WIDTH8 parity_calc_unit ( .P_DATA(data_q), .PAR_TYP(PAR_TYP), .PAR_BIT(par_bit) );
  MUX_4to1_DATA_WIDTH1 TX_MUX ( .I0(1'b0), .I1(1'b1), .I2(ser_data), .I3(
        par_bit), .sel(mux_sel), .Y(TX_OUT) );
  DFFRQX2M \data_q_reg[5]  ( .D(n7), .CK(CLK), .RN(n1), .Q(data_q[5]) );
  DFFRQX2M \data_q_reg[1]  ( .D(n3), .CK(CLK), .RN(n1), .Q(data_q[1]) );
  DFFRQX2M \data_q_reg[4]  ( .D(n6), .CK(CLK), .RN(n1), .Q(data_q[4]) );
  DFFRQX2M \data_q_reg[0]  ( .D(n2), .CK(CLK), .RN(n1), .Q(data_q[0]) );
  DFFRQX2M \data_q_reg[7]  ( .D(n9), .CK(CLK), .RN(n1), .Q(data_q[7]) );
  DFFRQX2M \data_q_reg[3]  ( .D(n5), .CK(CLK), .RN(n1), .Q(data_q[3]) );
  DFFRQX2M \data_q_reg[6]  ( .D(n8), .CK(CLK), .RN(n1), .Q(data_q[6]) );
  DFFRQX2M \data_q_reg[2]  ( .D(n4), .CK(CLK), .RN(n1), .Q(data_q[2]) );
  INVX2M U3 ( .A(busy), .Y(n11) );
  INVX2M U4 ( .A(n10), .Y(n1) );
  INVX2M U5 ( .A(RST), .Y(n10) );
  AO22X1M U6 ( .A0(data_q[0]), .A1(busy), .B0(P_DATA[0]), .B1(n11), .Y(n2) );
  AO22X1M U7 ( .A0(data_q[1]), .A1(busy), .B0(P_DATA[1]), .B1(n11), .Y(n3) );
  AO22X1M U8 ( .A0(data_q[2]), .A1(busy), .B0(P_DATA[2]), .B1(n11), .Y(n4) );
  AO22X1M U9 ( .A0(data_q[3]), .A1(busy), .B0(P_DATA[3]), .B1(n11), .Y(n5) );
  AO22X1M U10 ( .A0(data_q[4]), .A1(busy), .B0(P_DATA[4]), .B1(n11), .Y(n6) );
  AO22X1M U11 ( .A0(data_q[5]), .A1(busy), .B0(P_DATA[5]), .B1(n11), .Y(n7) );
  AO22X1M U12 ( .A0(data_q[6]), .A1(busy), .B0(P_DATA[6]), .B1(n11), .Y(n8) );
  AO22X1M U13 ( .A0(data_q[7]), .A1(busy), .B0(P_DATA[7]), .B1(n11), .Y(n9) );
endmodule


module FSM ( PAR_EN, RX_IN, CLK, RST, edge_cnt, bit_cnt, parity_error, 
        start_glitch, stp_error, data_sample_en, edge_counter_en, deser_en, 
        data_valid, stp_chk_en, start_chk_en, par_chk_en );
  input [4:0] edge_cnt;
  input [3:0] bit_cnt;
  input PAR_EN, RX_IN, CLK, RST, parity_error, start_glitch, stp_error;
  output data_sample_en, edge_counter_en, deser_en, data_valid, stp_chk_en,
         start_chk_en, par_chk_en;
  wire   data_valid_comb, N52, N56, N60, N64, n10, n11, n12, n13, n14, n15,
         n16, n18, n19, n20, n21, n22, n23, n24, n25, n1, n3, n4, n5, n6, n7,
         n8, n9;
  wire   [3:0] prev_bit_cnt;
  wire   [2:0] cur_state;
  assign data_sample_en = N52;
  assign deser_en = N56;
  assign stp_chk_en = N60;
  assign start_chk_en = N64;

  DFFRQX2M \prev_bit_cnt_reg[3]  ( .D(bit_cnt[3]), .CK(CLK), .RN(RST), .Q(
        prev_bit_cnt[3]) );
  DFFRQX2M \prev_bit_cnt_reg[2]  ( .D(bit_cnt[2]), .CK(CLK), .RN(RST), .Q(
        prev_bit_cnt[2]) );
  DFFRQX2M \prev_bit_cnt_reg[1]  ( .D(bit_cnt[1]), .CK(CLK), .RN(RST), .Q(
        prev_bit_cnt[1]) );
  DFFRQX2M \prev_bit_cnt_reg[0]  ( .D(bit_cnt[0]), .CK(CLK), .RN(RST), .Q(
        prev_bit_cnt[0]) );
  DFFRQX2M \cur_state_reg[0]  ( .D(n25), .CK(CLK), .RN(RST), .Q(cur_state[0])
         );
  DFFRQX2M \cur_state_reg[1]  ( .D(n24), .CK(CLK), .RN(RST), .Q(cur_state[1])
         );
  DFFRQX2M \cur_state_reg[2]  ( .D(n23), .CK(CLK), .RN(RST), .Q(cur_state[2])
         );
  DFFRQX2M data_valid_reg ( .D(data_valid_comb), .CK(CLK), .RN(RST), .Q(
        data_valid) );
  NOR3X2M U3 ( .A(cur_state[0]), .B(cur_state[2]), .C(n6), .Y(N56) );
  OAI222X1M U4 ( .A0(n9), .A1(n11), .B0(RX_IN), .B1(N52), .C0(n7), .C1(n10), 
        .Y(n25) );
  OAI31X1M U5 ( .A0(N64), .A1(N60), .A2(n12), .B0(n4), .Y(n10) );
  OAI211X2M U6 ( .A0(n6), .A1(n10), .B0(n13), .C0(n14), .Y(n24) );
  NAND3BX2M U7 ( .AN(start_glitch), .B(n15), .C(N64), .Y(n14) );
  OAI2BB1X2M U8 ( .A0N(n9), .A1N(n16), .B0(N56), .Y(n13) );
  NAND2X2M U9 ( .A(n16), .B(N56), .Y(n11) );
  INVX2M U10 ( .A(n12), .Y(n5) );
  INVX2M U11 ( .A(n15), .Y(n4) );
  NOR3X2M U12 ( .A(cur_state[0]), .B(cur_state[1]), .C(n8), .Y(N60) );
  INVX2M U13 ( .A(cur_state[1]), .Y(n6) );
  INVX2M U14 ( .A(cur_state[0]), .Y(n7) );
  INVX2M U15 ( .A(cur_state[2]), .Y(n8) );
  NOR4X1M U16 ( .A(n1), .B(bit_cnt[1]), .C(bit_cnt[2]), .D(n4), .Y(n16) );
  NAND2X2M U17 ( .A(bit_cnt[0]), .B(bit_cnt[3]), .Y(n1) );
  OAI222X1M U18 ( .A0(n8), .A1(n10), .B0(PAR_EN), .B1(n11), .C0(n3), .C1(n5), 
        .Y(n23) );
  INVX2M U19 ( .A(n10), .Y(n3) );
  NOR3X2M U20 ( .A(n7), .B(cur_state[2]), .C(n6), .Y(n12) );
  NOR3X2M U21 ( .A(cur_state[1]), .B(cur_state[2]), .C(n7), .Y(N64) );
  XNOR2X2M U22 ( .A(bit_cnt[0]), .B(prev_bit_cnt[0]), .Y(n21) );
  NOR3X2M U23 ( .A(n18), .B(stp_error), .C(n4), .Y(data_valid_comb) );
  OAI2BB1X2M U24 ( .A0N(parity_error), .A1N(PAR_EN), .B0(N60), .Y(n18) );
  NOR2X2M U25 ( .A(n5), .B(n9), .Y(par_chk_en) );
  NAND4X2M U26 ( .A(n19), .B(n20), .C(n21), .D(n22), .Y(n15) );
  XNOR2X2M U27 ( .A(bit_cnt[3]), .B(prev_bit_cnt[3]), .Y(n19) );
  XNOR2X2M U28 ( .A(bit_cnt[1]), .B(prev_bit_cnt[1]), .Y(n20) );
  XNOR2X2M U29 ( .A(bit_cnt[2]), .B(prev_bit_cnt[2]), .Y(n22) );
  INVX2M U30 ( .A(PAR_EN), .Y(n9) );
  BUFX2M U31 ( .A(N52), .Y(edge_counter_en) );
  NAND3X2M U32 ( .A(n6), .B(n8), .C(n7), .Y(N52) );
endmodule


module edge_bit_counter ( enable, CLK, RST, prescale, bit_cnt, edge_cnt, 
        bit_tick );
  input [5:0] prescale;
  output [3:0] bit_cnt;
  output [4:0] edge_cnt;
  input enable, CLK, RST;
  output bit_tick;
  wire   N10, N11, N12, N14, N15, N16, N17, N18, n5, n6, n7, n8, n9, n10, n11,
         \add_30/carry[4] , \add_30/carry[3] , \add_30/carry[2] , n1, n2, n3,
         n4, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;
  wire   [4:0] sample_rate;

  DFFRQX2M \bit_cnt_reg[3]  ( .D(n7), .CK(CLK), .RN(n11), .Q(bit_cnt[3]) );
  DFFRQX2M \bit_cnt_reg[1]  ( .D(n9), .CK(CLK), .RN(n11), .Q(bit_cnt[1]) );
  DFFRQX2M \bit_cnt_reg[2]  ( .D(n8), .CK(CLK), .RN(n11), .Q(bit_cnt[2]) );
  DFFRQX2M \bit_cnt_reg[0]  ( .D(n10), .CK(CLK), .RN(n11), .Q(bit_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[4]  ( .D(N18), .CK(CLK), .RN(n11), .Q(edge_cnt[4]) );
  DFFRQX2M \edge_cnt_reg[3]  ( .D(N17), .CK(CLK), .RN(n11), .Q(edge_cnt[3]) );
  DFFRQX2M \edge_cnt_reg[2]  ( .D(N16), .CK(CLK), .RN(n11), .Q(edge_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[1]  ( .D(N15), .CK(CLK), .RN(n11), .Q(edge_cnt[1]) );
  DFFRQX2M \edge_cnt_reg[0]  ( .D(N14), .CK(CLK), .RN(n11), .Q(edge_cnt[0]) );
  AND2X2M U3 ( .A(enable), .B(RST), .Y(n11) );
  NOR2BXLM U4 ( .AN(N10), .B(bit_tick), .Y(N15) );
  NOR2BXLM U5 ( .AN(N11), .B(bit_tick), .Y(N16) );
  NOR2BXLM U6 ( .AN(N12), .B(bit_tick), .Y(N17) );
  NAND2XLM U7 ( .A(bit_tick), .B(bit_cnt[0]), .Y(n6) );
  NOR2BX2M U8 ( .AN(bit_cnt[1]), .B(n6), .Y(n5) );
  XNOR2X2M U9 ( .A(bit_cnt[3]), .B(n1), .Y(n7) );
  NAND2X2M U10 ( .A(n5), .B(bit_cnt[2]), .Y(n1) );
  XNOR2X2M U11 ( .A(bit_cnt[1]), .B(n6), .Y(n9) );
  XOR2XLM U12 ( .A(bit_tick), .B(bit_cnt[0]), .Y(n10) );
  CLKXOR2X2M U13 ( .A(bit_cnt[2]), .B(n5), .Y(n8) );
  NOR2X2M U14 ( .A(n2), .B(bit_tick), .Y(N18) );
  XNOR2X2M U15 ( .A(\add_30/carry[4] ), .B(edge_cnt[4]), .Y(n2) );
  NOR2X2M U16 ( .A(edge_cnt[0]), .B(bit_tick), .Y(N14) );
  ADDHX1M U17 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_30/carry[2] ), .S(
        N10) );
  ADDHX1M U18 ( .A(edge_cnt[2]), .B(\add_30/carry[2] ), .CO(\add_30/carry[3] ), 
        .S(N11) );
  ADDHX1M U19 ( .A(edge_cnt[3]), .B(\add_30/carry[3] ), .CO(\add_30/carry[4] ), 
        .S(N12) );
  INVX2M U20 ( .A(prescale[2]), .Y(n13) );
  CLKINVX1M U21 ( .A(prescale[0]), .Y(sample_rate[0]) );
  NOR2X1M U22 ( .A(prescale[1]), .B(prescale[0]), .Y(n3) );
  AO21XLM U23 ( .A0(prescale[0]), .A1(prescale[1]), .B0(n3), .Y(sample_rate[1]) );
  CLKNAND2X2M U24 ( .A(n3), .B(n13), .Y(n4) );
  OAI21X1M U25 ( .A0(n3), .A1(n13), .B0(n4), .Y(sample_rate[2]) );
  XNOR2X1M U26 ( .A(prescale[3]), .B(n4), .Y(sample_rate[3]) );
  NOR2X1M U27 ( .A(prescale[3]), .B(n4), .Y(n12) );
  CLKXOR2X2M U28 ( .A(prescale[4]), .B(n12), .Y(sample_rate[4]) );
  CLKXOR2X2M U29 ( .A(sample_rate[2]), .B(edge_cnt[2]), .Y(n21) );
  NOR2BX1M U30 ( .AN(sample_rate[0]), .B(edge_cnt[0]), .Y(n14) );
  OAI2B2X1M U31 ( .A1N(edge_cnt[1]), .A0(n14), .B0(sample_rate[1]), .B1(n14), 
        .Y(n17) );
  NOR2BX1M U32 ( .AN(edge_cnt[0]), .B(sample_rate[0]), .Y(n15) );
  OAI2B2X1M U33 ( .A1N(sample_rate[1]), .A0(n15), .B0(edge_cnt[1]), .B1(n15), 
        .Y(n16) );
  CLKNAND2X2M U34 ( .A(n17), .B(n16), .Y(n20) );
  CLKXOR2X2M U35 ( .A(sample_rate[3]), .B(edge_cnt[3]), .Y(n19) );
  CLKXOR2X2M U36 ( .A(sample_rate[4]), .B(edge_cnt[4]), .Y(n18) );
  NOR4X1M U37 ( .A(n21), .B(n20), .C(n19), .D(n18), .Y(bit_tick) );
endmodule


module data_sampling ( edge_cnt, data_sample_en, RX_IN, prescale, CLK, RST, 
        sampled_bit );
  input [4:0] edge_cnt;
  input [5:0] prescale;
  input data_sample_en, RX_IN, CLK, RST;
  output sampled_bit;
  wire   N8, N11, N12, N13, N14, N15, N16, N17, N20, N21, N22, N23, N24, N25,
         n12, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, \add_28/carry[4] , \add_28/carry[3] , \add_28/carry[2] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47;
  wire   [2:0] samples;

  DFFRQX2M \samples_reg[0]  ( .D(n29), .CK(CLK), .RN(RST), .Q(samples[0]) );
  DFFRQX2M \samples_reg[1]  ( .D(n30), .CK(CLK), .RN(RST), .Q(samples[1]) );
  DFFRX1M \samples_reg[2]  ( .D(n31), .CK(CLK), .RN(RST), .QN(n12) );
  NOR4X1M U3 ( .A(prescale[2]), .B(prescale[1]), .C(prescale[0]), .D(n28), .Y(
        n23) );
  NAND3X2M U4 ( .A(N8), .B(n23), .C(RX_IN), .Y(n22) );
  OAI211X2M U5 ( .A0(n24), .A1(n43), .B0(n25), .C0(n22), .Y(n30) );
  AOI21X2M U6 ( .A0(N17), .A1(n47), .B0(n45), .Y(n24) );
  NAND3X2M U7 ( .A(N8), .B(n46), .C(RX_IN), .Y(n25) );
  OAI211X2M U8 ( .A0(n20), .A1(n44), .B0(n21), .C0(n22), .Y(n29) );
  AOI22X1M U9 ( .A0(n23), .A1(n45), .B0(n47), .B1(n46), .Y(n20) );
  NAND3X2M U10 ( .A(RX_IN), .B(n47), .C(N17), .Y(n21) );
  INVXLM U11 ( .A(N8), .Y(n45) );
  INVXLM U12 ( .A(N17), .Y(n46) );
  INVX2M U13 ( .A(n23), .Y(n47) );
  NOR2BX2M U14 ( .AN(data_sample_en), .B(n18), .Y(sampled_bit) );
  AOI21X2M U15 ( .A0(samples[1]), .A1(samples[0]), .B0(n19), .Y(n18) );
  AOI21X2M U16 ( .A0(n43), .A1(n44), .B0(n12), .Y(n19) );
  INVX2M U17 ( .A(samples[1]), .Y(n43) );
  INVX2M U18 ( .A(samples[0]), .Y(n44) );
  OAI2BB2X1M U19 ( .B0(n12), .B1(n26), .A0N(n26), .A1N(RX_IN), .Y(n31) );
  OAI32XLM U20 ( .A0(n27), .A1(N8), .A2(N17), .B0(n47), .B1(n45), .Y(n26) );
  NAND2X2M U21 ( .A(N25), .B(n47), .Y(n27) );
  OR3X2M U22 ( .A(prescale[5]), .B(prescale[4]), .C(prescale[3]), .Y(n28) );
  OR2X2M U23 ( .A(prescale[2]), .B(prescale[1]), .Y(n1) );
  ADDHX1M U24 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_28/carry[2] ), .S(
        N20) );
  ADDHX1M U25 ( .A(prescale[4]), .B(\add_28/carry[3] ), .CO(\add_28/carry[4] ), 
        .S(N22) );
  ADDHX1M U26 ( .A(prescale[3]), .B(\add_28/carry[2] ), .CO(\add_28/carry[3] ), 
        .S(N21) );
  ADDHX1M U27 ( .A(prescale[5]), .B(\add_28/carry[4] ), .CO(N24), .S(N23) );
  CLKINVX1M U28 ( .A(prescale[1]), .Y(N11) );
  OAI2BB1X1M U29 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n1), .Y(N12) );
  OR2X1M U30 ( .A(n1), .B(prescale[3]), .Y(n2) );
  OAI2BB1X1M U31 ( .A0N(n1), .A1N(prescale[3]), .B0(n2), .Y(N13) );
  XNOR2X1M U32 ( .A(prescale[4]), .B(n2), .Y(N14) );
  NOR3X1M U33 ( .A(prescale[4]), .B(prescale[5]), .C(n2), .Y(N16) );
  OAI21X1M U34 ( .A0(prescale[4]), .A1(n2), .B0(prescale[5]), .Y(n3) );
  NAND2BX1M U35 ( .AN(N16), .B(n3), .Y(N15) );
  CLKXOR2X2M U36 ( .A(prescale[3]), .B(edge_cnt[2]), .Y(n11) );
  NOR2BX1M U37 ( .AN(prescale[1]), .B(edge_cnt[0]), .Y(n4) );
  OAI2B2X1M U38 ( .A1N(edge_cnt[1]), .A0(n4), .B0(prescale[2]), .B1(n4), .Y(n7) );
  NOR2BX1M U39 ( .AN(edge_cnt[0]), .B(prescale[1]), .Y(n5) );
  OAI2B2X1M U40 ( .A1N(prescale[2]), .A0(n5), .B0(edge_cnt[1]), .B1(n5), .Y(n6) );
  CLKNAND2X2M U41 ( .A(n7), .B(n6), .Y(n10) );
  CLKXOR2X2M U42 ( .A(prescale[4]), .B(edge_cnt[3]), .Y(n9) );
  CLKXOR2X2M U43 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n8) );
  NOR4X1M U44 ( .A(n11), .B(n10), .C(n9), .D(n8), .Y(N8) );
  NOR2BX1M U45 ( .AN(N11), .B(edge_cnt[0]), .Y(n13) );
  OAI2B2X1M U46 ( .A1N(edge_cnt[1]), .A0(n13), .B0(N12), .B1(n13), .Y(n16) );
  NOR2BX1M U47 ( .AN(edge_cnt[0]), .B(N11), .Y(n14) );
  OAI2B2X1M U48 ( .A1N(N12), .A0(n14), .B0(edge_cnt[1]), .B1(n14), .Y(n15) );
  NAND3BX1M U49 ( .AN(N16), .B(n16), .C(n15), .Y(n34) );
  CLKXOR2X2M U50 ( .A(N15), .B(edge_cnt[4]), .Y(n33) );
  CLKXOR2X2M U51 ( .A(N13), .B(edge_cnt[2]), .Y(n32) );
  CLKXOR2X2M U52 ( .A(N14), .B(edge_cnt[3]), .Y(n17) );
  NOR4X1M U53 ( .A(n34), .B(n33), .C(n32), .D(n17), .Y(N17) );
  NOR2BX1M U54 ( .AN(N11), .B(edge_cnt[0]), .Y(n35) );
  OAI2B2X1M U55 ( .A1N(edge_cnt[1]), .A0(n35), .B0(N20), .B1(n35), .Y(n38) );
  NOR2BX1M U56 ( .AN(edge_cnt[0]), .B(N11), .Y(n36) );
  OAI2B2X1M U57 ( .A1N(N20), .A0(n36), .B0(edge_cnt[1]), .B1(n36), .Y(n37) );
  NAND3BX1M U58 ( .AN(N24), .B(n38), .C(n37), .Y(n42) );
  CLKXOR2X2M U59 ( .A(N23), .B(edge_cnt[4]), .Y(n41) );
  CLKXOR2X2M U60 ( .A(N21), .B(edge_cnt[2]), .Y(n40) );
  CLKXOR2X2M U61 ( .A(N22), .B(edge_cnt[3]), .Y(n39) );
  NOR4X1M U62 ( .A(n42), .B(n41), .C(n40), .D(n39), .Y(N25) );
endmodule


module deserializer_DATA_WIDTH8 ( deser_en, sampled_bit, CLK, RST, P_DATA, 
        bit_tick );
  output [7:0] P_DATA;
  input deser_en, sampled_bit, CLK, RST, bit_tick;
  wire   n1, n10, n11, n12, n13, n14, n15, n16, n17, n2, n3, n4, n5, n6, n7,
         n8, n9, n18;

  DFFRQX2M \P_DATA_reg[0]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  INVX2M U2 ( .A(n2), .Y(n18) );
  OAI22X1M U3 ( .A0(n18), .A1(n9), .B0(n2), .B1(n8), .Y(n11) );
  OAI22X1M U4 ( .A0(n18), .A1(n8), .B0(n2), .B1(n7), .Y(n12) );
  OAI22X1M U5 ( .A0(n18), .A1(n7), .B0(n2), .B1(n6), .Y(n13) );
  OAI22X1M U6 ( .A0(n18), .A1(n6), .B0(n2), .B1(n5), .Y(n14) );
  OAI22X1M U7 ( .A0(n18), .A1(n5), .B0(n2), .B1(n4), .Y(n15) );
  OAI22X1M U8 ( .A0(n18), .A1(n4), .B0(n2), .B1(n3), .Y(n16) );
  OAI2BB2X1M U9 ( .B0(n18), .B1(n3), .A0N(sampled_bit), .A1N(n18), .Y(n17) );
  BUFX2M U10 ( .A(n1), .Y(n2) );
  NAND2X2M U11 ( .A(deser_en), .B(bit_tick), .Y(n1) );
  OAI2BB2X1M U12 ( .B0(n2), .B1(n9), .A0N(P_DATA[0]), .A1N(n2), .Y(n10) );
  INVX2M U13 ( .A(P_DATA[2]), .Y(n8) );
  INVX2M U14 ( .A(P_DATA[6]), .Y(n4) );
  INVX2M U15 ( .A(P_DATA[7]), .Y(n3) );
  INVX2M U16 ( .A(P_DATA[3]), .Y(n7) );
  INVX2M U17 ( .A(P_DATA[1]), .Y(n9) );
  INVX2M U18 ( .A(P_DATA[4]), .Y(n6) );
  INVX2M U19 ( .A(P_DATA[5]), .Y(n5) );
endmodule


module parity_check_DATA_WIDTH8 ( par_chk_en, PAR_TYP, sampled_bit, P_DATA, 
        CLK, RST, par_err );
  input [7:0] P_DATA;
  input par_chk_en, PAR_TYP, sampled_bit, CLK, RST;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRQX2M par_err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_err) );
  XNOR2X2M U2 ( .A(sampled_bit), .B(PAR_TYP), .Y(n5) );
  OAI2BB2X1M U3 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n8) );
  INVX2M U4 ( .A(par_chk_en), .Y(n2) );
  XOR3XLM U5 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  XOR3XLM U6 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U7 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U9 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
endmodule


module start_check ( start_chk_en, sampled_bit, start_glitch );
  input start_chk_en, sampled_bit;
  output start_glitch;


  AND2X2M U2 ( .A(start_chk_en), .B(sampled_bit), .Y(start_glitch) );
endmodule


module stop_check ( stp_chk_en, sampled_bit, stp_err );
  input stp_chk_en, sampled_bit;
  output stp_err;


  NOR2BX4M U2 ( .AN(stp_chk_en), .B(sampled_bit), .Y(stp_err) );
endmodule


module UART_RX_DATA_WIDTH8 ( RX_IN, prescale, PAR_EN, PAR_TYP, CLK, RST, 
        P_DATA, data_valid, Parity_Error, Stop_Error );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYP, CLK, RST;
  output data_valid, Parity_Error, Stop_Error;
  wire   par_err, start_glitch, data_sample_en, edge_counter_en, deser_en,
         stp_chk_en, start_chk_en, par_chk_en, bit_tick, sampled_bit, n1, n2;
  wire   [4:0] edge_cnt;
  wire   [3:0] bit_cnt;

  FSM control_unit ( .PAR_EN(PAR_EN), .RX_IN(RX_IN), .CLK(CLK), .RST(n1), 
        .edge_cnt(edge_cnt), .bit_cnt(bit_cnt), .parity_error(par_err), 
        .start_glitch(start_glitch), .stp_error(Stop_Error), .data_sample_en(
        data_sample_en), .edge_counter_en(edge_counter_en), .deser_en(deser_en), .data_valid(data_valid), .stp_chk_en(stp_chk_en), .start_chk_en(start_chk_en), .par_chk_en(par_chk_en) );
  edge_bit_counter edge_counting_unit ( .enable(edge_counter_en), .CLK(CLK), 
        .RST(n1), .prescale(prescale), .bit_cnt(bit_cnt), .edge_cnt(edge_cnt), 
        .bit_tick(bit_tick) );
  data_sampling data_sampling_unit ( .edge_cnt(edge_cnt), .data_sample_en(
        data_sample_en), .RX_IN(RX_IN), .prescale(prescale), .CLK(CLK), .RST(
        n1), .sampled_bit(sampled_bit) );
  deserializer_DATA_WIDTH8 deserializing_unit ( .deser_en(deser_en), 
        .sampled_bit(sampled_bit), .CLK(CLK), .RST(n1), .P_DATA(P_DATA), 
        .bit_tick(bit_tick) );
  parity_check_DATA_WIDTH8 parity_check_unit ( .par_chk_en(par_chk_en), 
        .PAR_TYP(PAR_TYP), .sampled_bit(sampled_bit), .P_DATA(P_DATA), .CLK(
        CLK), .RST(n1), .par_err(par_err) );
  start_check start_check_unit ( .start_chk_en(start_chk_en), .sampled_bit(
        sampled_bit), .start_glitch(start_glitch) );
  stop_check stop_check_unit ( .stp_chk_en(stp_chk_en), .sampled_bit(
        sampled_bit), .stp_err(Stop_Error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  AND2X2M U3 ( .A(par_err), .B(PAR_EN), .Y(Parity_Error) );
endmodule


module UART_TOP_DATA_WIDTH8_PRESCALE_WIDTH6 ( RST, PAR_EN, PAR_TYP, TX_CLK, 
        TX_IN_P, TX_IN_V, TX_OUT_S, TX_OUT_V, RX_CLK, RX_IN_S, Prescale, 
        RX_OUT_P, RX_OUT_V, RX_Parity_Error, RX_Stop_Error );
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  output [7:0] RX_OUT_P;
  input RST, PAR_EN, PAR_TYP, TX_CLK, TX_IN_V, RX_CLK, RX_IN_S;
  output TX_OUT_S, TX_OUT_V, RX_OUT_V, RX_Parity_Error, RX_Stop_Error;
  wire   n1, n2;

  UART_TX_DATA_WIDTH8 TX ( .CLK(TX_CLK), .RST(n1), .PAR_EN(PAR_EN), .PAR_TYP(
        PAR_TYP), .P_DATA(TX_IN_P), .DATA_VAILD(TX_IN_V), .TX_OUT(TX_OUT_S), 
        .busy(TX_OUT_V) );
  UART_RX_DATA_WIDTH8 RX ( .RX_IN(RX_IN_S), .prescale(Prescale), .PAR_EN(
        PAR_EN), .PAR_TYP(PAR_TYP), .CLK(RX_CLK), .RST(n1), .P_DATA(RX_OUT_P), 
        .data_valid(RX_OUT_V), .Parity_Error(RX_Parity_Error), .Stop_Error(
        RX_Stop_Error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module RegFile_DATA_WIDTH8_DEPTH16 ( CLK, RST, WrEn, RdEn, RdData_VLD, Address, 
        WrData, RdData, REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   N11, N12, N13, N14, \Reg_arr[4][7] , \Reg_arr[4][6] , \Reg_arr[4][5] ,
         \Reg_arr[4][4] , \Reg_arr[4][3] , \Reg_arr[4][2] , \Reg_arr[4][1] ,
         \Reg_arr[4][0] , \Reg_arr[5][7] , \Reg_arr[5][6] , \Reg_arr[5][5] ,
         \Reg_arr[5][4] , \Reg_arr[5][3] , \Reg_arr[5][2] , \Reg_arr[5][1] ,
         \Reg_arr[5][0] , \Reg_arr[6][7] , \Reg_arr[6][6] , \Reg_arr[6][5] ,
         \Reg_arr[6][4] , \Reg_arr[6][3] , \Reg_arr[6][2] , \Reg_arr[6][1] ,
         \Reg_arr[6][0] , \Reg_arr[7][7] , \Reg_arr[7][6] , \Reg_arr[7][5] ,
         \Reg_arr[7][4] , \Reg_arr[7][3] , \Reg_arr[7][2] , \Reg_arr[7][1] ,
         \Reg_arr[7][0] , \Reg_arr[8][7] , \Reg_arr[8][6] , \Reg_arr[8][5] ,
         \Reg_arr[8][4] , \Reg_arr[8][3] , \Reg_arr[8][2] , \Reg_arr[8][1] ,
         \Reg_arr[8][0] , \Reg_arr[9][7] , \Reg_arr[9][6] , \Reg_arr[9][5] ,
         \Reg_arr[9][4] , \Reg_arr[9][3] , \Reg_arr[9][2] , \Reg_arr[9][1] ,
         \Reg_arr[9][0] , \Reg_arr[10][7] , \Reg_arr[10][6] , \Reg_arr[10][5] ,
         \Reg_arr[10][4] , \Reg_arr[10][3] , \Reg_arr[10][2] ,
         \Reg_arr[10][1] , \Reg_arr[10][0] , \Reg_arr[11][7] ,
         \Reg_arr[11][6] , \Reg_arr[11][5] , \Reg_arr[11][4] ,
         \Reg_arr[11][3] , \Reg_arr[11][2] , \Reg_arr[11][1] ,
         \Reg_arr[11][0] , \Reg_arr[12][7] , \Reg_arr[12][6] ,
         \Reg_arr[12][5] , \Reg_arr[12][4] , \Reg_arr[12][3] ,
         \Reg_arr[12][2] , \Reg_arr[12][1] , \Reg_arr[12][0] ,
         \Reg_arr[13][7] , \Reg_arr[13][6] , \Reg_arr[13][5] ,
         \Reg_arr[13][4] , \Reg_arr[13][3] , \Reg_arr[13][2] ,
         \Reg_arr[13][1] , \Reg_arr[13][0] , \Reg_arr[14][7] ,
         \Reg_arr[14][6] , \Reg_arr[14][5] , \Reg_arr[14][4] ,
         \Reg_arr[14][3] , \Reg_arr[14][2] , \Reg_arr[14][1] ,
         \Reg_arr[14][0] , \Reg_arr[15][7] , \Reg_arr[15][6] ,
         \Reg_arr[15][5] , \Reg_arr[15][4] , \Reg_arr[15][3] ,
         \Reg_arr[15][2] , \Reg_arr[15][1] , \Reg_arr[15][0] , N36, N37, N38,
         N39, N40, N41, N42, N43, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M RdData_VLD_reg ( .D(n300), .CK(CLK), .RN(n284), .Q(RdData_VLD) );
  DFFRQX2M \Reg_arr_reg[3][7]  ( .D(n152), .CK(CLK), .RN(n277), .Q(REG3[7]) );
  DFFRQX2M \Reg_arr_reg[3][6]  ( .D(n151), .CK(CLK), .RN(n277), .Q(REG3[6]) );
  DFFRQX2M \Reg_arr_reg[5][7]  ( .D(n136), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[5][7] ) );
  DFFRQX2M \Reg_arr_reg[5][6]  ( .D(n135), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[5][6] ) );
  DFFRQX2M \Reg_arr_reg[5][5]  ( .D(n134), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[5][5] ) );
  DFFRQX2M \Reg_arr_reg[5][4]  ( .D(n133), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[5][4] ) );
  DFFRQX2M \Reg_arr_reg[5][3]  ( .D(n132), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[5][3] ) );
  DFFRQX2M \Reg_arr_reg[5][2]  ( .D(n131), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[5][2] ) );
  DFFRQX2M \Reg_arr_reg[5][1]  ( .D(n130), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[5][1] ) );
  DFFRQX2M \Reg_arr_reg[5][0]  ( .D(n129), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[5][0] ) );
  DFFRQX2M \Reg_arr_reg[7][7]  ( .D(n120), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[7][7] ) );
  DFFRQX2M \Reg_arr_reg[7][6]  ( .D(n119), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[7][6] ) );
  DFFRQX2M \Reg_arr_reg[7][5]  ( .D(n118), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[7][5] ) );
  DFFRQX2M \Reg_arr_reg[7][4]  ( .D(n117), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[7][4] ) );
  DFFRQX2M \Reg_arr_reg[7][3]  ( .D(n116), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[7][3] ) );
  DFFRQX2M \Reg_arr_reg[7][2]  ( .D(n115), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[7][2] ) );
  DFFRQX2M \Reg_arr_reg[7][1]  ( .D(n114), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[7][1] ) );
  DFFRQX2M \Reg_arr_reg[7][0]  ( .D(n113), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[7][0] ) );
  DFFRQX2M \Reg_arr_reg[9][7]  ( .D(n104), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[9][7] ) );
  DFFRQX2M \Reg_arr_reg[9][6]  ( .D(n103), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[9][6] ) );
  DFFRQX2M \Reg_arr_reg[9][5]  ( .D(n102), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[9][5] ) );
  DFFRQX2M \Reg_arr_reg[9][4]  ( .D(n101), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[9][4] ) );
  DFFRQX2M \Reg_arr_reg[9][3]  ( .D(n100), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[9][3] ) );
  DFFRQX2M \Reg_arr_reg[9][2]  ( .D(n99), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[9][2] ) );
  DFFRQX2M \Reg_arr_reg[9][1]  ( .D(n98), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[9][1] ) );
  DFFRQX2M \Reg_arr_reg[9][0]  ( .D(n97), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[9][0] ) );
  DFFRQX2M \Reg_arr_reg[11][7]  ( .D(n88), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[11][7] ) );
  DFFRQX2M \Reg_arr_reg[11][6]  ( .D(n87), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[11][6] ) );
  DFFRQX2M \Reg_arr_reg[11][5]  ( .D(n86), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[11][5] ) );
  DFFRQX2M \Reg_arr_reg[11][4]  ( .D(n85), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[11][4] ) );
  DFFRQX2M \Reg_arr_reg[11][3]  ( .D(n84), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[11][3] ) );
  DFFRQX2M \Reg_arr_reg[11][2]  ( .D(n83), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[11][2] ) );
  DFFRQX2M \Reg_arr_reg[11][1]  ( .D(n82), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[11][1] ) );
  DFFRQX2M \Reg_arr_reg[11][0]  ( .D(n81), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[11][0] ) );
  DFFRQX2M \Reg_arr_reg[13][7]  ( .D(n72), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[13][7] ) );
  DFFRQX2M \Reg_arr_reg[13][6]  ( .D(n71), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[13][6] ) );
  DFFRQX2M \Reg_arr_reg[13][5]  ( .D(n70), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[13][5] ) );
  DFFRQX2M \Reg_arr_reg[13][4]  ( .D(n69), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[13][4] ) );
  DFFRQX2M \Reg_arr_reg[13][3]  ( .D(n68), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[13][3] ) );
  DFFRQX2M \Reg_arr_reg[13][2]  ( .D(n67), .CK(CLK), .RN(n284), .Q(
        \Reg_arr[13][2] ) );
  DFFRQX2M \Reg_arr_reg[13][1]  ( .D(n66), .CK(CLK), .RN(n284), .Q(
        \Reg_arr[13][1] ) );
  DFFRQX2M \Reg_arr_reg[13][0]  ( .D(n65), .CK(CLK), .RN(n284), .Q(
        \Reg_arr[13][0] ) );
  DFFRQX2M \Reg_arr_reg[15][7]  ( .D(n56), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[15][7] ) );
  DFFRQX2M \Reg_arr_reg[15][6]  ( .D(n55), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[15][6] ) );
  DFFRQX2M \Reg_arr_reg[15][5]  ( .D(n54), .CK(CLK), .RN(n284), .Q(
        \Reg_arr[15][5] ) );
  DFFRQX2M \Reg_arr_reg[15][4]  ( .D(n53), .CK(CLK), .RN(n285), .Q(
        \Reg_arr[15][4] ) );
  DFFRQX2M \Reg_arr_reg[15][3]  ( .D(n52), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[15][3] ) );
  DFFRQX2M \Reg_arr_reg[15][2]  ( .D(n51), .CK(CLK), .RN(n284), .Q(
        \Reg_arr[15][2] ) );
  DFFRQX2M \Reg_arr_reg[15][1]  ( .D(n50), .CK(CLK), .RN(n276), .Q(
        \Reg_arr[15][1] ) );
  DFFRQX2M \Reg_arr_reg[15][0]  ( .D(n49), .CK(CLK), .RN(n284), .Q(
        \Reg_arr[15][0] ) );
  DFFRQX2M \Reg_arr_reg[4][7]  ( .D(n144), .CK(CLK), .RN(n277), .Q(
        \Reg_arr[4][7] ) );
  DFFRQX2M \Reg_arr_reg[4][6]  ( .D(n143), .CK(CLK), .RN(n277), .Q(
        \Reg_arr[4][6] ) );
  DFFRQX2M \Reg_arr_reg[4][5]  ( .D(n142), .CK(CLK), .RN(n277), .Q(
        \Reg_arr[4][5] ) );
  DFFRQX2M \Reg_arr_reg[4][4]  ( .D(n141), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[4][4] ) );
  DFFRQX2M \Reg_arr_reg[4][3]  ( .D(n140), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[4][3] ) );
  DFFRQX2M \Reg_arr_reg[4][2]  ( .D(n139), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[4][2] ) );
  DFFRQX2M \Reg_arr_reg[4][1]  ( .D(n138), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[4][1] ) );
  DFFRQX2M \Reg_arr_reg[4][0]  ( .D(n137), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[4][0] ) );
  DFFRQX2M \Reg_arr_reg[6][7]  ( .D(n128), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[6][7] ) );
  DFFRQX2M \Reg_arr_reg[6][6]  ( .D(n127), .CK(CLK), .RN(n278), .Q(
        \Reg_arr[6][6] ) );
  DFFRQX2M \Reg_arr_reg[6][5]  ( .D(n126), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[6][5] ) );
  DFFRQX2M \Reg_arr_reg[6][4]  ( .D(n125), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[6][4] ) );
  DFFRQX2M \Reg_arr_reg[6][3]  ( .D(n124), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[6][3] ) );
  DFFRQX2M \Reg_arr_reg[6][2]  ( .D(n123), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[6][2] ) );
  DFFRQX2M \Reg_arr_reg[6][1]  ( .D(n122), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[6][1] ) );
  DFFRQX2M \Reg_arr_reg[6][0]  ( .D(n121), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[6][0] ) );
  DFFRQX2M \Reg_arr_reg[8][7]  ( .D(n112), .CK(CLK), .RN(n279), .Q(
        \Reg_arr[8][7] ) );
  DFFRQX2M \Reg_arr_reg[8][6]  ( .D(n111), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[8][6] ) );
  DFFRQX2M \Reg_arr_reg[8][5]  ( .D(n110), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[8][5] ) );
  DFFRQX2M \Reg_arr_reg[8][4]  ( .D(n109), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[8][4] ) );
  DFFRQX2M \Reg_arr_reg[8][3]  ( .D(n108), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[8][3] ) );
  DFFRQX2M \Reg_arr_reg[8][2]  ( .D(n107), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[8][2] ) );
  DFFRQX2M \Reg_arr_reg[8][1]  ( .D(n106), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[8][1] ) );
  DFFRQX2M \Reg_arr_reg[8][0]  ( .D(n105), .CK(CLK), .RN(n280), .Q(
        \Reg_arr[8][0] ) );
  DFFRQX2M \Reg_arr_reg[10][7]  ( .D(n96), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[10][7] ) );
  DFFRQX2M \Reg_arr_reg[10][6]  ( .D(n95), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[10][6] ) );
  DFFRQX2M \Reg_arr_reg[10][5]  ( .D(n94), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[10][5] ) );
  DFFRQX2M \Reg_arr_reg[10][4]  ( .D(n93), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[10][4] ) );
  DFFRQX2M \Reg_arr_reg[10][3]  ( .D(n92), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[10][3] ) );
  DFFRQX2M \Reg_arr_reg[10][2]  ( .D(n91), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[10][2] ) );
  DFFRQX2M \Reg_arr_reg[10][1]  ( .D(n90), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[10][1] ) );
  DFFRQX2M \Reg_arr_reg[10][0]  ( .D(n89), .CK(CLK), .RN(n281), .Q(
        \Reg_arr[10][0] ) );
  DFFRQX2M \Reg_arr_reg[12][7]  ( .D(n80), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[12][7] ) );
  DFFRQX2M \Reg_arr_reg[12][6]  ( .D(n79), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[12][6] ) );
  DFFRQX2M \Reg_arr_reg[12][5]  ( .D(n78), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[12][5] ) );
  DFFRQX2M \Reg_arr_reg[12][4]  ( .D(n77), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[12][4] ) );
  DFFRQX2M \Reg_arr_reg[12][3]  ( .D(n76), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[12][3] ) );
  DFFRQX2M \Reg_arr_reg[12][2]  ( .D(n75), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[12][2] ) );
  DFFRQX2M \Reg_arr_reg[12][1]  ( .D(n74), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[12][1] ) );
  DFFRQX2M \Reg_arr_reg[12][0]  ( .D(n73), .CK(CLK), .RN(n282), .Q(
        \Reg_arr[12][0] ) );
  DFFRQX2M \Reg_arr_reg[14][7]  ( .D(n64), .CK(CLK), .RN(n284), .Q(
        \Reg_arr[14][7] ) );
  DFFRQX2M \Reg_arr_reg[14][6]  ( .D(n63), .CK(CLK), .RN(n284), .Q(
        \Reg_arr[14][6] ) );
  DFFRQX2M \Reg_arr_reg[14][5]  ( .D(n62), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[14][5] ) );
  DFFRQX2M \Reg_arr_reg[14][4]  ( .D(n61), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[14][4] ) );
  DFFRQX2M \Reg_arr_reg[14][3]  ( .D(n60), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[14][3] ) );
  DFFRQX2M \Reg_arr_reg[14][2]  ( .D(n59), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[14][2] ) );
  DFFRQX2M \Reg_arr_reg[14][1]  ( .D(n58), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[14][1] ) );
  DFFRQX2M \Reg_arr_reg[14][0]  ( .D(n57), .CK(CLK), .RN(n283), .Q(
        \Reg_arr[14][0] ) );
  DFFRQX2M \Reg_arr_reg[3][0]  ( .D(n145), .CK(CLK), .RN(n277), .Q(REG3[0]) );
  DFFRQX2M \RdData_reg[7]  ( .D(n48), .CK(CLK), .RN(n285), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n47), .CK(CLK), .RN(n284), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n46), .CK(CLK), .RN(n284), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n45), .CK(CLK), .RN(n284), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n44), .CK(CLK), .RN(n284), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n43), .CK(CLK), .RN(n284), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n42), .CK(CLK), .RN(n284), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n41), .CK(CLK), .RN(n281), .Q(RdData[0]) );
  DFFRQX2M \Reg_arr_reg[3][1]  ( .D(n146), .CK(CLK), .RN(n277), .Q(REG3[1]) );
  DFFRQX2M \Reg_arr_reg[2][1]  ( .D(n154), .CK(CLK), .RN(n278), .Q(REG2[1]) );
  DFFSQX2M \Reg_arr_reg[3][5]  ( .D(n150), .CK(CLK), .SN(n276), .Q(REG3[5]) );
  DFFSQX2M \Reg_arr_reg[2][0]  ( .D(n153), .CK(CLK), .SN(n276), .Q(REG2[0]) );
  DFFRQX2M \Reg_arr_reg[3][2]  ( .D(n147), .CK(CLK), .RN(n277), .Q(REG3[2]) );
  DFFRQX2M \Reg_arr_reg[3][3]  ( .D(n148), .CK(CLK), .RN(n277), .Q(REG3[3]) );
  DFFRQX2M \Reg_arr_reg[3][4]  ( .D(n149), .CK(CLK), .RN(n277), .Q(REG3[4]) );
  DFFRQX2M \Reg_arr_reg[2][2]  ( .D(n155), .CK(CLK), .RN(n278), .Q(REG2[2]) );
  DFFSQX2M \Reg_arr_reg[2][7]  ( .D(n160), .CK(CLK), .SN(n276), .Q(REG2[7]) );
  DFFRQX2M \Reg_arr_reg[2][4]  ( .D(n157), .CK(CLK), .RN(n278), .Q(REG2[4]) );
  DFFRQX2M \Reg_arr_reg[2][3]  ( .D(n156), .CK(CLK), .RN(n278), .Q(REG2[3]) );
  DFFRQX2M \Reg_arr_reg[2][5]  ( .D(n158), .CK(CLK), .RN(n278), .Q(REG2[5]) );
  DFFRQX2M \Reg_arr_reg[2][6]  ( .D(n159), .CK(CLK), .RN(n276), .Q(REG2[6]) );
  DFFRQX2M \Reg_arr_reg[0][1]  ( .D(n170), .CK(CLK), .RN(n277), .Q(REG0[1]) );
  DFFRQX2M \Reg_arr_reg[0][0]  ( .D(n169), .CK(CLK), .RN(n276), .Q(REG0[0]) );
  DFFRQX2M \Reg_arr_reg[0][2]  ( .D(n171), .CK(CLK), .RN(n277), .Q(REG0[2]) );
  DFFRQX2M \Reg_arr_reg[0][3]  ( .D(n172), .CK(CLK), .RN(n277), .Q(REG0[3]) );
  DFFRQX2M \Reg_arr_reg[0][4]  ( .D(n173), .CK(CLK), .RN(n277), .Q(REG0[4]) );
  DFFRQX2M \Reg_arr_reg[0][5]  ( .D(n174), .CK(CLK), .RN(n277), .Q(REG0[5]) );
  DFFRQX2M \Reg_arr_reg[0][6]  ( .D(n175), .CK(CLK), .RN(n280), .Q(REG0[6]) );
  DFFRQX2M \Reg_arr_reg[1][6]  ( .D(n167), .CK(CLK), .RN(n276), .Q(REG1[6]) );
  DFFRQX2M \Reg_arr_reg[0][7]  ( .D(n176), .CK(CLK), .RN(n276), .Q(REG0[7]) );
  DFFRQX2M \Reg_arr_reg[1][5]  ( .D(n166), .CK(CLK), .RN(n276), .Q(REG1[5]) );
  DFFRQX2M \Reg_arr_reg[1][4]  ( .D(n165), .CK(CLK), .RN(n276), .Q(REG1[4]) );
  DFFRQX2M \Reg_arr_reg[1][1]  ( .D(n162), .CK(CLK), .RN(n276), .Q(REG1[1]) );
  DFFRQX2M \Reg_arr_reg[1][7]  ( .D(n168), .CK(CLK), .RN(n276), .Q(REG1[7]) );
  DFFRQX2M \Reg_arr_reg[1][3]  ( .D(n164), .CK(CLK), .RN(n276), .Q(REG1[3]) );
  DFFRQX2M \Reg_arr_reg[1][2]  ( .D(n163), .CK(CLK), .RN(n276), .Q(REG1[2]) );
  DFFRQX2M \Reg_arr_reg[1][0]  ( .D(n161), .CK(CLK), .RN(n276), .Q(REG1[0]) );
  NOR2BX2M U3 ( .AN(n39), .B(n269), .Y(n31) );
  NOR2BX2M U4 ( .AN(n27), .B(n269), .Y(n16) );
  NOR2BX2M U5 ( .AN(n39), .B(N11), .Y(n33) );
  NOR2BX2M U6 ( .AN(n27), .B(N11), .Y(n18) );
  INVX2M U7 ( .A(WrData[0]), .Y(n299) );
  INVX2M U8 ( .A(WrData[2]), .Y(n296) );
  INVX2M U9 ( .A(WrData[4]), .Y(n294) );
  INVX2M U10 ( .A(WrData[1]), .Y(n298) );
  INVX2M U11 ( .A(WrData[5]), .Y(n293) );
  INVX2M U12 ( .A(WrData[3]), .Y(n295) );
  INVX2M U13 ( .A(WrData[6]), .Y(n292) );
  INVX2M U14 ( .A(WrData[7]), .Y(n291) );
  INVX2M U15 ( .A(n2), .Y(n274) );
  INVX2M U16 ( .A(n1), .Y(n272) );
  NOR2X2M U17 ( .A(n297), .B(n270), .Y(n15) );
  NAND2X2M U18 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U19 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U20 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U21 ( .A(n31), .B(n20), .Y(n34) );
  NAND2X2M U22 ( .A(n31), .B(n23), .Y(n36) );
  NAND2X2M U23 ( .A(n31), .B(n26), .Y(n38) );
  NAND2X2M U24 ( .A(n31), .B(n15), .Y(n30) );
  NAND2X2M U25 ( .A(n15), .B(n16), .Y(n14) );
  INVX2M U26 ( .A(n13), .Y(n300) );
  OR2X2M U27 ( .A(n270), .B(n269), .Y(n1) );
  OR2X2M U28 ( .A(n269), .B(N12), .Y(n2) );
  INVX2M U29 ( .A(N12), .Y(n270) );
  INVX2M U30 ( .A(n4), .Y(n273) );
  INVX2M U31 ( .A(n3), .Y(n275) );
  NOR2X2M U32 ( .A(n270), .B(N13), .Y(n23) );
  NOR2X2M U33 ( .A(N12), .B(N13), .Y(n26) );
  NOR2X2M U34 ( .A(n297), .B(N12), .Y(n20) );
  NAND2X2M U35 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U36 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U37 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U38 ( .A(n33), .B(n20), .Y(n35) );
  NAND2X2M U39 ( .A(n33), .B(n23), .Y(n37) );
  NAND2X2M U40 ( .A(n33), .B(n26), .Y(n40) );
  NAND2X2M U41 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U42 ( .A(n33), .B(n15), .Y(n32) );
  NAND2BX2M U43 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  INVX2M U44 ( .A(N13), .Y(n297) );
  NOR2BX2M U45 ( .AN(n29), .B(N14), .Y(n39) );
  NOR2BX2M U46 ( .AN(WrEn), .B(RdEn), .Y(n29) );
  INVX2M U47 ( .A(N14), .Y(n271) );
  AND2X2M U48 ( .A(N14), .B(n29), .Y(n27) );
  BUFX2M U49 ( .A(n290), .Y(n276) );
  BUFX2M U50 ( .A(n287), .Y(n283) );
  BUFX2M U51 ( .A(n287), .Y(n282) );
  BUFX2M U52 ( .A(n288), .Y(n281) );
  BUFX2M U53 ( .A(n289), .Y(n279) );
  BUFX2M U54 ( .A(n289), .Y(n278) );
  BUFX2M U55 ( .A(n290), .Y(n277) );
  BUFX2M U56 ( .A(n288), .Y(n280) );
  BUFX2M U57 ( .A(n286), .Y(n284) );
  BUFX2M U58 ( .A(n286), .Y(n285) );
  OR2X2M U59 ( .A(N11), .B(N12), .Y(n3) );
  OR2X2M U60 ( .A(n270), .B(N11), .Y(n4) );
  INVX2M U61 ( .A(N11), .Y(n269) );
  BUFX2M U62 ( .A(RST), .Y(n287) );
  BUFX2M U63 ( .A(RST), .Y(n289) );
  BUFX2M U64 ( .A(RST), .Y(n288) );
  BUFX2M U65 ( .A(RST), .Y(n290) );
  BUFX2M U66 ( .A(RST), .Y(n286) );
  AO22X1M U67 ( .A0(N43), .A1(n300), .B0(RdData[0]), .B1(n13), .Y(n41) );
  AO22X1M U68 ( .A0(N42), .A1(n300), .B0(RdData[1]), .B1(n13), .Y(n42) );
  AO22X1M U69 ( .A0(N41), .A1(n300), .B0(RdData[2]), .B1(n13), .Y(n43) );
  AO22X1M U70 ( .A0(N40), .A1(n300), .B0(RdData[3]), .B1(n13), .Y(n44) );
  AO22X1M U71 ( .A0(N39), .A1(n300), .B0(RdData[4]), .B1(n13), .Y(n45) );
  AO22X1M U72 ( .A0(N38), .A1(n300), .B0(RdData[5]), .B1(n13), .Y(n46) );
  AO22X1M U73 ( .A0(N37), .A1(n300), .B0(RdData[6]), .B1(n13), .Y(n47) );
  AO22X1M U74 ( .A0(N36), .A1(n300), .B0(RdData[7]), .B1(n13), .Y(n48) );
  OAI2BB2X1M U75 ( .B0(n14), .B1(n299), .A0N(\Reg_arr[15][0] ), .A1N(n14), .Y(
        n49) );
  OAI2BB2X1M U76 ( .B0(n14), .B1(n298), .A0N(\Reg_arr[15][1] ), .A1N(n14), .Y(
        n50) );
  OAI2BB2X1M U77 ( .B0(n14), .B1(n296), .A0N(\Reg_arr[15][2] ), .A1N(n14), .Y(
        n51) );
  OAI2BB2X1M U78 ( .B0(n14), .B1(n295), .A0N(\Reg_arr[15][3] ), .A1N(n14), .Y(
        n52) );
  OAI2BB2X1M U79 ( .B0(n14), .B1(n294), .A0N(\Reg_arr[15][4] ), .A1N(n14), .Y(
        n53) );
  OAI2BB2X1M U80 ( .B0(n14), .B1(n293), .A0N(\Reg_arr[15][5] ), .A1N(n14), .Y(
        n54) );
  OAI2BB2X1M U81 ( .B0(n14), .B1(n292), .A0N(\Reg_arr[15][6] ), .A1N(n14), .Y(
        n55) );
  OAI2BB2X1M U82 ( .B0(n14), .B1(n291), .A0N(\Reg_arr[15][7] ), .A1N(n14), .Y(
        n56) );
  OAI2BB2X1M U83 ( .B0(n299), .B1(n17), .A0N(\Reg_arr[14][0] ), .A1N(n17), .Y(
        n57) );
  OAI2BB2X1M U84 ( .B0(n298), .B1(n17), .A0N(\Reg_arr[14][1] ), .A1N(n17), .Y(
        n58) );
  OAI2BB2X1M U85 ( .B0(n296), .B1(n17), .A0N(\Reg_arr[14][2] ), .A1N(n17), .Y(
        n59) );
  OAI2BB2X1M U86 ( .B0(n295), .B1(n17), .A0N(\Reg_arr[14][3] ), .A1N(n17), .Y(
        n60) );
  OAI2BB2X1M U87 ( .B0(n294), .B1(n17), .A0N(\Reg_arr[14][4] ), .A1N(n17), .Y(
        n61) );
  OAI2BB2X1M U88 ( .B0(n293), .B1(n17), .A0N(\Reg_arr[14][5] ), .A1N(n17), .Y(
        n62) );
  OAI2BB2X1M U89 ( .B0(n292), .B1(n17), .A0N(\Reg_arr[14][6] ), .A1N(n17), .Y(
        n63) );
  OAI2BB2X1M U90 ( .B0(n291), .B1(n17), .A0N(\Reg_arr[14][7] ), .A1N(n17), .Y(
        n64) );
  OAI2BB2X1M U91 ( .B0(n299), .B1(n30), .A0N(\Reg_arr[7][0] ), .A1N(n30), .Y(
        n113) );
  OAI2BB2X1M U92 ( .B0(n298), .B1(n30), .A0N(\Reg_arr[7][1] ), .A1N(n30), .Y(
        n114) );
  OAI2BB2X1M U93 ( .B0(n296), .B1(n30), .A0N(\Reg_arr[7][2] ), .A1N(n30), .Y(
        n115) );
  OAI2BB2X1M U94 ( .B0(n295), .B1(n30), .A0N(\Reg_arr[7][3] ), .A1N(n30), .Y(
        n116) );
  OAI2BB2X1M U95 ( .B0(n294), .B1(n30), .A0N(\Reg_arr[7][4] ), .A1N(n30), .Y(
        n117) );
  OAI2BB2X1M U96 ( .B0(n293), .B1(n30), .A0N(\Reg_arr[7][5] ), .A1N(n30), .Y(
        n118) );
  OAI2BB2X1M U97 ( .B0(n292), .B1(n30), .A0N(\Reg_arr[7][6] ), .A1N(n30), .Y(
        n119) );
  OAI2BB2X1M U98 ( .B0(n291), .B1(n30), .A0N(\Reg_arr[7][7] ), .A1N(n30), .Y(
        n120) );
  OAI2BB2X1M U99 ( .B0(n299), .B1(n32), .A0N(\Reg_arr[6][0] ), .A1N(n32), .Y(
        n121) );
  OAI2BB2X1M U100 ( .B0(n298), .B1(n32), .A0N(\Reg_arr[6][1] ), .A1N(n32), .Y(
        n122) );
  OAI2BB2X1M U101 ( .B0(n296), .B1(n32), .A0N(\Reg_arr[6][2] ), .A1N(n32), .Y(
        n123) );
  OAI2BB2X1M U102 ( .B0(n295), .B1(n32), .A0N(\Reg_arr[6][3] ), .A1N(n32), .Y(
        n124) );
  OAI2BB2X1M U103 ( .B0(n294), .B1(n32), .A0N(\Reg_arr[6][4] ), .A1N(n32), .Y(
        n125) );
  OAI2BB2X1M U104 ( .B0(n293), .B1(n32), .A0N(\Reg_arr[6][5] ), .A1N(n32), .Y(
        n126) );
  OAI2BB2X1M U105 ( .B0(n292), .B1(n32), .A0N(\Reg_arr[6][6] ), .A1N(n32), .Y(
        n127) );
  OAI2BB2X1M U106 ( .B0(n291), .B1(n32), .A0N(\Reg_arr[6][7] ), .A1N(n32), .Y(
        n128) );
  OAI2BB2X1M U107 ( .B0(n299), .B1(n34), .A0N(\Reg_arr[5][0] ), .A1N(n34), .Y(
        n129) );
  OAI2BB2X1M U108 ( .B0(n298), .B1(n34), .A0N(\Reg_arr[5][1] ), .A1N(n34), .Y(
        n130) );
  OAI2BB2X1M U109 ( .B0(n296), .B1(n34), .A0N(\Reg_arr[5][2] ), .A1N(n34), .Y(
        n131) );
  OAI2BB2X1M U110 ( .B0(n295), .B1(n34), .A0N(\Reg_arr[5][3] ), .A1N(n34), .Y(
        n132) );
  OAI2BB2X1M U111 ( .B0(n294), .B1(n34), .A0N(\Reg_arr[5][4] ), .A1N(n34), .Y(
        n133) );
  OAI2BB2X1M U112 ( .B0(n293), .B1(n34), .A0N(\Reg_arr[5][5] ), .A1N(n34), .Y(
        n134) );
  OAI2BB2X1M U113 ( .B0(n292), .B1(n34), .A0N(\Reg_arr[5][6] ), .A1N(n34), .Y(
        n135) );
  OAI2BB2X1M U114 ( .B0(n291), .B1(n34), .A0N(\Reg_arr[5][7] ), .A1N(n34), .Y(
        n136) );
  OAI2BB2X1M U115 ( .B0(n299), .B1(n35), .A0N(\Reg_arr[4][0] ), .A1N(n35), .Y(
        n137) );
  OAI2BB2X1M U116 ( .B0(n298), .B1(n35), .A0N(\Reg_arr[4][1] ), .A1N(n35), .Y(
        n138) );
  OAI2BB2X1M U117 ( .B0(n296), .B1(n35), .A0N(\Reg_arr[4][2] ), .A1N(n35), .Y(
        n139) );
  OAI2BB2X1M U118 ( .B0(n295), .B1(n35), .A0N(\Reg_arr[4][3] ), .A1N(n35), .Y(
        n140) );
  OAI2BB2X1M U119 ( .B0(n294), .B1(n35), .A0N(\Reg_arr[4][4] ), .A1N(n35), .Y(
        n141) );
  OAI2BB2X1M U120 ( .B0(n293), .B1(n35), .A0N(\Reg_arr[4][5] ), .A1N(n35), .Y(
        n142) );
  OAI2BB2X1M U121 ( .B0(n292), .B1(n35), .A0N(\Reg_arr[4][6] ), .A1N(n35), .Y(
        n143) );
  OAI2BB2X1M U122 ( .B0(n291), .B1(n35), .A0N(\Reg_arr[4][7] ), .A1N(n35), .Y(
        n144) );
  OAI2BB2X1M U123 ( .B0(n299), .B1(n36), .A0N(REG3[0]), .A1N(n36), .Y(n145) );
  OAI2BB2X1M U124 ( .B0(n298), .B1(n36), .A0N(REG3[1]), .A1N(n36), .Y(n146) );
  OAI2BB2X1M U125 ( .B0(n296), .B1(n36), .A0N(REG3[2]), .A1N(n36), .Y(n147) );
  OAI2BB2X1M U126 ( .B0(n295), .B1(n36), .A0N(REG3[3]), .A1N(n36), .Y(n148) );
  OAI2BB2X1M U127 ( .B0(n294), .B1(n36), .A0N(REG3[4]), .A1N(n36), .Y(n149) );
  OAI2BB2X1M U128 ( .B0(n292), .B1(n36), .A0N(REG3[6]), .A1N(n36), .Y(n151) );
  OAI2BB2X1M U129 ( .B0(n291), .B1(n36), .A0N(REG3[7]), .A1N(n36), .Y(n152) );
  OAI2BB2X1M U130 ( .B0(n298), .B1(n37), .A0N(REG2[1]), .A1N(n37), .Y(n154) );
  OAI2BB2X1M U131 ( .B0(n296), .B1(n37), .A0N(REG2[2]), .A1N(n37), .Y(n155) );
  OAI2BB2X1M U132 ( .B0(n295), .B1(n37), .A0N(REG2[3]), .A1N(n37), .Y(n156) );
  OAI2BB2X1M U133 ( .B0(n294), .B1(n37), .A0N(REG2[4]), .A1N(n37), .Y(n157) );
  OAI2BB2X1M U134 ( .B0(n293), .B1(n37), .A0N(REG2[5]), .A1N(n37), .Y(n158) );
  OAI2BB2X1M U135 ( .B0(n292), .B1(n37), .A0N(REG2[6]), .A1N(n37), .Y(n159) );
  OAI2BB2X1M U136 ( .B0(n299), .B1(n38), .A0N(REG1[0]), .A1N(n38), .Y(n161) );
  OAI2BB2X1M U137 ( .B0(n298), .B1(n38), .A0N(REG1[1]), .A1N(n38), .Y(n162) );
  OAI2BB2X1M U138 ( .B0(n296), .B1(n38), .A0N(REG1[2]), .A1N(n38), .Y(n163) );
  OAI2BB2X1M U139 ( .B0(n295), .B1(n38), .A0N(REG1[3]), .A1N(n38), .Y(n164) );
  OAI2BB2X1M U140 ( .B0(n294), .B1(n38), .A0N(REG1[4]), .A1N(n38), .Y(n165) );
  OAI2BB2X1M U141 ( .B0(n293), .B1(n38), .A0N(REG1[5]), .A1N(n38), .Y(n166) );
  OAI2BB2X1M U142 ( .B0(n292), .B1(n38), .A0N(REG1[6]), .A1N(n38), .Y(n167) );
  OAI2BB2X1M U143 ( .B0(n291), .B1(n38), .A0N(REG1[7]), .A1N(n38), .Y(n168) );
  OAI2BB2X1M U144 ( .B0(n299), .B1(n40), .A0N(REG0[0]), .A1N(n40), .Y(n169) );
  OAI2BB2X1M U145 ( .B0(n298), .B1(n40), .A0N(REG0[1]), .A1N(n40), .Y(n170) );
  OAI2BB2X1M U146 ( .B0(n296), .B1(n40), .A0N(REG0[2]), .A1N(n40), .Y(n171) );
  OAI2BB2X1M U147 ( .B0(n295), .B1(n40), .A0N(REG0[3]), .A1N(n40), .Y(n172) );
  OAI2BB2X1M U148 ( .B0(n294), .B1(n40), .A0N(REG0[4]), .A1N(n40), .Y(n173) );
  OAI2BB2X1M U149 ( .B0(n293), .B1(n40), .A0N(REG0[5]), .A1N(n40), .Y(n174) );
  OAI2BB2X1M U150 ( .B0(n292), .B1(n40), .A0N(REG0[6]), .A1N(n40), .Y(n175) );
  OAI2BB2X1M U151 ( .B0(n291), .B1(n40), .A0N(REG0[7]), .A1N(n40), .Y(n176) );
  OAI2BB2X1M U152 ( .B0(n299), .B1(n19), .A0N(\Reg_arr[13][0] ), .A1N(n19), 
        .Y(n65) );
  OAI2BB2X1M U153 ( .B0(n298), .B1(n19), .A0N(\Reg_arr[13][1] ), .A1N(n19), 
        .Y(n66) );
  OAI2BB2X1M U154 ( .B0(n296), .B1(n19), .A0N(\Reg_arr[13][2] ), .A1N(n19), 
        .Y(n67) );
  OAI2BB2X1M U155 ( .B0(n295), .B1(n19), .A0N(\Reg_arr[13][3] ), .A1N(n19), 
        .Y(n68) );
  OAI2BB2X1M U156 ( .B0(n294), .B1(n19), .A0N(\Reg_arr[13][4] ), .A1N(n19), 
        .Y(n69) );
  OAI2BB2X1M U157 ( .B0(n293), .B1(n19), .A0N(\Reg_arr[13][5] ), .A1N(n19), 
        .Y(n70) );
  OAI2BB2X1M U158 ( .B0(n292), .B1(n19), .A0N(\Reg_arr[13][6] ), .A1N(n19), 
        .Y(n71) );
  OAI2BB2X1M U159 ( .B0(n291), .B1(n19), .A0N(\Reg_arr[13][7] ), .A1N(n19), 
        .Y(n72) );
  OAI2BB2X1M U160 ( .B0(n299), .B1(n21), .A0N(\Reg_arr[12][0] ), .A1N(n21), 
        .Y(n73) );
  OAI2BB2X1M U161 ( .B0(n298), .B1(n21), .A0N(\Reg_arr[12][1] ), .A1N(n21), 
        .Y(n74) );
  OAI2BB2X1M U162 ( .B0(n296), .B1(n21), .A0N(\Reg_arr[12][2] ), .A1N(n21), 
        .Y(n75) );
  OAI2BB2X1M U163 ( .B0(n295), .B1(n21), .A0N(\Reg_arr[12][3] ), .A1N(n21), 
        .Y(n76) );
  OAI2BB2X1M U164 ( .B0(n294), .B1(n21), .A0N(\Reg_arr[12][4] ), .A1N(n21), 
        .Y(n77) );
  OAI2BB2X1M U165 ( .B0(n293), .B1(n21), .A0N(\Reg_arr[12][5] ), .A1N(n21), 
        .Y(n78) );
  OAI2BB2X1M U166 ( .B0(n292), .B1(n21), .A0N(\Reg_arr[12][6] ), .A1N(n21), 
        .Y(n79) );
  OAI2BB2X1M U167 ( .B0(n291), .B1(n21), .A0N(\Reg_arr[12][7] ), .A1N(n21), 
        .Y(n80) );
  OAI2BB2X1M U168 ( .B0(n299), .B1(n22), .A0N(\Reg_arr[11][0] ), .A1N(n22), 
        .Y(n81) );
  OAI2BB2X1M U169 ( .B0(n298), .B1(n22), .A0N(\Reg_arr[11][1] ), .A1N(n22), 
        .Y(n82) );
  OAI2BB2X1M U170 ( .B0(n296), .B1(n22), .A0N(\Reg_arr[11][2] ), .A1N(n22), 
        .Y(n83) );
  OAI2BB2X1M U171 ( .B0(n295), .B1(n22), .A0N(\Reg_arr[11][3] ), .A1N(n22), 
        .Y(n84) );
  OAI2BB2X1M U172 ( .B0(n294), .B1(n22), .A0N(\Reg_arr[11][4] ), .A1N(n22), 
        .Y(n85) );
  OAI2BB2X1M U173 ( .B0(n293), .B1(n22), .A0N(\Reg_arr[11][5] ), .A1N(n22), 
        .Y(n86) );
  OAI2BB2X1M U174 ( .B0(n292), .B1(n22), .A0N(\Reg_arr[11][6] ), .A1N(n22), 
        .Y(n87) );
  OAI2BB2X1M U175 ( .B0(n291), .B1(n22), .A0N(\Reg_arr[11][7] ), .A1N(n22), 
        .Y(n88) );
  OAI2BB2X1M U176 ( .B0(n299), .B1(n24), .A0N(\Reg_arr[10][0] ), .A1N(n24), 
        .Y(n89) );
  OAI2BB2X1M U177 ( .B0(n298), .B1(n24), .A0N(\Reg_arr[10][1] ), .A1N(n24), 
        .Y(n90) );
  OAI2BB2X1M U178 ( .B0(n296), .B1(n24), .A0N(\Reg_arr[10][2] ), .A1N(n24), 
        .Y(n91) );
  OAI2BB2X1M U179 ( .B0(n295), .B1(n24), .A0N(\Reg_arr[10][3] ), .A1N(n24), 
        .Y(n92) );
  OAI2BB2X1M U180 ( .B0(n294), .B1(n24), .A0N(\Reg_arr[10][4] ), .A1N(n24), 
        .Y(n93) );
  OAI2BB2X1M U181 ( .B0(n293), .B1(n24), .A0N(\Reg_arr[10][5] ), .A1N(n24), 
        .Y(n94) );
  OAI2BB2X1M U182 ( .B0(n292), .B1(n24), .A0N(\Reg_arr[10][6] ), .A1N(n24), 
        .Y(n95) );
  OAI2BB2X1M U183 ( .B0(n291), .B1(n24), .A0N(\Reg_arr[10][7] ), .A1N(n24), 
        .Y(n96) );
  OAI2BB2X1M U184 ( .B0(n299), .B1(n25), .A0N(\Reg_arr[9][0] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U185 ( .B0(n298), .B1(n25), .A0N(\Reg_arr[9][1] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U186 ( .B0(n296), .B1(n25), .A0N(\Reg_arr[9][2] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U187 ( .B0(n295), .B1(n25), .A0N(\Reg_arr[9][3] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U188 ( .B0(n294), .B1(n25), .A0N(\Reg_arr[9][4] ), .A1N(n25), .Y(
        n101) );
  OAI2BB2X1M U189 ( .B0(n293), .B1(n25), .A0N(\Reg_arr[9][5] ), .A1N(n25), .Y(
        n102) );
  OAI2BB2X1M U190 ( .B0(n292), .B1(n25), .A0N(\Reg_arr[9][6] ), .A1N(n25), .Y(
        n103) );
  OAI2BB2X1M U191 ( .B0(n291), .B1(n25), .A0N(\Reg_arr[9][7] ), .A1N(n25), .Y(
        n104) );
  OAI2BB2X1M U192 ( .B0(n299), .B1(n28), .A0N(\Reg_arr[8][0] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U193 ( .B0(n298), .B1(n28), .A0N(\Reg_arr[8][1] ), .A1N(n28), .Y(
        n106) );
  OAI2BB2X1M U194 ( .B0(n296), .B1(n28), .A0N(\Reg_arr[8][2] ), .A1N(n28), .Y(
        n107) );
  OAI2BB2X1M U195 ( .B0(n295), .B1(n28), .A0N(\Reg_arr[8][3] ), .A1N(n28), .Y(
        n108) );
  OAI2BB2X1M U196 ( .B0(n294), .B1(n28), .A0N(\Reg_arr[8][4] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U197 ( .B0(n293), .B1(n28), .A0N(\Reg_arr[8][5] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U198 ( .B0(n292), .B1(n28), .A0N(\Reg_arr[8][6] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U199 ( .B0(n291), .B1(n28), .A0N(\Reg_arr[8][7] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U200 ( .B0(n293), .B1(n36), .A0N(REG3[5]), .A1N(n36), .Y(n150) );
  OAI2BB2X1M U201 ( .B0(n299), .B1(n37), .A0N(REG2[0]), .A1N(n37), .Y(n153) );
  OAI2BB2X1M U202 ( .B0(n291), .B1(n37), .A0N(REG2[7]), .A1N(n37), .Y(n160) );
  AOI22X1M U203 ( .A0(\Reg_arr[10][0] ), .A1(n273), .B0(\Reg_arr[11][0] ), 
        .B1(n272), .Y(n6) );
  AOI22X1M U204 ( .A0(\Reg_arr[8][0] ), .A1(n275), .B0(\Reg_arr[9][0] ), .B1(
        n274), .Y(n5) );
  CLKNAND2X2M U205 ( .A(N14), .B(n297), .Y(n253) );
  AOI21X1M U206 ( .A0(n6), .A1(n5), .B0(n253), .Y(n180) );
  AOI22X1M U207 ( .A0(\Reg_arr[14][0] ), .A1(n273), .B0(\Reg_arr[15][0] ), 
        .B1(n272), .Y(n8) );
  AOI22X1M U208 ( .A0(\Reg_arr[12][0] ), .A1(n275), .B0(\Reg_arr[13][0] ), 
        .B1(n274), .Y(n7) );
  CLKNAND2X2M U209 ( .A(N14), .B(N13), .Y(n256) );
  AOI21X1M U210 ( .A0(n8), .A1(n7), .B0(n256), .Y(n179) );
  AOI22X1M U211 ( .A0(REG2[0]), .A1(n273), .B0(REG3[0]), .B1(n272), .Y(n10) );
  AOI22X1M U212 ( .A0(REG0[0]), .A1(n275), .B0(REG1[0]), .B1(n274), .Y(n9) );
  CLKNAND2X2M U213 ( .A(n297), .B(n271), .Y(n259) );
  AOI21X1M U214 ( .A0(n10), .A1(n9), .B0(n259), .Y(n178) );
  AOI22X1M U215 ( .A0(\Reg_arr[6][0] ), .A1(n273), .B0(\Reg_arr[7][0] ), .B1(
        n272), .Y(n12) );
  AOI22X1M U216 ( .A0(\Reg_arr[4][0] ), .A1(n275), .B0(\Reg_arr[5][0] ), .B1(
        n274), .Y(n11) );
  CLKNAND2X2M U217 ( .A(N13), .B(n271), .Y(n262) );
  AOI21X1M U218 ( .A0(n12), .A1(n11), .B0(n262), .Y(n177) );
  OR4X1M U219 ( .A(n180), .B(n179), .C(n178), .D(n177), .Y(N43) );
  AOI22X1M U220 ( .A0(\Reg_arr[10][1] ), .A1(n273), .B0(\Reg_arr[11][1] ), 
        .B1(n272), .Y(n182) );
  AOI22X1M U221 ( .A0(\Reg_arr[8][1] ), .A1(n275), .B0(\Reg_arr[9][1] ), .B1(
        n274), .Y(n181) );
  AOI21X1M U222 ( .A0(n182), .A1(n181), .B0(n253), .Y(n192) );
  AOI22X1M U223 ( .A0(\Reg_arr[14][1] ), .A1(n273), .B0(\Reg_arr[15][1] ), 
        .B1(n272), .Y(n184) );
  AOI22X1M U224 ( .A0(\Reg_arr[12][1] ), .A1(n275), .B0(\Reg_arr[13][1] ), 
        .B1(n274), .Y(n183) );
  AOI21X1M U225 ( .A0(n184), .A1(n183), .B0(n256), .Y(n191) );
  AOI22X1M U226 ( .A0(REG2[1]), .A1(n273), .B0(REG3[1]), .B1(n272), .Y(n186)
         );
  AOI22X1M U227 ( .A0(REG0[1]), .A1(n275), .B0(REG1[1]), .B1(n274), .Y(n185)
         );
  AOI21X1M U228 ( .A0(n186), .A1(n185), .B0(n259), .Y(n190) );
  AOI22X1M U229 ( .A0(\Reg_arr[6][1] ), .A1(n273), .B0(\Reg_arr[7][1] ), .B1(
        n272), .Y(n188) );
  AOI22X1M U230 ( .A0(\Reg_arr[4][1] ), .A1(n275), .B0(\Reg_arr[5][1] ), .B1(
        n274), .Y(n187) );
  AOI21X1M U231 ( .A0(n188), .A1(n187), .B0(n262), .Y(n189) );
  OR4X1M U232 ( .A(n192), .B(n191), .C(n190), .D(n189), .Y(N42) );
  AOI22X1M U233 ( .A0(\Reg_arr[10][2] ), .A1(n273), .B0(\Reg_arr[11][2] ), 
        .B1(n272), .Y(n194) );
  AOI22X1M U234 ( .A0(\Reg_arr[8][2] ), .A1(n275), .B0(\Reg_arr[9][2] ), .B1(
        n274), .Y(n193) );
  AOI21X1M U235 ( .A0(n194), .A1(n193), .B0(n253), .Y(n204) );
  AOI22X1M U236 ( .A0(\Reg_arr[14][2] ), .A1(n273), .B0(\Reg_arr[15][2] ), 
        .B1(n272), .Y(n196) );
  AOI22X1M U237 ( .A0(\Reg_arr[12][2] ), .A1(n275), .B0(\Reg_arr[13][2] ), 
        .B1(n274), .Y(n195) );
  AOI21X1M U238 ( .A0(n196), .A1(n195), .B0(n256), .Y(n203) );
  AOI22X1M U239 ( .A0(REG2[2]), .A1(n273), .B0(REG3[2]), .B1(n272), .Y(n198)
         );
  AOI22X1M U240 ( .A0(REG0[2]), .A1(n275), .B0(REG1[2]), .B1(n274), .Y(n197)
         );
  AOI21X1M U241 ( .A0(n198), .A1(n197), .B0(n259), .Y(n202) );
  AOI22X1M U242 ( .A0(\Reg_arr[6][2] ), .A1(n273), .B0(\Reg_arr[7][2] ), .B1(
        n272), .Y(n200) );
  AOI22X1M U243 ( .A0(\Reg_arr[4][2] ), .A1(n275), .B0(\Reg_arr[5][2] ), .B1(
        n274), .Y(n199) );
  AOI21X1M U244 ( .A0(n200), .A1(n199), .B0(n262), .Y(n201) );
  OR4X1M U245 ( .A(n204), .B(n203), .C(n202), .D(n201), .Y(N41) );
  AOI22X1M U246 ( .A0(\Reg_arr[10][3] ), .A1(n273), .B0(\Reg_arr[11][3] ), 
        .B1(n272), .Y(n206) );
  AOI22X1M U247 ( .A0(\Reg_arr[8][3] ), .A1(n275), .B0(\Reg_arr[9][3] ), .B1(
        n274), .Y(n205) );
  AOI21X1M U248 ( .A0(n206), .A1(n205), .B0(n253), .Y(n216) );
  AOI22X1M U249 ( .A0(\Reg_arr[14][3] ), .A1(n273), .B0(\Reg_arr[15][3] ), 
        .B1(n272), .Y(n208) );
  AOI22X1M U250 ( .A0(\Reg_arr[12][3] ), .A1(n275), .B0(\Reg_arr[13][3] ), 
        .B1(n274), .Y(n207) );
  AOI21X1M U251 ( .A0(n208), .A1(n207), .B0(n256), .Y(n215) );
  AOI22X1M U252 ( .A0(REG2[3]), .A1(n273), .B0(REG3[3]), .B1(n272), .Y(n210)
         );
  AOI22X1M U253 ( .A0(REG0[3]), .A1(n275), .B0(REG1[3]), .B1(n274), .Y(n209)
         );
  AOI21X1M U254 ( .A0(n210), .A1(n209), .B0(n259), .Y(n214) );
  AOI22X1M U255 ( .A0(\Reg_arr[6][3] ), .A1(n273), .B0(\Reg_arr[7][3] ), .B1(
        n272), .Y(n212) );
  AOI22X1M U256 ( .A0(\Reg_arr[4][3] ), .A1(n275), .B0(\Reg_arr[5][3] ), .B1(
        n274), .Y(n211) );
  AOI21X1M U257 ( .A0(n212), .A1(n211), .B0(n262), .Y(n213) );
  OR4X1M U258 ( .A(n216), .B(n215), .C(n214), .D(n213), .Y(N40) );
  AOI22X1M U259 ( .A0(\Reg_arr[10][4] ), .A1(n273), .B0(\Reg_arr[11][4] ), 
        .B1(n272), .Y(n218) );
  AOI22X1M U260 ( .A0(\Reg_arr[8][4] ), .A1(n275), .B0(\Reg_arr[9][4] ), .B1(
        n274), .Y(n217) );
  AOI21X1M U261 ( .A0(n218), .A1(n217), .B0(n253), .Y(n228) );
  AOI22X1M U262 ( .A0(\Reg_arr[14][4] ), .A1(n273), .B0(\Reg_arr[15][4] ), 
        .B1(n272), .Y(n220) );
  AOI22X1M U263 ( .A0(\Reg_arr[12][4] ), .A1(n275), .B0(\Reg_arr[13][4] ), 
        .B1(n274), .Y(n219) );
  AOI21X1M U264 ( .A0(n220), .A1(n219), .B0(n256), .Y(n227) );
  AOI22X1M U265 ( .A0(REG2[4]), .A1(n273), .B0(REG3[4]), .B1(n272), .Y(n222)
         );
  AOI22X1M U266 ( .A0(REG0[4]), .A1(n275), .B0(REG1[4]), .B1(n274), .Y(n221)
         );
  AOI21X1M U267 ( .A0(n222), .A1(n221), .B0(n259), .Y(n226) );
  AOI22X1M U268 ( .A0(\Reg_arr[6][4] ), .A1(n273), .B0(\Reg_arr[7][4] ), .B1(
        n272), .Y(n224) );
  AOI22X1M U269 ( .A0(\Reg_arr[4][4] ), .A1(n275), .B0(\Reg_arr[5][4] ), .B1(
        n274), .Y(n223) );
  AOI21X1M U270 ( .A0(n224), .A1(n223), .B0(n262), .Y(n225) );
  OR4X1M U271 ( .A(n228), .B(n227), .C(n226), .D(n225), .Y(N39) );
  AOI22X1M U272 ( .A0(\Reg_arr[10][5] ), .A1(n273), .B0(\Reg_arr[11][5] ), 
        .B1(n272), .Y(n230) );
  AOI22X1M U273 ( .A0(\Reg_arr[8][5] ), .A1(n275), .B0(\Reg_arr[9][5] ), .B1(
        n274), .Y(n229) );
  AOI21X1M U274 ( .A0(n230), .A1(n229), .B0(n253), .Y(n240) );
  AOI22X1M U275 ( .A0(\Reg_arr[14][5] ), .A1(n273), .B0(\Reg_arr[15][5] ), 
        .B1(n272), .Y(n232) );
  AOI22X1M U276 ( .A0(\Reg_arr[12][5] ), .A1(n275), .B0(\Reg_arr[13][5] ), 
        .B1(n274), .Y(n231) );
  AOI21X1M U277 ( .A0(n232), .A1(n231), .B0(n256), .Y(n239) );
  AOI22X1M U278 ( .A0(REG2[5]), .A1(n273), .B0(REG3[5]), .B1(n272), .Y(n234)
         );
  AOI22X1M U279 ( .A0(REG0[5]), .A1(n275), .B0(REG1[5]), .B1(n274), .Y(n233)
         );
  AOI21X1M U280 ( .A0(n234), .A1(n233), .B0(n259), .Y(n238) );
  AOI22X1M U281 ( .A0(\Reg_arr[6][5] ), .A1(n273), .B0(\Reg_arr[7][5] ), .B1(
        n272), .Y(n236) );
  AOI22X1M U282 ( .A0(\Reg_arr[4][5] ), .A1(n275), .B0(\Reg_arr[5][5] ), .B1(
        n274), .Y(n235) );
  AOI21X1M U283 ( .A0(n236), .A1(n235), .B0(n262), .Y(n237) );
  OR4X1M U284 ( .A(n240), .B(n239), .C(n238), .D(n237), .Y(N38) );
  AOI22X1M U285 ( .A0(\Reg_arr[10][6] ), .A1(n273), .B0(\Reg_arr[11][6] ), 
        .B1(n272), .Y(n242) );
  AOI22X1M U286 ( .A0(\Reg_arr[8][6] ), .A1(n275), .B0(\Reg_arr[9][6] ), .B1(
        n274), .Y(n241) );
  AOI21X1M U287 ( .A0(n242), .A1(n241), .B0(n253), .Y(n252) );
  AOI22X1M U288 ( .A0(\Reg_arr[14][6] ), .A1(n273), .B0(\Reg_arr[15][6] ), 
        .B1(n272), .Y(n244) );
  AOI22X1M U289 ( .A0(\Reg_arr[12][6] ), .A1(n275), .B0(\Reg_arr[13][6] ), 
        .B1(n274), .Y(n243) );
  AOI21X1M U290 ( .A0(n244), .A1(n243), .B0(n256), .Y(n251) );
  AOI22X1M U291 ( .A0(REG2[6]), .A1(n273), .B0(REG3[6]), .B1(n272), .Y(n246)
         );
  AOI22X1M U292 ( .A0(REG0[6]), .A1(n275), .B0(REG1[6]), .B1(n274), .Y(n245)
         );
  AOI21X1M U293 ( .A0(n246), .A1(n245), .B0(n259), .Y(n250) );
  AOI22X1M U294 ( .A0(\Reg_arr[6][6] ), .A1(n273), .B0(\Reg_arr[7][6] ), .B1(
        n272), .Y(n248) );
  AOI22X1M U295 ( .A0(\Reg_arr[4][6] ), .A1(n275), .B0(\Reg_arr[5][6] ), .B1(
        n274), .Y(n247) );
  AOI21X1M U296 ( .A0(n248), .A1(n247), .B0(n262), .Y(n249) );
  OR4X1M U297 ( .A(n252), .B(n251), .C(n250), .D(n249), .Y(N37) );
  AOI22X1M U298 ( .A0(\Reg_arr[10][7] ), .A1(n273), .B0(\Reg_arr[11][7] ), 
        .B1(n272), .Y(n255) );
  AOI22X1M U299 ( .A0(\Reg_arr[8][7] ), .A1(n275), .B0(\Reg_arr[9][7] ), .B1(
        n274), .Y(n254) );
  AOI21X1M U300 ( .A0(n255), .A1(n254), .B0(n253), .Y(n268) );
  AOI22X1M U301 ( .A0(\Reg_arr[14][7] ), .A1(n273), .B0(\Reg_arr[15][7] ), 
        .B1(n272), .Y(n258) );
  AOI22X1M U302 ( .A0(\Reg_arr[12][7] ), .A1(n275), .B0(\Reg_arr[13][7] ), 
        .B1(n274), .Y(n257) );
  AOI21X1M U303 ( .A0(n258), .A1(n257), .B0(n256), .Y(n267) );
  AOI22X1M U304 ( .A0(REG2[7]), .A1(n273), .B0(REG3[7]), .B1(n272), .Y(n261)
         );
  AOI22X1M U305 ( .A0(REG0[7]), .A1(n275), .B0(REG1[7]), .B1(n274), .Y(n260)
         );
  AOI21X1M U306 ( .A0(n261), .A1(n260), .B0(n259), .Y(n266) );
  AOI22X1M U307 ( .A0(\Reg_arr[6][7] ), .A1(n273), .B0(\Reg_arr[7][7] ), .B1(
        n272), .Y(n264) );
  AOI22X1M U308 ( .A0(\Reg_arr[4][7] ), .A1(n275), .B0(\Reg_arr[5][7] ), .B1(
        n274), .Y(n263) );
  AOI21X1M U309 ( .A0(n264), .A1(n263), .B0(n262), .Y(n265) );
  OR4X1M U310 ( .A(n268), .B(n267), .C(n266), .D(n265), .Y(N36) );
endmodule


module FIFO_MEM_CNTRL_DATA_WIDTH8_DEPTH16 ( wclken, wdata, waddr, raddr, wclk, 
        rdata );
  input [7:0] wdata;
  input [3:0] waddr;
  input [3:0] raddr;
  output [7:0] rdata;
  input wclken, wclk;
  wire   N10, N11, N12, N13, \Memory[15][7] , \Memory[15][6] , \Memory[15][5] ,
         \Memory[15][4] , \Memory[15][3] , \Memory[15][2] , \Memory[15][1] ,
         \Memory[15][0] , \Memory[14][7] , \Memory[14][6] , \Memory[14][5] ,
         \Memory[14][4] , \Memory[14][3] , \Memory[14][2] , \Memory[14][1] ,
         \Memory[14][0] , \Memory[13][7] , \Memory[13][6] , \Memory[13][5] ,
         \Memory[13][4] , \Memory[13][3] , \Memory[13][2] , \Memory[13][1] ,
         \Memory[13][0] , \Memory[12][7] , \Memory[12][6] , \Memory[12][5] ,
         \Memory[12][4] , \Memory[12][3] , \Memory[12][2] , \Memory[12][1] ,
         \Memory[12][0] , \Memory[11][7] , \Memory[11][6] , \Memory[11][5] ,
         \Memory[11][4] , \Memory[11][3] , \Memory[11][2] , \Memory[11][1] ,
         \Memory[11][0] , \Memory[10][7] , \Memory[10][6] , \Memory[10][5] ,
         \Memory[10][4] , \Memory[10][3] , \Memory[10][2] , \Memory[10][1] ,
         \Memory[10][0] , \Memory[9][7] , \Memory[9][6] , \Memory[9][5] ,
         \Memory[9][4] , \Memory[9][3] , \Memory[9][2] , \Memory[9][1] ,
         \Memory[9][0] , \Memory[8][7] , \Memory[8][6] , \Memory[8][5] ,
         \Memory[8][4] , \Memory[8][3] , \Memory[8][2] , \Memory[8][1] ,
         \Memory[8][0] , \Memory[7][7] , \Memory[7][6] , \Memory[7][5] ,
         \Memory[7][4] , \Memory[7][3] , \Memory[7][2] , \Memory[7][1] ,
         \Memory[7][0] , \Memory[6][7] , \Memory[6][6] , \Memory[6][5] ,
         \Memory[6][4] , \Memory[6][3] , \Memory[6][2] , \Memory[6][1] ,
         \Memory[6][0] , \Memory[5][7] , \Memory[5][6] , \Memory[5][5] ,
         \Memory[5][4] , \Memory[5][3] , \Memory[5][2] , \Memory[5][1] ,
         \Memory[5][0] , \Memory[4][7] , \Memory[4][6] , \Memory[4][5] ,
         \Memory[4][4] , \Memory[4][3] , \Memory[4][2] , \Memory[4][1] ,
         \Memory[4][0] , \Memory[3][7] , \Memory[3][6] , \Memory[3][5] ,
         \Memory[3][4] , \Memory[3][3] , \Memory[3][2] , \Memory[3][1] ,
         \Memory[3][0] , \Memory[2][7] , \Memory[2][6] , \Memory[2][5] ,
         \Memory[2][4] , \Memory[2][3] , \Memory[2][2] , \Memory[2][1] ,
         \Memory[2][0] , \Memory[1][7] , \Memory[1][6] , \Memory[1][5] ,
         \Memory[1][4] , \Memory[1][3] , \Memory[1][2] , \Memory[1][1] ,
         \Memory[1][0] , \Memory[0][7] , \Memory[0][6] , \Memory[0][5] ,
         \Memory[0][4] , \Memory[0][3] , \Memory[0][2] , \Memory[0][1] ,
         \Memory[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign N13 = raddr[3];

  DFFQX2M \Memory_reg[15][7]  ( .D(n164), .CK(wclk), .Q(\Memory[15][7] ) );
  DFFQX2M \Memory_reg[15][6]  ( .D(n163), .CK(wclk), .Q(\Memory[15][6] ) );
  DFFQX2M \Memory_reg[15][5]  ( .D(n162), .CK(wclk), .Q(\Memory[15][5] ) );
  DFFQX2M \Memory_reg[15][4]  ( .D(n161), .CK(wclk), .Q(\Memory[15][4] ) );
  DFFQX2M \Memory_reg[15][3]  ( .D(n160), .CK(wclk), .Q(\Memory[15][3] ) );
  DFFQX2M \Memory_reg[15][2]  ( .D(n159), .CK(wclk), .Q(\Memory[15][2] ) );
  DFFQX2M \Memory_reg[15][1]  ( .D(n158), .CK(wclk), .Q(\Memory[15][1] ) );
  DFFQX2M \Memory_reg[15][0]  ( .D(n157), .CK(wclk), .Q(\Memory[15][0] ) );
  DFFQX2M \Memory_reg[13][7]  ( .D(n148), .CK(wclk), .Q(\Memory[13][7] ) );
  DFFQX2M \Memory_reg[13][6]  ( .D(n147), .CK(wclk), .Q(\Memory[13][6] ) );
  DFFQX2M \Memory_reg[13][5]  ( .D(n146), .CK(wclk), .Q(\Memory[13][5] ) );
  DFFQX2M \Memory_reg[13][4]  ( .D(n145), .CK(wclk), .Q(\Memory[13][4] ) );
  DFFQX2M \Memory_reg[13][3]  ( .D(n144), .CK(wclk), .Q(\Memory[13][3] ) );
  DFFQX2M \Memory_reg[13][2]  ( .D(n143), .CK(wclk), .Q(\Memory[13][2] ) );
  DFFQX2M \Memory_reg[13][1]  ( .D(n142), .CK(wclk), .Q(\Memory[13][1] ) );
  DFFQX2M \Memory_reg[13][0]  ( .D(n141), .CK(wclk), .Q(\Memory[13][0] ) );
  DFFQX2M \Memory_reg[11][7]  ( .D(n132), .CK(wclk), .Q(\Memory[11][7] ) );
  DFFQX2M \Memory_reg[11][6]  ( .D(n131), .CK(wclk), .Q(\Memory[11][6] ) );
  DFFQX2M \Memory_reg[11][5]  ( .D(n130), .CK(wclk), .Q(\Memory[11][5] ) );
  DFFQX2M \Memory_reg[11][4]  ( .D(n129), .CK(wclk), .Q(\Memory[11][4] ) );
  DFFQX2M \Memory_reg[11][3]  ( .D(n128), .CK(wclk), .Q(\Memory[11][3] ) );
  DFFQX2M \Memory_reg[11][2]  ( .D(n127), .CK(wclk), .Q(\Memory[11][2] ) );
  DFFQX2M \Memory_reg[11][1]  ( .D(n126), .CK(wclk), .Q(\Memory[11][1] ) );
  DFFQX2M \Memory_reg[11][0]  ( .D(n125), .CK(wclk), .Q(\Memory[11][0] ) );
  DFFQX2M \Memory_reg[9][7]  ( .D(n116), .CK(wclk), .Q(\Memory[9][7] ) );
  DFFQX2M \Memory_reg[9][6]  ( .D(n115), .CK(wclk), .Q(\Memory[9][6] ) );
  DFFQX2M \Memory_reg[9][5]  ( .D(n114), .CK(wclk), .Q(\Memory[9][5] ) );
  DFFQX2M \Memory_reg[9][4]  ( .D(n113), .CK(wclk), .Q(\Memory[9][4] ) );
  DFFQX2M \Memory_reg[9][3]  ( .D(n112), .CK(wclk), .Q(\Memory[9][3] ) );
  DFFQX2M \Memory_reg[9][2]  ( .D(n111), .CK(wclk), .Q(\Memory[9][2] ) );
  DFFQX2M \Memory_reg[9][1]  ( .D(n110), .CK(wclk), .Q(\Memory[9][1] ) );
  DFFQX2M \Memory_reg[9][0]  ( .D(n109), .CK(wclk), .Q(\Memory[9][0] ) );
  DFFQX2M \Memory_reg[7][7]  ( .D(n100), .CK(wclk), .Q(\Memory[7][7] ) );
  DFFQX2M \Memory_reg[7][6]  ( .D(n99), .CK(wclk), .Q(\Memory[7][6] ) );
  DFFQX2M \Memory_reg[7][5]  ( .D(n98), .CK(wclk), .Q(\Memory[7][5] ) );
  DFFQX2M \Memory_reg[7][4]  ( .D(n97), .CK(wclk), .Q(\Memory[7][4] ) );
  DFFQX2M \Memory_reg[7][3]  ( .D(n96), .CK(wclk), .Q(\Memory[7][3] ) );
  DFFQX2M \Memory_reg[7][2]  ( .D(n95), .CK(wclk), .Q(\Memory[7][2] ) );
  DFFQX2M \Memory_reg[7][1]  ( .D(n94), .CK(wclk), .Q(\Memory[7][1] ) );
  DFFQX2M \Memory_reg[7][0]  ( .D(n93), .CK(wclk), .Q(\Memory[7][0] ) );
  DFFQX2M \Memory_reg[5][7]  ( .D(n84), .CK(wclk), .Q(\Memory[5][7] ) );
  DFFQX2M \Memory_reg[5][6]  ( .D(n83), .CK(wclk), .Q(\Memory[5][6] ) );
  DFFQX2M \Memory_reg[5][5]  ( .D(n82), .CK(wclk), .Q(\Memory[5][5] ) );
  DFFQX2M \Memory_reg[5][4]  ( .D(n81), .CK(wclk), .Q(\Memory[5][4] ) );
  DFFQX2M \Memory_reg[5][3]  ( .D(n80), .CK(wclk), .Q(\Memory[5][3] ) );
  DFFQX2M \Memory_reg[5][2]  ( .D(n79), .CK(wclk), .Q(\Memory[5][2] ) );
  DFFQX2M \Memory_reg[5][1]  ( .D(n78), .CK(wclk), .Q(\Memory[5][1] ) );
  DFFQX2M \Memory_reg[5][0]  ( .D(n77), .CK(wclk), .Q(\Memory[5][0] ) );
  DFFQX2M \Memory_reg[3][7]  ( .D(n68), .CK(wclk), .Q(\Memory[3][7] ) );
  DFFQX2M \Memory_reg[3][6]  ( .D(n67), .CK(wclk), .Q(\Memory[3][6] ) );
  DFFQX2M \Memory_reg[3][5]  ( .D(n66), .CK(wclk), .Q(\Memory[3][5] ) );
  DFFQX2M \Memory_reg[3][4]  ( .D(n65), .CK(wclk), .Q(\Memory[3][4] ) );
  DFFQX2M \Memory_reg[3][3]  ( .D(n64), .CK(wclk), .Q(\Memory[3][3] ) );
  DFFQX2M \Memory_reg[3][2]  ( .D(n63), .CK(wclk), .Q(\Memory[3][2] ) );
  DFFQX2M \Memory_reg[3][1]  ( .D(n62), .CK(wclk), .Q(\Memory[3][1] ) );
  DFFQX2M \Memory_reg[3][0]  ( .D(n61), .CK(wclk), .Q(\Memory[3][0] ) );
  DFFQX2M \Memory_reg[1][7]  ( .D(n52), .CK(wclk), .Q(\Memory[1][7] ) );
  DFFQX2M \Memory_reg[1][6]  ( .D(n51), .CK(wclk), .Q(\Memory[1][6] ) );
  DFFQX2M \Memory_reg[1][5]  ( .D(n50), .CK(wclk), .Q(\Memory[1][5] ) );
  DFFQX2M \Memory_reg[1][4]  ( .D(n49), .CK(wclk), .Q(\Memory[1][4] ) );
  DFFQX2M \Memory_reg[1][3]  ( .D(n48), .CK(wclk), .Q(\Memory[1][3] ) );
  DFFQX2M \Memory_reg[1][2]  ( .D(n47), .CK(wclk), .Q(\Memory[1][2] ) );
  DFFQX2M \Memory_reg[1][1]  ( .D(n46), .CK(wclk), .Q(\Memory[1][1] ) );
  DFFQX2M \Memory_reg[1][0]  ( .D(n45), .CK(wclk), .Q(\Memory[1][0] ) );
  DFFQX2M \Memory_reg[14][7]  ( .D(n156), .CK(wclk), .Q(\Memory[14][7] ) );
  DFFQX2M \Memory_reg[14][6]  ( .D(n155), .CK(wclk), .Q(\Memory[14][6] ) );
  DFFQX2M \Memory_reg[14][5]  ( .D(n154), .CK(wclk), .Q(\Memory[14][5] ) );
  DFFQX2M \Memory_reg[14][4]  ( .D(n153), .CK(wclk), .Q(\Memory[14][4] ) );
  DFFQX2M \Memory_reg[14][3]  ( .D(n152), .CK(wclk), .Q(\Memory[14][3] ) );
  DFFQX2M \Memory_reg[14][2]  ( .D(n151), .CK(wclk), .Q(\Memory[14][2] ) );
  DFFQX2M \Memory_reg[14][1]  ( .D(n150), .CK(wclk), .Q(\Memory[14][1] ) );
  DFFQX2M \Memory_reg[14][0]  ( .D(n149), .CK(wclk), .Q(\Memory[14][0] ) );
  DFFQX2M \Memory_reg[12][7]  ( .D(n140), .CK(wclk), .Q(\Memory[12][7] ) );
  DFFQX2M \Memory_reg[12][6]  ( .D(n139), .CK(wclk), .Q(\Memory[12][6] ) );
  DFFQX2M \Memory_reg[12][5]  ( .D(n138), .CK(wclk), .Q(\Memory[12][5] ) );
  DFFQX2M \Memory_reg[12][4]  ( .D(n137), .CK(wclk), .Q(\Memory[12][4] ) );
  DFFQX2M \Memory_reg[12][3]  ( .D(n136), .CK(wclk), .Q(\Memory[12][3] ) );
  DFFQX2M \Memory_reg[12][2]  ( .D(n135), .CK(wclk), .Q(\Memory[12][2] ) );
  DFFQX2M \Memory_reg[12][1]  ( .D(n134), .CK(wclk), .Q(\Memory[12][1] ) );
  DFFQX2M \Memory_reg[12][0]  ( .D(n133), .CK(wclk), .Q(\Memory[12][0] ) );
  DFFQX2M \Memory_reg[10][7]  ( .D(n124), .CK(wclk), .Q(\Memory[10][7] ) );
  DFFQX2M \Memory_reg[10][6]  ( .D(n123), .CK(wclk), .Q(\Memory[10][6] ) );
  DFFQX2M \Memory_reg[10][5]  ( .D(n122), .CK(wclk), .Q(\Memory[10][5] ) );
  DFFQX2M \Memory_reg[10][4]  ( .D(n121), .CK(wclk), .Q(\Memory[10][4] ) );
  DFFQX2M \Memory_reg[10][3]  ( .D(n120), .CK(wclk), .Q(\Memory[10][3] ) );
  DFFQX2M \Memory_reg[10][2]  ( .D(n119), .CK(wclk), .Q(\Memory[10][2] ) );
  DFFQX2M \Memory_reg[10][1]  ( .D(n118), .CK(wclk), .Q(\Memory[10][1] ) );
  DFFQX2M \Memory_reg[10][0]  ( .D(n117), .CK(wclk), .Q(\Memory[10][0] ) );
  DFFQX2M \Memory_reg[8][7]  ( .D(n108), .CK(wclk), .Q(\Memory[8][7] ) );
  DFFQX2M \Memory_reg[8][6]  ( .D(n107), .CK(wclk), .Q(\Memory[8][6] ) );
  DFFQX2M \Memory_reg[8][5]  ( .D(n106), .CK(wclk), .Q(\Memory[8][5] ) );
  DFFQX2M \Memory_reg[8][4]  ( .D(n105), .CK(wclk), .Q(\Memory[8][4] ) );
  DFFQX2M \Memory_reg[8][3]  ( .D(n104), .CK(wclk), .Q(\Memory[8][3] ) );
  DFFQX2M \Memory_reg[8][2]  ( .D(n103), .CK(wclk), .Q(\Memory[8][2] ) );
  DFFQX2M \Memory_reg[8][1]  ( .D(n102), .CK(wclk), .Q(\Memory[8][1] ) );
  DFFQX2M \Memory_reg[8][0]  ( .D(n101), .CK(wclk), .Q(\Memory[8][0] ) );
  DFFQX2M \Memory_reg[6][7]  ( .D(n92), .CK(wclk), .Q(\Memory[6][7] ) );
  DFFQX2M \Memory_reg[6][6]  ( .D(n91), .CK(wclk), .Q(\Memory[6][6] ) );
  DFFQX2M \Memory_reg[6][5]  ( .D(n90), .CK(wclk), .Q(\Memory[6][5] ) );
  DFFQX2M \Memory_reg[6][4]  ( .D(n89), .CK(wclk), .Q(\Memory[6][4] ) );
  DFFQX2M \Memory_reg[6][3]  ( .D(n88), .CK(wclk), .Q(\Memory[6][3] ) );
  DFFQX2M \Memory_reg[6][2]  ( .D(n87), .CK(wclk), .Q(\Memory[6][2] ) );
  DFFQX2M \Memory_reg[6][1]  ( .D(n86), .CK(wclk), .Q(\Memory[6][1] ) );
  DFFQX2M \Memory_reg[6][0]  ( .D(n85), .CK(wclk), .Q(\Memory[6][0] ) );
  DFFQX2M \Memory_reg[4][7]  ( .D(n76), .CK(wclk), .Q(\Memory[4][7] ) );
  DFFQX2M \Memory_reg[4][6]  ( .D(n75), .CK(wclk), .Q(\Memory[4][6] ) );
  DFFQX2M \Memory_reg[4][5]  ( .D(n74), .CK(wclk), .Q(\Memory[4][5] ) );
  DFFQX2M \Memory_reg[4][4]  ( .D(n73), .CK(wclk), .Q(\Memory[4][4] ) );
  DFFQX2M \Memory_reg[4][3]  ( .D(n72), .CK(wclk), .Q(\Memory[4][3] ) );
  DFFQX2M \Memory_reg[4][2]  ( .D(n71), .CK(wclk), .Q(\Memory[4][2] ) );
  DFFQX2M \Memory_reg[4][1]  ( .D(n70), .CK(wclk), .Q(\Memory[4][1] ) );
  DFFQX2M \Memory_reg[4][0]  ( .D(n69), .CK(wclk), .Q(\Memory[4][0] ) );
  DFFQX2M \Memory_reg[2][7]  ( .D(n60), .CK(wclk), .Q(\Memory[2][7] ) );
  DFFQX2M \Memory_reg[2][6]  ( .D(n59), .CK(wclk), .Q(\Memory[2][6] ) );
  DFFQX2M \Memory_reg[2][5]  ( .D(n58), .CK(wclk), .Q(\Memory[2][5] ) );
  DFFQX2M \Memory_reg[2][4]  ( .D(n57), .CK(wclk), .Q(\Memory[2][4] ) );
  DFFQX2M \Memory_reg[2][3]  ( .D(n56), .CK(wclk), .Q(\Memory[2][3] ) );
  DFFQX2M \Memory_reg[2][2]  ( .D(n55), .CK(wclk), .Q(\Memory[2][2] ) );
  DFFQX2M \Memory_reg[2][1]  ( .D(n54), .CK(wclk), .Q(\Memory[2][1] ) );
  DFFQX2M \Memory_reg[2][0]  ( .D(n53), .CK(wclk), .Q(\Memory[2][0] ) );
  DFFQX2M \Memory_reg[0][7]  ( .D(n44), .CK(wclk), .Q(\Memory[0][7] ) );
  DFFQX2M \Memory_reg[0][6]  ( .D(n43), .CK(wclk), .Q(\Memory[0][6] ) );
  DFFQX2M \Memory_reg[0][5]  ( .D(n42), .CK(wclk), .Q(\Memory[0][5] ) );
  DFFQX2M \Memory_reg[0][4]  ( .D(n41), .CK(wclk), .Q(\Memory[0][4] ) );
  DFFQX2M \Memory_reg[0][3]  ( .D(n40), .CK(wclk), .Q(\Memory[0][3] ) );
  DFFQX2M \Memory_reg[0][2]  ( .D(n39), .CK(wclk), .Q(\Memory[0][2] ) );
  DFFQX2M \Memory_reg[0][1]  ( .D(n38), .CK(wclk), .Q(\Memory[0][1] ) );
  DFFQX2M \Memory_reg[0][0]  ( .D(n37), .CK(wclk), .Q(\Memory[0][0] ) );
  INVX2M U2 ( .A(wdata[0]), .Y(n276) );
  INVX2M U3 ( .A(wdata[1]), .Y(n275) );
  INVX2M U4 ( .A(wdata[2]), .Y(n274) );
  INVX2M U5 ( .A(wdata[3]), .Y(n273) );
  INVX2M U6 ( .A(wdata[4]), .Y(n272) );
  INVX2M U7 ( .A(wdata[5]), .Y(n271) );
  INVX2M U8 ( .A(wdata[6]), .Y(n270) );
  INVX2M U9 ( .A(wdata[7]), .Y(n269) );
  NOR2X2M U10 ( .A(n268), .B(waddr[2]), .Y(n17) );
  NOR2X2M U11 ( .A(waddr[1]), .B(waddr[2]), .Y(n12) );
  INVX2M U12 ( .A(n1), .Y(n263) );
  NAND2X2M U13 ( .A(n17), .B(n13), .Y(n16) );
  NAND2X2M U14 ( .A(n17), .B(n15), .Y(n18) );
  NAND2X2M U15 ( .A(n20), .B(n13), .Y(n19) );
  NAND2X2M U16 ( .A(n20), .B(n15), .Y(n21) );
  NAND2X2M U17 ( .A(n23), .B(n15), .Y(n25) );
  NAND2X2M U18 ( .A(n27), .B(n20), .Y(n32) );
  NAND2X2M U19 ( .A(n29), .B(n20), .Y(n33) );
  NAND2X2M U20 ( .A(n27), .B(n23), .Y(n34) );
  NAND2X2M U21 ( .A(n29), .B(n23), .Y(n36) );
  NAND2X2M U22 ( .A(n15), .B(n12), .Y(n14) );
  NAND2X2M U23 ( .A(n23), .B(n13), .Y(n22) );
  NAND2X2M U24 ( .A(n27), .B(n12), .Y(n26) );
  NAND2X2M U25 ( .A(n29), .B(n12), .Y(n28) );
  NAND2X2M U26 ( .A(n27), .B(n17), .Y(n30) );
  NAND2X2M U27 ( .A(n29), .B(n17), .Y(n31) );
  NAND2X2M U28 ( .A(n12), .B(n13), .Y(n11) );
  AND2X2M U29 ( .A(n24), .B(n267), .Y(n13) );
  AND2X2M U30 ( .A(n35), .B(n267), .Y(n27) );
  OR2X2M U31 ( .A(n259), .B(n262), .Y(n1) );
  INVX2M U32 ( .A(n2), .Y(n266) );
  INVX2M U33 ( .A(n4), .Y(n264) );
  INVX2M U34 ( .A(n3), .Y(n265) );
  OAI2BB2X1M U35 ( .B0(n11), .B1(n276), .A0N(\Memory[0][0] ), .A1N(n11), .Y(
        n37) );
  OAI2BB2X1M U36 ( .B0(n11), .B1(n275), .A0N(\Memory[0][1] ), .A1N(n11), .Y(
        n38) );
  OAI2BB2X1M U37 ( .B0(n11), .B1(n274), .A0N(\Memory[0][2] ), .A1N(n11), .Y(
        n39) );
  OAI2BB2X1M U38 ( .B0(n11), .B1(n273), .A0N(\Memory[0][3] ), .A1N(n11), .Y(
        n40) );
  OAI2BB2X1M U39 ( .B0(n11), .B1(n272), .A0N(\Memory[0][4] ), .A1N(n11), .Y(
        n41) );
  OAI2BB2X1M U40 ( .B0(n11), .B1(n271), .A0N(\Memory[0][5] ), .A1N(n11), .Y(
        n42) );
  OAI2BB2X1M U41 ( .B0(n11), .B1(n270), .A0N(\Memory[0][6] ), .A1N(n11), .Y(
        n43) );
  OAI2BB2X1M U42 ( .B0(n11), .B1(n269), .A0N(\Memory[0][7] ), .A1N(n11), .Y(
        n44) );
  OAI2BB2X1M U43 ( .B0(n276), .B1(n16), .A0N(\Memory[2][0] ), .A1N(n16), .Y(
        n53) );
  OAI2BB2X1M U44 ( .B0(n275), .B1(n16), .A0N(\Memory[2][1] ), .A1N(n16), .Y(
        n54) );
  OAI2BB2X1M U45 ( .B0(n274), .B1(n16), .A0N(\Memory[2][2] ), .A1N(n16), .Y(
        n55) );
  OAI2BB2X1M U46 ( .B0(n273), .B1(n16), .A0N(\Memory[2][3] ), .A1N(n16), .Y(
        n56) );
  OAI2BB2X1M U47 ( .B0(n272), .B1(n16), .A0N(\Memory[2][4] ), .A1N(n16), .Y(
        n57) );
  OAI2BB2X1M U48 ( .B0(n271), .B1(n16), .A0N(\Memory[2][5] ), .A1N(n16), .Y(
        n58) );
  OAI2BB2X1M U49 ( .B0(n270), .B1(n16), .A0N(\Memory[2][6] ), .A1N(n16), .Y(
        n59) );
  OAI2BB2X1M U50 ( .B0(n269), .B1(n16), .A0N(\Memory[2][7] ), .A1N(n16), .Y(
        n60) );
  OAI2BB2X1M U51 ( .B0(n276), .B1(n18), .A0N(\Memory[3][0] ), .A1N(n18), .Y(
        n61) );
  OAI2BB2X1M U52 ( .B0(n275), .B1(n18), .A0N(\Memory[3][1] ), .A1N(n18), .Y(
        n62) );
  OAI2BB2X1M U53 ( .B0(n274), .B1(n18), .A0N(\Memory[3][2] ), .A1N(n18), .Y(
        n63) );
  OAI2BB2X1M U54 ( .B0(n273), .B1(n18), .A0N(\Memory[3][3] ), .A1N(n18), .Y(
        n64) );
  OAI2BB2X1M U55 ( .B0(n272), .B1(n18), .A0N(\Memory[3][4] ), .A1N(n18), .Y(
        n65) );
  OAI2BB2X1M U56 ( .B0(n271), .B1(n18), .A0N(\Memory[3][5] ), .A1N(n18), .Y(
        n66) );
  OAI2BB2X1M U57 ( .B0(n270), .B1(n18), .A0N(\Memory[3][6] ), .A1N(n18), .Y(
        n67) );
  OAI2BB2X1M U58 ( .B0(n269), .B1(n18), .A0N(\Memory[3][7] ), .A1N(n18), .Y(
        n68) );
  OAI2BB2X1M U59 ( .B0(n276), .B1(n14), .A0N(\Memory[1][0] ), .A1N(n14), .Y(
        n45) );
  OAI2BB2X1M U60 ( .B0(n275), .B1(n14), .A0N(\Memory[1][1] ), .A1N(n14), .Y(
        n46) );
  OAI2BB2X1M U61 ( .B0(n274), .B1(n14), .A0N(\Memory[1][2] ), .A1N(n14), .Y(
        n47) );
  OAI2BB2X1M U62 ( .B0(n273), .B1(n14), .A0N(\Memory[1][3] ), .A1N(n14), .Y(
        n48) );
  OAI2BB2X1M U63 ( .B0(n272), .B1(n14), .A0N(\Memory[1][4] ), .A1N(n14), .Y(
        n49) );
  OAI2BB2X1M U64 ( .B0(n271), .B1(n14), .A0N(\Memory[1][5] ), .A1N(n14), .Y(
        n50) );
  OAI2BB2X1M U65 ( .B0(n270), .B1(n14), .A0N(\Memory[1][6] ), .A1N(n14), .Y(
        n51) );
  OAI2BB2X1M U66 ( .B0(n269), .B1(n14), .A0N(\Memory[1][7] ), .A1N(n14), .Y(
        n52) );
  OAI2BB2X1M U67 ( .B0(n276), .B1(n26), .A0N(\Memory[8][0] ), .A1N(n26), .Y(
        n101) );
  OAI2BB2X1M U68 ( .B0(n275), .B1(n26), .A0N(\Memory[8][1] ), .A1N(n26), .Y(
        n102) );
  OAI2BB2X1M U69 ( .B0(n274), .B1(n26), .A0N(\Memory[8][2] ), .A1N(n26), .Y(
        n103) );
  OAI2BB2X1M U70 ( .B0(n273), .B1(n26), .A0N(\Memory[8][3] ), .A1N(n26), .Y(
        n104) );
  OAI2BB2X1M U71 ( .B0(n272), .B1(n26), .A0N(\Memory[8][4] ), .A1N(n26), .Y(
        n105) );
  OAI2BB2X1M U72 ( .B0(n271), .B1(n26), .A0N(\Memory[8][5] ), .A1N(n26), .Y(
        n106) );
  OAI2BB2X1M U73 ( .B0(n270), .B1(n26), .A0N(\Memory[8][6] ), .A1N(n26), .Y(
        n107) );
  OAI2BB2X1M U74 ( .B0(n269), .B1(n26), .A0N(\Memory[8][7] ), .A1N(n26), .Y(
        n108) );
  OAI2BB2X1M U75 ( .B0(n276), .B1(n28), .A0N(\Memory[9][0] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U76 ( .B0(n275), .B1(n28), .A0N(\Memory[9][1] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U77 ( .B0(n274), .B1(n28), .A0N(\Memory[9][2] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U78 ( .B0(n273), .B1(n28), .A0N(\Memory[9][3] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U79 ( .B0(n272), .B1(n28), .A0N(\Memory[9][4] ), .A1N(n28), .Y(
        n113) );
  OAI2BB2X1M U80 ( .B0(n271), .B1(n28), .A0N(\Memory[9][5] ), .A1N(n28), .Y(
        n114) );
  OAI2BB2X1M U81 ( .B0(n270), .B1(n28), .A0N(\Memory[9][6] ), .A1N(n28), .Y(
        n115) );
  OAI2BB2X1M U82 ( .B0(n269), .B1(n28), .A0N(\Memory[9][7] ), .A1N(n28), .Y(
        n116) );
  OAI2BB2X1M U83 ( .B0(n276), .B1(n30), .A0N(\Memory[10][0] ), .A1N(n30), .Y(
        n117) );
  OAI2BB2X1M U84 ( .B0(n275), .B1(n30), .A0N(\Memory[10][1] ), .A1N(n30), .Y(
        n118) );
  OAI2BB2X1M U85 ( .B0(n274), .B1(n30), .A0N(\Memory[10][2] ), .A1N(n30), .Y(
        n119) );
  OAI2BB2X1M U86 ( .B0(n273), .B1(n30), .A0N(\Memory[10][3] ), .A1N(n30), .Y(
        n120) );
  OAI2BB2X1M U87 ( .B0(n272), .B1(n30), .A0N(\Memory[10][4] ), .A1N(n30), .Y(
        n121) );
  OAI2BB2X1M U88 ( .B0(n271), .B1(n30), .A0N(\Memory[10][5] ), .A1N(n30), .Y(
        n122) );
  OAI2BB2X1M U89 ( .B0(n270), .B1(n30), .A0N(\Memory[10][6] ), .A1N(n30), .Y(
        n123) );
  OAI2BB2X1M U90 ( .B0(n269), .B1(n30), .A0N(\Memory[10][7] ), .A1N(n30), .Y(
        n124) );
  OAI2BB2X1M U91 ( .B0(n276), .B1(n31), .A0N(\Memory[11][0] ), .A1N(n31), .Y(
        n125) );
  OAI2BB2X1M U92 ( .B0(n275), .B1(n31), .A0N(\Memory[11][1] ), .A1N(n31), .Y(
        n126) );
  OAI2BB2X1M U93 ( .B0(n274), .B1(n31), .A0N(\Memory[11][2] ), .A1N(n31), .Y(
        n127) );
  OAI2BB2X1M U94 ( .B0(n273), .B1(n31), .A0N(\Memory[11][3] ), .A1N(n31), .Y(
        n128) );
  OAI2BB2X1M U95 ( .B0(n272), .B1(n31), .A0N(\Memory[11][4] ), .A1N(n31), .Y(
        n129) );
  OAI2BB2X1M U96 ( .B0(n271), .B1(n31), .A0N(\Memory[11][5] ), .A1N(n31), .Y(
        n130) );
  OAI2BB2X1M U97 ( .B0(n270), .B1(n31), .A0N(\Memory[11][6] ), .A1N(n31), .Y(
        n131) );
  OAI2BB2X1M U98 ( .B0(n269), .B1(n31), .A0N(\Memory[11][7] ), .A1N(n31), .Y(
        n132) );
  OAI2BB2X1M U99 ( .B0(n276), .B1(n19), .A0N(\Memory[4][0] ), .A1N(n19), .Y(
        n69) );
  OAI2BB2X1M U100 ( .B0(n275), .B1(n19), .A0N(\Memory[4][1] ), .A1N(n19), .Y(
        n70) );
  OAI2BB2X1M U101 ( .B0(n274), .B1(n19), .A0N(\Memory[4][2] ), .A1N(n19), .Y(
        n71) );
  OAI2BB2X1M U102 ( .B0(n273), .B1(n19), .A0N(\Memory[4][3] ), .A1N(n19), .Y(
        n72) );
  OAI2BB2X1M U103 ( .B0(n272), .B1(n19), .A0N(\Memory[4][4] ), .A1N(n19), .Y(
        n73) );
  OAI2BB2X1M U104 ( .B0(n271), .B1(n19), .A0N(\Memory[4][5] ), .A1N(n19), .Y(
        n74) );
  OAI2BB2X1M U105 ( .B0(n270), .B1(n19), .A0N(\Memory[4][6] ), .A1N(n19), .Y(
        n75) );
  OAI2BB2X1M U106 ( .B0(n269), .B1(n19), .A0N(\Memory[4][7] ), .A1N(n19), .Y(
        n76) );
  OAI2BB2X1M U107 ( .B0(n276), .B1(n21), .A0N(\Memory[5][0] ), .A1N(n21), .Y(
        n77) );
  OAI2BB2X1M U108 ( .B0(n275), .B1(n21), .A0N(\Memory[5][1] ), .A1N(n21), .Y(
        n78) );
  OAI2BB2X1M U109 ( .B0(n274), .B1(n21), .A0N(\Memory[5][2] ), .A1N(n21), .Y(
        n79) );
  OAI2BB2X1M U110 ( .B0(n273), .B1(n21), .A0N(\Memory[5][3] ), .A1N(n21), .Y(
        n80) );
  OAI2BB2X1M U111 ( .B0(n272), .B1(n21), .A0N(\Memory[5][4] ), .A1N(n21), .Y(
        n81) );
  OAI2BB2X1M U112 ( .B0(n271), .B1(n21), .A0N(\Memory[5][5] ), .A1N(n21), .Y(
        n82) );
  OAI2BB2X1M U113 ( .B0(n270), .B1(n21), .A0N(\Memory[5][6] ), .A1N(n21), .Y(
        n83) );
  OAI2BB2X1M U114 ( .B0(n269), .B1(n21), .A0N(\Memory[5][7] ), .A1N(n21), .Y(
        n84) );
  OAI2BB2X1M U115 ( .B0(n276), .B1(n22), .A0N(\Memory[6][0] ), .A1N(n22), .Y(
        n85) );
  OAI2BB2X1M U116 ( .B0(n275), .B1(n22), .A0N(\Memory[6][1] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U117 ( .B0(n274), .B1(n22), .A0N(\Memory[6][2] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U118 ( .B0(n273), .B1(n22), .A0N(\Memory[6][3] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U119 ( .B0(n272), .B1(n22), .A0N(\Memory[6][4] ), .A1N(n22), .Y(
        n89) );
  OAI2BB2X1M U120 ( .B0(n271), .B1(n22), .A0N(\Memory[6][5] ), .A1N(n22), .Y(
        n90) );
  OAI2BB2X1M U121 ( .B0(n270), .B1(n22), .A0N(\Memory[6][6] ), .A1N(n22), .Y(
        n91) );
  OAI2BB2X1M U122 ( .B0(n269), .B1(n22), .A0N(\Memory[6][7] ), .A1N(n22), .Y(
        n92) );
  OAI2BB2X1M U123 ( .B0(n276), .B1(n25), .A0N(\Memory[7][0] ), .A1N(n25), .Y(
        n93) );
  OAI2BB2X1M U124 ( .B0(n275), .B1(n25), .A0N(\Memory[7][1] ), .A1N(n25), .Y(
        n94) );
  OAI2BB2X1M U125 ( .B0(n274), .B1(n25), .A0N(\Memory[7][2] ), .A1N(n25), .Y(
        n95) );
  OAI2BB2X1M U126 ( .B0(n273), .B1(n25), .A0N(\Memory[7][3] ), .A1N(n25), .Y(
        n96) );
  OAI2BB2X1M U127 ( .B0(n272), .B1(n25), .A0N(\Memory[7][4] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U128 ( .B0(n271), .B1(n25), .A0N(\Memory[7][5] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U129 ( .B0(n270), .B1(n25), .A0N(\Memory[7][6] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U130 ( .B0(n269), .B1(n25), .A0N(\Memory[7][7] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U131 ( .B0(n276), .B1(n32), .A0N(\Memory[12][0] ), .A1N(n32), .Y(
        n133) );
  OAI2BB2X1M U132 ( .B0(n275), .B1(n32), .A0N(\Memory[12][1] ), .A1N(n32), .Y(
        n134) );
  OAI2BB2X1M U133 ( .B0(n274), .B1(n32), .A0N(\Memory[12][2] ), .A1N(n32), .Y(
        n135) );
  OAI2BB2X1M U134 ( .B0(n273), .B1(n32), .A0N(\Memory[12][3] ), .A1N(n32), .Y(
        n136) );
  OAI2BB2X1M U135 ( .B0(n272), .B1(n32), .A0N(\Memory[12][4] ), .A1N(n32), .Y(
        n137) );
  OAI2BB2X1M U136 ( .B0(n271), .B1(n32), .A0N(\Memory[12][5] ), .A1N(n32), .Y(
        n138) );
  OAI2BB2X1M U137 ( .B0(n270), .B1(n32), .A0N(\Memory[12][6] ), .A1N(n32), .Y(
        n139) );
  OAI2BB2X1M U138 ( .B0(n269), .B1(n32), .A0N(\Memory[12][7] ), .A1N(n32), .Y(
        n140) );
  OAI2BB2X1M U139 ( .B0(n276), .B1(n33), .A0N(\Memory[13][0] ), .A1N(n33), .Y(
        n141) );
  OAI2BB2X1M U140 ( .B0(n275), .B1(n33), .A0N(\Memory[13][1] ), .A1N(n33), .Y(
        n142) );
  OAI2BB2X1M U141 ( .B0(n274), .B1(n33), .A0N(\Memory[13][2] ), .A1N(n33), .Y(
        n143) );
  OAI2BB2X1M U142 ( .B0(n273), .B1(n33), .A0N(\Memory[13][3] ), .A1N(n33), .Y(
        n144) );
  OAI2BB2X1M U143 ( .B0(n272), .B1(n33), .A0N(\Memory[13][4] ), .A1N(n33), .Y(
        n145) );
  OAI2BB2X1M U144 ( .B0(n271), .B1(n33), .A0N(\Memory[13][5] ), .A1N(n33), .Y(
        n146) );
  OAI2BB2X1M U145 ( .B0(n270), .B1(n33), .A0N(\Memory[13][6] ), .A1N(n33), .Y(
        n147) );
  OAI2BB2X1M U146 ( .B0(n269), .B1(n33), .A0N(\Memory[13][7] ), .A1N(n33), .Y(
        n148) );
  OAI2BB2X1M U147 ( .B0(n276), .B1(n34), .A0N(\Memory[14][0] ), .A1N(n34), .Y(
        n149) );
  OAI2BB2X1M U148 ( .B0(n275), .B1(n34), .A0N(\Memory[14][1] ), .A1N(n34), .Y(
        n150) );
  OAI2BB2X1M U149 ( .B0(n274), .B1(n34), .A0N(\Memory[14][2] ), .A1N(n34), .Y(
        n151) );
  OAI2BB2X1M U150 ( .B0(n273), .B1(n34), .A0N(\Memory[14][3] ), .A1N(n34), .Y(
        n152) );
  OAI2BB2X1M U151 ( .B0(n272), .B1(n34), .A0N(\Memory[14][4] ), .A1N(n34), .Y(
        n153) );
  OAI2BB2X1M U152 ( .B0(n271), .B1(n34), .A0N(\Memory[14][5] ), .A1N(n34), .Y(
        n154) );
  OAI2BB2X1M U153 ( .B0(n270), .B1(n34), .A0N(\Memory[14][6] ), .A1N(n34), .Y(
        n155) );
  OAI2BB2X1M U154 ( .B0(n269), .B1(n34), .A0N(\Memory[14][7] ), .A1N(n34), .Y(
        n156) );
  OAI2BB2X1M U155 ( .B0(n276), .B1(n36), .A0N(\Memory[15][0] ), .A1N(n36), .Y(
        n157) );
  OAI2BB2X1M U156 ( .B0(n275), .B1(n36), .A0N(\Memory[15][1] ), .A1N(n36), .Y(
        n158) );
  OAI2BB2X1M U157 ( .B0(n274), .B1(n36), .A0N(\Memory[15][2] ), .A1N(n36), .Y(
        n159) );
  OAI2BB2X1M U158 ( .B0(n273), .B1(n36), .A0N(\Memory[15][3] ), .A1N(n36), .Y(
        n160) );
  OAI2BB2X1M U159 ( .B0(n272), .B1(n36), .A0N(\Memory[15][4] ), .A1N(n36), .Y(
        n161) );
  OAI2BB2X1M U160 ( .B0(n271), .B1(n36), .A0N(\Memory[15][5] ), .A1N(n36), .Y(
        n162) );
  OAI2BB2X1M U161 ( .B0(n270), .B1(n36), .A0N(\Memory[15][6] ), .A1N(n36), .Y(
        n163) );
  OAI2BB2X1M U162 ( .B0(n269), .B1(n36), .A0N(\Memory[15][7] ), .A1N(n36), .Y(
        n164) );
  NOR2BX2M U163 ( .AN(wclken), .B(waddr[3]), .Y(n24) );
  AND2X2M U164 ( .A(n24), .B(waddr[0]), .Y(n15) );
  AND2X2M U165 ( .A(n35), .B(waddr[0]), .Y(n29) );
  AND2X2M U166 ( .A(waddr[3]), .B(wclken), .Y(n35) );
  AND2X2M U167 ( .A(waddr[2]), .B(n268), .Y(n20) );
  AND2X2M U168 ( .A(waddr[2]), .B(waddr[1]), .Y(n23) );
  INVX2M U169 ( .A(waddr[1]), .Y(n268) );
  INVX2M U170 ( .A(waddr[0]), .Y(n267) );
  OR2X2M U171 ( .A(N10), .B(N11), .Y(n2) );
  OR2X2M U172 ( .A(n262), .B(N11), .Y(n3) );
  OR2X2M U173 ( .A(n259), .B(N10), .Y(n4) );
  INVX2M U174 ( .A(N11), .Y(n259) );
  INVX2M U175 ( .A(N10), .Y(n262) );
  INVX2M U176 ( .A(N13), .Y(n261) );
  INVX2M U177 ( .A(N12), .Y(n260) );
  AOI22X1M U178 ( .A0(\Memory[10][0] ), .A1(n264), .B0(\Memory[11][0] ), .B1(
        n263), .Y(n6) );
  AOI22X1M U179 ( .A0(\Memory[8][0] ), .A1(n266), .B0(\Memory[9][0] ), .B1(
        n265), .Y(n5) );
  CLKNAND2X2M U180 ( .A(N13), .B(n260), .Y(n243) );
  AOI21X1M U181 ( .A0(n6), .A1(n5), .B0(n243), .Y(n170) );
  AOI22X1M U182 ( .A0(\Memory[14][0] ), .A1(n264), .B0(\Memory[15][0] ), .B1(
        n263), .Y(n8) );
  AOI22X1M U183 ( .A0(\Memory[12][0] ), .A1(n266), .B0(\Memory[13][0] ), .B1(
        n265), .Y(n7) );
  CLKNAND2X2M U184 ( .A(N13), .B(N12), .Y(n246) );
  AOI21X1M U185 ( .A0(n8), .A1(n7), .B0(n246), .Y(n169) );
  AOI22X1M U186 ( .A0(\Memory[2][0] ), .A1(n264), .B0(\Memory[3][0] ), .B1(
        n263), .Y(n10) );
  AOI22X1M U187 ( .A0(\Memory[0][0] ), .A1(n266), .B0(\Memory[1][0] ), .B1(
        n265), .Y(n9) );
  CLKNAND2X2M U188 ( .A(n260), .B(n261), .Y(n249) );
  AOI21X1M U189 ( .A0(n10), .A1(n9), .B0(n249), .Y(n168) );
  AOI22X1M U190 ( .A0(\Memory[6][0] ), .A1(n264), .B0(\Memory[7][0] ), .B1(
        n263), .Y(n166) );
  AOI22X1M U191 ( .A0(\Memory[4][0] ), .A1(n266), .B0(\Memory[5][0] ), .B1(
        n265), .Y(n165) );
  CLKNAND2X2M U192 ( .A(N12), .B(n261), .Y(n252) );
  AOI21X1M U193 ( .A0(n166), .A1(n165), .B0(n252), .Y(n167) );
  OR4X1M U194 ( .A(n170), .B(n169), .C(n168), .D(n167), .Y(rdata[0]) );
  AOI22X1M U195 ( .A0(\Memory[10][1] ), .A1(n264), .B0(\Memory[11][1] ), .B1(
        n263), .Y(n172) );
  AOI22X1M U196 ( .A0(\Memory[8][1] ), .A1(n266), .B0(\Memory[9][1] ), .B1(
        n265), .Y(n171) );
  AOI21X1M U197 ( .A0(n172), .A1(n171), .B0(n243), .Y(n182) );
  AOI22X1M U198 ( .A0(\Memory[14][1] ), .A1(n264), .B0(\Memory[15][1] ), .B1(
        n263), .Y(n174) );
  AOI22X1M U199 ( .A0(\Memory[12][1] ), .A1(n266), .B0(\Memory[13][1] ), .B1(
        n265), .Y(n173) );
  AOI21X1M U200 ( .A0(n174), .A1(n173), .B0(n246), .Y(n181) );
  AOI22X1M U201 ( .A0(\Memory[2][1] ), .A1(n264), .B0(\Memory[3][1] ), .B1(
        n263), .Y(n176) );
  AOI22X1M U202 ( .A0(\Memory[0][1] ), .A1(n266), .B0(\Memory[1][1] ), .B1(
        n265), .Y(n175) );
  AOI21X1M U203 ( .A0(n176), .A1(n175), .B0(n249), .Y(n180) );
  AOI22X1M U204 ( .A0(\Memory[6][1] ), .A1(n264), .B0(\Memory[7][1] ), .B1(
        n263), .Y(n178) );
  AOI22X1M U205 ( .A0(\Memory[4][1] ), .A1(n266), .B0(\Memory[5][1] ), .B1(
        n265), .Y(n177) );
  AOI21X1M U206 ( .A0(n178), .A1(n177), .B0(n252), .Y(n179) );
  OR4X1M U207 ( .A(n182), .B(n181), .C(n180), .D(n179), .Y(rdata[1]) );
  AOI22X1M U208 ( .A0(\Memory[10][2] ), .A1(n264), .B0(\Memory[11][2] ), .B1(
        n263), .Y(n184) );
  AOI22X1M U209 ( .A0(\Memory[8][2] ), .A1(n266), .B0(\Memory[9][2] ), .B1(
        n265), .Y(n183) );
  AOI21X1M U210 ( .A0(n184), .A1(n183), .B0(n243), .Y(n194) );
  AOI22X1M U211 ( .A0(\Memory[14][2] ), .A1(n264), .B0(\Memory[15][2] ), .B1(
        n263), .Y(n186) );
  AOI22X1M U212 ( .A0(\Memory[12][2] ), .A1(n266), .B0(\Memory[13][2] ), .B1(
        n265), .Y(n185) );
  AOI21X1M U213 ( .A0(n186), .A1(n185), .B0(n246), .Y(n193) );
  AOI22X1M U214 ( .A0(\Memory[2][2] ), .A1(n264), .B0(\Memory[3][2] ), .B1(
        n263), .Y(n188) );
  AOI22X1M U215 ( .A0(\Memory[0][2] ), .A1(n266), .B0(\Memory[1][2] ), .B1(
        n265), .Y(n187) );
  AOI21X1M U216 ( .A0(n188), .A1(n187), .B0(n249), .Y(n192) );
  AOI22X1M U217 ( .A0(\Memory[6][2] ), .A1(n264), .B0(\Memory[7][2] ), .B1(
        n263), .Y(n190) );
  AOI22X1M U218 ( .A0(\Memory[4][2] ), .A1(n266), .B0(\Memory[5][2] ), .B1(
        n265), .Y(n189) );
  AOI21X1M U219 ( .A0(n190), .A1(n189), .B0(n252), .Y(n191) );
  OR4X1M U220 ( .A(n194), .B(n193), .C(n192), .D(n191), .Y(rdata[2]) );
  AOI22X1M U221 ( .A0(\Memory[10][3] ), .A1(n264), .B0(\Memory[11][3] ), .B1(
        n263), .Y(n196) );
  AOI22X1M U222 ( .A0(\Memory[8][3] ), .A1(n266), .B0(\Memory[9][3] ), .B1(
        n265), .Y(n195) );
  AOI21X1M U223 ( .A0(n196), .A1(n195), .B0(n243), .Y(n206) );
  AOI22X1M U224 ( .A0(\Memory[14][3] ), .A1(n264), .B0(\Memory[15][3] ), .B1(
        n263), .Y(n198) );
  AOI22X1M U225 ( .A0(\Memory[12][3] ), .A1(n266), .B0(\Memory[13][3] ), .B1(
        n265), .Y(n197) );
  AOI21X1M U226 ( .A0(n198), .A1(n197), .B0(n246), .Y(n205) );
  AOI22X1M U227 ( .A0(\Memory[2][3] ), .A1(n264), .B0(\Memory[3][3] ), .B1(
        n263), .Y(n200) );
  AOI22X1M U228 ( .A0(\Memory[0][3] ), .A1(n266), .B0(\Memory[1][3] ), .B1(
        n265), .Y(n199) );
  AOI21X1M U229 ( .A0(n200), .A1(n199), .B0(n249), .Y(n204) );
  AOI22X1M U230 ( .A0(\Memory[6][3] ), .A1(n264), .B0(\Memory[7][3] ), .B1(
        n263), .Y(n202) );
  AOI22X1M U231 ( .A0(\Memory[4][3] ), .A1(n266), .B0(\Memory[5][3] ), .B1(
        n265), .Y(n201) );
  AOI21X1M U232 ( .A0(n202), .A1(n201), .B0(n252), .Y(n203) );
  OR4X1M U233 ( .A(n206), .B(n205), .C(n204), .D(n203), .Y(rdata[3]) );
  AOI22X1M U234 ( .A0(\Memory[10][4] ), .A1(n264), .B0(\Memory[11][4] ), .B1(
        n263), .Y(n208) );
  AOI22X1M U235 ( .A0(\Memory[8][4] ), .A1(n266), .B0(\Memory[9][4] ), .B1(
        n265), .Y(n207) );
  AOI21X1M U236 ( .A0(n208), .A1(n207), .B0(n243), .Y(n218) );
  AOI22X1M U237 ( .A0(\Memory[14][4] ), .A1(n264), .B0(\Memory[15][4] ), .B1(
        n263), .Y(n210) );
  AOI22X1M U238 ( .A0(\Memory[12][4] ), .A1(n266), .B0(\Memory[13][4] ), .B1(
        n265), .Y(n209) );
  AOI21X1M U239 ( .A0(n210), .A1(n209), .B0(n246), .Y(n217) );
  AOI22X1M U240 ( .A0(\Memory[2][4] ), .A1(n264), .B0(\Memory[3][4] ), .B1(
        n263), .Y(n212) );
  AOI22X1M U241 ( .A0(\Memory[0][4] ), .A1(n266), .B0(\Memory[1][4] ), .B1(
        n265), .Y(n211) );
  AOI21X1M U242 ( .A0(n212), .A1(n211), .B0(n249), .Y(n216) );
  AOI22X1M U243 ( .A0(\Memory[6][4] ), .A1(n264), .B0(\Memory[7][4] ), .B1(
        n263), .Y(n214) );
  AOI22X1M U244 ( .A0(\Memory[4][4] ), .A1(n266), .B0(\Memory[5][4] ), .B1(
        n265), .Y(n213) );
  AOI21X1M U245 ( .A0(n214), .A1(n213), .B0(n252), .Y(n215) );
  OR4X1M U246 ( .A(n218), .B(n217), .C(n216), .D(n215), .Y(rdata[4]) );
  AOI22X1M U247 ( .A0(\Memory[10][5] ), .A1(n264), .B0(\Memory[11][5] ), .B1(
        n263), .Y(n220) );
  AOI22X1M U248 ( .A0(\Memory[8][5] ), .A1(n266), .B0(\Memory[9][5] ), .B1(
        n265), .Y(n219) );
  AOI21X1M U249 ( .A0(n220), .A1(n219), .B0(n243), .Y(n230) );
  AOI22X1M U250 ( .A0(\Memory[14][5] ), .A1(n264), .B0(\Memory[15][5] ), .B1(
        n263), .Y(n222) );
  AOI22X1M U251 ( .A0(\Memory[12][5] ), .A1(n266), .B0(\Memory[13][5] ), .B1(
        n265), .Y(n221) );
  AOI21X1M U252 ( .A0(n222), .A1(n221), .B0(n246), .Y(n229) );
  AOI22X1M U253 ( .A0(\Memory[2][5] ), .A1(n264), .B0(\Memory[3][5] ), .B1(
        n263), .Y(n224) );
  AOI22X1M U254 ( .A0(\Memory[0][5] ), .A1(n266), .B0(\Memory[1][5] ), .B1(
        n265), .Y(n223) );
  AOI21X1M U255 ( .A0(n224), .A1(n223), .B0(n249), .Y(n228) );
  AOI22X1M U256 ( .A0(\Memory[6][5] ), .A1(n264), .B0(\Memory[7][5] ), .B1(
        n263), .Y(n226) );
  AOI22X1M U257 ( .A0(\Memory[4][5] ), .A1(n266), .B0(\Memory[5][5] ), .B1(
        n265), .Y(n225) );
  AOI21X1M U258 ( .A0(n226), .A1(n225), .B0(n252), .Y(n227) );
  OR4X1M U259 ( .A(n230), .B(n229), .C(n228), .D(n227), .Y(rdata[5]) );
  AOI22X1M U260 ( .A0(\Memory[10][6] ), .A1(n264), .B0(\Memory[11][6] ), .B1(
        n263), .Y(n232) );
  AOI22X1M U261 ( .A0(\Memory[8][6] ), .A1(n266), .B0(\Memory[9][6] ), .B1(
        n265), .Y(n231) );
  AOI21X1M U262 ( .A0(n232), .A1(n231), .B0(n243), .Y(n242) );
  AOI22X1M U263 ( .A0(\Memory[14][6] ), .A1(n264), .B0(\Memory[15][6] ), .B1(
        n263), .Y(n234) );
  AOI22X1M U264 ( .A0(\Memory[12][6] ), .A1(n266), .B0(\Memory[13][6] ), .B1(
        n265), .Y(n233) );
  AOI21X1M U265 ( .A0(n234), .A1(n233), .B0(n246), .Y(n241) );
  AOI22X1M U266 ( .A0(\Memory[2][6] ), .A1(n264), .B0(\Memory[3][6] ), .B1(
        n263), .Y(n236) );
  AOI22X1M U267 ( .A0(\Memory[0][6] ), .A1(n266), .B0(\Memory[1][6] ), .B1(
        n265), .Y(n235) );
  AOI21X1M U268 ( .A0(n236), .A1(n235), .B0(n249), .Y(n240) );
  AOI22X1M U269 ( .A0(\Memory[6][6] ), .A1(n264), .B0(\Memory[7][6] ), .B1(
        n263), .Y(n238) );
  AOI22X1M U270 ( .A0(\Memory[4][6] ), .A1(n266), .B0(\Memory[5][6] ), .B1(
        n265), .Y(n237) );
  AOI21X1M U271 ( .A0(n238), .A1(n237), .B0(n252), .Y(n239) );
  OR4X1M U272 ( .A(n242), .B(n241), .C(n240), .D(n239), .Y(rdata[6]) );
  AOI22X1M U273 ( .A0(\Memory[10][7] ), .A1(n264), .B0(\Memory[11][7] ), .B1(
        n263), .Y(n245) );
  AOI22X1M U274 ( .A0(\Memory[8][7] ), .A1(n266), .B0(\Memory[9][7] ), .B1(
        n265), .Y(n244) );
  AOI21X1M U275 ( .A0(n245), .A1(n244), .B0(n243), .Y(n258) );
  AOI22X1M U276 ( .A0(\Memory[14][7] ), .A1(n264), .B0(\Memory[15][7] ), .B1(
        n263), .Y(n248) );
  AOI22X1M U277 ( .A0(\Memory[12][7] ), .A1(n266), .B0(\Memory[13][7] ), .B1(
        n265), .Y(n247) );
  AOI21X1M U278 ( .A0(n248), .A1(n247), .B0(n246), .Y(n257) );
  AOI22X1M U279 ( .A0(\Memory[2][7] ), .A1(n264), .B0(\Memory[3][7] ), .B1(
        n263), .Y(n251) );
  AOI22X1M U280 ( .A0(\Memory[0][7] ), .A1(n266), .B0(\Memory[1][7] ), .B1(
        n265), .Y(n250) );
  AOI21X1M U281 ( .A0(n251), .A1(n250), .B0(n249), .Y(n256) );
  AOI22X1M U282 ( .A0(\Memory[6][7] ), .A1(n264), .B0(\Memory[7][7] ), .B1(
        n263), .Y(n254) );
  AOI22X1M U283 ( .A0(\Memory[4][7] ), .A1(n266), .B0(\Memory[5][7] ), .B1(
        n265), .Y(n253) );
  AOI21X1M U284 ( .A0(n254), .A1(n253), .B0(n252), .Y(n255) );
  OR4X1M U285 ( .A(n258), .B(n257), .C(n256), .D(n255), .Y(rdata[7]) );
endmodule


module bin2gray_WIDTH5_0 ( bin, gray, CLK, RST );
  input [4:0] bin;
  output [4:0] gray;
  input CLK, RST;
  wire   N1, N2, N3, N4;

  DFFRQX2M \gray_reg[3]  ( .D(N1), .CK(CLK), .RN(RST), .Q(gray[3]) );
  DFFRQX2M \gray_reg[2]  ( .D(N2), .CK(CLK), .RN(RST), .Q(gray[2]) );
  DFFRQX2M \gray_reg[1]  ( .D(N3), .CK(CLK), .RN(RST), .Q(gray[1]) );
  DFFRQX2M \gray_reg[0]  ( .D(N4), .CK(CLK), .RN(RST), .Q(gray[0]) );
  DFFRQX2M \gray_reg[4]  ( .D(bin[4]), .CK(CLK), .RN(RST), .Q(gray[4]) );
  CLKXOR2X2M U3 ( .A(bin[2]), .B(bin[1]), .Y(N3) );
  CLKXOR2X2M U4 ( .A(bin[1]), .B(bin[0]), .Y(N4) );
  CLKXOR2X2M U5 ( .A(bin[3]), .B(bin[2]), .Y(N2) );
  CLKXOR2X2M U6 ( .A(bin[4]), .B(bin[3]), .Y(N1) );
endmodule


module gray2bin_WIDTH5_0 ( gray, bin );
  input [4:0] gray;
  output [4:0] bin;


  CLKXOR2X2M U1 ( .A(bin[2]), .B(gray[1]), .Y(bin[1]) );
  CLKXOR2X2M U2 ( .A(gray[3]), .B(gray[4]), .Y(bin[3]) );
  CLKXOR2X2M U3 ( .A(bin[3]), .B(gray[2]), .Y(bin[2]) );
  CLKXOR2X2M U4 ( .A(gray[0]), .B(bin[1]), .Y(bin[0]) );
  BUFX2M U5 ( .A(gray[4]), .Y(bin[4]) );
endmodule


module FIFO_WR_DEPTH16 ( winc, wclk, wrst_n, wq2_rptr, wfull, wptr, waddr );
  input [4:0] wq2_rptr;
  output [4:0] wptr;
  output [3:0] waddr;
  input winc, wclk, wrst_n;
  output wfull;
  wire   \bin_wptr[4] , N6, N7, N8, N9, N10, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, \add_38/carry[4] , \add_38/carry[3] ,
         \add_38/carry[2] ;
  wire   [4:0] bin_wq2_rptr;

  bin2gray_WIDTH5_0 b2g_WR ( .bin({\bin_wptr[4] , waddr}), .gray(wptr), .CLK(
        wclk), .RST(wrst_n) );
  gray2bin_WIDTH5_0 g2b_WR ( .gray(wq2_rptr), .bin(bin_wq2_rptr) );
  DFFRQX2M \bin_wptr_reg[4]  ( .D(n8), .CK(wclk), .RN(wrst_n), .Q(
        \bin_wptr[4] ) );
  DFFRQX2M \bin_wptr_reg[0]  ( .D(n12), .CK(wclk), .RN(wrst_n), .Q(waddr[0])
         );
  DFFRQX2M \bin_wptr_reg[3]  ( .D(n9), .CK(wclk), .RN(wrst_n), .Q(waddr[3]) );
  DFFRQX2M \bin_wptr_reg[1]  ( .D(n11), .CK(wclk), .RN(wrst_n), .Q(waddr[1])
         );
  DFFRQX2M \bin_wptr_reg[2]  ( .D(n10), .CK(wclk), .RN(wrst_n), .Q(waddr[2])
         );
  NOR2BX2M U3 ( .AN(winc), .B(wfull), .Y(n1) );
  AND4X2M U4 ( .A(n2), .B(n3), .C(n4), .D(n5), .Y(wfull) );
  XNOR2X2M U5 ( .A(waddr[3]), .B(bin_wq2_rptr[3]), .Y(n2) );
  CLKXOR2X2M U6 ( .A(bin_wq2_rptr[4]), .B(\bin_wptr[4] ), .Y(n3) );
  XNOR2X2M U7 ( .A(waddr[2]), .B(bin_wq2_rptr[2]), .Y(n4) );
  NOR2X2M U8 ( .A(n6), .B(n7), .Y(n5) );
  CLKXOR2X2M U9 ( .A(waddr[1]), .B(bin_wq2_rptr[1]), .Y(n7) );
  CLKXOR2X2M U10 ( .A(waddr[0]), .B(bin_wq2_rptr[0]), .Y(n6) );
  AO2B2X2M U11 ( .B0(N10), .B1(n1), .A0(\bin_wptr[4] ), .A1N(n1), .Y(n8) );
  AO2B2X2M U12 ( .B0(N9), .B1(n1), .A0(waddr[3]), .A1N(n1), .Y(n9) );
  AO2B2X2M U13 ( .B0(N8), .B1(n1), .A0(waddr[2]), .A1N(n1), .Y(n10) );
  AO2B2X2M U14 ( .B0(N7), .B1(n1), .A0(waddr[1]), .A1N(n1), .Y(n11) );
  AO2B2X2M U15 ( .B0(N6), .B1(n1), .A0(waddr[0]), .A1N(n1), .Y(n12) );
  ADDHX1M U16 ( .A(waddr[2]), .B(\add_38/carry[2] ), .CO(\add_38/carry[3] ), 
        .S(N8) );
  ADDHX1M U17 ( .A(waddr[1]), .B(waddr[0]), .CO(\add_38/carry[2] ), .S(N7) );
  ADDHX1M U18 ( .A(waddr[3]), .B(\add_38/carry[3] ), .CO(\add_38/carry[4] ), 
        .S(N9) );
  CLKINVX1M U19 ( .A(waddr[0]), .Y(N6) );
  CLKXOR2X2M U20 ( .A(\add_38/carry[4] ), .B(\bin_wptr[4] ), .Y(N10) );
endmodule


module DF_SYNC_DATA_WIDTH5_0 ( ASync_data, clk, rst, Sync_data );
  input [4:0] ASync_data;
  output [4:0] Sync_data;
  input clk, rst;

  wire   [4:0] ff1;

  DFFRQX2M \ff2_reg[2]  ( .D(ff1[2]), .CK(clk), .RN(rst), .Q(Sync_data[2]) );
  DFFRQX2M \ff2_reg[1]  ( .D(ff1[1]), .CK(clk), .RN(rst), .Q(Sync_data[1]) );
  DFFRQX2M \ff2_reg[3]  ( .D(ff1[3]), .CK(clk), .RN(rst), .Q(Sync_data[3]) );
  DFFRQX2M \ff2_reg[0]  ( .D(ff1[0]), .CK(clk), .RN(rst), .Q(Sync_data[0]) );
  DFFRQX2M \ff2_reg[4]  ( .D(ff1[4]), .CK(clk), .RN(rst), .Q(Sync_data[4]) );
  DFFRQX2M \ff1_reg[4]  ( .D(ASync_data[4]), .CK(clk), .RN(rst), .Q(ff1[4]) );
  DFFRQX2M \ff1_reg[3]  ( .D(ASync_data[3]), .CK(clk), .RN(rst), .Q(ff1[3]) );
  DFFRQX2M \ff1_reg[2]  ( .D(ASync_data[2]), .CK(clk), .RN(rst), .Q(ff1[2]) );
  DFFRQX2M \ff1_reg[1]  ( .D(ASync_data[1]), .CK(clk), .RN(rst), .Q(ff1[1]) );
  DFFRQX2M \ff1_reg[0]  ( .D(ASync_data[0]), .CK(clk), .RN(rst), .Q(ff1[0]) );
endmodule


module bin2gray_WIDTH5_1 ( bin, gray, CLK, RST );
  input [4:0] bin;
  output [4:0] gray;
  input CLK, RST;
  wire   N1, N2, N3, N4;

  DFFRQX2M \gray_reg[3]  ( .D(N1), .CK(CLK), .RN(RST), .Q(gray[3]) );
  DFFRQX2M \gray_reg[2]  ( .D(N2), .CK(CLK), .RN(RST), .Q(gray[2]) );
  DFFRQX2M \gray_reg[1]  ( .D(N3), .CK(CLK), .RN(RST), .Q(gray[1]) );
  DFFRQX2M \gray_reg[0]  ( .D(N4), .CK(CLK), .RN(RST), .Q(gray[0]) );
  DFFRQX2M \gray_reg[4]  ( .D(bin[4]), .CK(CLK), .RN(RST), .Q(gray[4]) );
  CLKXOR2X2M U3 ( .A(bin[1]), .B(bin[0]), .Y(N4) );
  CLKXOR2X2M U4 ( .A(bin[2]), .B(bin[1]), .Y(N3) );
  CLKXOR2X2M U5 ( .A(bin[3]), .B(bin[2]), .Y(N2) );
  CLKXOR2X2M U6 ( .A(bin[4]), .B(bin[3]), .Y(N1) );
endmodule


module gray2bin_WIDTH5_1 ( gray, bin );
  input [4:0] gray;
  output [4:0] bin;


  CLKXOR2X2M U1 ( .A(gray[3]), .B(gray[4]), .Y(bin[3]) );
  CLKXOR2X2M U2 ( .A(bin[3]), .B(gray[2]), .Y(bin[2]) );
  CLKXOR2X2M U3 ( .A(bin[2]), .B(gray[1]), .Y(bin[1]) );
  CLKXOR2X2M U4 ( .A(gray[0]), .B(bin[1]), .Y(bin[0]) );
  BUFX2M U5 ( .A(gray[4]), .Y(bin[4]) );
endmodule


module FIFO_RD_DEPTH16 ( rinc, rclk, rrst_n, rq2_wptr, rempty, rptr, raddr );
  input [4:0] rq2_wptr;
  output [4:0] rptr;
  output [3:0] raddr;
  input rinc, rclk, rrst_n;
  output rempty;
  wire   \bin_rptr[4] , N4, N5, N6, N7, N8, n1, n3, n4, n5, n6, n7,
         \add_34/carry[4] , \add_34/carry[3] , \add_34/carry[2] , n2, n8, n9,
         n10, n11, n12, n13, n14, n15;
  wire   [4:0] bin_rq2_wptr;

  bin2gray_WIDTH5_1 b2g_RD ( .bin({\bin_rptr[4] , raddr}), .gray(rptr), .CLK(
        rclk), .RST(rrst_n) );
  gray2bin_WIDTH5_1 g2b_RD ( .gray(rq2_wptr), .bin(bin_rq2_wptr) );
  DFFRQX2M \bin_rptr_reg[4]  ( .D(n6), .CK(rclk), .RN(rrst_n), .Q(
        \bin_rptr[4] ) );
  DFFRQX2M \bin_rptr_reg[2]  ( .D(n4), .CK(rclk), .RN(rrst_n), .Q(raddr[2]) );
  DFFRQX2M \bin_rptr_reg[0]  ( .D(n7), .CK(rclk), .RN(rrst_n), .Q(raddr[0]) );
  DFFRQX2M \bin_rptr_reg[3]  ( .D(n5), .CK(rclk), .RN(rrst_n), .Q(raddr[3]) );
  DFFRQX2M \bin_rptr_reg[1]  ( .D(n3), .CK(rclk), .RN(rrst_n), .Q(raddr[1]) );
  INVX2M U3 ( .A(n1), .Y(n15) );
  NAND2BX2M U4 ( .AN(rempty), .B(rinc), .Y(n1) );
  AO22X1M U5 ( .A0(raddr[1]), .A1(n1), .B0(N5), .B1(n15), .Y(n3) );
  AO22X1M U6 ( .A0(raddr[2]), .A1(n1), .B0(N6), .B1(n15), .Y(n4) );
  AO22X1M U7 ( .A0(raddr[3]), .A1(n1), .B0(N7), .B1(n15), .Y(n5) );
  AO22X1M U8 ( .A0(\bin_rptr[4] ), .A1(n1), .B0(N8), .B1(n15), .Y(n6) );
  AO22X1M U9 ( .A0(raddr[0]), .A1(n1), .B0(N4), .B1(n15), .Y(n7) );
  ADDHX1M U10 ( .A(raddr[1]), .B(raddr[0]), .CO(\add_34/carry[2] ), .S(N5) );
  ADDHX1M U11 ( .A(raddr[2]), .B(\add_34/carry[2] ), .CO(\add_34/carry[3] ), 
        .S(N6) );
  ADDHX1M U12 ( .A(raddr[3]), .B(\add_34/carry[3] ), .CO(\add_34/carry[4] ), 
        .S(N7) );
  CLKINVX1M U13 ( .A(raddr[0]), .Y(N4) );
  CLKXOR2X2M U14 ( .A(\add_34/carry[4] ), .B(\bin_rptr[4] ), .Y(N8) );
  CLKXOR2X2M U15 ( .A(bin_rq2_wptr[2]), .B(raddr[2]), .Y(n14) );
  NOR2BX1M U16 ( .AN(bin_rq2_wptr[0]), .B(raddr[0]), .Y(n2) );
  OAI2B2X1M U17 ( .A1N(raddr[1]), .A0(n2), .B0(bin_rq2_wptr[1]), .B1(n2), .Y(
        n10) );
  NOR2BX1M U18 ( .AN(raddr[0]), .B(bin_rq2_wptr[0]), .Y(n8) );
  OAI2B2X1M U19 ( .A1N(bin_rq2_wptr[1]), .A0(n8), .B0(raddr[1]), .B1(n8), .Y(
        n9) );
  CLKNAND2X2M U20 ( .A(n10), .B(n9), .Y(n13) );
  CLKXOR2X2M U21 ( .A(bin_rq2_wptr[3]), .B(raddr[3]), .Y(n12) );
  CLKXOR2X2M U22 ( .A(bin_rq2_wptr[4]), .B(\bin_rptr[4] ), .Y(n11) );
  NOR4X1M U23 ( .A(n14), .B(n13), .C(n12), .D(n11), .Y(rempty) );
endmodule


module DF_SYNC_DATA_WIDTH5_1 ( ASync_data, clk, rst, Sync_data );
  input [4:0] ASync_data;
  output [4:0] Sync_data;
  input clk, rst;

  wire   [4:0] ff1;

  DFFRQX2M \ff2_reg[2]  ( .D(ff1[2]), .CK(clk), .RN(rst), .Q(Sync_data[2]) );
  DFFRQX2M \ff2_reg[1]  ( .D(ff1[1]), .CK(clk), .RN(rst), .Q(Sync_data[1]) );
  DFFRQX2M \ff2_reg[3]  ( .D(ff1[3]), .CK(clk), .RN(rst), .Q(Sync_data[3]) );
  DFFRQX2M \ff2_reg[0]  ( .D(ff1[0]), .CK(clk), .RN(rst), .Q(Sync_data[0]) );
  DFFRQX2M \ff2_reg[4]  ( .D(ff1[4]), .CK(clk), .RN(rst), .Q(Sync_data[4]) );
  DFFRQX2M \ff1_reg[4]  ( .D(ASync_data[4]), .CK(clk), .RN(rst), .Q(ff1[4]) );
  DFFRQX2M \ff1_reg[3]  ( .D(ASync_data[3]), .CK(clk), .RN(rst), .Q(ff1[3]) );
  DFFRQX2M \ff1_reg[2]  ( .D(ASync_data[2]), .CK(clk), .RN(rst), .Q(ff1[2]) );
  DFFRQX2M \ff1_reg[1]  ( .D(ASync_data[1]), .CK(clk), .RN(rst), .Q(ff1[1]) );
  DFFRQX2M \ff1_reg[0]  ( .D(ASync_data[0]), .CK(clk), .RN(rst), .Q(ff1[0]) );
endmodule


module ASYNC_FIFO_DATA_WIDTH8_DEPTH16 ( w_clk, w_rst, w_inc, r_clk, r_rst, 
        r_inc, w_data, empty, full, rd_data );
  input [7:0] w_data;
  output [7:0] rd_data;
  input w_clk, w_rst, w_inc, r_clk, r_rst, r_inc;
  output empty, full;
  wire   wclken, n1, n2, n3, n4;
  wire   [3:0] waddr;
  wire   [3:0] raddr;
  wire   [4:0] sync_wq2_rptr;
  wire   [4:0] wptr;
  wire   [4:0] rptr;
  wire   [4:0] sync_rq2_wptr;

  FIFO_MEM_CNTRL_DATA_WIDTH8_DEPTH16 Memory ( .wclken(wclken), .wdata(w_data), 
        .waddr(waddr), .raddr(raddr), .wclk(w_clk), .rdata(rd_data) );
  FIFO_WR_DEPTH16 wr_logic ( .winc(w_inc), .wclk(w_clk), .wrst_n(n1), 
        .wq2_rptr(sync_wq2_rptr), .wfull(full), .wptr(wptr), .waddr(waddr) );
  DF_SYNC_DATA_WIDTH5_0 wq2_rptr_sync ( .ASync_data(rptr), .clk(w_clk), .rst(
        n1), .Sync_data(sync_wq2_rptr) );
  FIFO_RD_DEPTH16 rd_logic ( .rinc(r_inc), .rclk(r_clk), .rrst_n(n3), 
        .rq2_wptr(sync_rq2_wptr), .rempty(empty), .rptr(rptr), .raddr(raddr)
         );
  DF_SYNC_DATA_WIDTH5_1 rq2_wptr_sync ( .ASync_data(wptr), .clk(r_clk), .rst(
        n3), .Sync_data(sync_rq2_wptr) );
  NOR2BX2M U1 ( .AN(w_inc), .B(full), .Y(wclken) );
  INVX2M U2 ( .A(n2), .Y(n1) );
  INVX2M U3 ( .A(w_rst), .Y(n2) );
  INVX2M U4 ( .A(n4), .Y(n3) );
  INVX2M U5 ( .A(r_rst), .Y(n4) );
endmodule


module ALU_DATA_WIDTH8_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0
 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U8 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U9 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U10 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n4) );
  INVX2M U12 ( .A(n19), .Y(n3) );
  NAND2X2M U13 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n6) );
  INVX2M U15 ( .A(n19), .Y(n5) );
  NAND2X2M U16 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n8) );
  INVX2M U18 ( .A(n19), .Y(n7) );
  NAND2X2M U19 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n9) );
  NAND2X2M U21 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n10) );
  NAND2X2M U23 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n19), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n13) );
  INVX2M U28 ( .A(a[0]), .Y(n11) );
  INVX2M U29 ( .A(b[1]), .Y(n18) );
  INVX2M U30 ( .A(b[2]), .Y(n17) );
  INVX2M U31 ( .A(b[3]), .Y(n16) );
  INVX2M U32 ( .A(b[4]), .Y(n15) );
  INVX2M U33 ( .A(b[5]), .Y(n14) );
  INVX2M U34 ( .A(b[7]), .Y(n12) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
endmodule


module ALU_DATA_WIDTH8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_DATA_WIDTH8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DATA_WIDTH8_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  XNOR2X2M U3 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  NAND2X2M U4 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(n9), .Y(SUM[6]) );
  INVX2M U8 ( .A(A[6]), .Y(n9) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_DATA_WIDTH8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;

  ALU_DATA_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n14, n13, n15, n11, n12, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n7), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n6), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n21) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][7] ), .Y(n22) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n20) );
  INVX2M U15 ( .A(\ab[0][4] ), .Y(n19) );
  INVX2M U16 ( .A(\ab[0][3] ), .Y(n18) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n17) );
  AND2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U23 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  CLKXOR2X2M U24 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  CLKXOR2X2M U27 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U28 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U29 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U30 ( .A(\ab[1][3] ), .B(n19), .Y(\SUMB[1][3] ) );
  XNOR2X2M U31 ( .A(\ab[1][6] ), .B(n22), .Y(\SUMB[1][6] ) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n21), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n20), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][2] ), .B(n18), .Y(\SUMB[1][2] ) );
  INVX2M U35 ( .A(A[1]), .Y(n29) );
  INVX2M U36 ( .A(A[0]), .Y(n30) );
  INVX2M U37 ( .A(B[6]), .Y(n32) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n17), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[2]), .Y(n28) );
  INVX2M U40 ( .A(A[3]), .Y(n27) );
  INVX2M U41 ( .A(A[4]), .Y(n26) );
  INVX2M U42 ( .A(A[7]), .Y(n23) );
  INVX2M U43 ( .A(A[6]), .Y(n24) );
  INVX2M U44 ( .A(A[5]), .Y(n25) );
  INVX2M U45 ( .A(B[3]), .Y(n35) );
  INVX2M U46 ( .A(B[2]), .Y(n36) );
  INVX2M U47 ( .A(B[7]), .Y(n31) );
  INVX2M U48 ( .A(B[5]), .Y(n33) );
  INVX2M U49 ( .A(B[4]), .Y(n34) );
  INVX2M U50 ( .A(B[0]), .Y(n38) );
  INVX2M U51 ( .A(B[1]), .Y(n37) );
  NOR2X1M U53 ( .A(n23), .B(n31), .Y(\ab[7][7] ) );
  NOR2X1M U54 ( .A(n23), .B(n32), .Y(\ab[7][6] ) );
  NOR2X1M U55 ( .A(n23), .B(n33), .Y(\ab[7][5] ) );
  NOR2X1M U56 ( .A(n23), .B(n34), .Y(\ab[7][4] ) );
  NOR2X1M U57 ( .A(n23), .B(n35), .Y(\ab[7][3] ) );
  NOR2X1M U58 ( .A(n23), .B(n36), .Y(\ab[7][2] ) );
  NOR2X1M U59 ( .A(n23), .B(n37), .Y(\ab[7][1] ) );
  NOR2X1M U60 ( .A(n23), .B(n38), .Y(\ab[7][0] ) );
  NOR2X1M U61 ( .A(n31), .B(n24), .Y(\ab[6][7] ) );
  NOR2X1M U62 ( .A(n32), .B(n24), .Y(\ab[6][6] ) );
  NOR2X1M U63 ( .A(n33), .B(n24), .Y(\ab[6][5] ) );
  NOR2X1M U64 ( .A(n34), .B(n24), .Y(\ab[6][4] ) );
  NOR2X1M U65 ( .A(n35), .B(n24), .Y(\ab[6][3] ) );
  NOR2X1M U66 ( .A(n36), .B(n24), .Y(\ab[6][2] ) );
  NOR2X1M U67 ( .A(n37), .B(n24), .Y(\ab[6][1] ) );
  NOR2X1M U68 ( .A(n38), .B(n24), .Y(\ab[6][0] ) );
  NOR2X1M U69 ( .A(n31), .B(n25), .Y(\ab[5][7] ) );
  NOR2X1M U70 ( .A(n32), .B(n25), .Y(\ab[5][6] ) );
  NOR2X1M U71 ( .A(n33), .B(n25), .Y(\ab[5][5] ) );
  NOR2X1M U72 ( .A(n34), .B(n25), .Y(\ab[5][4] ) );
  NOR2X1M U73 ( .A(n35), .B(n25), .Y(\ab[5][3] ) );
  NOR2X1M U74 ( .A(n36), .B(n25), .Y(\ab[5][2] ) );
  NOR2X1M U75 ( .A(n37), .B(n25), .Y(\ab[5][1] ) );
  NOR2X1M U76 ( .A(n38), .B(n25), .Y(\ab[5][0] ) );
  NOR2X1M U77 ( .A(n31), .B(n26), .Y(\ab[4][7] ) );
  NOR2X1M U78 ( .A(n32), .B(n26), .Y(\ab[4][6] ) );
  NOR2X1M U79 ( .A(n33), .B(n26), .Y(\ab[4][5] ) );
  NOR2X1M U80 ( .A(n34), .B(n26), .Y(\ab[4][4] ) );
  NOR2X1M U81 ( .A(n35), .B(n26), .Y(\ab[4][3] ) );
  NOR2X1M U82 ( .A(n36), .B(n26), .Y(\ab[4][2] ) );
  NOR2X1M U83 ( .A(n37), .B(n26), .Y(\ab[4][1] ) );
  NOR2X1M U84 ( .A(n38), .B(n26), .Y(\ab[4][0] ) );
  NOR2X1M U85 ( .A(n31), .B(n27), .Y(\ab[3][7] ) );
  NOR2X1M U86 ( .A(n32), .B(n27), .Y(\ab[3][6] ) );
  NOR2X1M U87 ( .A(n33), .B(n27), .Y(\ab[3][5] ) );
  NOR2X1M U88 ( .A(n34), .B(n27), .Y(\ab[3][4] ) );
  NOR2X1M U89 ( .A(n35), .B(n27), .Y(\ab[3][3] ) );
  NOR2X1M U90 ( .A(n36), .B(n27), .Y(\ab[3][2] ) );
  NOR2X1M U91 ( .A(n37), .B(n27), .Y(\ab[3][1] ) );
  NOR2X1M U92 ( .A(n38), .B(n27), .Y(\ab[3][0] ) );
  NOR2X1M U93 ( .A(n31), .B(n28), .Y(\ab[2][7] ) );
  NOR2X1M U94 ( .A(n32), .B(n28), .Y(\ab[2][6] ) );
  NOR2X1M U95 ( .A(n33), .B(n28), .Y(\ab[2][5] ) );
  NOR2X1M U96 ( .A(n34), .B(n28), .Y(\ab[2][4] ) );
  NOR2X1M U97 ( .A(n35), .B(n28), .Y(\ab[2][3] ) );
  NOR2X1M U98 ( .A(n36), .B(n28), .Y(\ab[2][2] ) );
  NOR2X1M U99 ( .A(n37), .B(n28), .Y(\ab[2][1] ) );
  NOR2X1M U100 ( .A(n38), .B(n28), .Y(\ab[2][0] ) );
  NOR2X1M U101 ( .A(n31), .B(n29), .Y(\ab[1][7] ) );
  NOR2X1M U102 ( .A(n32), .B(n29), .Y(\ab[1][6] ) );
  NOR2X1M U103 ( .A(n33), .B(n29), .Y(\ab[1][5] ) );
  NOR2X1M U104 ( .A(n34), .B(n29), .Y(\ab[1][4] ) );
  NOR2X1M U105 ( .A(n35), .B(n29), .Y(\ab[1][3] ) );
  NOR2X1M U106 ( .A(n36), .B(n29), .Y(\ab[1][2] ) );
  NOR2X1M U107 ( .A(n37), .B(n29), .Y(\ab[1][1] ) );
  NOR2X1M U108 ( .A(n38), .B(n29), .Y(\ab[1][0] ) );
  NOR2X1M U109 ( .A(n31), .B(n30), .Y(\ab[0][7] ) );
  NOR2X1M U110 ( .A(n32), .B(n30), .Y(\ab[0][6] ) );
  NOR2X1M U111 ( .A(n33), .B(n30), .Y(\ab[0][5] ) );
  NOR2X1M U112 ( .A(n34), .B(n30), .Y(\ab[0][4] ) );
  NOR2X1M U113 ( .A(n35), .B(n30), .Y(\ab[0][3] ) );
  NOR2X1M U114 ( .A(n36), .B(n30), .Y(\ab[0][2] ) );
  NOR2X1M U115 ( .A(n37), .B(n30), .Y(\ab[0][1] ) );
  NOR2X1M U116 ( .A(n38), .B(n30), .Y(PRODUCT[0]) );
endmodule


module ALU_DATA_WIDTH8 ( A, B, ALU_FUN, CLK, EN, ALU_OUT, Shift_flag, CMP_flag, 
        Logic_flag, Arith_flag, Carry_Flag, ALU_OUT_Valid );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, EN;
  output Shift_flag, CMP_flag, Logic_flag, Arith_flag, Carry_Flag,
         ALU_OUT_Valid;
  wire   N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N126, N127, N128, N153, N155, N156, N157, N158,
         N159, N160, N161, N162, N163, N164, N165, N166, N167, N168, N169,
         N170, N171, N172, N173, N174, N175, N176, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141;

  ALU_DATA_WIDTH8_DW_div_uns_0 div_29 ( .a({n11, n10, n9, n8, n7, n6, n5, n4}), 
        .b({B[7], n3, B[5:0]}), .quotient({N128, N127, N126, N125, N124, N123, 
        N122, N121}) );
  ALU_DATA_WIDTH8_DW01_sub_0 sub_21 ( .A({1'b0, n11, n10, n9, n8, n7, n6, n5, 
        n4}), .B({1'b0, B[7], n3, B[5:0]}), .CI(1'b0), .DIFF({N104, N103, N102, 
        N101, N100, N99, N98, N97, N96}) );
  ALU_DATA_WIDTH8_DW01_add_0 add_17 ( .A({1'b0, n11, n10, n9, n8, n7, n6, n5, 
        n4}), .B({1'b0, B[7], n3, B[5:0]}), .CI(1'b0), .SUM({N95, N94, N93, 
        N92, N91, N90, N89, N88, N87}) );
  ALU_DATA_WIDTH8_DW02_mult_0 mult_25 ( .A({n11, n10, n9, n8, n7, n6, n5, n4}), 
        .B({B[7], n3, B[5:0]}), .TC(1'b0), .PRODUCT({N120, N119, N118, N117, 
        N116, N115, N114, N113, N112, N111, N110, N109, N108, N107, N106, N105}) );
  DFFQX2M ALU_OUT_Valid_reg ( .D(EN), .CK(CLK), .Q(ALU_OUT_Valid) );
  EDFFHQX2M \ALU_OUT_reg[7]  ( .D(N163), .E(EN), .CK(CLK), .Q(ALU_OUT[7]) );
  EDFFHQX2M \ALU_OUT_reg[6]  ( .D(N162), .E(EN), .CK(CLK), .Q(ALU_OUT[6]) );
  EDFFHQX2M \ALU_OUT_reg[5]  ( .D(N161), .E(EN), .CK(CLK), .Q(ALU_OUT[5]) );
  EDFFHQX2M \ALU_OUT_reg[4]  ( .D(N160), .E(EN), .CK(CLK), .Q(ALU_OUT[4]) );
  EDFFHQX2M \ALU_OUT_reg[3]  ( .D(N159), .E(EN), .CK(CLK), .Q(ALU_OUT[3]) );
  EDFFHQX2M \ALU_OUT_reg[2]  ( .D(N158), .E(EN), .CK(CLK), .Q(ALU_OUT[2]) );
  EDFFHQX2M \ALU_OUT_reg[1]  ( .D(N157), .E(EN), .CK(CLK), .Q(ALU_OUT[1]) );
  EDFFHQX2M \ALU_OUT_reg[0]  ( .D(N156), .E(EN), .CK(CLK), .Q(ALU_OUT[0]) );
  EDFFHQX2M \ALU_OUT_reg[15]  ( .D(N171), .E(EN), .CK(CLK), .Q(ALU_OUT[15]) );
  EDFFHQX2M \ALU_OUT_reg[14]  ( .D(N170), .E(EN), .CK(CLK), .Q(ALU_OUT[14]) );
  EDFFHQX2M \ALU_OUT_reg[13]  ( .D(N169), .E(EN), .CK(CLK), .Q(ALU_OUT[13]) );
  EDFFHQX2M \ALU_OUT_reg[12]  ( .D(N168), .E(EN), .CK(CLK), .Q(ALU_OUT[12]) );
  EDFFHQX2M \ALU_OUT_reg[11]  ( .D(N167), .E(EN), .CK(CLK), .Q(ALU_OUT[11]) );
  EDFFHQX2M \ALU_OUT_reg[10]  ( .D(N166), .E(EN), .CK(CLK), .Q(ALU_OUT[10]) );
  EDFFHQX2M \ALU_OUT_reg[9]  ( .D(N165), .E(EN), .CK(CLK), .Q(ALU_OUT[9]) );
  EDFFHQX2M \ALU_OUT_reg[8]  ( .D(N164), .E(EN), .CK(CLK), .Q(ALU_OUT[8]) );
  EDFFHQX2M Arith_flag_reg ( .D(N176), .E(EN), .CK(CLK), .Q(Arith_flag) );
  EDFFHQX2M Logic_flag_reg ( .D(N175), .E(EN), .CK(CLK), .Q(Logic_flag) );
  EDFFHQX2M CMP_flag_reg ( .D(N174), .E(EN), .CK(CLK), .Q(CMP_flag) );
  EDFFHQX2M Shift_flag_reg ( .D(N173), .E(EN), .CK(CLK), .Q(Shift_flag) );
  EDFFHQX2M Carry_Flag_reg ( .D(N172), .E(EN), .CK(CLK), .Q(Carry_Flag) );
  BUFX2M U3 ( .A(A[6]), .Y(n10) );
  OAI2BB1X2M U4 ( .A0N(N120), .A1N(n36), .B0(n48), .Y(N171) );
  OAI2BB1X2M U5 ( .A0N(N119), .A1N(n36), .B0(n48), .Y(N170) );
  OAI2BB1X2M U8 ( .A0N(N116), .A1N(n36), .B0(n48), .Y(N167) );
  OAI2BB1X2M U9 ( .A0N(N117), .A1N(n36), .B0(n48), .Y(N168) );
  OAI2BB1X2M U10 ( .A0N(N118), .A1N(n36), .B0(n48), .Y(N169) );
  OAI2BB1X2M U11 ( .A0N(N114), .A1N(n36), .B0(n48), .Y(N165) );
  OAI2BB1X2M U12 ( .A0N(N115), .A1N(n36), .B0(n48), .Y(N166) );
  NAND4BX1M U13 ( .AN(n12), .B(n39), .C(n40), .D(n41), .Y(N175) );
  NOR2X2M U14 ( .A(n42), .B(n13), .Y(n41) );
  INVX2M U15 ( .A(n40), .Y(n137) );
  INVX2M U16 ( .A(n49), .Y(n138) );
  OR4X1M U17 ( .A(n35), .B(n36), .C(n37), .D(n138), .Y(N176) );
  INVX2M U18 ( .A(n47), .Y(n135) );
  INVX2M U19 ( .A(n45), .Y(n134) );
  NOR3X2M U20 ( .A(n137), .B(N172), .C(n13), .Y(n48) );
  AND2X2M U21 ( .A(n92), .B(n102), .Y(n42) );
  NAND2X2M U22 ( .A(n39), .B(n108), .Y(n57) );
  NAND2X2M U23 ( .A(n103), .B(n101), .Y(n39) );
  INVX2M U24 ( .A(n113), .Y(n121) );
  BUFX2M U25 ( .A(n43), .Y(n13) );
  OAI21X2M U26 ( .A0(n100), .A1(n107), .B0(n108), .Y(n43) );
  NOR2BX2M U27 ( .AN(n101), .B(n44), .Y(n36) );
  NOR2BX2M U28 ( .AN(n102), .B(n100), .Y(n37) );
  NOR2X2M U29 ( .A(n44), .B(n100), .Y(n35) );
  NAND2X2M U30 ( .A(n92), .B(n141), .Y(n47) );
  NAND2X2M U31 ( .A(n141), .B(n101), .Y(n40) );
  OAI21X2M U32 ( .A0(n44), .A1(n136), .B0(n45), .Y(N174) );
  NAND2X2M U33 ( .A(n101), .B(n102), .Y(n49) );
  NAND2X2M U34 ( .A(n92), .B(n103), .Y(n45) );
  INVX2M U35 ( .A(n46), .Y(n139) );
  BUFX2M U36 ( .A(n38), .Y(n12) );
  NOR2BX2M U37 ( .AN(n103), .B(n100), .Y(n38) );
  INVX2M U38 ( .A(n107), .Y(n141) );
  INVX2M U39 ( .A(n44), .Y(n140) );
  NAND2X2M U40 ( .A(n46), .B(n47), .Y(N173) );
  AOI222X1M U41 ( .A0(N105), .A1(n36), .B0(n4), .B1(n12), .C0(N121), .C1(n35), 
        .Y(n99) );
  NAND4BX1M U42 ( .AN(n96), .B(n97), .C(n98), .D(n99), .Y(N156) );
  AOI22X1M U43 ( .A0(N96), .A1(n37), .B0(N87), .B1(n138), .Y(n98) );
  AOI222X1M U44 ( .A0(n137), .A1(n129), .B0(n5), .B1(n139), .C0(N155), .C1(
        n134), .Y(n97) );
  OAI21X2M U45 ( .A0(n104), .A1(n114), .B0(n105), .Y(n96) );
  AOI222X1M U46 ( .A0(N122), .A1(n35), .B0(n137), .B1(n127), .C0(n5), .C1(n12), 
        .Y(n91) );
  NAND3X2M U47 ( .A(n82), .B(n83), .C(n84), .Y(N158) );
  AOI22X1M U48 ( .A0(N98), .A1(n37), .B0(N89), .B1(n138), .Y(n82) );
  AOI221XLM U49 ( .A0(n7), .A1(n139), .B0(n137), .B1(n126), .C0(n85), .Y(n84)
         );
  AOI222X1M U50 ( .A0(N107), .A1(n36), .B0(n6), .B1(n12), .C0(N123), .C1(n35), 
        .Y(n83) );
  NAND3X2M U51 ( .A(n76), .B(n77), .C(n78), .Y(N159) );
  AOI22X1M U52 ( .A0(N99), .A1(n37), .B0(N90), .B1(n138), .Y(n76) );
  AOI221XLM U53 ( .A0(n8), .A1(n139), .B0(n137), .B1(n125), .C0(n79), .Y(n78)
         );
  AOI222X1M U54 ( .A0(N108), .A1(n36), .B0(n7), .B1(n12), .C0(N124), .C1(n35), 
        .Y(n77) );
  NAND3X2M U55 ( .A(n70), .B(n71), .C(n72), .Y(N160) );
  AOI22X1M U56 ( .A0(N100), .A1(n37), .B0(N91), .B1(n138), .Y(n70) );
  AOI221XLM U57 ( .A0(n139), .A1(n9), .B0(n137), .B1(n124), .C0(n73), .Y(n72)
         );
  AOI222X1M U58 ( .A0(N109), .A1(n36), .B0(n8), .B1(n12), .C0(N125), .C1(n35), 
        .Y(n71) );
  NAND3X2M U59 ( .A(n64), .B(n65), .C(n66), .Y(N161) );
  AOI22X1M U60 ( .A0(N101), .A1(n37), .B0(N92), .B1(n138), .Y(n64) );
  AOI221XLM U61 ( .A0(n139), .A1(n10), .B0(n137), .B1(n123), .C0(n67), .Y(n66)
         );
  AOI222X1M U62 ( .A0(N110), .A1(n36), .B0(n9), .B1(n12), .C0(N126), .C1(n35), 
        .Y(n65) );
  NAND3X2M U63 ( .A(n58), .B(n59), .C(n60), .Y(N162) );
  AOI22X1M U64 ( .A0(N102), .A1(n37), .B0(N93), .B1(n138), .Y(n58) );
  AOI221XLM U65 ( .A0(n139), .A1(n11), .B0(n137), .B1(n122), .C0(n61), .Y(n60)
         );
  AOI222X1M U66 ( .A0(N111), .A1(n36), .B0(n12), .B1(n10), .C0(N127), .C1(n35), 
        .Y(n59) );
  NAND3X2M U67 ( .A(n51), .B(n52), .C(n53), .Y(N163) );
  AOI221XLM U68 ( .A0(n137), .A1(n120), .B0(n12), .B1(n11), .C0(n54), .Y(n53)
         );
  AOI22X1M U69 ( .A0(N103), .A1(n37), .B0(N94), .B1(n138), .Y(n51) );
  AOI22X1M U70 ( .A0(N128), .A1(n35), .B0(N112), .B1(n36), .Y(n52) );
  OAI2B11X2M U71 ( .A1N(N95), .A0(n49), .B0(n48), .C0(n50), .Y(N164) );
  AOI22X1M U72 ( .A0(n11), .A1(n135), .B0(N113), .B1(n36), .Y(n50) );
  INVX2M U73 ( .A(n3), .Y(n117) );
  OAI222X1M U74 ( .A0(n62), .A1(n117), .B0(n3), .B1(n63), .C0(n47), .C1(n123), 
        .Y(n61) );
  AOI221XLM U75 ( .A0(n10), .A1(n42), .B0(n13), .B1(n122), .C0(n137), .Y(n63)
         );
  AOI221XLM U76 ( .A0(n42), .A1(n122), .B0(n10), .B1(n57), .C0(n12), .Y(n62)
         );
  NOR2X2M U77 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n101) );
  NAND2X2M U78 ( .A(ALU_FUN[0]), .B(n136), .Y(n100) );
  AOI32X1M U79 ( .A0(n92), .A1(n140), .A2(N153), .B0(n128), .B1(n114), .Y(n105) );
  INVX2M U80 ( .A(n106), .Y(n128) );
  AOI221XLM U81 ( .A0(n129), .A1(n13), .B0(n42), .B1(n4), .C0(n137), .Y(n106)
         );
  NOR2X2M U82 ( .A(n136), .B(ALU_FUN[0]), .Y(n92) );
  INVX2M U83 ( .A(ALU_FUN[3]), .Y(n136) );
  NAND4BX1M U84 ( .AN(n113), .B(ALU_FUN[3]), .C(n140), .D(ALU_FUN[0]), .Y(n95)
         );
  AND2X2M U85 ( .A(N104), .B(n37), .Y(N172) );
  AOI221XLM U86 ( .A0(n42), .A1(n129), .B0(n4), .B1(n57), .C0(n12), .Y(n104)
         );
  AOI221XLM U87 ( .A0(n42), .A1(n127), .B0(n5), .B1(n57), .C0(n12), .Y(n94) );
  AOI221XLM U88 ( .A0(n5), .A1(n42), .B0(n13), .B1(n127), .C0(n137), .Y(n93)
         );
  NOR2BX2M U89 ( .AN(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n103) );
  NOR2X2M U90 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n102) );
  NAND3X2M U91 ( .A(ALU_FUN[0]), .B(n102), .C(ALU_FUN[3]), .Y(n108) );
  NAND3X2M U92 ( .A(n103), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n46) );
  NAND2BX2M U93 ( .AN(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n44) );
  NAND2X2M U94 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U95 ( .A(n10), .Y(n122) );
  INVX2M U96 ( .A(n6), .Y(n126) );
  INVX2M U97 ( .A(n7), .Y(n125) );
  INVX2M U98 ( .A(n9), .Y(n123) );
  INVX2M U99 ( .A(n8), .Y(n124) );
  INVX2M U100 ( .A(n4), .Y(n129) );
  INVX2M U101 ( .A(n11), .Y(n120) );
  INVX2M U102 ( .A(n5), .Y(n127) );
  BUFX2M U103 ( .A(A[7]), .Y(n11) );
  BUFX2M U104 ( .A(B[6]), .Y(n3) );
  NAND4BX1M U105 ( .AN(n88), .B(n89), .C(n90), .D(n91), .Y(N157) );
  AOI222X1M U106 ( .A0(N88), .A1(n138), .B0(N106), .B1(n36), .C0(N97), .C1(n37), .Y(n90) );
  AOI222X1M U107 ( .A0(N155), .A1(n134), .B0(n4), .B1(n135), .C0(n6), .C1(n139), .Y(n89) );
  OAI221X1M U108 ( .A0(B[1]), .A1(n93), .B0(n94), .B1(n133), .C0(n95), .Y(n88)
         );
  BUFX2M U109 ( .A(A[5]), .Y(n9) );
  BUFX2M U110 ( .A(A[4]), .Y(n8) );
  BUFX2M U111 ( .A(A[3]), .Y(n7) );
  BUFX2M U112 ( .A(A[2]), .Y(n6) );
  BUFX2M U113 ( .A(A[1]), .Y(n5) );
  BUFX2M U114 ( .A(A[0]), .Y(n4) );
  OAI222X1M U115 ( .A0(n86), .A1(n115), .B0(B[2]), .B1(n87), .C0(n47), .C1(
        n127), .Y(n85) );
  AOI221XLM U116 ( .A0(n6), .A1(n42), .B0(n13), .B1(n126), .C0(n137), .Y(n87)
         );
  AOI221XLM U117 ( .A0(n42), .A1(n126), .B0(n6), .B1(n57), .C0(n12), .Y(n86)
         );
  OAI222X1M U118 ( .A0(n80), .A1(n116), .B0(B[3]), .B1(n81), .C0(n47), .C1(
        n126), .Y(n79) );
  AOI221XLM U119 ( .A0(n7), .A1(n42), .B0(n13), .B1(n125), .C0(n137), .Y(n81)
         );
  AOI221XLM U120 ( .A0(n42), .A1(n125), .B0(n7), .B1(n57), .C0(n12), .Y(n80)
         );
  OAI222X1M U121 ( .A0(n74), .A1(n132), .B0(B[4]), .B1(n75), .C0(n47), .C1(
        n125), .Y(n73) );
  INVX2M U122 ( .A(B[4]), .Y(n132) );
  AOI221XLM U123 ( .A0(n8), .A1(n42), .B0(n13), .B1(n124), .C0(n137), .Y(n75)
         );
  AOI221XLM U124 ( .A0(n42), .A1(n124), .B0(n8), .B1(n57), .C0(n12), .Y(n74)
         );
  OAI222X1M U125 ( .A0(n68), .A1(n131), .B0(B[5]), .B1(n69), .C0(n47), .C1(
        n124), .Y(n67) );
  INVX2M U126 ( .A(B[5]), .Y(n131) );
  AOI221XLM U127 ( .A0(n9), .A1(n42), .B0(n13), .B1(n123), .C0(n137), .Y(n69)
         );
  AOI221XLM U128 ( .A0(n42), .A1(n123), .B0(n9), .B1(n57), .C0(n12), .Y(n68)
         );
  OAI222X1M U129 ( .A0(n55), .A1(n130), .B0(B[7]), .B1(n56), .C0(n47), .C1(
        n122), .Y(n54) );
  INVX2M U130 ( .A(B[7]), .Y(n130) );
  AOI221XLM U131 ( .A0(n42), .A1(n11), .B0(n13), .B1(n120), .C0(n137), .Y(n56)
         );
  AOI221XLM U132 ( .A0(n42), .A1(n120), .B0(n11), .B1(n57), .C0(n12), .Y(n55)
         );
  INVX2M U133 ( .A(n14), .Y(n118) );
  INVX2M U134 ( .A(n25), .Y(n119) );
  INVX2M U135 ( .A(B[0]), .Y(n114) );
  INVX2M U136 ( .A(B[2]), .Y(n115) );
  INVX2M U137 ( .A(B[3]), .Y(n116) );
  INVX2M U138 ( .A(B[1]), .Y(n133) );
  NOR2X1M U139 ( .A(n120), .B(B[7]), .Y(n110) );
  NAND2BX1M U140 ( .AN(B[4]), .B(n8), .Y(n29) );
  NAND2BX1M U141 ( .AN(n8), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U142 ( .A(n29), .B(n18), .Y(n31) );
  NOR2X1M U143 ( .A(n116), .B(n7), .Y(n26) );
  NOR2X1M U144 ( .A(n115), .B(n6), .Y(n17) );
  NOR2X1M U145 ( .A(n114), .B(n4), .Y(n14) );
  CLKNAND2X2M U146 ( .A(n6), .B(n115), .Y(n28) );
  NAND2BX1M U147 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U148 ( .A0(n14), .A1(n127), .B0(B[1]), .Y(n15) );
  AOI211X1M U149 ( .A0(n5), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U150 ( .A(n7), .B(n116), .Y(n27) );
  OAI31X1M U151 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U152 ( .AN(n9), .B(B[5]), .Y(n34) );
  OAI211X1M U153 ( .A0(n31), .A1(n19), .B0(n18), .C0(n34), .Y(n20) );
  NAND2BX1M U154 ( .AN(B[5]), .B(n9), .Y(n30) );
  XNOR2X1M U155 ( .A(n10), .B(n3), .Y(n33) );
  AOI32X1M U156 ( .A0(n20), .A1(n30), .A2(n33), .B0(n3), .B1(n122), .Y(n21) );
  CLKNAND2X2M U157 ( .A(B[7]), .B(n120), .Y(n111) );
  OAI21X1M U158 ( .A0(n110), .A1(n21), .B0(n111), .Y(N155) );
  CLKNAND2X2M U159 ( .A(n4), .B(n114), .Y(n24) );
  OA21X1M U160 ( .A0(n24), .A1(n127), .B0(B[1]), .Y(n22) );
  AOI211X1M U161 ( .A0(n24), .A1(n127), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U162 ( .A0(n119), .A1(n28), .A2(n27), .B0(n26), .Y(n32) );
  OAI2B11X1M U163 ( .A1N(n32), .A0(n31), .B0(n30), .C0(n29), .Y(n109) );
  AOI32X1M U164 ( .A0(n109), .A1(n34), .A2(n33), .B0(n10), .B1(n117), .Y(n112)
         );
  AOI2B1X1M U165 ( .A1N(n112), .A0(n111), .B0(n110), .Y(n113) );
  NOR2X1M U166 ( .A(N155), .B(n121), .Y(N153) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module RST_SYNC_NUM_STAGES2_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \flops[0] ;

  DFFRQX2M \flops_reg[1]  ( .D(\flops[0] ), .CK(CLK), .RN(RST), .Q(SYNC_RST)
         );
  DFFRQX2M \flops_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\flops[0] ) );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \flops[0] ;

  DFFRQX2M \flops_reg[1]  ( .D(\flops[0] ), .CK(CLK), .RN(RST), .Q(SYNC_RST)
         );
  DFFRQX2M \flops_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\flops[0] ) );
endmodule


module CLK_DIV_Counter_WIDTH6_0 ( clk, rst_n, rst_value, count );
  input [5:0] rst_value;
  output [5:0] count;
  input clk, rst_n;
  wire   N2, N3, N5, N8, N9, N10, N11, N12, N13, \add_18_aco/carry[5] ,
         \add_18_aco/carry[4] , \add_18_aco/carry[3] , \add_18_aco/carry[2] ,
         \mult_add_18_aco/PROD_not[0] , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX2M \count_reg[5]  ( .D(N12), .CK(clk), .RN(rst_n), .Q(count[5]) );
  DFFSQX2M \count_reg[0]  ( .D(\mult_add_18_aco/PROD_not[0] ), .CK(clk), .SN(
        rst_n), .Q(count[0]) );
  DFFRQX2M \count_reg[4]  ( .D(N11), .CK(clk), .RN(rst_n), .Q(count[4]) );
  DFFRQX2M \count_reg[1]  ( .D(N8), .CK(clk), .RN(rst_n), .Q(count[1]) );
  DFFRQX2M \count_reg[3]  ( .D(N10), .CK(clk), .RN(rst_n), .Q(count[3]) );
  DFFRQX2M \count_reg[2]  ( .D(N9), .CK(clk), .RN(rst_n), .Q(count[2]) );
  AND2X2M U3 ( .A(count[1]), .B(N5), .Y(n1) );
  AND2X2M U4 ( .A(count[2]), .B(N5), .Y(n2) );
  AND2X2M U5 ( .A(count[3]), .B(N5), .Y(n3) );
  AND2X2M U6 ( .A(count[4]), .B(N5), .Y(n4) );
  AND2X2M U7 ( .A(N5), .B(count[5]), .Y(n5) );
  INVX2M U8 ( .A(rst_value[4]), .Y(n18) );
  NOR2X2M U9 ( .A(N3), .B(N2), .Y(N5) );
  ADDHX1M U10 ( .A(n1), .B(N13), .CO(\add_18_aco/carry[2] ), .S(N8) );
  ADDHX1M U11 ( .A(n2), .B(\add_18_aco/carry[2] ), .CO(\add_18_aco/carry[3] ), 
        .S(N9) );
  ADDHX1M U12 ( .A(n3), .B(\add_18_aco/carry[3] ), .CO(\add_18_aco/carry[4] ), 
        .S(N10) );
  ADDHX1M U13 ( .A(n4), .B(\add_18_aco/carry[4] ), .CO(\add_18_aco/carry[5] ), 
        .S(N11) );
  INVX2M U14 ( .A(count[2]), .Y(n19) );
  INVX2M U15 ( .A(count[3]), .Y(n20) );
  CLKNAND2X2M U16 ( .A(count[0]), .B(N5), .Y(\mult_add_18_aco/PROD_not[0] ) );
  CLKINVX1M U17 ( .A(\mult_add_18_aco/PROD_not[0] ), .Y(N13) );
  CLKXOR2X2M U18 ( .A(\add_18_aco/carry[5] ), .B(n5), .Y(N12) );
  CLKNAND2X2M U19 ( .A(rst_value[2]), .B(n19), .Y(n17) );
  NAND2BX1M U20 ( .AN(count[4]), .B(rst_value[4]), .Y(n13) );
  CLKNAND2X2M U21 ( .A(rst_value[3]), .B(n20), .Y(n12) );
  NOR2BX1M U22 ( .AN(rst_value[0]), .B(count[0]), .Y(n6) );
  OAI2B2X1M U23 ( .A1N(count[1]), .A0(n6), .B0(rst_value[1]), .B1(n6), .Y(n7)
         );
  NAND3X1M U24 ( .A(n13), .B(n12), .C(n7), .Y(n16) );
  NOR2BX1M U25 ( .AN(rst_value[5]), .B(count[5]), .Y(n15) );
  NOR2BX1M U26 ( .AN(count[0]), .B(rst_value[0]), .Y(n9) );
  OAI2BB1X1M U27 ( .A0N(n9), .A1N(count[1]), .B0(rst_value[1]), .Y(n8) );
  OAI211X1M U28 ( .A0(count[1]), .A1(n9), .B0(n8), .C0(n17), .Y(n10) );
  OAI221X1M U29 ( .A0(rst_value[2]), .A1(n19), .B0(rst_value[3]), .B1(n20), 
        .C0(n10), .Y(n11) );
  AOI32X1M U30 ( .A0(n13), .A1(n12), .A2(n11), .B0(count[4]), .B1(n18), .Y(n14) );
  OAI2B2X1M U31 ( .A1N(count[5]), .A0(rst_value[5]), .B0(n15), .B1(n14), .Y(N3) );
  NOR4BX1M U32 ( .AN(n17), .B(n16), .C(N3), .D(n15), .Y(N2) );
endmodule


module ClkDiv_DATA_DIV_WIDTH6_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk );
  input [5:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, div_clk_r, N5, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [5:0] count;

  CLK_DIV_Counter_WIDTH6_0 counter ( .clk(i_ref_clk), .rst_n(i_rst_n), 
        .rst_value(i_div_ratio), .count(count) );
  DFFSQX2M div_clk_r_reg ( .D(N5), .CK(i_ref_clk), .SN(i_rst_n), .Q(div_clk_r)
         );
  MX2X2M U3 ( .A(div_clk_r), .B(i_ref_clk), .S0(N0), .Y(o_div_clk) );
  INVX2M U4 ( .A(count[3]), .Y(n12) );
  INVX2M U5 ( .A(count[2]), .Y(n11) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n10) );
  OAI31X1M U7 ( .A0(n1), .A1(i_div_ratio[2]), .A2(i_div_ratio[1]), .B0(
        i_clk_en), .Y(N0) );
  OR3X2M U8 ( .A(i_div_ratio[5]), .B(i_div_ratio[4]), .C(i_div_ratio[3]), .Y(
        n1) );
  INVX2M U9 ( .A(i_div_ratio[4]), .Y(n9) );
  INVX2M U10 ( .A(i_div_ratio[3]), .Y(n8) );
  INVX2M U11 ( .A(i_div_ratio[2]), .Y(n7) );
  AOI2BB1X1M U12 ( .A0N(count[1]), .A1N(n7), .B0(i_div_ratio[1]), .Y(n2) );
  AOI222X1M U13 ( .A0(count[2]), .A1(n8), .B0(n2), .B1(count[0]), .C0(count[1]), .C1(n7), .Y(n3) );
  AOI221XLM U14 ( .A0(i_div_ratio[4]), .A1(n12), .B0(i_div_ratio[3]), .B1(n11), 
        .C0(n3), .Y(n4) );
  AOI221XLM U15 ( .A0(count[4]), .A1(n10), .B0(count[3]), .B1(n9), .C0(n4), 
        .Y(n5) );
  AOI2BB1X1M U16 ( .A0N(count[4]), .A1N(n10), .B0(n5), .Y(n6) );
  NOR2X1M U17 ( .A(count[5]), .B(n6), .Y(N5) );
endmodule


module CLKDIV_MUX_WIDTH6 ( IN, OUT );
  input [5:0] IN;
  output [5:0] OUT;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13;

  INVX2M U3 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[4]) );
  NAND4BX1M U7 ( .AN(IN[4]), .B(IN[3]), .C(n11), .D(n10), .Y(n6) );
  NAND4BX1M U8 ( .AN(IN[3]), .B(IN[4]), .C(n11), .D(n10), .Y(n7) );
  NOR3X2M U9 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR4X1M U10 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U11 ( .A(n13), .B(n12), .C(IN[2]), .Y(n5) );
  NOR3X2M U12 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  OAI211X2M U13 ( .A0(n8), .A1(n9), .B0(n13), .C0(n12), .Y(OUT[0]) );
  NAND2X2M U14 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U15 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n11), .Y(n8) );
  INVX2M U16 ( .A(IN[2]), .Y(n11) );
  INVX2M U17 ( .A(IN[1]), .Y(n12) );
  INVX2M U18 ( .A(IN[0]), .Y(n13) );
  INVX2M U19 ( .A(IN[5]), .Y(n10) );
endmodule


module CLK_DIV_Counter_WIDTH6_1 ( clk, rst_n, rst_value, count );
  input [5:0] rst_value;
  output [5:0] count;
  input clk, rst_n;
  wire   N2, N3, N5, N8, N9, N10, N11, N12, N13, \add_18_aco/carry[5] ,
         \add_18_aco/carry[4] , \add_18_aco/carry[3] , \add_18_aco/carry[2] ,
         \mult_add_18_aco/PROD_not[0] , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRQX2M \count_reg[5]  ( .D(N12), .CK(clk), .RN(rst_n), .Q(count[5]) );
  DFFRQX2M \count_reg[4]  ( .D(N11), .CK(clk), .RN(rst_n), .Q(count[4]) );
  DFFSQX2M \count_reg[0]  ( .D(\mult_add_18_aco/PROD_not[0] ), .CK(clk), .SN(
        rst_n), .Q(count[0]) );
  DFFRQX2M \count_reg[1]  ( .D(N8), .CK(clk), .RN(rst_n), .Q(count[1]) );
  DFFRQX2M \count_reg[3]  ( .D(N10), .CK(clk), .RN(rst_n), .Q(count[3]) );
  DFFRQX2M \count_reg[2]  ( .D(N9), .CK(clk), .RN(rst_n), .Q(count[2]) );
  AND2X2M U3 ( .A(count[1]), .B(N5), .Y(n1) );
  AND2X2M U4 ( .A(count[2]), .B(N5), .Y(n2) );
  AND2X2M U5 ( .A(count[3]), .B(N5), .Y(n3) );
  AND2X2M U6 ( .A(count[4]), .B(N5), .Y(n4) );
  AND2X2M U7 ( .A(N5), .B(count[5]), .Y(n5) );
  NOR2X2M U8 ( .A(N3), .B(N2), .Y(N5) );
  INVX2M U9 ( .A(rst_value[4]), .Y(n18) );
  ADDHX1M U10 ( .A(n1), .B(N13), .CO(\add_18_aco/carry[2] ), .S(N8) );
  ADDHX1M U11 ( .A(n2), .B(\add_18_aco/carry[2] ), .CO(\add_18_aco/carry[3] ), 
        .S(N9) );
  ADDHX1M U12 ( .A(n3), .B(\add_18_aco/carry[3] ), .CO(\add_18_aco/carry[4] ), 
        .S(N10) );
  ADDHX1M U13 ( .A(n4), .B(\add_18_aco/carry[4] ), .CO(\add_18_aco/carry[5] ), 
        .S(N11) );
  INVX2M U14 ( .A(count[2]), .Y(n19) );
  INVX2M U15 ( .A(count[3]), .Y(n20) );
  CLKNAND2X2M U16 ( .A(count[0]), .B(N5), .Y(\mult_add_18_aco/PROD_not[0] ) );
  CLKINVX1M U17 ( .A(\mult_add_18_aco/PROD_not[0] ), .Y(N13) );
  CLKXOR2X2M U18 ( .A(\add_18_aco/carry[5] ), .B(n5), .Y(N12) );
  CLKNAND2X2M U19 ( .A(rst_value[2]), .B(n19), .Y(n17) );
  NAND2BX1M U20 ( .AN(count[4]), .B(rst_value[4]), .Y(n13) );
  CLKNAND2X2M U21 ( .A(rst_value[3]), .B(n20), .Y(n12) );
  NOR2BX1M U22 ( .AN(rst_value[0]), .B(count[0]), .Y(n6) );
  OAI2B2X1M U23 ( .A1N(count[1]), .A0(n6), .B0(rst_value[1]), .B1(n6), .Y(n7)
         );
  NAND3X1M U24 ( .A(n13), .B(n12), .C(n7), .Y(n16) );
  NOR2BX1M U25 ( .AN(rst_value[5]), .B(count[5]), .Y(n15) );
  NOR2BX1M U26 ( .AN(count[0]), .B(rst_value[0]), .Y(n9) );
  OAI2BB1X1M U27 ( .A0N(n9), .A1N(count[1]), .B0(rst_value[1]), .Y(n8) );
  OAI211X1M U28 ( .A0(count[1]), .A1(n9), .B0(n8), .C0(n17), .Y(n10) );
  OAI221X1M U29 ( .A0(rst_value[2]), .A1(n19), .B0(rst_value[3]), .B1(n20), 
        .C0(n10), .Y(n11) );
  AOI32X1M U30 ( .A0(n13), .A1(n12), .A2(n11), .B0(count[4]), .B1(n18), .Y(n14) );
  OAI2B2X1M U31 ( .A1N(count[5]), .A0(rst_value[5]), .B0(n15), .B1(n14), .Y(N3) );
  NOR4BX1M U32 ( .AN(n17), .B(n16), .C(N3), .D(n15), .Y(N2) );
endmodule


module ClkDiv_DATA_DIV_WIDTH6_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk );
  input [5:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, div_clk_r, N5, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13
;
  wire   [5:0] count;

  CLK_DIV_Counter_WIDTH6_1 counter ( .clk(i_ref_clk), .rst_n(i_rst_n), 
        .rst_value(i_div_ratio), .count(count) );
  DFFSQX2M div_clk_r_reg ( .D(N5), .CK(i_ref_clk), .SN(i_rst_n), .Q(div_clk_r)
         );
  INVX2M U3 ( .A(i_div_ratio[2]), .Y(n10) );
  INVX2M U4 ( .A(i_div_ratio[3]), .Y(n9) );
  MX2X2M U5 ( .A(div_clk_r), .B(i_ref_clk), .S0(N0), .Y(o_div_clk) );
  INVX2M U6 ( .A(count[3]), .Y(n12) );
  INVX2M U7 ( .A(count[2]), .Y(n11) );
  INVX2M U8 ( .A(i_div_ratio[4]), .Y(n7) );
  OAI31X1M U9 ( .A0(n13), .A1(i_div_ratio[2]), .A2(i_div_ratio[1]), .B0(
        i_clk_en), .Y(N0) );
  OR3X2M U10 ( .A(i_div_ratio[5]), .B(i_div_ratio[4]), .C(i_div_ratio[3]), .Y(
        n13) );
  INVX2M U11 ( .A(i_div_ratio[5]), .Y(n8) );
  AOI2BB1X1M U12 ( .A0N(count[1]), .A1N(n10), .B0(i_div_ratio[1]), .Y(n2) );
  AOI222X1M U13 ( .A0(count[2]), .A1(n9), .B0(n2), .B1(count[0]), .C0(count[1]), .C1(n10), .Y(n3) );
  AOI221XLM U14 ( .A0(i_div_ratio[4]), .A1(n12), .B0(i_div_ratio[3]), .B1(n11), 
        .C0(n3), .Y(n4) );
  AOI221XLM U15 ( .A0(count[4]), .A1(n8), .B0(count[3]), .B1(n7), .C0(n4), .Y(
        n5) );
  AOI2BB1X1M U16 ( .A0N(count[4]), .A1N(n8), .B0(n5), .Y(n6) );
  NOR2X1M U17 ( .A(count[5]), .B(n6), .Y(N5) );
endmodule


module SYS_TOP ( REF_CLK, UART_CLK, RST, RX_IN, TX_OUT, RX_Stop_Error, 
        RX_Parity_Error, TX_OUT_V );
  input REF_CLK, UART_CLK, RST, RX_IN;
  output TX_OUT, RX_Stop_Error, RX_Parity_Error, TX_OUT_V;
  wire   SYNC_RST1, ALU_OUT_Valid, Ref_File_RdData_Valid, SYNC_RX_OUT_V,
         FIFO_Full, Wr_inc, ALU_EN, ALU_CLK_EN, Ref_File_WrEn, Ref_File_RdEn,
         ASYNC_RX_OUT_V, SYNC_RST2, TX_CLK, RX_CLK, FIFO_Empty, Rd_inc,
         ALU_CLK, n1, n2, n3, n4, n5, n6;
  wire   [5:0] RX_Prescale;
  wire   [1:0] UART_CONFIG;
  wire   [5:0] TX_DIV_RATHIO;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Ref_File_RdData;
  wire   [7:0] SYNC_RX_OUT_P;
  wire   [3:0] ALU_FUN;
  wire   [3:0] Ref_File_Adrr;
  wire   [7:0] Ref_File_WrData;
  wire   [7:0] FIFO_Wr_DATA;
  wire   [7:0] ASYNC_RX_OUT_P;
  wire   [7:0] FIFO_Rd_DATA;
  wire   [7:0] ALU_OP_A;
  wire   [7:0] ALU_OP_B;
  wire   [5:0] RX_DIV_RATHIO;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  CLK_GATE ALU_CLK_GATE ( .CLK_EN(ALU_CLK_EN), .CLK(REF_CLK), .GATED_CLK(
        ALU_CLK) );
  SYS_CTRL_DATA_WIDTH8_REG_FILE_DEPTH16 Control_unit ( .CLK(REF_CLK), .RST(n5), 
        .ALU_OUT(ALU_OUT), .ALU_OUT_Valid(ALU_OUT_Valid), .RF_RdData(
        Ref_File_RdData), .RF_RdData_Valid(Ref_File_RdData_Valid), .RX_P_DATA(
        SYNC_RX_OUT_P), .RX_D_VLD(SYNC_RX_OUT_V), .FIFO_Full(FIFO_Full), 
        .ALU_FUN(ALU_FUN), .EN(ALU_EN), .CLK_EN(ALU_CLK_EN), .Address(
        Ref_File_Adrr), .WrEn(Ref_File_WrEn), .RdEn(Ref_File_RdEn), 
        .RF_WrData(Ref_File_WrData), .FIFO_RF_WrData(FIFO_Wr_DATA), .Wr_inc(
        Wr_inc) );
  DATA_SYNC_BUS_WIDTH8_NUM_STAGES2 RX_PDATA_SYNC ( .unsync_bus(ASYNC_RX_OUT_P), 
        .bus_enable(ASYNC_RX_OUT_V), .CLK(REF_CLK), .RST(n5), .sync_bus(
        SYNC_RX_OUT_P), .enable_pulse(SYNC_RX_OUT_V) );
  UART_TOP_DATA_WIDTH8_PRESCALE_WIDTH6 UART ( .RST(n3), .PAR_EN(UART_CONFIG[0]), .PAR_TYP(UART_CONFIG[1]), .TX_CLK(TX_CLK), .TX_IN_P(FIFO_Rd_DATA), .TX_IN_V(
        n1), .TX_OUT_S(TX_OUT), .TX_OUT_V(TX_OUT_V), .RX_CLK(RX_CLK), 
        .RX_IN_S(n2), .Prescale(RX_Prescale), .RX_OUT_P(ASYNC_RX_OUT_P), 
        .RX_OUT_V(ASYNC_RX_OUT_V), .RX_Parity_Error(RX_Parity_Error), 
        .RX_Stop_Error(RX_Stop_Error) );
  RegFile_DATA_WIDTH8_DEPTH16 Reg_File ( .CLK(REF_CLK), .RST(n5), .WrEn(
        Ref_File_WrEn), .RdEn(Ref_File_RdEn), .RdData_VLD(
        Ref_File_RdData_Valid), .Address(Ref_File_Adrr), .WrData(
        Ref_File_WrData), .RdData(Ref_File_RdData), .REG0(ALU_OP_A), .REG1(
        ALU_OP_B), .REG2({RX_Prescale, UART_CONFIG}), .REG3({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, TX_DIV_RATHIO}) );
  ASYNC_FIFO_DATA_WIDTH8_DEPTH16 ASYNC_FIFO_unit ( .w_clk(REF_CLK), .w_rst(n5), 
        .w_inc(Wr_inc), .r_clk(TX_CLK), .r_rst(n3), .r_inc(Rd_inc), .w_data(
        FIFO_Wr_DATA), .empty(FIFO_Empty), .full(FIFO_Full), .rd_data(
        FIFO_Rd_DATA) );
  ALU_DATA_WIDTH8 Processing_unit ( .A(ALU_OP_A), .B(ALU_OP_B), .ALU_FUN(
        ALU_FUN), .CLK(ALU_CLK), .EN(ALU_EN), .ALU_OUT(ALU_OUT), 
        .ALU_OUT_Valid(ALU_OUT_Valid) );
  PULSE_GEN Pulse_Generator ( .clk(TX_CLK), .rst(n3), .lvl_sig(TX_OUT_V), 
        .pulse_sig(Rd_inc) );
  RST_SYNC_NUM_STAGES2_0 Domain1_RST_SYNC ( .RST(RST), .CLK(REF_CLK), 
        .SYNC_RST(SYNC_RST1) );
  RST_SYNC_NUM_STAGES2_1 Domain2_RST_SYNC ( .RST(RST), .CLK(UART_CLK), 
        .SYNC_RST(SYNC_RST2) );
  ClkDiv_DATA_DIV_WIDTH6_0 TX_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n3), 
        .i_clk_en(1'b1), .i_div_ratio(TX_DIV_RATHIO), .o_div_clk(TX_CLK) );
  CLKDIV_MUX_WIDTH6 Prescale_CLKDIV_MUX ( .IN(RX_Prescale), .OUT({
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, RX_DIV_RATHIO[3:0]})
         );
  ClkDiv_DATA_DIV_WIDTH6_1 RX_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n3), 
        .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, RX_DIV_RATHIO[3:0]}), 
        .o_div_clk(RX_CLK) );
  INVX2M U2 ( .A(n6), .Y(n5) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  BUFX2M U4 ( .A(RX_IN), .Y(n2) );
  INVX2M U5 ( .A(FIFO_Empty), .Y(n1) );
  INVX2M U6 ( .A(SYNC_RST1), .Y(n6) );
  INVX2M U7 ( .A(SYNC_RST2), .Y(n4) );
endmodule

