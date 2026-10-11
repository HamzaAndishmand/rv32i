module Branch(
	input logic [31:0] result,
	input logic [2:0] funct3,
	input logic branch,
	input logic [31:0] rs1, rs2,
	output logic branch_taken 
	);
	always_comb begin
		case(funct3)
			3'b000: begin
				branch_taken = (32'd0 == result) ? 1:0;
			end
			3'b001: begin
				branch_taken = (32'd0 == result) ? 0:1;
			end
			3'b100: begin
				branch_taken = (32'd1 == result) ? 1:0;
			end
			3'b101: begin
				branch_taken = ($signed(rs1) >= $signed(rs2)) ? 1:0;
			end
			3'b110: begin
				branch_taken = (32'd1 == result) ? 1:0;
			end
			3'b111: begin
				branch_taken = (rs1 >= rs2) ? 1:0;
			end
			default:
				branch_taken = (branch) ? 1:0;
		endcase
	end
endmodule
