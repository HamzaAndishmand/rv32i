// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VALU_tb.h for the primary calling header

#ifndef VERILATED_VALU_TB___024ROOT_H_
#define VERILATED_VALU_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class VALU_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) VALU_tb___024root final {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VstlPhaseResult;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VinactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    IData/*31:0*/ ALU_tb__DOT__inputA;
    IData/*31:0*/ ALU_tb__DOT__inputB;
    IData/*31:0*/ __VdfgRegularize_h6e95ff9d_0_0;
    IData/*31:0*/ __VdfgRegularize_h6e95ff9d_0_1;
    IData/*31:0*/ __VdfgRegularize_h6e95ff9d_0_2;
    IData/*31:0*/ __VactIterCount;
    IData/*31:0*/ __VinactIterCount;
    IData/*31:0*/ __Vi;
    VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggeredAcc;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
    VlDelayScheduler __VdlySched;

    // INTERNAL VARIABLES
    VALU_tb__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    VALU_tb___024root(VALU_tb__Syms* symsp, const char* namep);
    ~VALU_tb___024root();
    VL_UNCOPYABLE(VALU_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
