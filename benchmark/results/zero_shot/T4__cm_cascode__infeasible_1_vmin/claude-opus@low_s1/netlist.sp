.subckt CM_N_lvcascode in out
* Reference branch: in -> R -> nA ; cascode M3 gate=in, bottom M1 gate=nA
R1  in nA 8k
XM3 nA in n1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM1 n1 nA 0 0  sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Output branch
XM2 out in n2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM0 n2 nA 0 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends CM_N_lvcascode

.subckt dut in out
XI0 in out CM_N_lvcascode
.ends dut
