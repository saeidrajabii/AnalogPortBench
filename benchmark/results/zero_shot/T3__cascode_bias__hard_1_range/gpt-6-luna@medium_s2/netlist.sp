.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference: Iin flows into a diode-connected device.
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1

* PMOS reference branch, biased by a matched NMOS mirror.
XMNPCAL vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1
XMPREF  vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1

* Output current mirrors.
XMNSINK out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1
XMPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1

* Provide corresponding bias outputs.
RVB2 vb2 vb1 1m
RVB3 vb3 vb4 1m
.ends dut
