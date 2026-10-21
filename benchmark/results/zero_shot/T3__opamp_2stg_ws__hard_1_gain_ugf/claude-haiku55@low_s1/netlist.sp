.subckt dut iref inp inn out
* Reference diode, 20 uA set by the ideal source into iref
Xnref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source, 2x reference (about 40 uA)
Xtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* NMOS differential pair
Xm1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
Xm2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load
Xm3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
Xm4 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink (4x reference, about 80 uA)
Xm6 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
Xmout out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Miller compensation with nulling resistor
Rz d2 x 3k
Cc x out 600f
.ends dut
