.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current flows into a diode-connected NMOS.
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=5 nf=1 m=1

* A second NMOS mirror branch establishes the PMOS reference current.
XNBIAS_L nbias vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=5 nf=1 m=1
XNBIAS_C vb1 vb3 nbias 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=5 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1800 L=5 nf=1 m=1

* Wide-swing cascode bias offsets.
RNB_H vdd vb3 10G
RNB_L vb3 vb4 900Meg
RPB_H vb1 vb2 1G
RPB_L vb2 0 8G

* Output current sink and source.
XNSINK_L nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=5 nf=1 m=1
XNSINK_C out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=1200 L=5 nf=1 m=1
XPSOURCE_L psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1800 L=5 nf=1 m=1
XPSOURCE_C out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=1800 L=5 nf=1 m=1
.ends dut
