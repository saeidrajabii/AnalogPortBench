.subckt dut iref inp inn out
* ---- bias ----
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* NMOS cascode bias: R from vdd, diode, source resistor
Rtop vdd vbnc 115k
XMc vbnc vbnc nsc 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
Rsn nsc 0 35k
* PMOS cascode bias
Rsp vdd psc 35k
XMpc vbpc vbpc psc vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
Rbp vbpc 0 105k
* ---- tail and input pair ----
XMtail t iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMi1 fa inp t 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XMi2 fb inn t 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* ---- PMOS sources (mirror gate n1) ----
XP0 fa n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP1 fb n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* ---- PMOS cascodes ----
XPc1 n1 vbpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XPc2 out vbpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* ---- NMOS cascodes and sinks ----
XNc1 n1 vbnc ya 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XNc2 out vbnc yb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XNs1 ya iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XNs2 yb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
