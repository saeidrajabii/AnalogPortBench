.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference / bias ----
* Reference diode (sets Iin node voltage, mirrored by MN0 and MNr1)
XMN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* vb4 follows iin (ideal short through 1 mOhm)
R_vb4 vb4 iin 1m
* Bottom sink and NMOS cascode sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* vb3 generator: MNr1 mirrors Iref, MNr2 diode-connected cascode, MPr supplies current
XMNr1 net1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNr2 vb3 vb3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPr vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* ---- PMOS bias ----
* vb1: PMOS diode sourced from vdd, sunk by NMOS mirror of Iref
XMPd1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNs1 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* vb2: two stacked PMOS (one mirror, one diode) sunk by NMOS mirror of Iref
XMPe1 pe vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPe2 vb2 vb2 pe vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNs2 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---- Output branches ----
* PMOS cascode source: mirror device MP1 and cascode MP0
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
