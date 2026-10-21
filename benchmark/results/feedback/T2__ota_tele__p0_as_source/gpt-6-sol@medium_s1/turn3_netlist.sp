.subckt dut iref inp inn out
* Wider reference and mirror devices reduce tail-current-source Vdsat
* while preserving the nominal current-mirror ratios.
XBN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XBT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=3

* Output-stage bias
XBP pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XPD pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.0 nf=1 m=1

* Differential first stage
XN1 a inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1.0 nf=1 m=1
XN2 b inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1.0 nf=1 m=1
XP1 a a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XP2 b a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1

* Common-source output stage and compensation
XNOUT out b 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.8 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.0 nf=1 m=6
RZ b cc 1.2k
CC cc out 1.45p
.ends dut
