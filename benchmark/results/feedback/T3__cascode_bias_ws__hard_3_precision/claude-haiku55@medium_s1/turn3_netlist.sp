.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference stack: iin -> diode(iin) -> vb4 -> diode(vb4) -> 0 ----
XN1 iin iin vb4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XN2 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
Rv3 iin vb3 1m
* ---- NMOS sink cascode (output side) ----
XN3 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XN4 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* ---- PMOS bias generation ----
* vb1: diode-connected PMOS from vdd, sunk by an NMOS copy of the reference
XP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XN5 vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* vb2: vdd -> PMOS(gate vb1) -> w -> diode PMOS -> vb2 -> diode NMOS (pins vb2) -> 0
XP3 w vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XP4 vb2 vb2 w vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XN6 vb2 vb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* ---- PMOS source cascode (output side) ----
XP2 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XP5 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
.ends dut
