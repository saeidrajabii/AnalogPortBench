.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference: iin is the drain-connected top diode, vb4 the bottom diode gate.
XMNr3 iin iin vb4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNr1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* vb3 is tied to iin (cascode gate voltage) through a 1 mOhm short.
Rs3 iin vb3 1m

* PMOS bias: diode-connected PMOS MPb sunk by an NMOS cascode slave copy of the reference.
XMPb vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNs3 vb1 vb3 nsA 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNs1 nsA vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* vb2 is set by an unloaded resistive divider (about 0.48 V).
Rd1 vdd vb2 15k
Rd2 vb2 0 10k

* NMOS sink: bottom mirror device MN0 and cascode MN2.
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS source: bottom mirror device MP1 and cascode MP0.
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
