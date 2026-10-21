.subckt dut iref inp inn out
* Bias: diode-connected reference (20 uA) and mirrors
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* Stage-1 tail mirror (40 uA)
XMB1 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
* Stage-2 output current sink (100 uA)
XMO out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Stage 1: NMOS differential pair
XM1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XM2 net9  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* Stage 1: PMOS mirror load (20 uA per branch)
XMP1 net9  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* Stage 2: PMOS common-source driver (5x stage-1 load, about 100 uA)
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1

* Miller compensation with nulling resistor (net08 -> RZ -> CC -> out)
RZ net08 ncz 3k
CC ncz out 0.5p
.ends dut
