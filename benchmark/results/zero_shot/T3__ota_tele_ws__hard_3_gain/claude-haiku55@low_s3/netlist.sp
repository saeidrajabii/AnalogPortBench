.subckt dut iref inp inn out
* ---- bias: 20 uA reference mirrored to tail (80 uA), PMOS/NMOS bias rails ----
XMNref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4
* vb1: PMOS current-source gate (self-biased with 20 uA NMOS sink)
XMPd vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMNbp vb1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* vb3: NMOS cascode gate (~0.6 V), fed by 20 uA PMOS mirror
XMPcb vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMNcb vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* vb2: PMOS cascode gate from resistor divider (~0.2 V)
Rb1 vdd vb2 5meg
Rb2 vb2 0 1meg

* ---- signal path ----
* inp branch: NMOS pair + cascode, PMOS current source + cascode
XMP_s1 nC vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP_c1 nB vb2 nC vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN1 nA inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN3 nB vb3 nA 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* inn branch: NMOS pair + cascode drives out directly (inverting)
XMN2 nD inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN4 out vb3 nD 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* output PMOS stage gated by nB (non-inverting from inp), with cascode
XMP_o pO nB vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP_oc out vb2 pO vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
