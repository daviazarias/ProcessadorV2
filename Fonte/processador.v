`include "registrador.v"
`include "logica_de_controle.v"
`include "multiplexador.v"
`include "contador.v"
`include "extensor.v"
`include "ula.v"

module processador(
    input         clock,
    input         resetn,
    input  [15:0] iin,
    output [15:0] bus
);

wire [3:0]  mux_select;
wire [7:0]  regs_enable;
wire [1:0]  alu_op_select;
wire [1:0]  saida_contador;
wire [15:0] imm, a_reg_out, alu_out, alu_reg_out;
wire [15:0] r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out;

contador cont(clock, clear, saida_contador);

extensor ext(iin[9:0], imm);

ula alu(a_reg_out, bus, alu_op_select, alu_out);

multiplexador mux(mux_select, imm, r0_out, r1_out, r2_out, r3_out, 
    r4_out, r5_out,r6_out, r7_out, alu_reg_out, bus);

logica_de_controle log_ctl(resetn, saida_contador, iin[15:7], mux_select,
    regs_enable, alu_op_select, a_reg_enable, alu_reg_enable,clear);

registrador r0(regs_enable[0], clock, bus, r0_out);
registrador r1(regs_enable[1], clock, bus, r1_out);
registrador r2(regs_enable[2], clock, bus, r2_out);
registrador r3(regs_enable[3], clock, bus, r3_out);
registrador r4(regs_enable[4], clock, bus, r4_out);
registrador r5(regs_enable[5], clock, bus, r5_out);
registrador r6(regs_enable[6], clock, bus, r6_out);
registrador r7(regs_enable[7], clock, bus, r7_out);
registrador a(a_reg_enable, clock, bus, a_reg_out);
registrador r(alu_reg_enable, clock, alu_out, alu_reg_out);

endmodule;