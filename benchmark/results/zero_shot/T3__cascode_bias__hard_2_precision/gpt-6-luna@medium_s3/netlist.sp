.subckt dut iin out vb1 vb2 vb3 vb4
RIN   iin vb4 1
RVB1  vb1 vb2 1
RVB3  vb3 vb4 1

XMNREF  vb4  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=20
XMNPM   vb1  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=20
XMPREF  vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=20

XMNOUT  out  vb3  0    0    sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=20
XMPOUT  out  vb2  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=20
.ends dut
