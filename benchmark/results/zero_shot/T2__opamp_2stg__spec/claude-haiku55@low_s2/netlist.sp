.subckt dut iref inp inn out
* Bias: diode-connected reference mirrored to tail (4x) and output sink (6x)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMs out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* First stage: NMOS differential pair with PMOS current-mirror load
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMpa d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMpb d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink
XMp2 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* Miller compensation with nulling resistor
RZ d2 nx 1k
CC nx out 1p
.ends dut
