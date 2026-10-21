.subckt dut iin out vb1 vb2 vb3 vb4

* Diode-connected NMOS reference; reference current enters its drain.
Rgate iin vb4 0
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=8 nf=1 m=1

* Cascoded NMOS mirror generates the PMOS reference current.
XNCONV_LO nconv vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=8 nf=1 m=1
XNCONV_HI vb1 vb3 nconv 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=8 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3600 L=8 nf=1 m=1

* NMOS cascode bias: mirrored current through a source-offset replica.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3600 L=8 nf=1 m=1
XNBIAS vb3 vb3 nbias_src 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=8 nf=1 m=1
RNBIAS nbias_src 0 4k

* PMOS cascode bias: mirrored sink through a source-offset replica.
XNPBIAS_LO npbias vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=8 nf=1 m=1
XNPBIAS_HI vb2 vb3 npbias 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=8 nf=1 m=1
RPBIAS vdd pbias_src 4k
XPBIAS vb2 vb2 pbias_src vdd sky130_fd_pr__pfet_01v8_lvt W=3600 L=8 nf=1 m=1

* Output cascode current sink.
XNOUT_LO nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=8 nf=1 m=1
XNOUT_HI out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=8 nf=1 m=1

* Output cascode current source.
XPOUT_HI psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3600 L=8 nf=1 m=1
XPOUT_LO out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=3600 L=8 nf=1 m=1

.ends dut
