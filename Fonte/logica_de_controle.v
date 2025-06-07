`include "decodificador.v"

module logica_de_controle(
    input        resetn,
    input  [1:0] counter,
    input  [8:0] iin,
    output [2:0] reg_address,
    output [7:0] regs_enable,
    output [1:0] alu_op_select,
    output       reg_a_enable,
    output       imm_select,
    output       alu_reg_enable,
    output       alu_reg_select,
    output  reg  clear
);

`define REP 3'b111
`define LDI 3'b101
`define OUT 3'b100

reg  [2:0] opcode, rx, ry;
wire [7:0] regs_select;
decodificador decode(rx, regs_select);

assign reg_a_enable   = (counter == 2'b01); 
assign reg_address    = (counter == 2'b01 || opcode == `OUT) ? {1'b0, rx} : {1'b0, ry};
assign alu_reg_enable = (counter == 2'b10);
assign alu_reg_select = (counter == 2'b11 && !opcode[2]);
assign imm_select     = (counter == 2'b11 && opcode == `LDI);
assign regs_enable    = (counter == 2'b11 && opcode != `OUT) ? regs_select : 8'h00;
assign alu_op_select  = (!opcode[2]) ? opcode[1:0] : 2'b11;

always @(counter) 
begin
    if(counter == 2'b01) begin
        opcode <= iin[8:6];
        rx     <= iin[5:3];
        ry     <= iin[2:0];
    end
end

always @(negedge resetn)
begin
    clear = 1'b1;
    clear = 1'b0;
end

endmodule