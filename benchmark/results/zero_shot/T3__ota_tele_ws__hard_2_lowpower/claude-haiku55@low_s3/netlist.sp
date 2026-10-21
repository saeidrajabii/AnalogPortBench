.subckt dut iref inp inn out
* Tail current mirror: 20 uA reference, tail = 2x (40 uA)
XMR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2

* Input differential pair
XM1  C inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2  F inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Left branch (inp side): PMOS load, PMOS cascode, NMOS cascode
XMPL1 A vbpl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPC1 B vbpc A   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNC1 B vbnc C   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Right branch (inn side): gate of PMOS load driven by left node B,
* so inp drives out non-inverting and inn drives out inverting
XMPR1 E B   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPC2 out vbpc E vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNC2 out vbnc F 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Cascode/load bias generation (resistive dividers, no DC current into gates)
Rn1 vdd  vbnc 1Meg
Rn2 vbnc 0    3Meg
Rp1 vdd  vbpc 3Meg
Rp2 vbpc 0    1Meg
Rl1 vdd  vbpl 1.4Meg
Rl2 vbpl 0    1Meg

* Output load is external (1 pF); no element connects inp directly to out
.ends dut
