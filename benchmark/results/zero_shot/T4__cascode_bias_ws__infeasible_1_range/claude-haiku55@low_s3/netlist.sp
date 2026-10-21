.subckt dut iin out vb1 vb2 vb3 vb4
* Reference diode (Iin flows into its drain)
XMNr iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* vb1: PMOS diode sourcing Iref, NMOS mirror of Iin sinking Iref
XMPd1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNm1 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* vb4: NMOS diode, current supplied by PMOS mirror of vb1
XMPm4 vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNd4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* vb3: two stacked NMOS diodes, current supplied by PMOS mirror of vb1
XMPm3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNd3a vb3 vb3 nz 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNd3b nz nz 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* vb2: two stacked PMOS diodes, current sunk by NMOS mirror of Iin
XMPd2a ny ny vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPd2b vb2 vb2 ny vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNm2 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* NMOS cascode sink to out
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS cascode source from vdd to out
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
