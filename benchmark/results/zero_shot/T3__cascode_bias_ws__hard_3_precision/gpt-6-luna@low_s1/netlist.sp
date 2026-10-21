.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current establishes an NMOS mirror bias.
XMREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* NMOS cascode bias and output sink.
XMNBIAS vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNCBIAS vb4 vb3 vb3 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNSINK nns vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNCAS out vb4 nns 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS mirror reference is driven by the NMOS reference mirror.
XMPREF npr vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMNPREF npr iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS cascode bias and output source.
XMPCBIAS vb2 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMPCBIAS2 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMPSOURCE nps vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMPCAS out vb2 nps vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
