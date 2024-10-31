module lfsr_7 (
    input logic         clk,
    input logic         rst,
    input logic         en,
    output logic [6:0]  data_out
);

logic [6:0] sreg;   //sreg is a 7 bit long representation of the shift registers

always_ff @(posedge clk, posedge rst) begin
    if (rst)
        sreg <= 7'b1;   //reset all 1s since all 0 will make it static
    else if (en)
        sreg <= {sreg[5:0], sreg[2] ^ sreg[6]};      //XOR 3rd and 7th register, append it as input in LSB
end

assign  data_out = sreg;

endmodule
