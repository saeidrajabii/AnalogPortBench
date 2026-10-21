.subckt dut iin out vb1 vb2 vb3 vb4
* ---- Reference diode (Iref flows into iin) ----
XM4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* ---- vb4 = iin voltage (ideal short via 1 mohm) ----
RB4 iin vb4 1m
* ---- NMOS sink: bottom device and cascode ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* ---- vb3 generator: diode NMOS fed by resistor from vdd ----
XMNb3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
RB3 vdd vb3 17.5k
* ---- PMOS source: bottom device and cascode ----
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* ---- vb1 generator: diode PMOS with resistor to ground ----
XMPb1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
RB1 vb1 0 17.5k
* ---- vb2 generator: diode PMOS with resistor to ground ----
XMPb2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
RB2 vb2 0 17.5k
.ends dut
