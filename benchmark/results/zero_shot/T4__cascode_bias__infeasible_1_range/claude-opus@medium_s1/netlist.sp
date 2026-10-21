.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS low-voltage cascode reference (Iref enters drain of MN3 via R) ----
RIN  iin vb3 1
RN   vb3 vb4 10k
XMN3 vb4 vb3 nm  0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=80
XMN1 nm  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=80
* ---- NMOS replica cascode sink feeding the PMOS reference ----
XMN2 vb2 vb3 nr  0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=80
XMN0 nr  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=80
* ---- PMOS low-voltage cascode reference ----
RP   vb1 vb2 10k
XMP0 vb1 vb2 ps  vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=240
XMP1 ps  vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=240
* ---- output cascode sink and source ----
XMNO2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=83
XMNO0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=83
XMPO0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=240
XMPO1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=240
* ---- out-sensing compensation: source-degenerated NMOS draws a small current from vb1 ----
XMX  vb1 out xs 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
RX   xs  0  430k
.ends dut
