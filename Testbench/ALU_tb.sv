`include "Modules/ALU.sv"
module ALU_tb();
	logic [31:0] srcA, srcB;
	logic [3:0] control;
	logic [31:0] result;
	logic [3:0] status;
	logic [31:0] expected;

	ALU dut(
		.A(srcA),
		.B(srcB),
		.control(control),
		.result(result),
		.status(status)
		);

	initial begin

		control = AND;

		srcA[31:0] = $urandom;
		srcB[31:0] = $urandom;
		#10;

		$display("Control is: %d", control);
		expected = srcA & srcB;

		if (expected !== result) begin
			$error("Failed at srcA=%d, srcB=%d, and control=%d", srcA, srcB, control);
		end
		else begin
			$display("Passed");
		end
		$display("Your answer was: %d", expected);	
		$display("Real answer was: %d", result);
	end
endmodule
