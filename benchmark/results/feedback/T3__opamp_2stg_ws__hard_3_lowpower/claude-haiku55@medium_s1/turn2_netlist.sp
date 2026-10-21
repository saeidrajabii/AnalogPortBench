.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference driven by iref (20 uA)
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
* Tail current source, 3x mirror (60 uA)
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
* Second-stage NMOS current sink, 4.5x mirror (90 uA)
XMSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=2 nf=1 m=1
* First stage: NMOS differential pair, longer L for gain, low Vov for gm
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XM2 d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
* First stage: PMOS current mirror load, long L for gain
XMP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=88 L=2 nf=1 m=1
XMP2 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=88 L=2 nf=1 m=1
* Second stage: PMOS common source (gate d2), long L for gain and higher gm
XMP3 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=266 L=2 nf=1 m=1
* Miller compensation with nulling resistor sized to place LHP zero near p2
RZ d2 nz 2k
CC nz out 1p
.ends dut
