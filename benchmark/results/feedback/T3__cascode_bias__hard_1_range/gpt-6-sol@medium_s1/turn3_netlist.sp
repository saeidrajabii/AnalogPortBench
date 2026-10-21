.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS bias stack and output cascode.
XNREF0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=100
XNREF1 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=100
XNOUT0 nsink vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=100
XNOUT1 out vb3 nsink 0 sky130_fd_pr__nfet_01v8_lvt W=39.28 L=10 nf=1 m=100

* The PMOS reference stack has a separate, saturated NMOS sink.
XNBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=39.3 L=10 nf=1 m=100
XPREF0 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=10 nf=1 m=100
XPREF1 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=10 nf=1 m=100

* Lower the output-cascode gate voltage to provide saturation headroom.
RPG1 vb2 pgate 100k
RPG2 pgate 0 400k
XPOUT0 psource vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=81.8 L=10 nf=1 m=100
XPOUT1 out pgate psource vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=10 nf=1 m=100

RIN iin vb3 1
.ends dut
