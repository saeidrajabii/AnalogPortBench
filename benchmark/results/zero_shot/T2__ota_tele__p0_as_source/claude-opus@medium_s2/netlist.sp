.subckt dut iref inp inn out
* ---- bias: mirror the 20 uA reference (unit nfet W=15 L=1) ----
XMB  iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=15 L=1   nf=1 m=4
XMT  tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=15 L=1   nf=1 m=8
* ---- first stage: NMOS diff pair, PMOS mirror load ----
XM1  d1   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=2
XM2  o1   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=2
XM3  d1   d1   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8  L=0.5 nf=1 m=2
XM4  o1   d1   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8  L=0.5 nf=1 m=2
* ---- second stage: PMOS common source, NMOS current-sink load ----
XM6  out  o1   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8  L=0.5 nf=1 m=15
XM7  out  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=15 L=1   nf=1 m=30
* ---- Miller compensation with nulling resistor ----
RZ   o1   nc   1.2k
CC   nc   out  1p
.ends dut
