`include "decodificador.v"

module logica_de_controle(
    input   resetn,
    input   [1:0] counter,
    input   [8:0] iin,
    output  [3:0] mux_select,
    output  [7:0] regs_enable,
    output  a_enable,
    output  alu_output_enable,
    output  [1:0] alu_op_select
);

`define REP 3'b111
`define LDI 3'b101
`define ADD 3'b000
`define SUB 3'b001
`define NAN 3'b010
`define OUT 3'b100

reg  [2:0] opcode;
reg  [2:0] rx;
reg  [2:0] ry;

wire [7:0] regs_select;
decodificador decode(rx, regs_select);

assign a_enable          = (counter == 2'b01); 
assign alu_output_enable = (counter == 2'b10);
assign regs_enable       = (counter == 2'b11 && opcode != `OUT) ? regs_select : 8'h00;

always @(counter, resetn)
begin
    case(counter)
        2'b00: begin
            opcode <= iin[8:6];
            rx <= iin[5:3];
            ry <= iin[2:0];
        end

        2'b01: begin

        end

        2'b10: begin

        end

        2'b11: begin
        end

    endcase
end

endmodule