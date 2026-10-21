.subckt dut iin out vb1 vb2 vb3 vb4

* Long-channel reference and NMOS mirror gate.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=64000 L=200 nf=1 m=1
RNGATE iin vb4 1

* Convert the mirrored reference current to a PMOS gate bias.
XNPMREF vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=64000 L=200 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200000 L=200 nf=1 m=1

* NMOS wide-swing cascode bias.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200000 L=200 nf=1 m=1
XNDIODE vb3 vb3 nb 0 sky130_fd_pr__nfet_01v8_lvt W=64000 L=200 nf=1 m=1
RNLEVEL nb 0 4k

* PMOS wide-swing cascode bias.
XNPBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=64000 L=200 nf=1 m=1
XPDIODE vb2 vb2 pb vdd sky130_fd_pr__pfet_01v8_lvt W=200000 L=200 nf=1 m=1
RPLEVEL vdd pb 4k

* Cascoded output current sink.
XNMAIN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=64000 L=200 nf=1 m=1
XNCASC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=64000 L=200 nf=1 m=1

* Cascoded output current source.
XPMAIN psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200000 L=200 nf=1 m=1
XPCASC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=200000 L=200 nf=1 m=1

.ends dut
