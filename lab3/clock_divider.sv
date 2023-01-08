module clock_divider(
 input clk_in,
 output clk_out
 );

logic [27:0] count = 0;
logic clk_NoBuf;
always@ (posedge clk_in) begin
count <= count + 1;
if(count > 236869999)
    count <= 0;
end

assign clk_NoBuf = count[27];
BUFG BUFG_inst (
 .I(clk_NoBuf), // 1-bit input: Clock input
 .O(clk_out) // 1-bit output: Clock output
);
endmodule