.subckt dut iref inp inn out
* Bias: reference diode (iref is mirrored, never injected into a source)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* Tail current source (20 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* Input differential pair (bulk tied to source to remove body effect)
XM1  x  inp tail tail sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2  d1 inn tail tail sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS current-mirror load (diode on inn side)
XM3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4  x  d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Second stage: PMOS common source (60 uA) with NMOS current-sink load
XM6  out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=6
XM7  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=3
* Miller compensation with nulling resistor
Rz   x  nz 2k
Cc   nz out 1p
.ends dut
