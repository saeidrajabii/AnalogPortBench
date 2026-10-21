.subckt dut iref inp inn out
* bias: reference diode and mirrors
XNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XNt   t    iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XNb1  vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.6 nf=1 m=1
XNb2  vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.6 nf=1 m=1
* PMOS fold-source bias diode
XPd1  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=3
* PMOS cascode bias: resistor + diode
Rpc   vdd q 50k
XPdc  vbpc vbpc q vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* NMOS cascode bias replica
XPr   vbn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=3
XNd   vbn vbn r 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
Rn    r 0 50k
* input pair
XMa fa inp t 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.25 nf=1 m=1
XMb fb inn t 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.25 nf=1 m=1
* fold sources and cascodes
XPs1 fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=12
XPs2 fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=12
XPc1 g1 vbpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPc2 out vbpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* wide-swing NMOS cascode mirror
XNc1 g1  vbn s1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XNc2 out vbn s2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XNm1 s1 g1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XNm2 s2 g1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
.ends dut
