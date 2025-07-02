module contador_de_programa(
    input             wr_enable,
    input      [15:0] pc_in,
    input             resetn,
    input             clock,
    output reg [15:0] pc_out
);

always @ (negedge resetn)
    pc_out <= 16'h0000;

always @ (posedge clock)
    if(wr_enable)
        pc_out <= pc_in;

endmodule