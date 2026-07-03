`include "Components/mux.sv"
module mux_tb();
	logic [31:0] register_32 [31:0];
	logic [31:0] rs;
	logic [4:0] sel;

	mux dut(
		.register_32(register_32),
		.rs(rs),
		.sel(sel)
	);
	
	initial begin
		register_32[1] = 1;
		register_32[0] = 3;
		sel = 0;
		#5

		$display("Value at register: %d", rs);
	$finish;
end
endmodule
