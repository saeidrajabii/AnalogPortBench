.subckt dut iin out vb1 vb2 vb3 vb4
* The 20 uA reference develops the NMOS mirror bias at vb4.
* A resistor raises the NMOS cascode bias above vb4.
RIN iin vb3 1
RN vb3 vb4 6.8k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* Mirrored reference currents establish the PMOS biases.
XNBIAS1 vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
RP vb1 vb2 6.8k
XNBIAS2 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* Cascoded current sink and source meet at out.
XNSRC nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XPSRC psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
.ends dut
