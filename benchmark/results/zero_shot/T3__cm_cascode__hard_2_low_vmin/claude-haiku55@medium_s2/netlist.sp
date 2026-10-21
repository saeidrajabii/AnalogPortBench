.subckt CM_N_cascode_sky130 in out
* 1:1 NMOS cascode current mirror, L = 1 um for high output resistance
* MN1: reference bottom diode   MN3: reference cascode diode
* MN0: output bottom            MN2: output cascode
XMN3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=1
XMN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=1
XMN1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=1
XMN0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=1
.ends CM_N_cascode_sky130

.subckt dut in out
XI0 in out CM_N_cascode_sky130
.ends dut
