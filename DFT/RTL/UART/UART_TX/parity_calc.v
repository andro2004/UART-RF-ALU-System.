module parity_calc#(parameter DATA_WIDTH = 8)(
    input [DATA_WIDTH-1:0] P_DATA,
    input PAR_TYP,
    output PAR_BIT
    );
    
    assign PAR_BIT = PAR_TYP? ~^(P_DATA):^(P_DATA);
endmodule