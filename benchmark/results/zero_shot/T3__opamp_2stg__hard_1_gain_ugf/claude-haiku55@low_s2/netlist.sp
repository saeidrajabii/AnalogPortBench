.subckt dut iref inp inn out
* ---- Bias: 20 uA reference mirrored from iref ----
* Diode-connected reference, current enters at drain (not source)
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source: 2x reference -> 40 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Second-stage current sink: 6x reference -> 120 uA
XMB5 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* ---- First stage: NMOS differential pair with PMOS mirror load ----
* Non-inverting path: inp -> net08 (same polarity as the source design)
XM1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP2 net08 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---- Second stage: PMOS common-source with NMOS current sink ----
XP3 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=2

* ---- Miller compensation with nulling resistor ----
RZ net08 ncc 3k
CC ncc out 500f
.ends dut
