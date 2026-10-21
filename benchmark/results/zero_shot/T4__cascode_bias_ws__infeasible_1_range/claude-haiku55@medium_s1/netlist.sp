.subckt dut iin out vb1 vb2 vb3 vb4
* Reference diode: iin carries 20 uA, gate sets the NMOS mirror voltage
XMNr iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* vb4 follows iin; the 1G resistor carries no DC current into the unloaded node
Rb iin vb4 1G

* vb1 generator: diode-connected PMOS carrying 20 uA, sunk by an NMOS mirror of iin
XMPd1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMNs1 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* vb2 generator: PMOS clone of MP1 feeding a diode clone of MP0, sunk by an NMOS clone of MN0
XMPa2 px vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPb2 vb2 vb2 px vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMNb2 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* vb3 generator: PMOS current source feeding a diode clone of MN2 on top of an NMOS clone of MN0
XMPs3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMNd3 vb3 vb3 nx 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNx nx vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* NMOS cascode sink to ground
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS cascode source from vdd
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
.ends dut
