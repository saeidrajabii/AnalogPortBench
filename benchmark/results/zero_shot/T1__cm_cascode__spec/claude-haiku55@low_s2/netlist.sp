.subckt dut in out
* Cascode NMOS current mirror, 1:1, ported from the TSMC 0.18 um design.
* Reference current enters 'in' from vdd and is mirrored into 'out'.
* Sizing: W=10 um, L=1 um on all devices (longer L for higher Rout,
* wider W for lower overdrive and lower vmin).
XM3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
