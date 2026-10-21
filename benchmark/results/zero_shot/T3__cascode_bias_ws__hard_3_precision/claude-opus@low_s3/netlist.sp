.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS wide-swing reference (Iin)
XN2 iin vb3 na 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XN1 na iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
R4 iin vb4 1
* NMOS output sink
XN4 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XN3 nsrc iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
* NMOS copy feeding PMOS wide-swing reference
XN6 vb1 vb3 nb 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XN5 nb iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XP2 vb1 vb2 np vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XP1 np vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=4
* PMOS output source
XP4 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XP3 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=4
* vb2 generation: long PMOS diode fed by NMOS mirror
XN7 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XP5 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* vb3 generation: long NMOS diode fed by PMOS mirror
XP6 vb3 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
.ends dut
