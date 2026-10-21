.subckt dut iref inp inn out
* Reference-current sensing and NMOS bias mirrors
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNT   ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XN2   n2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XNPB  pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS bias reference
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPLOAD1 nleft pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPLOAD2 nright pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPSTAGE out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* NMOS differential input pair and PMOS mirror load
XNT1 ntail inp 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XNT2 ntail inn 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XPM1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPM2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Second gain stage and its current sink
XNOUT out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Miller compensation
CCOMP nright out 2p
.ends dut
