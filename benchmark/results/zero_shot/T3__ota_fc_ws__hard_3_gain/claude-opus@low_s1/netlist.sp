.subckt dut iref inp inn out
* ---- bias ----
XMB0  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMB1  vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMB2  vbp  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS cascode bias
XMB3  vcn  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMBCN vcn  vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1
* PMOS cascode bias
XMB4  vcp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMBCP vcp  vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* ---- OTA ----
XMT   tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1   f1 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2   f2 inn tail tail sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMS1  f1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMS2  f2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMC1  n1 vcn f1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMC2  out vcn f2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP3  n1 vcp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP4  out vcp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP1  p1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP2  p2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
