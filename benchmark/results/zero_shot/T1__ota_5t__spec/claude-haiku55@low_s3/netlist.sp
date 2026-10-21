.subckt dut iref inp inn out
* Bias: 20 uA reference sunk by NMOS diode MNr; MNs mirrors it,
* sinking 20 uA from a PMOS diode MPr (vbp), which is mirrored to the tail MPt.
XMNr iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNs vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMPr vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail: 1.5x the 20 uA reference, i.e. 30 uA
XMPt ntail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* PMOS input pair (inp drives the diode side, inn drives the output side)
XMPp nA  inp ntail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPn out inn ntail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* NMOS current-mirror load (diode side nA, output side out)
XMNd nA  nA 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNo out nA 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
