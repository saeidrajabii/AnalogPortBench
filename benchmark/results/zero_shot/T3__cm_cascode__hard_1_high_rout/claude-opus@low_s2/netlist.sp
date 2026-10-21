.subckt dut in out
* reference branch: wide-swing cascode, gates tied to in
XMN3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN1 net1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=10
* output branch: mirror device + regulated cascode
XMN0 net2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=10
XMN2 out vg net2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=5
* bias for amplifier tail
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
RB pb 0 60k
XMPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS-input error amplifier: forces net2 = net1
XMP1 da net1 tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP2 vg net2 tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN4 da da 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
XMN5 vg da 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
C1 vg 0 1p
.ends dut
