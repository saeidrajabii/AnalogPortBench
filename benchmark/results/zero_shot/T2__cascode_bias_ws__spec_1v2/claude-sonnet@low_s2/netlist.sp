.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference diode and mirrors
XN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
Rb4 iin vb4 1
XN6 nb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
XN7 nb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
* branch A: vb3 generation
XP11 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XN9 vb3 vb3 nt 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
XN10 nt vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
* branch B: vb1 diode
XP3 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* sink for branch B is XN6 (nb1) -> connect via resistor-free short node
Rb1 vb1 nb1 1
* branch C: vb2 diode stack
XP7 np vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP6 vb2 vb2 np vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
Rb2 vb2 nb2 1
* output stage
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
