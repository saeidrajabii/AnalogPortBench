.subckt dut iin out vb1 vb2 vb3 vb4
* ---------- NMOS low-voltage cascode reference (Iin -> R1 -> cascode drain) ----------
R1    iin  vb4  6.5k
XMN3R vb4  vb3  n1   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=30
XMN1R n1   vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=15
* ---------- NMOS replica feeding the PMOS reference ----------
XMN9  pref vb3  n8   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=30
XMN8  n8   vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=15
* ---------- PMOS low-voltage cascode reference ----------
R2    vb1  vb2  6.5k
XMP3R vb1  vb2  p1   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=30
XMP1R p1   vb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=20
Rlink vb2  pref 1
* ---------- Output NMOS cascode sink ----------
XMN0  nsrc vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=15
XMN2  out  vb3  nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=30
* ---------- Output PMOS cascode source ----------
XMP1  psrc vb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=20
XMP0  out  vb2  psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=30
.ends dut
