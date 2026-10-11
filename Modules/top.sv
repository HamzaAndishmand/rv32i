module top(
	input logic clk,
	input logic reset
	);
	logic [31:0] current_pc;
	logic [31:0] next_pc;
	logic jump;
	logic branch_taken;
	logic [31:0] imm;
	logic [31:0] instruction;
	logic [6:0] op;
	logic [6:0] funct7;
	logic [2:0] funct3;
	logic [4:0] rs1;
	logic [4:0] rs2;
	logic [4:0] rd;
	logic reg_write;
	logic mem_read;
	logic mem_write;
	logic [1:0] srcB_sel;
	logic [1:0] result_sel;
	logic branch;
	logic srcA_sel;
	logic [31:0] rs1_data;
	logic [31:0] rs2_data;
	logic [31:0] write_data;
	logic [31:0] srcA;
	logic [31:0] srcB;
	logic [3:0] ALU_op;
	logic [31:0] alu_result;
	logic [31:0] mem_addr;
	logic [31:0] mem_rdata;
	logic [31:0] mem_wdata;
	logic [3:0] mem_wmask;
	logic [31:0] load_data;

	pc u_pc(
		.clk(clk),
		.reset(reset),
		.next_pc(next_pc),
		.current_pc(current_pc)
		);

	Next_PC u_Next_PC(
		.current_pc(current_pc),
		.next_pc(next_pc),
		.jump(jump),
		.imm(imm),
		.address(alu_result),
		.branch_taken(branch_taken)
		);

	Instruction_Memory u_Instruction_Memory(
		.instruction(instruction),
		.pc(current_pc)
		);

	Instruction_Decoder u_Instruction_Decoder(
		.Instruction(instruction),
		.op(op),
		.rs1(rs1),
		.rs2(rs2),
		.funct7(funct7),
		.funct3(funct3),
		.rd(rd)
		);

	Control_Unit u_Control_Unit(
		.op(op),
		.reg_write(reg_write),
		.branch(branch),
		.read(mem_read),
		.mem_write(mem_write),
		.result_sel(result_sel),
		.srcB_sel(srcB_sel),
		.jump(jump),
		.srcA_sel(srcA_sel)
		);

	Immediate_Gen u_Immediate_Gen(
		.Instruction(instruction),
		.imm_out(imm)
		);

	register_file u_register_file(
		.clk(clk),
		.reset(reset),
		.reg_write(reg_write),
		.write_data(write_data),
		.rs1(rs1),
		.rs2(rs2),
		.rd(rd),
		.read_data1(rs1_data),
		.read_data2(rs2_data)
		);

	Mux_Src_A u_Mux_Src_A(
		.sel(srcA_sel),
		.rs1_data(rs1_data),
		.PC(current_pc),
		.srcA(srcA)
		);

	Mux_Src_B u_Mux_Src_B(
		.sel(srcB_sel),
		.imm(imm),
		.rs2_data(rs2_data),
		.shamt(instruction[24:20]),
		.srcB(srcB)
		);

	ALU_Control u_ALU_Control(
		.opcode(op),
		.funct7(funct7),
		.funct3(funct3),
		.ALU_op(ALU_op)
		);

	ALU u_ALU(
		.A(srcA),
		.B(srcB),
		.control(ALU_op),
		.result(alu_result)
		);

	Branch u_Branch(
		.result(alu_result),
		.funct3(funct3),
		.branch(branch),
		.rs1(rs1_data),
		.rs2(rs2_data),
		.branch_taken(branch_taken)
		);

	Load_Store u_Load_Store(
		.alu_result(alu_result),
		.funct3(funct3),
		.mem_rdata(mem_rdata),
		.rs2_data(rs2_data),
		.mem_addr(mem_addr),
		.load_data(load_data),
		.mem_wdata(mem_wdata),
		.mem_wmask(mem_wmask)
		);

	Memory u_Memory(
		.clk(clk),
		.address(mem_addr),
		.wd(mem_wdata),
		.write(mem_write),
		.read(mem_read),
		.wm(mem_wmask),
		.rd(mem_rdata)
		);

	Mux_WB u_Mux_WB(
		.sel(result_sel),
		.alu_result(alu_result),
		.load_data(load_data),
		.current_pc(current_pc),
		.wd(write_data)
		);
endmodule
