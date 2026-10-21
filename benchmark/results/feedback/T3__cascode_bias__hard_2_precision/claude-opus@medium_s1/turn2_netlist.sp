.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference: low-voltage cascode, drain lifted to ~0.9 V by a source follower
XN1  nx1  vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=16
XN3  iin  vb3 nx1  0   sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=16
XF   vdd  iin vb4  0   sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XS   vb4  vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=2
* ---- NMOS replica sinking Iref out of the PMOS reference
XN0R nx2  vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=16
XN2R vb1  vb3 nx2  0   sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=16
* ---- PMOS reference: cascode drain dp ~0.9 V, gate tap vb1 one IR drop below
XP1R px1  vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=32
XP0R dp   vb2 px1  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=32
RL   dp   vb1 7.5k
* ---- NMOS cascode-gate bias (diode W/L = 1/20 of cascode)
XPB3 vb3  vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=32
XNB3 vb3  vb3 0    0   sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1
* ---- PMOS cascode-gate bias (diode W/L = 1/20 of cascode)
XNB2 vb2  vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=16
XPB2 vb2  vb2 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
* ---- Output cascode sink / source
XN0  nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=16
XN2  out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=16
XP1  psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=32
XP0  out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=32
.ends dut
