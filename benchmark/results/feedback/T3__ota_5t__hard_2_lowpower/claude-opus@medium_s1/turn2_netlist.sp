.subckt dut iref inp inn out
* Bias: iref enters the drain of a diode-connected NMOS and is mirrored at 1:2 into the tail
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=16
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=8
* Input pair: wider, deep weak inversion, bulk tied to source to remove body effect
XM1  n9  inp tail tail sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=24
XM2  out inn tail tail sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=24
* PMOS current-mirror load
XM3  n9  n9  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4  out n9  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
