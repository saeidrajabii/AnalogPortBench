.subckt dut iref inp inn out
* Bias: iref is diode-connected (drain and gate on iref, source to ground).
* Mirror legs: tail (m=2 -> 40 uA), second-stage sink (m=8 -> 160 uA).
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=2
XMS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=8

* First stage: NMOS differential pair with PMOS diode-connected mirror load.
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* Second stage: PMOS common-source driven from n2, NMOS current sink (MNS).
XP3 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1

* Miller compensation with nulling resistor, from n2 to out.
RZ n2 mid 3k
CC mid out 600f
.ends dut
