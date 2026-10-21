.subckt dut iref inp inn out
* Reference mirror and differential-pair tail
XREF  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XTAIL tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1

* Differential pair with PMOS current-mirror load
XINP  nref inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=300 L=2 nf=1 m=1
XINN  out  inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=300 L=2 nf=1 m=1
XPL   nref nref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=1
XPR   out  nref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=1
.ends dut
