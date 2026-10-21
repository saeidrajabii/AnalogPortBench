.subckt dut in out
* Long-channel, low-overdrive, wide-swing cascode mirror.
* Auxiliary bias current is supplied through RB, not from the reference.
RB vdd vcas 3k
XMB vcas vcas 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=100 nf=1 m=1000

* Reference branch.
XMR1 nref in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=100 nf=1 m=1000
XMR2 in vcas nref nref sky130_fd_pr__nfet_01v8_lvt W=40 L=100 nf=1 m=1000

* Output branch.
XMO1 nout in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=100 nf=1 m=1000
XMO2 out vcas nout nout sky130_fd_pr__nfet_01v8_lvt W=40 L=100 nf=1 m=1000
.ends dut
