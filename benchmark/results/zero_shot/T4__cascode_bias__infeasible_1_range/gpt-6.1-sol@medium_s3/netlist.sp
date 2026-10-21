.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current sensing: current enters a drain, not a source.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=4 nf=1 m=1

* Mirror the reference into the PMOS bias branch.
XNBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6000 L=4 nf=1 m=1

* Mirror again to generate an independently loaded NMOS gate bias.
XPBIAS vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6000 L=4 nf=1 m=1
XNBIASREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=4 nf=1 m=1

* Low-headroom cascode gate biases.
* Divider currents are negligible relative to the 20-uA reference.
RNHI vdd vb3 900meg
RNLO vb3 vb4 100meg
RPHI vb1 vb2 100meg
RPLO vb2 0 900meg

* NMOS cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=4 nf=1 m=1
XNCASC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=8000 L=4 nf=1 m=1

* PMOS cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6000 L=4 nf=1 m=1
XPCASC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=24000 L=4 nf=1 m=1

.ends dut
