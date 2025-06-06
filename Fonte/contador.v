module contador(clock,clear,saida_cont);

input clock;
input clear;
output reg [1:0] saida_cont;

always @(posedge clock)
begin
    if(clear)
        saida_cont <= 2'b00;
    else 
        saida_cont <= saida_cont + 2'b01;
end

endmodule