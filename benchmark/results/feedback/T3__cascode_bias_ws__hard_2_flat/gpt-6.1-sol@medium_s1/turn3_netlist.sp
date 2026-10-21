.subckt dut iin out vb1 vb2 vb3 vb4

* Diode-connected reference; parallel devices limit individual width.
Rgate iin vb4 1
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=8 nf=1 m=100

* Cascoded reference-current mirror.
XNCONV_LO nconv vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=8 nf=1 m=100
XNCONV_HI vb1 vb3 nconv 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=8 nf=1 m=100
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=8 nf=1 m=100

* NMOS cascode bias.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=8 nf=1 m=100
XNBIAS vb3 vb3 nbias_src 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=8 nf=1 m=100
RNBIAS nbias_src 0 4k

* PMOS cascode bias.
XNPBIAS_LO npbias vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=8 nf=1 m=100
XNPBIAS_HI vb2 vb3 npbias 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=8 nf=1 m=100
RPBIAS vdd pbias_src 4k
XPBIAS vb2 vb2 pbias_src vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=8 nf=1 m=100

* Output cascode current sink.
XNOUT_LO nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=8 nf=1 m=100
XNOUT_HI out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=8 nf=1 m=100

* Output cascode current source.
XPOUT_HI psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=8 nf=1 m=100
XPOUT_LO out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=8 nf=1 m=100

.ends dut
