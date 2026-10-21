.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference diode and matched output sink
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XMNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1

* PMOS diode reference, biased by the NMOS reference-current mirror
XMNSINKREF vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1
XMPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1

* Bias outputs; the testbench leaves these unloaded
RVB2 vb2 vb1 1m
RVB3 vb3 iin 1m
RVB4 vb4 iin 1m
.ends dut
