.subckt dut iref inp inn out
* ---------------- bias ----------------
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
XMB2 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMP0 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
* PMOS cascode gate bias (vcp)
XMBA q q vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMBC vcp vcp q q sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB3 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* NMOS cascode gate bias (vcn)
XMP1 vcn pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
XMBN5 vcn vcn r 0 sky130_fd_pr__nfet_01v8_lvt W=1.33 L=0.5 nf=1 m=1
RN r 0 80k
* ---------------- first stage ----------------
XMT s pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=12
XM1 x1 inn s s sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=6
XM2 x2 inp s s sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=6
XM3 d1 vcp x1 x1 sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XM4 o1 vcp x2 x2 sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XM5 d1 vcn y1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM6 o1 vcn y2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM7 y1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM8 y2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* ---------------- second stage ----------------
XM9 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=7
XM10 out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=38
* ---------------- compensation ----------------
RZ o1 cz 2k
CC cz out 0.8p
.ends dut
