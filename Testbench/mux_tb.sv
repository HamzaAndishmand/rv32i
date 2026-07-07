`include "Modules/Mux_Src_B.sv"
module mux_tb();
	logic [1:0] sel;
	logic [31:0] imm;
	logic [31:0] rs2_data;
	logic [4:0] shamt;
	logic [31:0] srcB;

	Mux_Src_B dut(
		.rs2_data(rs2_data),
		.shamt(shamt),
		.srcB(srcB),
		.imm(imm),
		.sel(sel)
	);
	
	initial begin
		rs2_data = 20;
		shamt = 3;
		imm = 232;
		sel = 1;
		#10
		if(srcB !== imm) begin
			$error("Failed");
		end
		else begin 
			$display("Pass");
	  end
	$finish;
	end
endmodule
