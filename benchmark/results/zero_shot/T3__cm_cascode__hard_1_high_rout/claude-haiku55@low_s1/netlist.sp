.subckt dut in out
* Reference branch: NMOS diode-connected cascode sinks Iref from node in
XMr1c in in x 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMr1  x  x  0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* NMOS cascode copy of Iref, sinking the same current from node pg
XMcc pg in y 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMcb y  x  0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS diode-connected device sources the copied current into pg
XMpd pg pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* Output PMOS cascode mirror, sourcing Iout into node out
XMo1 xo pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMo2 out bc xo vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* Resistive divider sets the PMOS cascode gate bias near 0.35 V
R1 vdd bc 243k
R2 bc 0 100k
.ends dut
