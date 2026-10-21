.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current is converted to a voltage by a diode-connected
* NMOS; it does not enter a transistor source.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Establish the PMOS mirror reference with a matched NMOS branch.
XNBIAS pb iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Matched output current sink and source.
XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XPSOURCE out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Unloaded bias outputs.
RVB1 pb vb1 1
RVB2 pb vb2 1
RVB3 iin vb3 1
RVB4 iin vb4 1
.ends dut
