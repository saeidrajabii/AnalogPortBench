.subckt dut iref inp inn out
* Bias: NMOS diode at iref sinks the 20 uA reference (not into a source terminal)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.76 L=1 nf=1 m=1
* Tail current source, 3x mirror of reference (about 60 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11.3 L=1 nf=1 m=1
* Second-stage NMOS current sink, 6x mirror (about 120 uA)
XM5 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=22.6 L=1 nf=1 m=1
* NMOS differential pair (about 30 uA per side)
XM1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=15.7 L=1 nf=1 m=1
XM2 net9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=15.7 L=1 nf=1 m=1
* PMOS current-mirror load of the first stage
XMp1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XMp0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
* PMOS second-stage common-source amplifier
XMp2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=1 nf=1 m=1
* Miller compensation with nulling resistor
CC0 net012 out 500f
RR0 net08 net012 3k
.ends dut
