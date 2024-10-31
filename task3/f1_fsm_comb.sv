module f1_fms_comb #(
	parameter WIDTH = 16
)(
    input   logic               clk,
    input   logic               rst,
    input   logic               en,
    input   logic   [WIDTH-1:0] N,
    output  logic   [7:0]       out
);

logic tick;

clktick myTicker (
    .clk(clk),
    .rst(rst),
    .en(en),
    .N(N),
    .tick(tick)
);

f1_fsm myF1_fsm (
    .clk(clk),
    .rst(rst),
    .en(tick),
    .out(out)
);

endmodule
