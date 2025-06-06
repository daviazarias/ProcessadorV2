`include "registrador.v"
module testeRegistrador;

reg clock = 0;

reg r0Enable = 0;
reg [15:0] r0in = 16'h0000;
wire [15:0] r0out;

always #1 clock <= !clock;

initial $dumpfile("testeRegistrador.vcd");
initial $dumpvars(0,testeRegistrador);

registrador r0(r0Enable,clock,r0in,r0out);

initial begin
    #3 
    r0Enable <= 1;
    r0in <= 16'h56ab;
    #1 
    r0Enable <= 0;
    r0in <= 16'h0bff;
    #1 r0Enable <= 1;
    #1 r0Enable <= 0;
    #3 r0in <= 16'h98a3;
    #3 r0Enable <= 1;
    #3 
    r0in <= 16'h5555;
    r0Enable <= 0;
    #2 $finish;
end

endmodule