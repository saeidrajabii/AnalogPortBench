.subckt dut iref inp inn out
* The 20 uA reference is received by a diode-connected NMOS and mirrored.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS bias and NMOS cascode bias.
XPR pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XNP pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XPC nbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XNC1 nbias nbias nmid 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XNC2 nmid nmid 0 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1

* Differential input stage with cascoded mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=3
XINP nlp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XINN nrp inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XNCL pload nbias nlp 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNCR vstage nbias nrp 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPTL pleft pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XPTR pright pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XPCL pload pload pleft vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XPCR vstage pload pright vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* Second gain stage and Miller compensation.
XOUTP out vstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=4
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=4
RZ vstage cnode 1k
CC cnode out 0.75p
.ends dut
