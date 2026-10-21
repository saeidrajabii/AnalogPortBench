.subckt dut iin out vb1 vb2 vb3 vb4
* Bias generator: 20 uA reference enters iin, is passed through a 1 ohm
* resistor to vb3, and is carried by the NMOS diode stack MN3 (vb3) / MN1 (vb4)
Rv3 iin vb3 1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1

* NMOS cascode current sink: out -> MN2 (gate vb3) -> nsrc -> MN0 (gate vb4) -> 0
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1

* PMOS current source: a diode-connected PMOS (vb1) is loaded by an NMOS
* copy of the vb4 mirror (20 uA sink), and the output PMOS mirrors vb1
XMNs vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMPr vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP0 out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* vb2 is not used by the output stage; it is weakly tied to vdd so the node is defined
Rv2 vb2 vdd 1Meg
.ends dut
