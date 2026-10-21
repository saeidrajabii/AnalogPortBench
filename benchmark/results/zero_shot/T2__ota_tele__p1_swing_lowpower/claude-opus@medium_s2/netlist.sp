.subckt dut iref inp inn out
* ---- bias: 20 uA reference mirrored (unit device = 10 uA) ----
XMB1 iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
XMT  tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=3
* ---- first stage: NMOS diff pair (bulk tied to source) + PMOS mirror ----
XM1  x1   inn  tail tail sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2  o1   inp  tail tail sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM3  x1   x1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM4  o1   x1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* ---- second stage: PMOS common source + NMOS current-sink load ----
XM6  out  o1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
XM7  out  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=6
* ---- Miller compensation with nulling resistor ----
Rc   o1   nc   2k
Cc   nc   out  1.5p
.ends dut
