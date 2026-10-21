.subckt dut iref inp inn out
* Bias: iref is a diode-connected NMOS (20 uA reference), mirrored to the tail (2x) and the output sink (6x)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1 nf=1 m=1
* Stage 1: NMOS differential pair with PMOS mirror load
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1 nf=1 m=1
XM4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1 nf=1 m=1
* Stage 2: PMOS common-source with NMOS current sink
XM6 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1 nf=1 m=1
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1 nf=1 m=1
* Miller compensation with nulling resistor
Rz n2 nz 2k
Cc nz out 0.8p
.ends dut
