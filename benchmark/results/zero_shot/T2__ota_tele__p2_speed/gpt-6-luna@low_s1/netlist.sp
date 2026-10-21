.subckt dut iref inp inn out
XREF   iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4  L=0.6 nf=1 m=1
XTAIL  tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XINP   d1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XINN   out  inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XLOAD1 d1   d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XLOAD2 out  d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
.ends dut
