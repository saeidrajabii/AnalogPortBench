.subckt dut in out
* Wide-swing-free cascode NMOS current mirror (SKY130 lvt, 1.2 V supply)
* Reference stack: bottom diode MR1 (gate/drain x), cascode diode MR2 (gate/drain in)
XMR1 x x 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMR2 in in x 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* Output stack: bottom MO1 (gate x), cascode MO2 (gate in), drain at out
XMO1 y x 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMO2 out in y 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
