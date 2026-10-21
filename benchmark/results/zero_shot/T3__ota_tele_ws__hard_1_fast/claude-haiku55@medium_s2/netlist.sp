.subckt dut iref inp inn out
* Bias: NMOS diode on iref (~20 uA, Vgs ~0.5 V) sets the tail gate and the mirror ratio
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Tail current source, ~3x the reference (~60 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
* Stage 1: NMOS differential pair with PMOS current-mirror load
XM1  d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XM2  d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XM3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=1 nf=1 m=1
XM4  d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=1 nf=1 m=1
* Stage 2: PMOS common-source with NMOS current-sink load (~120 uA)
XM5  out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=1 nf=1 m=1
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
* Miller compensation with nulling resistor
Cc   d2 cz 1.5p
Rz   cz out 1.2k
.ends dut
