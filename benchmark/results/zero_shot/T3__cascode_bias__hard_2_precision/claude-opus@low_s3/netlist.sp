.subckt dut iin out vb1 vb2 vb3 vb4
* ---------- NMOS self-biased (wide-swing) cascode reference ----------
* Iref enters iin (=vb3 through 1 ohm), flows through Rn into drain of cascode MN3
RIN  iin  vb3  1
RN   vb3  vb4  12k
XMN3 vb4  vb3  n1   0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMN1 n1   vb4  0    0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* ---------- NMOS mirror feeding the PMOS reference branch ----------
XMN5 vb2  vb3  n2   0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMN4 n2   vb4  0    0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* ---------- PMOS self-biased (wide-swing) cascode reference ----------
RP   vb1  vb2  7.5k
XMP3 vb1  vb2  p1   vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMP4 p1   vb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* ---------- Output cascode sink / source ----------
XMN0 nsrc vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMN2 out  vb3  nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMP1 psrc vb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMP0 out  vb2  psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
.ends dut
