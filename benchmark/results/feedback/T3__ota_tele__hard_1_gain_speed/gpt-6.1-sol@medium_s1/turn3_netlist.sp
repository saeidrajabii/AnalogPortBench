.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS reference branch: nominally 5 uA.
XBN pref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XBP pref pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1

* NMOS cascode bias.
XBCN vcn pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1
RBCN vcn nbias 36k
XDN nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1

* PMOS cascode bias.
XDP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1
RBCP pbias vcp 48k
XBCP vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* Differential pair: nominally 40 uA total.
XTAIL ptail pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XINP f2 inp ptail vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=0.6 nf=1 m=1
XINN f1 inn ptail vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=0.6 nf=1 m=1

* Folding sinks: nominally 25 uA per branch.
XS1 f1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
XS2 f2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1

* Folded cascodes: nominally 5 uA per branch.
XFC1 mirror vcn f1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XFC2 stage1 vcn f2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1

* Reduced-capacitance cascoded mirror.
XPC1 mirror vcp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XPC2 stage1 vcp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XPL1 p1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XPL2 p2 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* Output stage with reduced input capacitance.
XON out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.6 nf=1 m=1
XOP out pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=315 L=1.5 nf=1 m=1

* Miller compensation with a left-half-plane zero.
RZ stage1 comp 12k
CC comp out 0.3p

.ends dut
