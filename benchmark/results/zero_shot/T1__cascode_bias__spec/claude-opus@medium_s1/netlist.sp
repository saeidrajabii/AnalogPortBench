.subckt dut iin out vb1 vb2 vb3 vb4
* ---------- NMOS self-biased low-voltage cascode reference ----------
* Iref -> iin -> Rs -> vb3 -> R1 -> vb4 = drain of cascode MN3
Rs  iin vb3 1
R1  vb3 vb4 12k
XMN3 vb4 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=2
XMN1 n1  vb4 0  0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=2
* ---------- NMOS copy leg feeding the PMOS self-biased cascode ----------
XMN0 n2  vb4 0  0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=2
XMN2 vb2 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=2
R2  vb1 vb2 12k
XMP0 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP1 p1  vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
* ---------- Output cascode sink / source ----------
XMNO0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=2
XMNO2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=2
XMPO1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XMPO0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
.ends dut
