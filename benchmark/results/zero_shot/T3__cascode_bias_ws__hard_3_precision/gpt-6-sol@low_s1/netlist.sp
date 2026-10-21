.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and output mirror
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XNOUT nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XNCOUT out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* A mirrored reference current biases the PMOS mirror
XNPBIAS vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPCREF vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1

* PMOS output mirror and its cascode
XPOUT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPCOUT out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1

* A mirrored PMOS current biases the NMOS cascode gate
XP NBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XNBIAS nref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XNCBIAS vb3 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Expose the NMOS mirror gate as vb4 without drawing DC current
RVB4 iin vb4 1
.ends dut
