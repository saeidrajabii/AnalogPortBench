.subckt dut iref inp inn out
* bias
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XMn1 vbpt iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XPd vbpt vbpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMn2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XPbc vbp vbp q vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
Rq vdd q 25k
XPq vbnc vbpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMc vbnc vbnc r 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.3 nf=1 m=1
Rb r 0 24k
* tail and input pair
XPt s vbpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XMa fa inp s vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1
XMb fb inn s vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1
* NMOS sinks and cascodes
XNsa fa iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=0.8 nf=1 m=1
XNsb fb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=0.8 nf=1 m=1
XNca x vbnc fa 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.3 nf=1 m=1
XNcb out vbnc fb 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.3 nf=1 m=1
* PMOS cascode mirror load
XPm1 p1 x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XPm2 p2 x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XPc1 x vbp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPc2 out vbp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
.ends dut
