module contador(
    input clock,
    input clear,
    output reg [1:0] saida_cont);

always @(clear)
    saida_cont <= 2'b00;

always @(posedge clock)
    saida_cont <= saida_cont + 2'b01;


endmodule