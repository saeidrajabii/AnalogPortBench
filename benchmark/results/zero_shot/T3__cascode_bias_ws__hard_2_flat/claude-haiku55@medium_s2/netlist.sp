.subckt dut iin out vb1 vb2 vb3 vb4
* ---- reference: 20 uA into iin via diode-connected NMOS ----
XMref iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=1

* ---- vb1: PMOS bottom-gate bias (diode PMOS sourcing, NMOS mirror sinking) ----
XMpd vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMns vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=1

* ---- vb2: PMOS cascode-gate bias (replica of PMOS bottom + diode PMOS cascode) ----
XMprb pr vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMprc vb2 vb2 pr vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMns2 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=1

* ---- vb4: NMOS bottom-gate bias (diode NMOS fed by PMOS mirror) ----
XMpb vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMnb vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=1

* ---- vb3: NMOS cascode-gate bias (diode NMOS over replica NMOS bottom) ----
XMpc vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMnc vb3 vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=1
XMnr nr vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=1

* ---- output stage ----
* NMOS cascode sink (out <- nsrc <- ground)
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=1
XMN2 out  vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=1
* PMOS cascode source (vdd -> psrc -> out)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
