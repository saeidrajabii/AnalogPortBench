.subckt dut iin out vb1 vb2 vb3 vb4
* Reference: Iref enters iin, diode-connected NMOS MN4 sets Vgs for 1:1 mirrors
XMN4  iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Bias vb4 (NMOS diode, Vgs = Vgs of unit) fed by PMOS source copy of Iref
XMNv  vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMPs4 vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Bias vb1: PMOS diode sourced by NMOS sink copy of Iref
XMNm  vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMPd  vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Bias vb3: NMOS diode with Vgs ~ Vgs_unit + 0.2 V (cascode gate for MN2)
XMPs3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNd  vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=0.5 nf=1 m=1
* Bias vb2: PMOS diode from vdd (Vsg ~0.75 V) sunk by NMOS copy of Iref
XMPd2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.2 L=0.5 nf=1 m=1
XMNr  vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* NMOS sink cascode (1:1 with reference)
XMN0  nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2  out  vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS source cascode (1:1 with reference, low Vdsat for headroom)
XMP1  psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP0  out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
