module register_file(
	input logic clk,
	input logic reset,

	input logic reg_write,
	input logic [31:0] write_data,
	
	input logic [4:0] rs1, rs2, rd,

	output logic [31:0] read_data1, read_data2
	);
	
	logic [31:0] registers [31:0];

	always_comb begin
		read_data1 = (rs1 == 5'd0) ? 32'd0 : registers[rs1];
		read_data2 = (rs2 == 5'd0) ? 32'd0 : registers[rs2];
	end
	
	always_ff @(posedge clk or posedge reset) begin

		if(reset) begin
			for(int i = 0; i < 32; i++) begin
				registers[i] <= 32'd0;
			end 
		end

		else begin
			if((reg_write != 0) && (rd != 5'd0)) begin
				registers[rd] <= write_data;
			end
		end

	end

endmodule
