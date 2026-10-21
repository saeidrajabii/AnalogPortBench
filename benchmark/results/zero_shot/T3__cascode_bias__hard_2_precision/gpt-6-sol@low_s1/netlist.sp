.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference stack; the 20 uA reference current enters at iin.
XNREF0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1
XNREF1 iin vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1
RNB iin vb3 1

* Mirror the reference into a diode-connected PMOS bias stack.
XNMIR pb vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1
XPREF0 pb vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=10 nf=1 m=1
XPREF1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=10 nf=1 m=1
RPB pb vb2 1

* Cascoded output sink and source.
XNOUT0 ns vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1
XNOUT1 out vb3 ns 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1
XPOUT1 ps vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=10 nf=1 m=1
XPOUT0 out vb2 ps vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=10 nf=1 m=1
.ends dut
