.subckt dut iref inp inn out
* ---- bias ----
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* branch A : PMOS cascode bias (Vb2)
RP vdd sp 40k
XMcp vb2 vb2 sp vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMba vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=1
* branch B : NMOS cascode bias (Vb3), mirrored from branch A
RP2 vdd sp2 40k
XMmir vb3 vb2 sp2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMc vb3 vb3 sc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
RS sc 0 33k
* ---- OTA ----
* tail
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1 nf=1 m=1
* input pair
XM1 na inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 nb inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* PMOS top mirror
XP0 na net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.7 nf=1 m=1
XP1 nb net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.7 nf=1 m=1
* PMOS cascodes
XP4 net1 vb2 na vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP5 out vb2 nb vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* NMOS cascodes and sinks
XN6 net1 vb3 n7 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XN9 out vb3 n8 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XN7 n7 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=1
XN8 n8 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=1
.ends dut
