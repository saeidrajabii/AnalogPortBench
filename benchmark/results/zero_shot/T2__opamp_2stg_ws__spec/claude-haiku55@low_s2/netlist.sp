.subckt dut iref inp inn out
* Bias: NMOS diode on the reference (20 uA). The reference current enters a drain, not a source.
XMb iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail current source, 2x mirror -> ~40 uA
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Second-stage current source, 7.5x mirror -> ~150 uA
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* First stage: NMOS pair with PMOS mirror load
* inn drives the diode-side device M1, so inn is the inverting input overall
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM4 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Second stage: PMOS common source with NMOS current-source load
XM6 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor (values from the source design)
RZ d2 nz 3k
CC nz out 500f
.ends dut
