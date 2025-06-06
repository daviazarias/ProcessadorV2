`include "extensor.v"
module testeExtensor;

reg [15:0] iin = 16'h0000;
wire [15:0] imm;

extensor e(iin,imm);

initial $dumpfile("testeExtensor.vcd");
initial $dumpvars(0,testeExtensor);

initial begin
    #3 iin <= 16'h00ff;
    #3 iin <= 16'h01ff;
    #3 iin <= 16'h02ff;
    #3 iin <= 16'h03ff;
    #3 iin <= 16'h0fff;
    #3 $finish;
end

endmodule