.subckt dut iin out vb1 vb2 vb3 vb4

* Input reference: the ideal current enters a drain, not a source.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=200

* Generate the PMOS current-mirror reference.
XNPR pref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=200
XPREF pref pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=600

* NMOS gate and wide-swing cascode biases.
XPNBIAS vb3 pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=600
RNLEVEL vb3 vb4 6k
XNBIAS vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=200

* PMOS gate and wide-swing cascode biases.
XPBIAS vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=600
RPLEVEL vb1 vb2 6k
XNPBIAS vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=200

* Cascoded output current sink.
XNOUT nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=200
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=200

* Cascoded output current source.
XPOUT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=600
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=600

.ends dut
