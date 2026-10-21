.subckt dut iin out vb1 vb2 vb3 vb4
* ---------------- NMOS reference (low-voltage cascode, single-resistor bias)
R0  iin vb3 1
R1  vb3 vb4 9k
XN1 nr   vb4 0  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XN3 vb4  vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
* ---------------- NMOS mirror branch feeding the PMOS reference
XN0 nm   vb4 0  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XN2 vb2  vb3 nm 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
* ---------------- PMOS reference (low-voltage cascode, single-resistor bias)
R2  vb1 vb2 7.5k
XP1 pr   vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=30
XP0 vb1  vb2 pr  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=30
* ---------------- Output cascode sink / source
XN4 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XN5 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XP2 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=30
XP3 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=30
.ends dut
