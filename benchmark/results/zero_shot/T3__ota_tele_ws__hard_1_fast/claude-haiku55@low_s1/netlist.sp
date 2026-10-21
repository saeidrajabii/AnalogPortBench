.subckt dut iref inp inn out
* Reference and tail (100 uA = 5 x 20 uA)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMt   ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1

* NMOS input pair
XM1 nxL inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XM2 nxR inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.5 nf=1 m=1

* NMOS cascodes (gate vbnc)
XMcL nA   vbnc nxL 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XMcR out  vbnc nxR 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.5 nf=1 m=1

* PMOS folded mirror: diode side (inp) and output side
XMPd  nG nG vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPdc nA vbpc nG vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPr  nRp nG vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPrc out vbpc nRp vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* Cascode bias generation (about 0.75 V for NMOS, 0.1 V for PMOS)
Rbn1 vdd vbnc 300k
Rbn2 vbnc 0 500k
Cbn  vbnc 0 1p
Rbp1 vdd vbpc 1.1meg
Rbp2 vbpc 0 100k
Cbp  vbpc 0 1p
.ends dut
