`include "registrador.v"
`include "logica_de_controle.v"
`include "contador.v"
`include "extensor.v"

module processador(
    input clock,
    input resetn,
    input  [15:0] iin,
    output [15:0] bus
);

wire [2:0] reg_address;
wire [7:0] regs_enable;
wire [1:0] alu_op_select;
wire [1:0] saida_contador;
wire [15:0] data_bus, imm, reg_a_out, alu_out;
wire [15:0] r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out;

contador cont(clock, clear, saida_contador);
extensor ext(iin[9:0], imm);
logica_de_controle log_ctl(resetn, saida_contador, iin[15:7],
    reg_address, regs_enable, alu_op_select, reg_a_enable, imm_select,
    alu_output_enable, alu_output_select, clear);

registrador r0(regs_enable[0],clock,data_bus,r0_out);
registrador r1(regs_enable[1],clock,data_bus,r1_out);
registrador r2(regs_enable[2],clock,data_bus,r2_out);
registrador r3(regs_enable[3],clock,data_bus,r3_out);
registrador r4(regs_enable[4],clock,data_bus,r4_out);
registrador r5(regs_enable[5],clock,data_bus,r5_out);
registrador r6(regs_enable[6],clock,data_bus,r6_out);
registrador r7(regs_enable[7],clock,data_bus,r7_out);
registrador a(reg_a_enable,clock,data_bus,reg_a_out);
registrador r(alu_output_enable,clock,data_bus,alu_out);

assign bus = data_bus;

endmodule;