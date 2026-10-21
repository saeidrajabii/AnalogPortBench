.subckt dut iref inp inn out
* Bias generation
* vb4 = iref: diode-connected NMOS reference (20 uA)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* vb1: 10 uA PMOS diode (gate of PMOS current sources)
XMnr  vb1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMpr  vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* vb3: NMOS cascode gate, 10 uA PMOS source into NMOS diode
XMpb3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMb3  vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
* vb2: PMOS cascode gate, set by a narrow PMOS diode with a 10 uA sink
XMpb2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.6 L=0.5 nf=1 m=1
XMn2s vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Signal path: NMOS input pair, single tail (no tail cascode, for headroom)
XMt  tl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=52 L=0.5 nf=1 m=1
XM1  fl inp tl 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM2  fr inn tl 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Left fold branch sourced by PMOS mirror (gate m1), PMOS cascode, NMOS cascode and sink
XMp0 fl m1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMp1 fl m1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMc4 m1 vb2 fl vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMn6 m1 vb3 nl 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMs7 nl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.5 nf=1 m=1

* Right fold branch: mirror copy into output node
XMp2 fr m1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMp3 fr m1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMc5 out vb2 fr vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMn9 out vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMs8 nr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.5 nf=1 m=1
.ends dut
