.subckt dut iref inp inn out
* ---- bias: 20 uA reference mirrored (NMOS unit W=8 L=2, 2 uA per unit) ----
XM0  iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8  L=2   nf=1 m=10
XM5  tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8  L=2   nf=1 m=10
* ---- stage 1: NMOS input pair, low-voltage cascode PMOS mirror load ----
XM1  d1   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=2   nf=1 m=8
XM2  o1   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=2   nf=1 m=8
XM3  a1   d1   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1   nf=1 m=1
XM3c d1   iref a1   vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XM4  a2   d1   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1   nf=1 m=1
XM4c o1   iref a2   vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
* ---- stage 2: PMOS common source (same unit as XM3/XM4), NMOS current-sink load ----
XM6  out  o1   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1   nf=1 m=4
XM7  out  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=8  L=2   nf=1 m=20
* ---- Miller compensation with LHP-zero nulling resistor ----
Rz   o1   nz   5k
Cc   nz   out  1p
.ends dut
