.subckt dut iref inp inn out
* ---- bias: 20 uA reference through diode-connected NMOS ----
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* ---- tail current source, 2x mirror = 40 uA ----
XMB2 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
* ---- first stage: NMOS pair, PMOS mirror load ----
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM2 d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP2 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* ---- second stage: PMOS common source, NMOS current sink (40 uA) ----
XMP3 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN3 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
* ---- Miller compensation with nulling resistor ----
RZ0 d2 cz 3k
CC0 cz out 500f
.ends dut
