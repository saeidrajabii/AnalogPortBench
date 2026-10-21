.subckt dut iref inp inn out
* Bias: iref node (vb3) is the top diode of a two-diode stack (Mn3 over Mn1).
* Tail mirror Mt copies the stack current (20 uA).
XMn1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMn3 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMt tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Input differential pair (inp drives the mirror-diode side, inn drives the output side).
XMip n9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XMin n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1

* NMOS cascode on the output side, gate at the iref (vb3) bias.
XMc2 out iref n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS current mirror load (long channel for output resistance).
XMpd n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.0 nf=1 m=1
XMpo out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.0 nf=1 m=1
.ends dut
