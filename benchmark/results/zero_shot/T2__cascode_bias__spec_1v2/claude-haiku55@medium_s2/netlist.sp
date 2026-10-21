.subckt dut iin out vb1 vb2 vb3 vb4
* Bias generation (Iref = 20 uA sunk by the diode at iin)
XMref iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
Rvb3 iin vb3 1
* NMOS sink copy feeding the PMOS bias chain
XMsk vb2 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* Diode-connected NMOS for the NMOS sink gate vb4
XMd4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS diode for vb1
XMpa vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Level shift from vb1 down to the PMOS cascode gate vb2
Rv12 vb1 vb2 5k
* PMOS current copy feeding the vb4 diode
XMps vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Output stage: NMOS cascode sink
XMn0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMn2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Output stage: PMOS cascode source
XMp1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMp0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
