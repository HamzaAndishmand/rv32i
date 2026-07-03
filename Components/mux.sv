module mux(
	input [4:0] sel,
	input [31:0] register_32 [31:0],
	output reg [31:0] rs);
	
	always @(*)
	begin
		rs = register_32[sel];
	end
endmodule
