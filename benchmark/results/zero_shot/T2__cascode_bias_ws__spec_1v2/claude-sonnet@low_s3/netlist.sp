.subckt dut iin out vb1 vb2 vb3 vb4
* reference diode and mirrors
XN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XN6 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XN7 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS bias: vb1 diode, vb2 diode stacked on vb1-gated device
XP3 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XP5 pn vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XP4 vb2 vb2 pn vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* NMOS bias: PMOS mirrors supply 20uA
XP7 vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XP6 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XNd vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XN9 nn vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XN8 vb3 vb3 nn 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* output stage
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
