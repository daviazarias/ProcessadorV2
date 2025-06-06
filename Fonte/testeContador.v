`include "contador.v"
module testeContador;

reg clock = 0;
reg clear = 0;
wire [1:0] out;

always #1 clock <= !clock;

initial $dumpfile("testeContador.vcd");
initial $dumpvars(0,testeContador);

contador c(clock,clear,out);

initial begin
    #5 clear <= 1;
    #1 clear <= 0;
    #13 clear <= 1;
    #16 clear <= 0;
    #20 $finish;
end

endmodule