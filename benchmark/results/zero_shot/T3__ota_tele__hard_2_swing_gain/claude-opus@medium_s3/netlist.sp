.subckt dut iref inp inn out
* --- NMOS bias mirror (unit W=8 L=2, about 5 uA per unit) ---
XMB1 iref iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=4
XMT  tail iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=3
XM7  out  iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=7
* --- first stage: NMOS differential pair with PMOS mirror load ---
XM1  d1   inn  tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1
XM2  o1   inp  tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1
XM3  d1   d1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=3
XM4  o1   d1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=3
* --- second stage: PMOS common-source output ---
XM6  out  o1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=14
* --- Miller compensation with nulling resistor ---
Rz   o1   nz   3.5k
Cc   nz   out  1p
.ends dut
