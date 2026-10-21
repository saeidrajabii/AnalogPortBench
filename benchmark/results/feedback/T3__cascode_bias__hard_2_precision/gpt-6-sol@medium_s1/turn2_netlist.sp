.subckt dut iin out vb1 vb2 vb3 vb4
* Generate unloaded cascode-gate bias voltages.
RNBH vdd vb3 110k
RNBL vb3 0 100k
RPBH vdd vb2 100k
RPBL vb2 0 110k

* The reference current enters the drain of the NMOS reference stack.
* Its bottom device establishes vb4; neither output branch is connected
* directly to iin.
XNREF1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XNREF2 iin vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1

* Replicate the NMOS reference current at the output.
XNOUT1 ns vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XNOUT2 out vb3 ns 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1

* A second copy sinks the current through the PMOS reference stack.
XNCOPY1 ncs vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XNCOPY2 vb1 vb3 ncs 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1

* PMOS reference and output cascode current source.
XPREF1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1
XPREF2 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1
XPOUT1 ps vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1
XPOUT2 out vb2 ps vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1
.ends dut
