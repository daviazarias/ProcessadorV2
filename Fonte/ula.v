module ula (
    input wire [15:0] A,
    input wire [15:0] B,
    input wire [1:0] op_select,
    output reg [15:0] r
);

    always @(*)
    case (op_select)
        2'd0: r = A + B;
        2'd1: r = A - B;
        2'd2: r = ~(A & B);
        2'd3: r = 16'dz;
    endcase

endmodule

/* Valores op_select -> Operação selecionada

00 -> Soma
01 -> Subtração
10 -> NAND
11 -> no_op
*/