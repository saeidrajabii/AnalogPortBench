.subckt dut in out
* Symmetric cascode mirror, 1:1. Cascode gates are tied to `in`, which is diode-connected.
* The reference current enters `in` and is mirrored through the stack to `out`.
XMN3 in  in  net1 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1
XMN2 out in  net2 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1
XMN1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1
XMN0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1
.ends dut
