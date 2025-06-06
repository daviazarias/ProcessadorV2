module decodificador(
    input      [2:0] chave,
    output reg [7:0] saida
);

always @(chave) begin
    saida        = 8'h00;
    saida[chave] = 1'b1;
end

endmodule