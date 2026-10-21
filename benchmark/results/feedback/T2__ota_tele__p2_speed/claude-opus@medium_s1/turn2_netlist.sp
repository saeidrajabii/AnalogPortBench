.subckt dut iref inp inn out
* Bias: reference diode and NMOS mirrors (unit W=40 L=0.5 per 20 uA)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=3
* First stage: NMOS differential pair (bulk tied to source), PMOS mirror load
XM1 n1 inp tail tail sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM2 d1 inn tail tail sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.4 nf=1 m=1
XM4 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.4 nf=1 m=1
* Second stage: PMOS common source with NMOS current-sink load
XM5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.4 nf=1 m=4
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=6
* Miller compensation with nulling resistor
Rz n1 nz 1.6k
Cc nz out 0.8p
.ends dut
