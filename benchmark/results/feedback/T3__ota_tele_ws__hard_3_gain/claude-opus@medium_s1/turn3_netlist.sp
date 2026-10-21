.subckt dut iref inp inn out
* ---------------- bias ----------------
XMR   iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=2
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=5
XMS7  out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20.8 L=2 nf=1 m=14
XMSB1 vcp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMSB2 vpd  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMB   vcp  vcp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.2 L=1 nf=1 m=1
XMPD  vpd  vpd  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1
XMPS  vcn  vpd  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1
XMD2  vcn  vcn  nd1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMD1  nd1  nd1  0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* ---------------- stage 1: cascoded diff pair ----------------
XM1   d1 inn tail tail sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=4
XM2   d2 inp tail tail sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=4
XM1C  y  vcn d1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2C  x  vcn d2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM3C  y  vcp s3 vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1 nf=1 m=1
XM4C  x  vcp s4 vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1 nf=1 m=1
XM3   s3 y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XM4   s4 y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
* ---------------- stage 2 + Miller compensation ----------------
XM6   out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.5 nf=1 m=7
Rz    x  nz 1.2k
Cc    nz out 1.3p
.ends dut
