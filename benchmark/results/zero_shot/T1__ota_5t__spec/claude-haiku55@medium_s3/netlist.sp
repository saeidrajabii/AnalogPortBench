.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference (20 uA injected at iref)
MREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Tail current mirror, 1:1 (about 20 uA)
MTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* NMOS differential pair (inp drives the diode-connected load side, as in the source design)
MN1 n9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
MN2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
* PMOS current-mirror active load
MP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=11 L=0.5 nf=1 m=1
MP2 out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=11 L=0.5 nf=1 m=1
.ends dut
