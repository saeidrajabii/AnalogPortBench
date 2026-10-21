.subckt dut in out
* Wide-swing NMOS cascode current mirror, 1:1 ratio.
* Iref enters at the diode-connected drain of XM3, so it is never fed into a source.
XM3 in  in  net1 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XM2 out in  net2 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XM1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XM0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
.ends dut
