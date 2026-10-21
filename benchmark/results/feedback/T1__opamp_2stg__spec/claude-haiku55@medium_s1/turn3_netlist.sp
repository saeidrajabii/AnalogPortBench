.subckt dut iref inp inn out
* Bias: stacked diode reference. iref is the top diode (about 2 Vgs above ground),
* vb4 is the bottom diode (about 1 Vgs above ground).
XMN3 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascode gate bias from a resistive divider (about 0.6 V, 0.6 uA)
RB1 vdd vbp 2meg
RB2 vbp 0 1meg
CB vbp 0 10p
* Tail current source, 2x reference (40 uA)
XMtail nt vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
* NMOS differential pair (inn on diode-load side, so inn to out is inverting)
XM1 nd1 inn nt 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 n1 inp nt 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS current-mirror load
XM3 nd1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM4 n1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Second stage: PMOS common source (XM6) with PMOS cascode (XMcp)
XM6 x n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMcp out vbp x vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* Second-stage sink: 100 uA (5x reference) with NMOS cascode (XMcn)
XMcn out iref y 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM7 y vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=5
* Miller compensation with nulling resistor
RZ n1 nx 3k
CC nx out 0.47p
.ends dut
