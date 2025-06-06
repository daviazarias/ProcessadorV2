`include "decodificador.v"
module testeDecodificador;

reg  [2:0] chave = 3'b000;
wire [7:0] saida;

initial $dumpfile("testeDecodificador.vcd");
initial $dumpvars(0,testeDecodificador);

decodificador decode(chave,saida);

initial begin
    #5  chave <= 3'b001;
    #5  chave <= 3'b101;
    #5  chave <= 3'b110;
    #5  chave <= 3'b000;
    #5  chave <= 3'b001;
    #5  chave <= 3'b011;
    #5  chave <= 3'b111;
    #5  chave <= 3'b000;
    #5  chave <= 3'b011;
    #5  chave <= 3'b010;
    #20 $finish;
end

endmodule