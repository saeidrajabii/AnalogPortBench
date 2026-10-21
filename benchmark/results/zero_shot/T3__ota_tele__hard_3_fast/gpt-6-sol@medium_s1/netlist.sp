.subckt dut iref inp inn out
* Reference-current mirror and tail source
XBNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Cascode-bias generator
XBNB nb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.4 L=0.5 nf=1 m=1
XBPREF vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.35 nf=1 m=1
XBPCN vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.35 nf=1 m=1
XBN2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.35 nf=1 m=1
XBN3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* PMOS-cascode bias
XBNP vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.4 L=0.5 nf=1 m=1
XBPP vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.35 nf=1 m=1

* Folded-cascode amplifier
XINP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XINN x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XNC1 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.35 nf=1 m=1
XNC2 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.35 nf=1 m=1
XPC1 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.35 nf=1 m=1
XPC2 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.35 nf=1 m=1
XPL1 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.35 nf=1 m=1
XPL2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.35 nf=1 m=1
.ends dut
