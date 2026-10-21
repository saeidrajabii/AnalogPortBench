.subckt dut iref inp inn out
* ---------------- bias: reference mirror (iref -> diode) ----------------
XMR  iref iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=5
XMT  tail iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=5
XM7  out  iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=11
* ---------------- NMOS cascode gate bias (diode stack) ----------------
RB   vdd  vbn  91k
XMB1 vbn  vbn  nb   0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMB2 nb   nb   0    0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=3
* ---------------- first stage: cascoded NMOS pair, PMOS mirror load ----------------
XM1  d1   inn  tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XM2  d2   inp  tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XM3  dg   vbn  d1   0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XM4  o1   vbn  d2   0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XM5  dg   dg   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=2
XM6L o1   dg   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=2
* ---------------- second stage: PMOS common source ----------------
XM6  out  o1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=9
* ---------------- Miller compensation with nulling resistor ----------------
RZ   o1   nz   7k
CC   nz   out  1.2p
.ends dut
