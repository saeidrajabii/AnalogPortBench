.subckt dut iref inp inn out
* ---------------- bias: 20uA reference mirrored (unit = 5uA) ----------------
XMR  iref iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=4
XMT  tail iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
XMS  out  iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=7
* ---------------- first stage: degenerated NMOS pair, PMOS mirror load -----
XM1  d1   inn  s1   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=4
XM2  o1   inp  s2   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=4
R1   s1   tail 5k
R2   s2   tail 5k
XM3  d1   d1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM4  o1   d1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* ---------------- second stage: PMOS common source, NMOS sink ---------------
XM5  out  o1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=7
* ---------------- Miller compensation with nulling resistor -----------------
Rz   o1   nz   3k
Cc   nz   out  0.4p
.ends dut
