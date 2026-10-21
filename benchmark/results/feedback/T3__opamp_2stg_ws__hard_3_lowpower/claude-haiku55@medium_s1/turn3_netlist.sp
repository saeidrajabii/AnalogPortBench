.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference driven by iref (20 uA)
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
* Tail current source, 3x mirror (60 uA)
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
* Second-stage NMOS current sink, 4x mirror (80 uA)
XMSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* Cascode gate bias from ideal resistor divider (about 0.98 V, about 4.4 uA)
RCASA vdd vcasc 50k
RCASB vcasc 0 225k
* First stage: NMOS differential pair (inn on diode side, inp on output side)
XM1 x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XM2 x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
* First stage: NMOS cascodes to raise output resistance
XMC1 d1 vcasc x1 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMC2 d2 vcasc x2 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
* First stage: PMOS current mirror load
XMP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMP2 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
* Second stage: PMOS common source (gate d2); short L and small area keep the d2 capacitance low
XMP3 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=0.5 nf=1 m=1
* Miller compensation with nulling resistor (zero placed near the output pole)
RZ d2 nz 1.8k
CC nz out 0.8p
.ends dut
