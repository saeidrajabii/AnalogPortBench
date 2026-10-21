.subckt dut iref inp inn out
* Bias reference (mirrors the 20 uA ideal current)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Tail current source, 20 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS input pair, bulk tied to source to remove body effect
XM1 d1 inn tail tail sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 o1 inp tail tail sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS current-mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* Second stage: PMOS common source (6x the load device), NMOS sink (3x the reference)
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=6
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=3
* Miller compensation with nulling resistor
Rz o1 nz 2.5k
Cc nz out 0.6p
.ends dut
