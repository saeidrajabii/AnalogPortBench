.subckt dut iin out vb1 vb2 vb3 vb4
* Reference NMOS and PMOS establish the mirrored 20 uA bias currents.
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMNPREF vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* PMOS cascode bias stack.
XMPSTACK1 pstack vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMPSTACK2 vb2 vb2 pstack vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMNPSTACK vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* NMOS cascode bias stack.
XMPNSTACK vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMNNSTACK1 vb3 vb3 nstack 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMNNSTACK2 nstack iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Output cascode current source and sink.
XMP_OUT1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMP_OUT2 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMN_OUT1 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMN_OUT2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Export the reference-gate bias on vb4.
RVB4 iin vb4 1u
.ends dut
