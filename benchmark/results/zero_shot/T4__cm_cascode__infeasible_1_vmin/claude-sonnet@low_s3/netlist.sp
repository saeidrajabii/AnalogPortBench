.subckt dut in out
* NMOS cascode mirror: reference in -> pulls current from PMOS diode stack
XN3 in in n1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XN1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XN2 p1 in n2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XN0 n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS cascode mirror: diode stack carries mirrored current, output stack sources into out
XP3 p1 p1 q1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP1 q1 q1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP2 out p1 q2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP0 q2 q1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
