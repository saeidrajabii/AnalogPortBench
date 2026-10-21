.subckt dut iin out vb1 vb2 vb3 vb4
* Reference diode: iin carries Iref = 20 uA
XMref iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* vb4 follows iin (ideal 1 mOhm link, no DC current into gate)
Rb4 iin vb4 1m

* NMOS sink branch (mirror of Iref) and NMOS cascode
XMs0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMc0 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS source branch (mirror of Iref via vb1) and PMOS cascode
XMp1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMp0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* vb1 bias: PMOS diode sourced from vdd, sunk by NMOS copy of Iref
XMpd vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMnd vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Cascode gate biases from resistor dividers (unloaded)
Rv2a vdd vb2 20k
Rv2b vb2 0 10k
Rv3a vdd vb3 7.5k
Rv3b vb3 0 10k
.ends dut
