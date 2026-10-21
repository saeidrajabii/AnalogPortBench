.subckt dut iref inp inn out
* ---------------- Bias network (20 uA reference) ----------------
* vbn1 = iref node: NMOS current-source gate (diode-connected reference)
XMb0  iref iref 0 0       sky130_fd_pr__nfet_01v8_lvt W=6.66  L=0.5 nf=1 m=1
* vbp1: PMOS current-source gate (diode PMOS loaded by a 20 uA NMOS sink)
XMpd1 vbp1 vbp1 vdd vdd   sky130_fd_pr__pfet_01v8_lvt W=12.19 L=0.5 nf=1 m=1
XMnr1 vbp1 iref 0 0       sky130_fd_pr__nfet_01v8_lvt W=6.66  L=0.5 nf=1 m=1
* vbp2: PMOS cascode gate (diode PMOS loaded by a 20 uA NMOS sink)
XMpd2 vbp2 vbp2 vdd vdd   sky130_fd_pr__pfet_01v8_lvt W=12.19 L=0.5 nf=1 m=1
XMnr2 vbp2 iref 0 0       sky130_fd_pr__nfet_01v8_lvt W=6.66  L=0.5 nf=1 m=1
* vbn2: NMOS cascode gate (diode NMOS fed by a PMOS copy of the 20 uA current)
XMpb  vbn2 vbp1 vdd vdd   sky130_fd_pr__pfet_01v8_lvt W=12.19 L=0.5 nf=1 m=1
XMnd  vbn2 vbn2 0 0       sky130_fd_pr__nfet_01v8_lvt W=6.66  L=0.5 nf=1 m=1

* ---------------- Folded-cascode OTA ----------------
* NMOS side: cascodes (gate vbn2), sinks/tail (gate iref)
XMN6 net1 vbn2 net018 0   sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN7 net018 iref 0 0      sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN0 net08 vbn2 net020 0  sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN3 net020 iref 0 0      sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN2 net010 inp net08 0   sky130_fd_pr__nfet_01v8_lvt W=20   L=0.5 nf=1 m=1
XMN1 net016 inn net08 0   sky130_fd_pr__nfet_01v8_lvt W=20   L=0.5 nf=1 m=1
XMN5 net08 vbn2 net019 0  sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN4 net019 iref 0 0      sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN9 out vbn2 net017 0    sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN8 net017 iref 0 0      sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1

* PMOS side: cascodes (gate vbp2), current sources (gate net1 mirror)
XMP4 net1 vbp2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=12.19 L=0.5 nf=1 m=1
XMP1 net010 net1 vdd vdd  sky130_fd_pr__pfet_01v8_lvt W=12.19 L=0.5 nf=1 m=1
XMP0 net010 net1 vdd vdd  sky130_fd_pr__pfet_01v8_lvt W=12.19 L=0.5 nf=1 m=1
XMP5 out vbp2 net016 vdd  sky130_fd_pr__pfet_01v8_lvt W=12.19 L=0.5 nf=1 m=1
XMP3 net016 net1 vdd vdd  sky130_fd_pr__pfet_01v8_lvt W=12.19 L=0.5 nf=1 m=1
XMP2 net016 net1 vdd vdd  sky130_fd_pr__pfet_01v8_lvt W=12.19 L=0.5 nf=1 m=1
.ends dut
