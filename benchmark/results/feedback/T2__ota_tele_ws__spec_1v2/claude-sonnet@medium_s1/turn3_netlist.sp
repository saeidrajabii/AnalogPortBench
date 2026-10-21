.subckt dut iref inp inn out
* reference mirror
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* tail 100uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=5
* PMOS cascode bias: 20uA sink through resistor from vdd
XMS vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
Rbp vdd vbp 42k
* NMOS cascode bias
Rbn1 vdd vbn 20k
XMD vbn vbn nd 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
Rbn2 nd 0 8k
* input pair
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.3 nf=1 m=1
XM2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.3 nf=1 m=1
* NMOS cascodes
XM3 mir vbn d1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM4 out vbn d2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS cascodes
XM5 mir vbp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM6 out vbp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* PMOS mirror
XM7 p1 mir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XM8 p2 mir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
.ends dut
