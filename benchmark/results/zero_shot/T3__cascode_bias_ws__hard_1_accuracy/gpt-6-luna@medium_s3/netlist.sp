.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and output sink
XMNREF  iin  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=400 L=10 nf=1 m=1
XMNOUT  out  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=400 L=10 nf=1 m=1

* PMOS reference branch and output source
XMNSRC  vb1  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=400 L=10 nf=1 m=1
XMPREF  vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
XMPOUT  out  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1

* Additional bias outputs
XMNSRC2 vb2  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=400 L=10 nf=1 m=1
XMPREF2 vb2  vb2  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1

XMPBIAS vb3  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
XMNDIREF vb3 vb3  0    0    sky130_fd_pr__nfet_01v8_lvt W=400 L=10 nf=1 m=1

* vb4 is the NMOS reference bias node
XMNDUMMY vb4 iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=400 L=10 nf=1 m=1
.ends dut
