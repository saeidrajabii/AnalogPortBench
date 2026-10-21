.subckt dut iref inp inn out
* ---- bias: 20 uA reference (MB1), derived bias voltages ----
XMB1  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* vbp: PMOS current-source gate, 15 uA (sink ratio 0.75)
XMBS1 vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMB7  vbp  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1

* vcn: NMOS cascode gate, PMOS mirror of vbp feeding an NMOS diode
XMB9  vcn  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XMB2  vcn  vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1

* vcp: PMOS cascode gate, NMOS sink feeding a PMOS diode
XMBS2 vcp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMB8  vcp  vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* ---- tail: resistor (about 30 uA total) ----
RT tail 0 2.7k

* ---- signal path: folded cascode ----
XM1 x1  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
XM2 x2  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
XM3 d1  vcn x1  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.0 nf=1 m=1
XM4 out vcn x2  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.0 nf=1 m=1
XM5 d1  vcp y1  vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.0 nf=1 m=1
XM6 out vcp y2  vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.0 nf=1 m=1
XM7 y1  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.0 nf=1 m=1
XM8 y2  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.0 nf=1 m=1
.ends dut
