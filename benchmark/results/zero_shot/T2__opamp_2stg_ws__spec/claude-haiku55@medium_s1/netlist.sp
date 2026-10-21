.subckt dut iref inp inn out
* Bias: diode-connected reference mirrored from iref (20 uA)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source, 3x mirror = 60 uA
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=3
* Second-stage NMOS current sink, 10x mirror = 200 uA
XMss out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=10

* First stage: NMOS differential pair with PMOS mirror load
* inn drives the diode-side device (M1); inp drives the output-side device (M2)
XM1 dL inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM3 dL dL vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM4 n1 dL vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Second stage: PMOS common-source driven from n1, NMOS current-sink load
XM5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor (n1 -> Rz -> Cc -> out)
RZ n1 cz 1k
CC cz out 1p
.ends dut
