.subckt dut iref inp inn out
* Bias: 20 uA reference, NMOS mirror, PMOS diode, PMOS tail mirror
XMNr  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1   nf=1 m=1
XMNb  xb   iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1   nf=1 m=1
XMPb  xb   xb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPt  tail xb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* PMOS input pair (tail about 20 uA, about 10 uA per side)
XMPout out  inn  tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPdio netD inp  tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* NMOS current-mirror load (1:1)
XMNd  netD netD 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNo  out  netD 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
