.subckt dut iref inp inn out
* Bias: 20 uA reference mirrored to the tail (1:1) and to the output sink (1:2)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
* Stage 1: NMOS differential pair (bulk tied to source) with PMOS mirror load
XM1 d1 inn tail tail sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XM2 n1 inp tail tail sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XM4 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
* Stage 2: PMOS common-source amplifier with mirrored NMOS current sink
XM5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=4
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
* Miller compensation with a nulling resistor
RZ n1 nz 4k
CC nz out 1.3p
.ends dut
