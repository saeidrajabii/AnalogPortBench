.subckt dut iref inp inn out
* ---- bias: mirror the 20 uA reference (unit nfet W=8 L=2, 2.5 uA/unit) ----
XMref iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=8
XMt   tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=6
* ---- stage 1: NMOS differential pair, PMOS mirror load ----
XM1   d    inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=5
XM2   x    inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=5
XM3   d    d    vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=3
XM4   x    d    vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=3
* ---- stage 2: PMOS common source, NMOS current-sink load ----
XM5   out  x    vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=14
XM6   out  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=14
* ---- Miller compensation with nulling resistor ----
Rz    x    ncz  4k
Cc    ncz  out  0.8p
.ends dut
