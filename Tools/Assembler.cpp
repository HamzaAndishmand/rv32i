#include <string>
#include <map>
#include <fstream>
#include <sstream>
#include <iostream>
#include <bitset>
using namespace std;

struct TypeCode {
    string funct7;
    string funct3;
	string opcode;
};

map<string, TypeCode> instructionTable = {
    {"add",  {"0000000", "000", "0110011"}},
    {"sub",  {"0100000", "000", "0110011"}},
    {"sll",  {"0000000", "001", "0110011"}},
    {"slt",  {"0000000", "010", "0110011"}},
    {"sltu", {"0000000", "011", "0110011"}},
    {"xor",  {"0000000", "100", "0110011"}},
    {"srl",  {"0000000", "101", "0110011"}},
    {"sra",  {"0100000", "101", "0110011"}},
    {"or",   {"0000000", "110", "0110011"}},
    {"and",  {"0000000", "111", "0110011"}}
};

int main(int argc, char** argv) {
    ifstream Assembly("Instructions.s");
    ofstream Binary("Instructions.bin");

    string line, mnemonic, f3, f7, op;

    while (getline(Assembly, line) && Assembly.is_open()) {
        for (char &c : line) {
            if (c == ','){ 
				c = ' ';
			}
		}
		stringstream ss(line);
		ss >> mnemonic;
		auto iter = instructionTable.find(mnemonic);
		
		if (iter != instructionTable.end()) {
			TypeCode code = iter->second;
			f3 = code.funct3;
			f7 = code.funct7;
			op = code.opcode;
		}
		for (char &c : line) {
         	if (!isdigit(c)){ 
				c = ' ';
			}
		}

		ss.clear();
		ss.str(line);

		int i = 0;
		int reg;
		bitset<5> rd, rs1, rs2;
		while (ss >> reg) {
			if (i == 0){
				rd = bitset<5> (reg);
				cout << reg;
			}
			else if (i == 1) {
				rs1 = bitset<5> (reg);
				cout << reg;
			}
			else {
				rs2 = bitset<5> (reg);
				cout << reg;
			}
			i = i + 1;
		}

		Binary << f7;
		Binary << rs2;
		Binary << rs1;
		Binary << f3;
		Binary << rd;
		Binary << op;
		Binary << "\n";
	}

	Assembly.close();
	Binary.close();
	return 0;
}

