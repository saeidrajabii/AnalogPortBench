.subckt dut iref inp inn out
* Bias: iref is the drain and gate of the reference diode (20 uA sunk to ground).
* The gate node iref is the NMOS mirror bias (vbn).
XMref  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Tail current source, ratio 3 -> about 60 uA
XMtail tn iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* First stage: NMOS differential pair (inn drives the diode side, inp drives the output side)
XMinn d1 inn tn 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMinp o1 inp tn 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS current-mirror active load
XMpd  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMpm  o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink, ratio 6 -> about 120 uA
XMcs  out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMs2  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
* Miller compensation with nulling resistor (feeds o1 to out, not inp to out)
Rz o1 nz 1.4k
Cc nz out 1p
.ends dut
