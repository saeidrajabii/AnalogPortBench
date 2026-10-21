.subckt dut iref inp inn out
* ---------------- bias generation (all derived from iref = 20 uA) ----------------
* reference diode
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Vbp2 generator: 10 uA, 0.2 V resistor drop + replica PMOS cascode diode
Rp vdd pa 20k
XMb1 vbp2 vbp2 pa vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMb2 vbp2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Vbp1 generator: replica of top source + cascode, 10 uA
XMb3 pb vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMb4 vbp1 vbp2 pb vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMb5 vbp1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Vbn2 generator: 10 uA from cascoded PMOS source, 0.2 V resistor drop + replica NMOS cascode diode
XMb6 pc vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMb7 vbn2 vbp2 pc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMb8 vbn2 vbn2 rn 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
Rn rn 0 20k
* ---------------- folded-cascode OTA ----------------
* tail (60 uA)
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=3
* NMOS input pair (bulk tied to source to save headroom)
XM1 fl inp tail tail sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 fr inn tail tail sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* top PMOS current sources (70 uA each)
XMp1 fl vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=7
XMp2 fr vbp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=7
* PMOS cascodes (40 uA each)
XMc1 net1 vbp2 fl vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=4
XMc2 out vbp2 fr vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=4
* NMOS cascoded mirror load (low-voltage cascode)
XMn1 net1 vbn2 s1 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=4
XMn2 out vbn2 s2 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=4
XMs1 s1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=4
XMs2 s2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=4
.ends dut
