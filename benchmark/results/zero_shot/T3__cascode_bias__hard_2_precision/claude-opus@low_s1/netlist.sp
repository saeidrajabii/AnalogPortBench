.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference (low-voltage cascode, self-biased bottom)
R0 iin vb4 1
XNRc iin vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNRb n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* NMOS copy A -> PMOS reference
XNAc vb1 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNAb n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS reference (low-voltage cascode, self-biased bottom)
XPRb p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
XPRc vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
* NMOS copy B -> vb2 PMOS diode
XNBc vb2 vb3 n3 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNBb n3 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XPD2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS copy C -> vb3 NMOS diode
XPCb c1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
XPCc vb3 vb2 c1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
XND3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Output cascode sink
XNOb nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNOc out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* Output cascode source
XPOb psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
XPOc out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
.ends dut
