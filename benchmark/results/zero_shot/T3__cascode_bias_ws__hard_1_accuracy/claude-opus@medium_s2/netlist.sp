.subckt dut iin out vb1 vb2 vb3 vb4
* ---------------- NMOS reference: self-biased wide-swing cascode ----------------
* Iref enters iin (= vb3), drops I*R across R1 to vb4 and flows into MN9's drain.
R1   iin vb4 8k
Rvb3 iin vb3 1
XMN9  vb4 vb3 n10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=8
XMN10 n10 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=8

* ---------------- NMOS cascode copy feeding the PMOS reference ----------------
XMN5  vb2 vb3 n11 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=8
XMN6  n11 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=8

* ---------------- PMOS reference: self-biased wide-swing cascode ----------------
XMP3  n13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=10
XMP2  vb1 vb2 n13 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=10
R2    vb1 vb2 8k

* ---------------- Output cascode sink / source ----------------
XMN0  nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=8
XMN2  out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=8
XMP1  psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=10
XMP0  out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=10
.ends dut
