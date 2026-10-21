.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference (20 uA), mirrored to the tail (120 uA)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=6
* Bias chain for the PMOS output current source: 20 uA NMOS sink, PMOS diode load
XMna x iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMpd x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
* PMOS current source at the output, 9x mirror = 180 uA
XMpl out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=9

* First stage: NMOS differential pair with PMOS mirror load
* inn drives the diode-side device (M1); inp drives the output-side device (M2)
XM1 dL inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XM3 dL dL vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
XM4 n1 dL vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1

* Second stage: NMOS common-source driven from n1, PMOS current-source load
XM5 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1 nf=1 m=1

* Miller compensation with nulling resistor (n1 -> Rz -> Cc -> out)
RZ n1 cz 1.2k
CC cz out 1.6p
.ends dut
