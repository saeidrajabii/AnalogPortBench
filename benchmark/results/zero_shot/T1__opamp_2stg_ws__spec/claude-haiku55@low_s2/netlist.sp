.subckt dut iref inp inn out
* Bias: diode-connected reference (20 uA from iref)
XMr iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* Tail mirror, 2x reference (40 uA)
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Second-stage current sink, 5x reference (100 uA)
XMs out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* First stage: NMOS differential pair with PMOS mirror load
* inp drives the non-inverting path (drain n1), inn the diode side (drain na)
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XM2 na inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XM3 na na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XM4 n1 na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Second stage: PMOS common-source driven by n1, NMOS current sink
XM6 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Miller compensation with nulling resistor (out-to-inn is the only feedback path)
RZ n1 nx 1.5k
CC nx out 1p
.ends dut
