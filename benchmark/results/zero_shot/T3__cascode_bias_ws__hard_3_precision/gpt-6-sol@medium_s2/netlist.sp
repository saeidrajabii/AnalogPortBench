.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current diode and NMOS mirrors.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=1
XNBIAS1 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=1
XNBIAS2 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=1
XNSINK nsrc iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=20 nf=1 m=1

* PMOS gate-bias diode and cascoded reference branch.
XPBIAS vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=20 nf=1 m=1
XPREF_TOP pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=20 nf=1 m=1
XPREF_CAS vb2 vb2 pref vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=10 nf=1 m=1

* Output current source and sink.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=20 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=10 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1

* NMOS cascode bias; the high-value divider does not load the reference.
RVB3H vdd vb3 670k
RVB3L vb3 0 530k

* Exposed NMOS mirror bias.
RVB4 iin vb4 1m
.ends dut
