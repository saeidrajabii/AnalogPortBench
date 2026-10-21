.subckt dut iin out vb1 vb2 vb3 vb4
* Generate the NMOS bias from the 20 uA reference current.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=4 nf=1 m=1
RNB iin vb4 1
RNC vb4 vb3 1

* Mirror the reference current into a diode-connected PMOS.
XNPREF vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=4 nf=1 m=1
RPB vb1 vb2 1

* Output current source and sink.
XPOUT out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=4 nf=1 m=1
XNOUT out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=4 nf=1 m=1
.ends dut
