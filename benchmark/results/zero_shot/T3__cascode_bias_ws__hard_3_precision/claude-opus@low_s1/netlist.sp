.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference: self-biased wide-swing cascode (Iin enters a drain) ----
Rn   iin vb4 8k
XNC0 vb4 iin nr0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XNB0 nr0 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
* vb3 = gate of the NMOS cascodes = iin node (alias via 0-ohm-like short)
Rv3  iin vb3 1m
* ---- NMOS copy branch feeding the PMOS reference ----
XNB1 nr1 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XNC1 vb2 vb3 nr1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
* ---- PMOS reference: self-biased wide-swing cascode ----
Rp   vb1 vb2 7k
XPC0 vb1 vb2 pr0 vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1 nf=1 m=4
XPB0 pr0 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1 nf=1 m=4
* ---- Output NMOS cascode sink ----
XMN0 nsrc vb4 0    0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMN2 out  vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
* ---- Output PMOS cascode source ----
XMP1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1 nf=1 m=4
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1 nf=1 m=4
.ends dut
