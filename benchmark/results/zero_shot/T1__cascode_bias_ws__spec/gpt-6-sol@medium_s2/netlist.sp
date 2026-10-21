.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current diode and NMOS mirrors
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XNBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
RVB4 iin vb4 1m

* PMOS mirror reference
XPBIAS vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=2 nf=1 m=1

* Unloaded cascode-gate biases
RP2H vdd vb2 68k
RP2L vb2 0 112k
RN3H vdd vb3 106k
RN3L vb3 0 74k

* Cascoded current sink
XNSRC nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1

* Cascoded current source
XPSRC psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=2 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=2 nf=1 m=1
.ends dut
