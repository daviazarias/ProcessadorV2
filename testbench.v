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
    # 0 iin =  16'b101_000_0000011100;
    # 8 iin =  16'b101_001_0000001010;
    # 8 iin =  16'b001_000_001_0000000;
    # 8 iin =  16'b100_000_000_0000000;
    # 8 $finish;
end
endmodule