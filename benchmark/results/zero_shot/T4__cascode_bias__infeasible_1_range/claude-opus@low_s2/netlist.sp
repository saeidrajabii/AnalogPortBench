.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference: low-voltage (self-biased) cascode ----
RR0  iin vb3 1
RN   vb3 vb4 6k
XMN3 vb4 vb3 nr  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN1 nr  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* ---- NMOS mirror branch feeding the PMOS reference ----
XMN4 nm  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN5 vb2 vb3 nm  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* ---- PMOS reference: low-voltage (self-biased) cascode ----
RP   vb1 vb2 6k
XMP1 pr  vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMP0 vb1 vb2 pr  vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
* ---- Output cascodes ----
XMN0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP2 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMP3 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
.ends dut
