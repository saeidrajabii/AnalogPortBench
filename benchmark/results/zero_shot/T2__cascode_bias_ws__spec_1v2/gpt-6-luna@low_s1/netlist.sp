* A numerical port cannot be verified from the information provided: the SKY130
* model parameters and simulation results are not available. This is a
* conventional current-mirror and cascode-bias starting point, not a
* demonstrated specification-compliant design.
.subckt dut iin out vb1 vb2 vb3 vb4

* PMOS reference and mirrors. The reference current enters the diode-connected
* PMOS drain/gate; it does not flow directly into a transistor source.
XPR iin iin vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPS psrc iin vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPD vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPT vb1 vb2 vb2 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1

* NMOS reference and cascode bias ladder.
XNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1
XND vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1
XNC vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1

* NMOS cascode sink; mirror devices use the reference gate voltage.
XNS nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1
XNK out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1

.ends dut
