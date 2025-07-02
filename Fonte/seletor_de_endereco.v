module seletor_de_endereco(
    input         branch_select,
    input  [15:0] reg_teste,
    input  [15:0] imm,
    input  [15:0] pc_out,
    output [15:0] endereco
);

assign endereco = 
    (reg_teste == 16'h0000 && branch_select) 
    ? pc_out + imm 
    : pc_out + 16'h0001;

endmodule