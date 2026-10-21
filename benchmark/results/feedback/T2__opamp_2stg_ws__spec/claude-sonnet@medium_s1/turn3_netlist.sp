.subckt dut iref inp inn out
* ---- bias ----
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
XMBP vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
* vcp bias: pmos unit into nfet diode
XMPC vcp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMCP vcp vcp 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
* vcn bias: two stacked nfet diodes
XMPN vcn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMCN2 vcn vcn sn 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
XMCN1 sn sn 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
* ---- first stage: folded cascode ----
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=2
XPL fl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPR fr inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XSL fl vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=2
XSR fr vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=2
XCL dl vcp fl vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XCR o1 vcp fr vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XNCL dl vcn ml 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
XNML ml ml 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
XNCR o1 vcn mr 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
XNMR mr ml 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
* ---- second stage ----
XMS out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1 nf=1 m=1
XMP2 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=8
* ---- compensation ----
RR0 o1 nc 700
CC0 nc out 0.7p
.ends dut
