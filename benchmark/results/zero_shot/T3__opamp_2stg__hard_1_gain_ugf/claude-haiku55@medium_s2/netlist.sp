.subckt dut iref inp inn out
* Bias: diode-connected NMOS on iref, which sinks the 20 uA ideal reference.
* The reference current enters the drain of MB, not a source.
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source, 1.5x reference (30 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
* First stage: NMOS differential pair (15 uA per side)
* inn drives M1 (feeds the diode-connected side), inp drives M2 (feeds o1)
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* PMOS current mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* Second stage: PMOS common source (about 180 uA) with NMOS current sink
XM6 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1 nf=1 m=1
* Miller compensation with nulling resistor (zero placed near the second-stage pole)
RZ o1 ncz 1.8k
CC ncz out 400f
.ends dut
