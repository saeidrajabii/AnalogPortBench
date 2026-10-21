.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS reference: nominally 10 uA.
XBN pref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XBP pref pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Low-voltage NMOS cascode bias.
XBCN vcn pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1
RBCN vcn nbias 36k
XDN nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1

* Low-voltage PMOS cascode bias.
XDP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1
RBCP pbias vcp 36k
XBCP vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* PMOS differential pair: nominally 20 uA total.
XTAIL ptail pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XINP f2 inp ptail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XINN f1 inn ptail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Folding sinks: nominally 25 uA per branch.
XS1 f1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XS2 f2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1

* Folded NMOS cascodes.
XFC1 mirror vcn f1 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XFC2 stage1 vcn f2 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1

* Cascoded PMOS mirror load.
XPC1 mirror vcp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.8 nf=1 m=1
XPC2 stage1 vcp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.8 nf=1 m=1
XPL1 p1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=1 nf=1 m=1
XPL2 p2 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=1 nf=1 m=1

* Common-source output stage: nominally 60 uA.
XON out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XOP out pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1 nf=1 m=1

* Miller compensation with series zero-control resistor.
RZ stage1 comp 1k
CC comp out 0.6p

.ends dut
