module multiplexador (
    input  wire [3:0] select,
    input  wire [15:0] immediate,
    input  wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7,
    input  wire [15:0] r,
    output reg  [15:0] saida
);
    always @(*)
    case (select)
        4'd0: saida = r0; 
        4'd1: saida = r1;
        4'd2: saida = r2;
        4'd3: saida = r3;
        4'd4: saida = r4;
        4'd5: saida = r5;
        4'd6: saida = r6;
        4'd7: saida = r7;
        4'd8: saida = immediate;
        4'd9: saida = r;
        default: saida = 16'dz;
    endcase
    
endmodule

/* Valores select -> Entrada selecionada

0000 -> r0
0001 -> r1
0010 -> r2
0011 -> r3
0100 -> r4
0101 -> r6
0110 -> r7
0111 -> r6
1000 -> Immediate
1001 -> r (Registrador ULA)
1010 -> *
1011 -> *
1100 -> *
1101 -> *
1110 -> *
1111 -> *
*/