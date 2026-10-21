.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current diode and NMOS mirrors
RVB4 iin vb4 1m
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=160
XNPR  pref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=160

* PMOS reference and output current source
RVB1 pref vb1 1m
XPREF pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=8 nf=1 m=160
XPSRC psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20.03 L=8 nf=1 m=160
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=120

* NMOS output current sink
XNSNK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20.08 L=8 nf=1 m=160
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=120

* Cascode-gate biases
R2TOP vdd vb2 113k
R2BOT vb2 0 127k
R3TOP vdd vb3 151k
R3BOT vb3 0 89k
.ends dut
