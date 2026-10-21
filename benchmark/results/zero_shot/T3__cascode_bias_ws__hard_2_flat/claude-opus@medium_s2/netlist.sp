.subckt dut iin out vb1 vb2 vb3 vb4
* ---------- NMOS wide-swing cascode reference (self-biased by R1) ----------
R1    iin  vb4  8k
XMNcr vb4  iin  nr   0   sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=4
XMNbr nr   vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=4
Rtie  iin  vb3  1
* ---------- NMOS copy branch feeding the PMOS reference ----------
XMNcc vb2  vb3  nc   0   sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=4
XMNbc nc   vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=4
* ---------- PMOS wide-swing cascode reference (self-biased by R2) ----------
R2    vb1  vb2  8k
XMPcr vb1  vb2  pr   vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=8
XMPbr pr   vb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=8
* ---------- Output: NMOS cascode sink ----------
XMN0  nsrc vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=4
XMN2  out  vb3  nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=4
* ---------- Output: PMOS cascode source ----------
XMP1  psrc vb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=8
XMP0  out  vb2  psrc vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=8
.ends dut
