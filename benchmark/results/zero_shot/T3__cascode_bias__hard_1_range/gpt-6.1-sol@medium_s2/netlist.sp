* Low-headroom, long-channel cascode mirrors.
* Candidate sizing: specifications require verification with the TT models.
* The reference current enters a drain, not a source.
* All transistor dimensions are in micrometres.

.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference mirror.
* The reference cascode drain also supplies the lower-device gate bias.
RNGATE iin vb4 1
XNREF nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10
XNCREF iin vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10

* Mirrored reference current establishes the PMOS reference bias.
XNTRANSFER nxfer vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10
XNCTRANSFER vb1 vb3 nxfer 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10
XPREF pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=20
XPCREF vb1 vb2 pref vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=20

* NMOS cascode bias: diode-connected device with raised source.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=20
XNBIAS vb3 vb3 nshift 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10
RNSHIFT nshift 0 3k

* PMOS cascode bias: diode-connected device with lowered source.
XPBIAS vb2 vb2 pshift vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=20
RPSHIFT vdd pshift 3k
XNPBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10

* Output NMOS cascode current sink.
XNOUTLOW nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10
XNOUT out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10

* Output PMOS cascode current source.
XPOUTHIGH psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=20
XPOUT out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=20

.ends dut
