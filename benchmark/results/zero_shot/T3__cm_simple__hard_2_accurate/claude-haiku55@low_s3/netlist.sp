.subckt dut in out
* Wide-swing-style cascode NMOS mirror (ratio 1:1).
* Reference branch: in -> MR2 (diode-connected cascode) -> x -> MR1 (diode-connected) -> 0
* Output branch:    out -> MO2 (cascode, gate = in) -> y -> MO1 (gate = x) -> 0
* Large W keeps overdrive low to reduce Vmin; L = 0.5 um raises output resistance.
XMR1 x x 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMR2 in in x 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMO1 y x 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMO2 out in y 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
