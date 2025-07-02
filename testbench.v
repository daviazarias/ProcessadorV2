`include "computador.v"
module testbench;

reg clock  = 1;
reg resetn = 1;
reg mem_wr = 1;
reg  [15:0] endereco_ext = 0;
reg  [15:0] iin;
wire [15:0] bus;

always #1 clock = !clock;
always #2 endereco_ext = endereco_ext + 16'h0001;

initial $dumpfile("testbench.vcd");
initial $dumpvars(0,testbench);

computador c(clock, resetn, mem_wr, iin, endereco_ext, bus);

initial begin
    # 0 iin = 16'b101_000_1111111101;
    # 2 iin = 16'b101_001_0000000001;
    # 2 iin = 16'b010_000_000_0000000;
    # 2 iin = 16'b000_000_001_0000000;
    # 2 iin = 16'b100_000_000_0000000;
    # 2 iin = 16'b011_000_0000000000;

    # 2 mem_wr <= 1'b0;
    # 1 resetn <= 1'b0;
end
endmodule
