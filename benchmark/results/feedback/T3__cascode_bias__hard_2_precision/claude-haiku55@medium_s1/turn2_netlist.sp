.subckt dut iin out vb1 vb2 vb3 vb4
* Reference branch: 20 uA from iin through NMOS diode stack (vb3 over vb4)
RR0 iin vb3 1
XMN3R vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN1R vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* PMOS bias: diode-connected PMOS at vb1 (wide, low Vov), sunk by an NMOS copy
XMP1R vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMN4 vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* vb2 from ideal resistor into a narrow NMOS diode (about 20 uA at vb2 near 0.6 V)
Rb2 vdd vb2 30k
XMNb2 vb2 vb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
* Output NMOS cascode sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* Output PMOS cascode source (wide devices keep Vdsat small)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
.ends dut
