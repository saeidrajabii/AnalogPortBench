.subckt dut iin out vb1 vb2 vb3 vb4
* Reference sink and its NMOS mirror
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XMNNREF vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1

* PMOS reference branch and PMOS output-current mirror
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=2 nf=1 m=1
XMPLOW out vb1 npsrc vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=2 nf=1 m=1
XMPCAS npsrc vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=2 nf=1 m=1

* NMOS cascode output-current sink
XMNSINK nnsrc iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XMNCAS out vb3 nnsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1

* Unloaded bias outputs
RVB2H vdd vb2 380k
RVB2L vb2 0 820k
RVB3H vdd vb3 580k
RVB3L vb3 0 620k
RVB4 iin vb4 1G
.ends dut
