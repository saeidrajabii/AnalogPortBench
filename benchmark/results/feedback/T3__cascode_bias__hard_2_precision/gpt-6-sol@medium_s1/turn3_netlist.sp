.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current flows into a diode-connected NMOS. Long-channel,
* equal-sized devices reduce drain-voltage-dependent mirror error.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=500 nf=1 m=1
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=500 nf=1 m=1

* A second NMOS mirror branch establishes the PMOS reference current.
XNCOPY vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=500 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40000 L=500 nf=1 m=1
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40000 L=500 nf=1 m=1

* Unloaded bias-voltage outputs.
RVB2 vb2 vb1 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
