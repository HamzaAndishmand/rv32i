module Branch(
	input logic [31:0] result,
	input logic [2:0] funct3,
	input logic branch,
	output branch_taken 
	);
	always_comb begin
		case(funct3)
			3'b000: begin
			end
			3'b001: begin
			end
			3'b100: begin
			end
			3'b101: begin
			end
			3'b110: begin
			end
			3'b111: begin
			end
		endcase
	end
endmodule
