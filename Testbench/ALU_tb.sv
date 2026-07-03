`include "Components/ALU.sv/"
module ALU_tb();
	logic [31:0] inputA, inputB;
	logic [3:0] control;
	logic [31:0] result;
	logic [3:0] status;

	ALU dut(
		.A(inputA),
		.B(inputB),
		.control(control),
		.result(result),
		.status(status)
		);

	initial begin
		inputA = 12;
		inputB = 10;
		control = 0;
		#5
		
		$display("Result: %d", result);
	$finish;
	end
endmodule
	

