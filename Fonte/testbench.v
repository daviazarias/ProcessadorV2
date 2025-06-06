`include "logica_de_controle.v"
`include "contador.v"
module testbench;

reg clock = 0;
reg [15:0] iin;
reg resetn = 1;
wire [3:0] mux_key;
wire [15:0] bus;
wire [1:0] counter;
output  [7:0] regs_enable;
output  a_enable;
output  alu_output_enable;
output  [1:0] alu_op_selec;

always #1 clock = !clock;

initial $dumpfile("testbench.vcd");
initial $dumpvars(0,testbench);

contador c(clock,resetn,counter);
logica_de_controle l(resetn,counter,iin[15:7],mux_key,regs_enable,a_enable,alu_output_enable,alu_op_selec);

initial begin
    # 2 resetn = 1'b0;
    # 8 iin = 16'b1010000000011100;
    # 8 iin = 16'b1010010000001010;
    # 8 iin = 16'b0010000010000000;
    # 8 iin = 16'b1000000000000000;
    # 8 $finish;
end
endmodule