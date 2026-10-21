.subckt dut iref inp inn out
* ---- bias: iref into stacked NMOS diodes -> vb4 (mirror gate) and iref node (cascode gate) ----
XMB1 vb4  vb4  0   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMB2 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.25 nf=1 m=1
* ---- first stage: NMOS pair, PMOS mirror load, 40 uA tail ----
XMT  tail vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1  n1   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2  n2   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM3  n2   n2   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM4  n1   n2   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* ---- second stage: PMOS CS, cascoded NMOS sink (150 uA) ----
XM6  out  n1   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=10
XM7  out  iref nc   0   sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.25 nf=1 m=10
XM8  nc   vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=7.5 L=1 nf=1 m=10
* ---- Miller compensation with zero-placing resistor ----
RZ   n1   nz   1.5k
CC   nz   out  0.7p
.ends dut
