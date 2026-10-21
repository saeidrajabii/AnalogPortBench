.subckt dut iref inp inn out
* ---- Bias generation (20 uA reference) ----
* Reference diode: iref is the drain of a diode-connected NMOS (current enters from vdd, never a source)
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* NMOS cascode gate bias: resistor from vdd into a diode-connected NMOS
R1 vdd vbn3 20k
XMB1 vbn3 vbn3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
* PMOS cascode gate bias: diode-connected PMOS from vdd, pulled to ground by a resistor
XMB2 vbp2 vbp2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=1
R2 vbp2 0 21k

* ---- Tail (plain NMOS sink, mirrored from iref, 2 x 30 uA) ----
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=2

* ---- NMOS input pair (folded cascode) ----
* inn drives the right (output) branch, inp drives the left (mirror-control) branch
XM1 net016 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 net010 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---- Left branch: PMOS current source, PMOS cascode, NMOS cascode + sink ----
XPL1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=2
XPL2 net1 vbp2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNL1 net1 vbn3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XNL2 net018 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1

* ---- Right (output) branch: PMOS current source, PMOS cascode, NMOS cascode + sink ----
XPR1 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=2
XPR2 out vbp2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNR1 out vbn3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XNR2 net017 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
.ends dut
