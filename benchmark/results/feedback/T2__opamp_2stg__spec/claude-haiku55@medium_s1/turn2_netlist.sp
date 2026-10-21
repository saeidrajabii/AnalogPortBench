.subckt dut iref inp inn out
* ---- Bias: diode-connected reference (20 uA sink from iref) ----
XMb0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* ---- Tail current source: 3x mirror -> 60 uA ----
XMt  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3

* ---- First-stage differential pair (30 uA per side) ----
* M1: inp drives the device whose drain is the first-stage output o1 (non-diode side)
* M2: inn drives the device whose drain is the diode side d1
XM1 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XM2 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* ---- First-stage PMOS mirror load (30 uA per side) ----
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* ---- Second stage: PMOS common-source driver (150 uA) ----
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1 nf=1 m=1

* ---- Second-stage NMOS current sink (7.5x mirror -> 150 uA) ----
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* ---- Miller compensation with nulling resistor ----
RZ x o1 1k
CC x out 1.5p
.ends dut
