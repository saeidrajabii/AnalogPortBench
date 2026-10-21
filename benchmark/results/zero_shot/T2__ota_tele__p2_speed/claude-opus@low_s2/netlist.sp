.subckt dut iref inp inn out
* bias: iref diode (20uA)
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* tail current 40uA
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
* NMOS input pair
X1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
X2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load
X3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
X4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* second stage: PMOS common source, NMOS sink (120uA)
X5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=6
X6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=6
* Miller compensation with nulling resistor
Rz o1 nz 1.5k
Cc nz out 0.8p
.ends dut
