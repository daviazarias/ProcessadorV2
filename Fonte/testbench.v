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
    # 0 iin =  16'b1010000000011100;
    # 8 iin =  16'b1010010000001010;
    # 8 iin =  16'b0010000010000000;
    # 8 iin =  16'b1000010000000000;
    # 8 $finish;
end
endmodule