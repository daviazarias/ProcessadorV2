`include "processador.v"
module testbench;

reg clock = 0;
reg resetn = 1;
reg  [15:0] iin;
wire [15:0] bus;

always #1 clock = !clock;

initial $dumpfile("testbench.vcd");
initial $dumpvars(0,testbench);

processador p(clock, resetn, iin, bus);

initial begin
    # 0 resetn <= 1'b0;
    # 0 iin = 16'b101_100_1111110000;
    # 8 iin = 16'b101_101_0011111111;
    # 8 iin = 16'b010_100_101_0000000;
    # 8 iin = 16'b010_100_100_0000000;
    # 8 iin = 16'b100_100_000_0000000;
    # 8 $finish;
end
endmodule