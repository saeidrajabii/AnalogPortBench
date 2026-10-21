.subckt dut iref inp inn out
* Bias: diode-connected reference at iref (current enters the drain, not a source)
XMR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail current source, 2x reference (about 40 uA)
XMT  tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* NMOS input differential pair (inp is non-inverting, inn is inverting)
XM1  d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2  n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS current-mirror active load for the first stage
XP1  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XP2  n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Second stage: PMOS common-source with NMOS current sink (about 100 uA)
XP3  out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XN3  out vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Miller compensation with nulling resistor
RZ   n1 cz 1k
CC   cz out 0.5p
.ends dut
