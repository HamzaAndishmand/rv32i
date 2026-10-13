def main():
    with open("Instructions.txt") as instructions:
        for instr in instructions:
            instr = instr.strip()

            opcode = instr[25:32]

            if opcode == "0110011":
                funct7 = instr[0:7]
                rs2 = instr[7:12]
                rs1 = instr[12:17]
                funct3 = instr[17:20]
                rd = instr[20:25]

            print(instr)
            print(f"{opcode} {rd} {funct3} {rs1} {rs2} {funct7}")
    print(" ")


main()
