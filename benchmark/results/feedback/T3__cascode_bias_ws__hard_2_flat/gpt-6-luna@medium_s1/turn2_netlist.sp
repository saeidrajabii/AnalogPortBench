.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and output sink mirror
XMNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=16000 L=20 nf=1 m=1
XMNS out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=16000 L=20 nf=1 m=1

* PMOS reference branch is biased by the NMOS mirror; output source mirror
XMPR vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32000 L=20 nf=1 m=1
XMPS out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32000 L=20 nf=1 m=1

* Unloaded bias outputs
RVB2 vb2 vb1 1m
RVB3 vb3 iin 1m
RVB4 vb4 iin 1m
.ends dut
