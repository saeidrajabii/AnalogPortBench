.subckt dut iref inp inn out
* reference mirror
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=2
* NMOS cascode bias
Rbn1 vdd vbn 55k
Rbn2 vbn nbd 20k
XMbn nbd nbd 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
* PMOS cascode bias
XMbp vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
Rbp vbp 0 60k
* input pair
XM1 nl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.35 nf=1 m=1
XM2 nr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.35 nf=1 m=1
* NMOS cascodes
XM3 a vbn nl 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.35 nf=1 m=1
XM4 out vbn nr 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.35 nf=1 m=1
* PMOS cascoded mirror load
XMc1 a vbp b1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMc2 out vbp b2 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMm1 b1 a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMm2 b2 a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
