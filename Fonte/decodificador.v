module decodificador(
    input      [2:0] chave,
    output reg [7:0] saida
);

always @(chave) 
    saida = 8'h01 << chave;

endmodule