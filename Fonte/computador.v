`include "processador.v"
`include "memoria_de_instrucoes.v"

module computador(
    input         clock,
    input         resetn,
    input         mem_wr,
    input  [15:0] mem_in,
    input  [15:0] endereco_ext,
    output [15:0] bus
);

wire [15:0] endereco;
wire [15:0] endereco_proc;
wire [15:0] iin;

processador p(clock, resetn, iin, bus, endereco_proc);
memoria_de_instrucoes mem(clock, mem_wr, endereco, mem_in, iin);

assign endereco = (mem_wr) ? endereco_ext : endereco_proc;

endmodule

