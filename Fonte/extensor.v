module extensor(
    input             clock,
    input             wr_enable,
    input      [9:0]  iin,
    output reg [15:0] imediato
);

always @ (posedge clock)
    if(wr_enable)
        begin
            imediato[9:0]   <= iin;
            imediato[15:10] <= {6{iin[9]}};
        end

endmodule;