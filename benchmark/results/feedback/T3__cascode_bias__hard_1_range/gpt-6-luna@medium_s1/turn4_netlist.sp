.subckt dut iin out vb1 vb2 vb3 vb4
* Long-channel, low-overdrive 1:1 NMOS reference and output sink.
RR0 iin vb3 1m
XNREF vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=50 nf=1 m=1
XNSINK out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=50 nf=1 m=1

* PMOS reference branch is fed by the NMOS reference mirror.
XNMIR vb1 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=50 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=50 nf=1 m=1
XPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=50 nf=1 m=1

* Duplicate the reference bias outputs.
RVB12 vb1 vb2 1m
RVB34 vb3 vb4 1m
.ends dut
