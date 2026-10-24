module gray2bin #(parameter WIDTH = 5)(
    input  [WIDTH-1:0] gray,
    output [WIDTH-1:0] bin
);
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : g
            assign bin[i] = ^(gray >> i);   // XOR of gray[WIDTH-1:i]
        end
    endgenerate
endmodule