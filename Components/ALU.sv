module ALU(input [31:0] A, B,
					input [3:0] control,
					output reg [31:0] result,
					output reg [3:0] status);
	always@(*)
	begin
		status = 4'b0000;

		case(control)
			4'b0000:
				result = A & B;
			4'b0001:
				result = A | B;
			4'b0010:
				result = A ^ B;
			4'b0011:
				result = ~A;
			4'b0100:
				result = A << 1;
			4'b0101:
				result = A >> 1;
			4'b0110:
				result = ~(A | B); 
			4'b0111:
				result = ~(A & B);
			4'b1000:
				result = ~(A ^ B);
			4'b1001:
				result = (A > B) ? 32'd1 : 32'd0;
			4'b1010:
				result = (A == B) ? 32'd1 : 32'd0;
			4'b1011:
				result = A + B;
			4'b1100:
				result = A - B;
			4'b1101:
				result = A * B;
			4'b1110:
				result = A / B;
			4'b1111:
				result = 32'd0;
			default result = 32'd1;
		endcase
	end
endmodule
		
