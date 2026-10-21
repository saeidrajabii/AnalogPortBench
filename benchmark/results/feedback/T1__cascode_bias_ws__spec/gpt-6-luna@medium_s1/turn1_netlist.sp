.subckt dut iin out vb1 vb2 vb3 vb4
* Reference NMOS and mirrored current sink
RIN iin vb4 0.001
XMNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XMNB vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1

* NMOS cascode bias stack and output sink
XMNCB vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XMNC1 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XMNC2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1

* PMOS cascode bias stack, fed by the mirrored reference current
XMPB1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1
XMPB2 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1

* PMOS cascode output source
XMPC1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1
XMPC2 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1
.ends dut
