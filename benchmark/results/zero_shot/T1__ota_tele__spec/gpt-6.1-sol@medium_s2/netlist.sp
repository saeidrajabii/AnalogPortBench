* Two-stage, Miller-compensated port candidate.
* Compliance with the specifications requires SKY130 model simulation.
.subckt dut iref inp inn out

* Reference diode and mirrored bias currents.
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
XB2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4

* Differential input stage with PMOS current-mirror load.
XINP vx inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XINN vd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XPL1 vd vd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XPL2 vx vd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Inverting output stage; overall inp-to-out polarity is positive.
XPO out vx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.7 nf=1 m=1

* Series-resistor Miller compensation.
RZ vx vc 6.8k
CC vc out 0.6p

.ends dut
