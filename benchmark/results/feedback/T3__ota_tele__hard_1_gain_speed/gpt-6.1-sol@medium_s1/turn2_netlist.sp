.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS current-reference branch.
XBN pref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XBP pref pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* NMOS cascode bias.
XBCN vcn pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1
RBCN vcn nbias 36k
XDN nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1

* PMOS cascode bias, adjusted for mirror-load saturation.
XDP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1
RBCP pbias vcp 48k
XBCP vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* PMOS differential input pair.
XTAIL ptail pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XINP f2 inp ptail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.5 nf=1 m=1
XINN f1 inn ptail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.5 nf=1 m=1

* Folding current sinks.
XS1 f1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XS2 f2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Folded NMOS cascodes.
XFC1 mirror vcn f1 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XFC2 stage1 vcn f2 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1

* Cascoded PMOS mirror load.
XPC1 mirror vcp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.2 nf=1 m=1
XPC2 stage1 vcp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.2 nf=1 m=1
XPL1 p1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XPL2 p2 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1

* High-transconductance output stage.
XON out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=1.2 nf=1 m=1
XOP out pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=306 L=1.5 nf=1 m=1

* Miller compensation and phase-lead zero.
RZ stage1 comp 5k
CC comp out 0.42p

.ends dut
