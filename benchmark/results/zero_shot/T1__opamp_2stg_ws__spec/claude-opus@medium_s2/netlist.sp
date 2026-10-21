* ---------------------------------------------------------------
* Bias generator: iref is mirrored to every branch
* vbp  : PMOS current-source gate (tail and 2nd-stage source)
* vbpc : PMOS cascode gate (long-L PMOS diode)
* vbnc : NMOS cascode gate (long-L NMOS diode)
* ---------------------------------------------------------------
.subckt bias_gen iref vbp vbpc vbnc
XMNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=2
XMNA vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMNB vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
XMPA vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPB vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=2.5 nf=1 m=1
XMPC vbnc vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMNC vbnc vbnc 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=2.5 nf=1 m=1
CD1 vbp  vdd 2p
CD2 vbpc vdd 2p
CD3 vbnc 0   2p
.ends bias_gen

* ---------------------------------------------------------------
* Two-stage Miller op-amp
* Stage 1: PMOS input pair (bulk tied to source), NMOS mirror load
* Stage 2: NMOS common source with NMOS cascode,
*          cascoded PMOS current-source load
* ---------------------------------------------------------------
.subckt opamp2 vbp vbpc vbnc inn inp out
XMPT tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMP1 n9 inn tail tail sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMP2 n8 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMN1 n9 n9 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.5 L=0.5 nf=1 m=1
XMN2 n8 n9 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.5 L=0.5 nf=1 m=1
XMN3 nc  n8   0  0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
XMN4 out vbnc nc 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
XMP4 out vbpc pc vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.35 nf=1 m=1
XMP3 pc  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=12
RZ n8 nz 2k
CC nz out 0.45p
.ends opamp2

.subckt dut iref inp inn out
XB iref vbp vbpc vbnc bias_gen
XA vbp vbpc vbnc inn inp out opamp2
.ends dut
