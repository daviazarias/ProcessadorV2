module memoria_de_instrucoes(
    input         clock,
    input         wr_enable,
    input  [15:0] endereco,
    input  [15:0] data_in,
    output [15:0] data_out
);

reg [15:0] mem_inst [0:65535];

assign data_out = mem_inst[endereco];

always @ (clock)
    if(wr_enable)
        mem_inst[endereco] = data_in;

endmodule;