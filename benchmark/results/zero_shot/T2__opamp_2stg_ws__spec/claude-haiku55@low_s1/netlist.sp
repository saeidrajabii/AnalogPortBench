.subckt dut iref inp inn out
* Bias: diode-connected reference sinks 20 uA from iref
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source: 2x mirror -> 40 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* Differential pair
XM1 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror active load (diode on n1 side)
XMP3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink (150 uA)
XMCS out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1
XMS2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
* Miller compensation
CC n2 out 500f
.ends dut
