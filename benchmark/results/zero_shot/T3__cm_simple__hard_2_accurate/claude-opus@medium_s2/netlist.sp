.subckt dut in out
* ---- main mirror devices (matched, weak inversion, equal Vds forced by loop)
XMN1 in  g 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=8
XMN0 out g 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=8

* ---- identical sensing dividers (currents cancel since V(in)=V(out))
R1a in  ta 1Meg
R2a ta  0  1Meg
R1b out tb 1Meg
R2b tb  0  1Meg

* ---- bias reference (~9 uA), independent of Iref
XMBP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
Rb   pb 0 80k

* ---- stage 1: PMOS input pair, NMOS mirror load
XMP0 tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP1 d1 tb tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP2 d2 ta tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN3 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMN4 d2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* ---- stage 2: NMOS common source, PMOS current load -> drives mirror gate
XMN5 g d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=2
XMP6 g pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* ---- Miller compensation (no effect on DC)
Cc g d2 2p
.ends dut
