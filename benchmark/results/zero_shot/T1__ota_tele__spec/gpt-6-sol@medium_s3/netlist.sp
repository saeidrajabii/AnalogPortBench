.subckt dut iref inp inn out
* Reference-current mirror and bias generators
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

RNC vdd vcn 65k
XNC1 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1
XNC2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1

XPCN vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.8 nf=1 m=1
XPCP vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.9 L=0.35 nf=1 m=1

* Cascoded differential pair and PMOS current-mirror load
XINP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XINN x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XCN1 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.4 nf=1 m=1
XCN2 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.4 nf=1 m=1
XCP1 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.3 nf=1 m=1
XCP2 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.3 nf=1 m=1
XPM1 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1
XPM2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1
.ends dut
