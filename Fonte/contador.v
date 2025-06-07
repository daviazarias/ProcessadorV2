module contador(
    input clock,
    input clear,
    output reg [1:0] saida_cont);

always @(clear)
begin
    saida_cont <= 2'b00;
end

always @(posedge clock)
begin
    saida_cont <= saida_cont + 2'b01;
end

endmodule