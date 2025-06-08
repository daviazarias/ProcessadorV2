`include "decodificador.v"

module logica_de_controle(
    input            resetn,
    input      [1:0] counter,
    input      [8:0] iin,
    output reg [3:0] mux_select,
    output     [7:0] regs_enable,
    output     [1:0] alu_op_select,
    output           a_reg_enable,
    output           alu_reg_enable,
    output reg       clear
);

`define REP 3'b111
`define ADD 3'b000 
`define SUB 3'b001 
`define NAN 3'b010
`define LDI 3'b101
`define OUT 3'b100

`define ALU_OPERATION (opcode == `ADD || opcode == `SUB || opcode == `NAN)
`define RX_SELECT      {1'b0,rx}
`define RY_SELECT      {1'b0,ry}
`define IMM_SELECT      4'b1000 
`define ALU_OUT_SELECT  4'b1001 
`define NO_OUTPUT       4'b1111
`define NO_OP            2'b11

reg  [2:0] opcode, rx, ry;
wire [7:0] regs_select;
decodificador dec(rx, regs_select);

// Habilita a escrita no registrador de entrada da ULA.
assign a_reg_enable   = (counter == 2'b01 && `ALU_OPERATION); 

// Habilita a escrita no regitrador de saída da ULA.
assign alu_reg_enable = (counter == 2'b10 && `ALU_OPERATION);

// Determina qual operação deve ser realizada pela ULA.
assign alu_op_select  = (`ALU_OPERATION) ? opcode[1:0] : `NO_OP;

// Cada elemento desse array de 8 bits é ligado ao campo 
// 'wr_enable' de um dos 8 registradores endereçáveis.
assign regs_enable    = (counter == 2'b11 && opcode != `OUT) ? regs_select : 8'h00;

always @(counter) 
begin
    case(counter)

        2'b00: 
            mux_select <= `NO_OUTPUT;

        2'b01: 
            begin
                opcode = iin[8:6];
                rx     = iin[5:3];
                ry     = iin[2:0];

                if(`ALU_OPERATION)
                    mux_select <= `RX_SELECT;
            end

        2'b10: 
            if(`ALU_OPERATION)
                mux_select <= `RY_SELECT;

        2'b11: 
            case(opcode)
                `OUT   : mux_select <= `RX_SELECT;
                `REP   : mux_select <= `RY_SELECT;
                `LDI   : mux_select <= `IMM_SELECT;
                default: mux_select <= `ALU_OUT_SELECT;
            endcase

    endcase
end

always @(negedge resetn)
begin
    clear = 1'b1;
    clear = 1'b0;
end

endmodule