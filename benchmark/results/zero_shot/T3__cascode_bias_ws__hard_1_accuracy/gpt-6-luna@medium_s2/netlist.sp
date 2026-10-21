.subckt dut iin out vb1 vb2 vb3 vb4
* Reference NMOS and lower diode of the NMOS cascode-bias stack.
XMNREF  iin iin 0   0   sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=10
XMNNBIAS vb3 vb3 vb4 0   sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=10

* PMOS reference and its NMOS current sink.
XMPREF  vp   vp   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=10
XMNPREF vp   vb4  0   0   sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=10

* PMOS cascode-bias stack and its NMOS current sink.
XMPB1   vb1  vb1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=10
XMPB2   vb2  vb2  vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=10
XMNPB   vb2  vb4  0   0   sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=10

* PMOS mirror feeding the NMOS cascode-bias stack.
XMPNBIAS vb3 vp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=10

* NMOS cascode sink: twice the reference-stack device width.
XMNSINK out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=20
XMNSRC  nsrc vb4 0    0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=20

* PMOS cascode source: twice the bias-stack device width.
XMPSRC  psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=20
XMPSINK out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=20
.ends dut
