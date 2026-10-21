* Long-channel, low-overdrive cascode mirror.
* Candidate sizing; compliance requires verification with the supplied
* SKY130 models and testbench.

.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference: the input current enters a drain, not a source.
RNG iin vb4 1m
XNR iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

* Mirror the reference into the diode-connected PMOS reference.
XNP vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XPR vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300000 L=100 nf=1 m=1

* NMOS cascode bias: approximately 80 mV of source elevation.
XPNB vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300000 L=100 nf=1 m=1
XNB vb3 vb3 nb_src 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
RNB nb_src 0 4k

* PMOS cascode bias: approximately 80 mV below VDD at its source.
XNPB vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XPB vb2 vb2 pb_src vdd sky130_fd_pr__pfet_01v8_lvt W=300000 L=100 nf=1 m=1
RPB vdd pb_src 4k

* Cascoded NMOS output current sink.
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

* Cascoded PMOS output current source.
XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300000 L=100 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=300000 L=100 nf=1 m=1

.ends dut
