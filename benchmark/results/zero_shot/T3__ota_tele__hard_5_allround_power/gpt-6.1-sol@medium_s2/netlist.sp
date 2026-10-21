.subckt dut iref inp inn out

* Reference mirror and elevated NMOS cascode bias.
RBN iref vbn 9k
XBN vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* Mirrored PMOS reference; resistor establishes folded-cascode bias.
XBP_SINK vfp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
RBP vbp vfp 150k
XBP vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* Differential input pair and mirrored tail current.
XTAIL tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=76 L=2 nf=1 m=1
XINP f1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XINN f2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* Upper current sources.
XPS1 f1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=58 L=1.5 nf=1 m=1
XPS2 f2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=58 L=1.5 nf=1 m=1

* PMOS folded-cascode branches.
XPF1 d1 vfp f1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPF2 out vfp f2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Cascoded NMOS current-mirror load.
XNL1 n1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XNL2 n2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XNC1 d1 iref n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNC2 out iref n2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

.ends dut
