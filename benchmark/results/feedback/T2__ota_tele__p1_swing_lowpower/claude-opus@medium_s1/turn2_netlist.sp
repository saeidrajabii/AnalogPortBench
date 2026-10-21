.subckt dut iref inp inn out
* Bias: reference diode (20 uA)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* Tail current source (30 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
* Input differential pair (bulk tied to source)
XM1  x  inp tail tail sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XM2  d1 inn tail tail sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
* PMOS current-mirror load
XM3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM4  x  d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* Second stage: PMOS common source (60 uA) with NMOS current-sink load
XM6  out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
XM7  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=3
* Miller compensation with nulling resistor
Rz   x  nz 2.5k
Cc   nz out 1.75p
.ends dut
