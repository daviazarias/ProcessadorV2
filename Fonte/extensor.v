module extensor(iin,imediato);

input  [15:0] iin;
output [15:0] imediato;

assign imediato[9:0] = iin[9:0];
assign imediato[15:10] = {6{iin[9]}};

endmodule;