def bits(instr, upper, lower):
    return instr[31 - upper : 32 - lower]


def main():
    with open("Instructions.txt") as instructions:
        for instr in instructions:
            instr = instr.strip()

            opcode = bits(instr, 6, 0)
            if opcode == "0110011":
                funct7 = bits(instr, 31, 25)
                rs2 = bits(instr, 24, 20)
                rs1 = bits(instr, 19, 15)
                funct3 = bits(instr, 14, 12)
                rd = bits(instr, 11, 7)

            print(instr)
            print(f"{opcode} {rd} {funct3} {rs1} {rs2} {funct7}")
    print(" ")


main()
