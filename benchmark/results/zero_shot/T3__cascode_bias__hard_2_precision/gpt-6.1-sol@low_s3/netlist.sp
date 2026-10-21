.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current sensing and NMOS reference cascode.
* The reference current enters a drain, not a source.
RIN iin vb4 1m
XNREF0 nr vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=40 nf=1 m=1000
XNREF1 iin vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=40 nf=1 m=1000

* NMOS output cascode current sink.
XNOUT0 ns vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=40 nf=1 m=1000
XNOUT1 out vb3 ns 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=40 nf=1 m=1000

* Mirrored reference-current sink for the PMOS reference branch.
XNPR0 npr vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=40 nf=1 m=1000
XNPR1 vb1 vb3 npr 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=40 nf=1 m=1000

* PMOS reference cascode.
XPREF0 pr vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=40 nf=1 m=1000
XPREF1 vb1 vb2 pr vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=40 nf=1 m=1000

* PMOS output cascode current source.
XPOUT0 ps vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=40 nf=1 m=1000
XPOUT1 out vb2 ps vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=40 nf=1 m=1000

* NMOS wide-swing cascode bias: diode voltage plus I*R.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=40 nf=1 m=1000
RNBIAS vb3 nd 4k
XNBIAS nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=40 nf=1 m=1000

* PMOS wide-swing cascode bias: diode voltage minus I*R.
XPBIAS pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=40 nf=1 m=1000
RPBIAS pd vb2 4k
XNPBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=40 nf=1 m=1000

.ends dut
