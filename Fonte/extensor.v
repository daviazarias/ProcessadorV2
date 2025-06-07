module extensor(
    input  [9:0] iin,
    output [15:0] imediato
);

assign imediato[9:0] = iin;
assign imediato[15:10] = {6{iin[9]}};

endmodule;