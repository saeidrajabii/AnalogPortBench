* Candidate port; specification compliance requires model-based simulation.
* Global supply node: vdd = 1.2 V.

.subckt Bias_Reference iref vbn
XR0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
RB0 iref vbn 1
.ends Bias_Reference

.subckt Amplifier vbn inp inn out
* NMOS differential pair and mirrored reference-current tail.
XT0 ntail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=5
XI0 nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XI1 nfirst inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* PMOS active-load mirror.
XL0 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.8 nf=1 m=1
XL1 nfirst nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.8 nf=1 m=1

* Inverting second stage with mirrored current sink.
XO0 out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.8 nf=1 m=4
XO1 out vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=10

* Series-R Miller compensation.
RC0 nfirst ncomp 330
CC0 ncomp out 1.8p
.ends Amplifier

.subckt dut iref inp inn out
XB0 iref vbn Bias_Reference
XA0 vbn inp inn out Amplifier
.ends dut
