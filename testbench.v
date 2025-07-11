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
    # 0 iin = 16'b101_000_0000000000;  // ldi r0 #0
    # 2 iin = 16'b101_001_0000000001;  // ldi r1 #1
    # 2 iin = 16'b101_010_0000000101;  // ldi r2 #5
    # 2 iin = 16'b101_011_0000000011;  // ldi r3 #3
    # 2 iin = 16'b101_100_0000000000;  // ldi r4 #0

    # 2 iin = 16'b110_011_0000000100;  // bez r3 #4
    # 2 iin = 16'b000_100_010_xxxxxxx; // add r4, r2
    # 2 iin = 16'b001_011_001_xxxxxxx; // sub r3 r1
    # 2 iin = 16'b110_000_1111111101;  // bez r0 #-3

    # 2 iin = 16'b100_100_xxxxxxxxxx;  // out r4
    # 2 iin = 16'b011_xxx_xxxxxxxxxx;  // hlt

    # 2 mem_wr <= 1'b0;
    # 1 resetn <= 1'b0;
end
endmodule
