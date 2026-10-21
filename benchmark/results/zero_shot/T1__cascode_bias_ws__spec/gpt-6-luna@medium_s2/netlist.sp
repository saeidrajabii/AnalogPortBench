.subckt dut iin out vb1 vb2 vb3 vb4

* Reference current input and NMOS reference
RIN     iin vb4 1m
XMNREF  vb4 vb4 0   0   sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

* PMOS bias vb1 and its mirrored cascode-bias branch vb2
XMPB1   vb1  vb1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMNPS1  vb1  vb4  0   0   sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMPB2L  xpb  vb1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMPB2D  vb2  vb2  xpb vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMNPS2  vb2  vb4  0   0   sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

* NMOS cascode-bias branch
XMPNB   vb3  vb1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMNNL   xn   vb4  0   0   sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMNND   vb3  vb3  xn  0   sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

* Cascode output sink and source
XMNNOUT nsrc vb4  0   0   sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMNCOUT out  vb3  nsrc 0  sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMPPOUT psrc vb1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1
XMPHOUT out  vb2  psrc vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2 nf=1 m=1

.ends dut
