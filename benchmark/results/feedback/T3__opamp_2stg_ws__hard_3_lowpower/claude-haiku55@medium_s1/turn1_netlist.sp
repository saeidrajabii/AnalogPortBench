.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference driven by iref (20 uA)
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
* Tail current source, 3x mirror (60 uA)
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
* Second-stage NMOS current sink, 4x mirror (80 uA)
XMSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* First stage: NMOS differential pair (inn on diode side, inp on output side)
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XM2 d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* First stage: PMOS current mirror load
XMP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=1 nf=1 m=1
XMP2 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=1 nf=1 m=1
* Second stage: PMOS common source (gate d2), NMOS sink
XMP3 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
* Miller compensation with nulling resistor (out to d2 path, no inp-to-out element)
RZ d2 nz 2.5k
CC nz out 0.8p
.ends dut
