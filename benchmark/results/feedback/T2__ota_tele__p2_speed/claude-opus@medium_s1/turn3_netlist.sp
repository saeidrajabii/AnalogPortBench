.subckt dut iref inp inn out
* Bias: reference diode and NMOS mirrors (20 uA reference)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
* First stage: NMOS differential pair (bulk tied to source), PMOS mirror load
XM1 n1 inp tail tail sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2 d1 inn tail tail sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.4 nf=1 m=1
XM4 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.4 nf=1 m=1
* Second stage: PMOS common source (5.6x mirror) with NMOS current sink (~140 uA)
XM5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=19.6 L=0.4 nf=1 m=4
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=7
* Miller compensation with nulling resistor
Rz n1 nz 1.8k
Cc nz out 0.6p
.ends dut
