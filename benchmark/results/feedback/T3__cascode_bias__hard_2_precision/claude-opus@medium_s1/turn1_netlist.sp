.subckt dut iin out vb1 vb2 vb3 vb4
* ---------------- NMOS reference: low-voltage cascode, gate of bottom tied to iin
XN1  nx1  iin vb_dummy0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=8
XN3  iin  vb3 nx1  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=8
Rz   vb_dummy0 0 0.001
R4   iin  vb4 1
* ---------------- NMOS replica sinking Iref out of the PMOS reference
XN0R nx2  vb4 0    0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=8
XN2R vb1  vb3 nx2  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=8
* ---------------- PMOS reference: low-voltage cascode, gate of bottom tied to vb1
XP1R px1  vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=16
XP0R vb1  vb2 px1  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=16
* ---------------- NMOS cascode-gate bias (diode W/L = 1/20 of cascode)
XPB3 vb3  vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=16
XNB3 vb3  vb3 0    0   sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
* ---------------- PMOS cascode-gate bias (diode W/L = 1/20 of cascode)
XNB2 vb2  vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=8
XPB2 vb2  vb2 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* ---------------- Output cascode sink / source
XN0  nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=8
XN2  out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=8
XP1  psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=16
XP0  out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=16
.ends dut
