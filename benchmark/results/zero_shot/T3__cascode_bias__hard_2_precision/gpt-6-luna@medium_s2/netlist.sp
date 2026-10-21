.subckt dut iin out vb1 vb2 vb3 vb4
RIN   iin vb4 1m
RVB12 vb1 vb2 1m
RVB34 vb3 vb4 1m

* NMOS reference and sink mirror
XMNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=500 nf=1 m=1
XMNSNK out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=500 nf=1 m=1

* PMOS reference and source mirror
XMNSER vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=500 nf=1 m=1
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25000 L=500 nf=1 m=1
XMPSRC out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25000 L=500 nf=1 m=1
.ends dut
