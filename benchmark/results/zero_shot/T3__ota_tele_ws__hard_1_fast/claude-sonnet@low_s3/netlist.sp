.subckt dut iref inp inn out
* reference mirror
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* tail
XMtail vt iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=7
* Vbp branch: pfet diode + nfet mirror
XMpd vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.35 nf=1 m=1
XMpn vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Vbn branch: pfet copy + nfet diode
XMpc vbn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.35 nf=1 m=1
XMnd vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* input pair
XM1 n1 inp vt 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=2
XM2 n2 inn vt 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=2
* nmos cascodes
XM3 d1 vbn n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=2
XM4 out vbn n2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=2
* pmos cascodes
XM5 d1 vbp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=2
XM6 out vbp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=2
* pmos mirror load
XM7 p1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=2
XM8 p2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=2
.ends dut
