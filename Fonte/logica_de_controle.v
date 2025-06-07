`include "decodificador.v"

module logica_de_controle(
    input            resetn,
    input      [1:0] counter,
    input      [8:0] iin,
    output reg [3:0] mux_select,
    output     [7:0] regs_enable,
    output     [1:0] alu_op_select,
    output           reg_a_enable,
    output           alu_output_enable,
    output           clear
);

`define REP 3'b111
`define LDI 3'b101
`define ADD 3'b000
`define SUB 3'b001
`define NAN 3'b010
`define OUT 3'b100

`define IMM_SELECT 4'b1000 
`define R_SELECT   4'b1001

reg [2:0] opcode, rx, ry;

wire [7:0] regs_select;
decodificador decode(rx, regs_select);

assign reg_a_enable      = (counter == 2'b01); 
assign alu_output_enable = (counter == 2'b10);
assign regs_enable       = (counter == 2'b11 && opcode != `OUT) ? regs_select : 8'h00;
assign alu_op_select     = (!opcode[2]) ? opcode[1:0] : 2'b11;
assign clear             = resetn;

always @(counter, resetn)
begin
    case(counter)

        2'b00: begin
            opcode <= iin[8:6];
            rx     <= iin[5:3];
            ry     <= iin[2:0];
        end

        2'b01: mux_select <= {1'b0, rx};

        2'b10: mux_select <= {1'b0, ry};

        2'b11: begin

            case(opcode)
                `REP:    mux_select <= {1'b0, ry};
                `LDI:    mux_select <= `IMM_SELECT;
                default: mux_select <= `R_SELECT;
            endcase

        end

    endcase
end

endmodule