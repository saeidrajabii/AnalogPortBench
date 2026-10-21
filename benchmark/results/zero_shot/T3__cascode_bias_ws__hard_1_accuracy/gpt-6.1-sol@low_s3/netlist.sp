* Long-channel, low-overdrive cascode mirror candidate.
* Compliance and accuracy require verification with the supplied TT models.
* All device dimensions are in micrometres.

.subckt dut iin out vb1 vb2 vb3 vb4

* Diode-connected input reference; the reference enters a drain.
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40000 L=100 nf=1 m=1

* Export the NMOS current-mirror gate bias.
RBN vb4 iin 1

* Mirror the reference into a diode-connected PMOS reference.
XMNPR vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40000 L=100 nf=1 m=1
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1

* NMOS cascode gate-bias branch.
* The smaller diode device raises the cascode bias above vb4.
XMPNB vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1
XMNCB vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=100 nf=1 m=1

* PMOS cascode gate-bias branch.
* The smaller diode device lowers the cascode bias below vb1.
XMNPB vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40000 L=100 nf=1 m=1
XMPCB vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=100 nf=1 m=1

* Cascoded NMOS output sink.
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40000 L=100 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40000 L=100 nf=1 m=1

* Cascoded PMOS output source.
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1

.ends dut
