// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VALU.h for the primary calling header

#include "VALU__pch.h"

void VALU___024root___eval_triggers_vec__ico(VALU___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU___024root___eval_triggers_vec__ico\n"); );
    VALU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VicoTriggered[0U] = ((0xfffffffffffffffeULL 
                                      & vlSelfRef.__VicoTriggered[0U]) 
                                     | (IData)((IData)(vlSelfRef.__VicoFirstIteration)));
}

bool VALU___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU___024root___trigger_anySet__ico\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void VALU___024root___ico_sequent__TOP__0(VALU___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU___024root___ico_sequent__TOP__0\n"); );
    VALU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VdfgRegularize_h6e95ff9d_0_0;
    __VdfgRegularize_h6e95ff9d_0_0 = 0;
    IData/*31:0*/ __VdfgRegularize_h6e95ff9d_0_1;
    __VdfgRegularize_h6e95ff9d_0_1 = 0;
    IData/*31:0*/ __VdfgRegularize_h6e95ff9d_0_2;
    __VdfgRegularize_h6e95ff9d_0_2 = 0;
    // Body
    __VdfgRegularize_h6e95ff9d_0_0 = (vlSelfRef.A ^ vlSelfRef.B);
    __VdfgRegularize_h6e95ff9d_0_1 = (vlSelfRef.A & vlSelfRef.B);
    __VdfgRegularize_h6e95ff9d_0_2 = (vlSelfRef.A | vlSelfRef.B);
    vlSelfRef.result = ((8U & (IData)(vlSelfRef.control))
                         ? ((4U & (IData)(vlSelfRef.control))
                             ? ((2U & (IData)(vlSelfRef.control))
                                 ? (VL_DIV_III(32, vlSelfRef.A, vlSelfRef.B) 
                                    & (- (IData)((1U 
                                                  & (~ (IData)(vlSelfRef.control))))))
                                 : ((1U & (IData)(vlSelfRef.control))
                                     ? (vlSelfRef.A 
                                        * vlSelfRef.B)
                                     : (vlSelfRef.A 
                                        - vlSelfRef.B)))
                             : ((2U & (IData)(vlSelfRef.control))
                                 ? ((1U & (IData)(vlSelfRef.control))
                                     ? (vlSelfRef.A 
                                        + vlSelfRef.B)
                                     : (1U & (- (IData)(
                                                        (vlSelfRef.A 
                                                         == vlSelfRef.B)))))
                                 : ((1U & (IData)(vlSelfRef.control))
                                     ? (1U & (- (IData)(
                                                        (vlSelfRef.A 
                                                         > vlSelfRef.B))))
                                     : (~ __VdfgRegularize_h6e95ff9d_0_0))))
                         : ((4U & (IData)(vlSelfRef.control))
                             ? ((2U & (IData)(vlSelfRef.control))
                                 ? (~ ((1U & (IData)(vlSelfRef.control))
                                        ? __VdfgRegularize_h6e95ff9d_0_1
                                        : __VdfgRegularize_h6e95ff9d_0_2))
                                 : ((1U & (IData)(vlSelfRef.control))
                                     ? VL_SHIFTR_III(32,32,32, vlSelfRef.A, 1U)
                                     : VL_SHIFTL_III(32,32,32, vlSelfRef.A, 1U)))
                             : ((2U & (IData)(vlSelfRef.control))
                                 ? ((1U & (IData)(vlSelfRef.control))
                                     ? (~ vlSelfRef.A)
                                     : __VdfgRegularize_h6e95ff9d_0_0)
                                 : ((1U & (IData)(vlSelfRef.control))
                                     ? __VdfgRegularize_h6e95ff9d_0_2
                                     : __VdfgRegularize_h6e95ff9d_0_1))));
}

void VALU___024root___eval_ico(VALU___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU___024root___eval_ico\n"); );
    VALU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VicoTriggered[0U])) {
        VALU___024root___ico_sequent__TOP__0(vlSelf);
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VALU___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool VALU___024root___eval_phase__ico(VALU___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU___024root___eval_phase__ico\n"); );
    VALU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VicoExecute;
    // Body
    VALU___024root___eval_triggers_vec__ico(vlSelf);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VALU___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
    }
#endif
    __VicoExecute = VALU___024root___trigger_anySet__ico(vlSelfRef.__VicoTriggered);
    if (__VicoExecute) {
        VALU___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

void VALU___024root___eval(VALU___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU___024root___eval\n"); );
    VALU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VicoIterCount;
    // Body
    __VicoIterCount = 0U;
    vlSelfRef.__VicoFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VicoIterCount)))) {
#ifdef VL_DEBUG
            VALU___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
#endif
            VL_FATAL_MT("Components/ALU.sv", 1, "", "DIDNOTCONVERGE: Input combinational region did not converge after '--converge-limit' of 10000 tries");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        vlSelfRef.__VicoPhaseResult = VALU___024root___eval_phase__ico(vlSelf);
        vlSelfRef.__VicoFirstIteration = 0U;
    } while (vlSelfRef.__VicoPhaseResult);
}

#ifdef VL_DEBUG
void VALU___024root___eval_debug_assertions(VALU___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU___024root___eval_debug_assertions\n"); );
    VALU__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((vlSelfRef.control & 0xf0U)))) {
        Verilated::overWidthError("control");
    }
}
#endif  // VL_DEBUG
