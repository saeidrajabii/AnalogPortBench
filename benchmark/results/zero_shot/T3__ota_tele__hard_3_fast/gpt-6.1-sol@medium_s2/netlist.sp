.subckt dut iref inp inn out

* Reference-current mirror.
XBR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Nominal 80-uA differential-pair tail.
XBT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4

* Nominal 5-uA PMOS bias branch.
XBB vbpf iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XBP vbpt vbpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.35 nf=1 m=1
RBP vbpt vbpf 50k

* NMOS differential input pair.
XI1 f1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.15 nf=1 m=1
XI2 f2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=0.15 nf=1 m=1

* Nominal 50-uA upper current sources.
XPT1 f1 vbpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.35 nf=1 m=1
XPT2 f2 vbpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.35 nf=1 m=1

* PMOS folding devices.
XPF1 mir vbpf f1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XPF2 out vbpf f2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1

* Cascoded NMOS current-mirror load.
XNC1 mir iref n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNC2 out iref n2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNM1 n1 mir 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.15 nf=1 m=1
XNM2 n2 mir 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.15 nf=1 m=1

.ends dut
