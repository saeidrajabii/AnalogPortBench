.subckt dut iref inp inn out
* Bias: iref (20 uA) diode, unit device W=4/L=1 at 2 uA each
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=10
* Tail current 6 uA
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
* Input pair
X1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
X2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load
X3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=1
X4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=1
* Second stage: PMOS common source (18 uA), NMOS current sink
X5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=6
X6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=9
* Miller compensation with nulling resistor
Rz o1 nz 8k
Cc nz out 0.6p
.ends dut
