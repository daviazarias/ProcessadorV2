module registrador(
    input wr_enable,
    input clock,
    input [15:0] entrada_reg,
    output reg [15:0] saida_reg
);

always @(posedge clock)
begin
    if(wr_enable)
        saida_reg <= entrada_reg;
end

endmodule