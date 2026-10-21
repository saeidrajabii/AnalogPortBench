.subckt dut iref inp inn out
* reference diode and mirrors (NMOS)
XN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* bias branch A: PMOS cascode bias vb2
XPB vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.6 L=0.5 nf=1 m=1
XNA vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
* bias branch B: NMOS cascode bias vb3
XPS vb3 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.6 L=0.5 nf=1 m=1
XNC vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=1 nf=1 m=1
* input pair
XI2 na inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XI1 nb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* top PMOS sources
XP1 na net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
XP3 nb net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
* PMOS cascodes
XP4 net1 vb2 na vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XP5 out vb2 nb vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* NMOS cascodes and sinks
XN6 net1 vb3 s1 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
XN9 out vb3 s2 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
XN7 s1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
XN8 s2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
.ends dut
