.subckt dut iref inp inn out
* bias: reference mirror
XMN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.2 L=0.5 nf=1 m=1
XMNb1 pd1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.2 L=0.5 nf=1 m=1
XMPd1 pd1 pd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPb2 vbn pd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* NMOS cascode bias
XMNc vbn vbn rn 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.3 nf=1 m=1
Rn rn 0 18k
* PMOS cascode bias
XMNb3 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.2 L=0.5 nf=1 m=1
XMPc vbp vbp rp vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
Rp vdd rp 12k
* OTA tail
XMT s iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1
* input pair
XM1 dl inp s 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.3 nf=1 m=1
XM2 dr inn s 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.3 nf=1 m=1
* NMOS cascodes
XM3 vd vbn dl 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM4 out vbn dr 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* PMOS cascode mirror load
XM5 al vd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM6 ar vd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM7 vd vbp al vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM8 out vbp ar vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
.ends dut
