.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference driven by the 20 uA iref
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source, mirror ratio 1 (about 20 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Second-stage current sink, mirror ratio 4 (about 80 uA)
XMS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4

* First stage: NMOS differential pair with PMOS mirror load
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XP1 n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XP0 n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Second stage: PMOS common source driving out
XP2 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor
RR0 n1 nz 4k
CC0 nz out 350f
.ends dut
