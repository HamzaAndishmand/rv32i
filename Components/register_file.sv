module register_file(
	input logic clk,
	input logic reset,
	input logic reg_write,
	input logic write_data,
	
	input logic [4:0] rs1, rs2, rd,

	output logic [31:0] read1, read2
	);

	logic [31:0] registers [31:0];

	always_comb begin
	end
	
	always_ff @(posedge clk or posedge reset) begin

		if(reset) begin
		end

		else begin
		end

	end

endmodule
