.subckt Cascode_Bias_WS iref vbp vb3 vb4
XMR   iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4
XMS1  nb1  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMS2  vbp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XPL   vbp  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=2 nf=1 m=1
XPD   nb1  nb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XP3   vb3  nb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XP4   vb4  nb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XN8   vb3  vb3  0    0   sky130_fd_pr__nfet_01v8_lvt W=1.5 L=4 nf=1 m=1
XN9   vb4  vb3  n10  0   sky130_fd_pr__nfet_01v8_lvt W=3 L=0.8 nf=1 m=1
XN10  n10  vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=3 L=0.8 nf=1 m=1
.ends Cascode_Bias_WS

.subckt Opamp_2stg vbn vbp vb3 vb4 vm vout vp
XMT   tail vbn  0    0   sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=8
XM1   n08  vp   tail 0   sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1
XM2   n9   vm   tail 0   sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1
XP1   n9   n9   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.6 nf=1 m=1
XP0   n08  n9   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.6 nf=1 m=1
XP2   nx   n08  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=16
XPC   vout vbp  nx   vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=16
XN5   vout vb3  n1   0   sky130_fd_pr__nfet_01v8_lvt W=3 L=0.8 nf=1 m=24
XN4   n1   vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=3 L=0.8 nf=1 m=24
RZ    n08  nc   3k
CC    nc   vout 500f
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vbp vb3 vb4 Cascode_Bias_WS
XI1 iref vbp vb3 vb4 inn out inp Opamp_2stg
.ends dut
