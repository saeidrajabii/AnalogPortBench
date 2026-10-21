.subckt dut iin out vb1 vb2 vb3 vb4
* ---- Reference: 20 uA sunk by diode-connected NMOS at iin ----
XMN_ref iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- PMOS current-source gate bias vb1 ----
* diode-connected PMOS sourced from vdd, sunk by NMOS mirror of iin
XMPb1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNb1 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- PMOS cascode gate bias vb2 (lower, smaller diode for larger Vsg) ----
XMPb2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMNb2 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- NMOS cascode gate bias vb3: diode NMOS fed by PMOS mirror of vb1 ----
XMPb3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNb3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- NMOS bottom gate bias vb4: diode NMOS fed by PMOS mirror of vb1 ----
XMPb4 vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNb4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- Output NMOS cascode sink (to ground) ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN2 out  vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- Output PMOS cascode source (from vdd) ----
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends dut
