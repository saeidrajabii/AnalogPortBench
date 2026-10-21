.subckt dut iref inp inn out
* ---------------- bias generation ----------------
XMNR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
XMTL  ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
XMB1  vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMB2  vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* vbp : cascoded PMOS replica (1/10 of folding source, 1/5 of cascode)
XMPRS pr1 vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.8 L=0.5 nf=1 m=2
XMPRC vbp vbpc pr1 vdd sky130_fd_pr__pfet_01v8_lvt W=6.9 L=0.5 nf=1 m=2
* vbpc : high-density PMOS diode
XMPBD vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.5 L=0.5 nf=1 m=1
* vbnc : 2 uA into high-density NMOS diode
XMPB3 vbnc vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.8 L=0.5 nf=1 m=2
XMNBD vbnc vbnc 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.6 L=1 nf=1 m=1
* ---------------- folded-cascode OTA ----------------
XMN2  fa inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=8
XMN1  fb inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=8
XMPSA fa vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=16
XMPSB fb vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=16
XMPCA net1 vbpc fa vdd sky130_fd_pr__pfet_01v8_lvt W=5.75 L=0.5 nf=1 m=12
XMPCB out  vbpc fb vdd sky130_fd_pr__pfet_01v8_lvt W=5.75 L=0.5 nf=1 m=12
XMNCA net1 vbnc sa 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=8
XMNCB out  vbnc sb 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=8
XMNSA sa net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=6
XMNSB sb net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=6
.ends dut
