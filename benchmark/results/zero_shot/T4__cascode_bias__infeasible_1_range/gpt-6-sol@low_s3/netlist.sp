.subckt dut iin out vb1 vb2 vb3 vb4
* Diode-connected NMOS establishes the reference gate voltage.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=10 nf=1 m=1

* A matched NMOS branch converts the reference into a PMOS gate bias.
XNBias vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=10 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1800 L=10 nf=1 m=1

* Long-channel output mirrors favor low-voltage compliance.
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=10 nf=1 m=1
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1800 L=10 nf=1 m=1

RVB2 vb2 vb1 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
