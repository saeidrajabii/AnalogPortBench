.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference stack; the 20 uA reference enters diode-connected drains.
XNREF0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XNREF1 iin vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
RNB vb3 iin 1
RNC vb3 0 100Meg

* Matched NMOS cascode sink and bias-leg sink.
XNOUT0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XNOUT1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XNBIAS0 nbias_src vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XNBIAS1 vb1 vb3 nbias_src 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1

* PMOS mirror and cascode-gate bias.
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1
XPOUT0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1
XPOUT1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1
RB21 vb1 vb2 100k
RB20 vb2 0 100k
.ends dut
