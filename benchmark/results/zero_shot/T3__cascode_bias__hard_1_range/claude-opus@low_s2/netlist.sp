.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS low-voltage cascode reference (resistor-shifted, self-biased) ----
* iin -> vb3 ; R -> vb4 ; cascode drain at vb4, bottom gate at vb4
R1  iin vb4 8k
XN1 vb4 iin nr  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XN0 nr  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* vb3 is the iin node
Rv3 iin vb3 0.001

* ---- NMOS cascode sink that supplies the PMOS reference branch ----
XN3 vb2 vb3 nm  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XN2 nm  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* ---- PMOS low-voltage cascode reference (resistor-shifted, self-biased) ----
R2  vb1 vb2 8k
XP0 pr  vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XP1 vb1 vb2 pr  vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* ---- Output cascode sink / source ----
XN4 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XN5 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP2 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XP3 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
.ends dut
