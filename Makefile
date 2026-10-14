VERILATOR = verilator
SV_SOURCES = isa_defs_pkg/defs_pkg.sv Modules/ALU.sv
OBJ_DIR = obj_dir
YOSYS = yosys
SYNTH_DIR = synth
SYNTH_PKG = isa_defs_pkg/defs_pkg.sv
SYNTH_RTL = $(wildcard Modules/*.sv)
SYNTH_PREP = read_verilog -sv $(SYNTH_PKG); \
	     read_verilog -sv $(SYNTH_RTL); \
	     blackbox Instruction_Memory Memory; \
	     setattr -set keep 1 top/u_Instruction_Memory top/u_Memory

NEXTPNR ?= $(if $(wildcard oss-cad-suite/bin/nextpnr-ice40),oss-cad-suite/bin/nextpnr-ice40,nextpnr-ice40)
PNR_DEVICE = --hx8k --package ct256
PNR_FREQ = 25
SEED ?= 1
PNR_PREP = read_verilog -sv $(SYNTH_PKG); \
           read_verilog -sv $(SYNTH_RTL); \
           hierarchy -top top; \
           delete top/u_Instruction_Memory top/u_Memory; \
           expose -input top/w:instruction top/w:mem_rdata; \
	   expose top/w:current_pc top/w:mem_addr top/w:mem_wdata \
	          top/w:mem_write top/w:mem_read top/w:mem_wmask

.PHONY: sim_verilator synth synth_ice40 synth_xilinx pnr_ice40 clean

sim_verilator:
	mkdir -p $(OBJ_DIR)/sv_only
	$(VERILATOR) --binary --timing --sv \
		--top-module ALU_tb \
		$(SV_SOURCES) Testbench/ALU_tb.sv \
		--Mdir $(OBJ_DIR)/sv_only
	./$(OBJ_DIR)/sv_only/VALU_tb

synth:	synth_ice40 synth_xilinx

synth_ice40:
	mkdir -p $(SYNTH_DIR)
	$(YOSYS) -q -l $(SYNTH_DIR)/ice40.log \
    		-p "$(SYNTH_PREP); synth_ice40 -top top; tee -o $(SYNTH_DIR)/ice40_stat.txt stat"
	@sed -n '/=== top ===/,$$p' $(SYNTH_DIR)/ice40_stat.txt | grep -E 'cells|SB_'

synth_xilinx:
	mkdir -p $(SYNTH_DIR)
	$(YOSYS) -q -l $(SYNTH_DIR)/xilinx.log \
		-p "$(SYNTH_PREP); synth_xilinx -flatten -top top; tee -o $(SYNTH_DIR)/xilinx_stat.txt stat"
	@sed -n '/=== top ===/,$$p' $(SYNTH_DIR)/xilinx_stat.txt | grep -E 'cells|LUT|FD|CARRY|MUXF|RAM|DSP'

pnr_ice40:
	mkdir -p $(SYNTH_DIR)
	$(YOSYS) -q -l $(SYNTH_DIR)/ice40_pnr_synth.log \
		-p "$(PNR_PREP); synth_ice40 -top top -json $(SYNTH_DIR)/ice40_pnr.json"
	$(NEXTPNR) $(PNR_DEVICE) --json $(SYNTH_DIR)/ice40_pnr.json \
		--pcf-allow-unconstrained --freq $(PNR_FREQ) --timing-allow-fail \
		--seed $(SEED) -q -l $(SYNTH_DIR)/ice40_pnr.log
	@grep -E 'ICESTORM_LC:' $(SYNTH_DIR)/ice40_pnr.log | tail -1
	@grep -E 'Max frequency|Max delay' $(SYNTH_DIR)/ice40_pnr.log | tail -4

clean:
	rm -rf $(OBJ_DIR) $(SYNTH_DIR)
