.subckt dut iin out vb1 vb2 vb3 vb4
* The input current establishes the NMOS mirror bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=198 L=5 nf=1 m=1

* An NMOS mirror branch draws current through the diode-connected PMOS.
* The ideal reference current does not enter a transistor source.
XNBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=198 L=5 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=5 nf=1 m=1
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=5 nf=1 m=1

* Unloaded auxiliary bias outputs.
RBIAS1 vdd vb2 100k
RBIAS2 vb2 vb3 100k
RBIAS3 vb3 vb4 100k
RBIAS4 vb4 0 100k
.ends dut
