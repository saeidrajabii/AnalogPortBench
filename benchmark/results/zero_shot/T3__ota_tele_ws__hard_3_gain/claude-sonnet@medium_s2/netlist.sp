.subckt dut iref inp inn out
* bias mirror from iref
XMN4 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* tail
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=3
* input pair
XMN1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XMN3 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1
* NMOS cascodes
XMN0 net082 vcn n1 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=1
XMN2 out vcn n2 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=1
* PMOS cascoded mirror load
XMP0 p1 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.8 nf=1 m=1
XMP2 p2 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.8 nf=1 m=1
XMP1 net082 vcp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.8 nf=1 m=1
XMP3 out vcp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.8 nf=1 m=1
* cascode bias dividers
Rn1 vdd vcn 380k
Rn2 vcn 0 870k
Rp1 vdd vcp 700k
Rp2 vcp 0 500k
Cn vcn 0 1p
Cp vcp 0 1p
.ends dut
