* Candidate port; performance requires verification with the supplied
* SKY130 models and testbench. Specification compliance is not established.
* Global supply: vdd = 1.2 V.
*
* Reference-current mirrors and PMOS bias generator.
.subckt Bias_Generator iref vbn vbp
XR0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
RB0 iref vbn 1
XR1 vbp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XR2 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
.ends Bias_Generator

* Two-stage amplifier with series-R Miller compensation.
.subckt Amplifier vbn vbp inp inn out
* NMOS differential pair and mirrored tail current.
XT0 tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=3
XI0 mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XI1 stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1

* PMOS current-mirror load.
XL0 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XL1 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1

* Common-source output stage and mirrored PMOS current source.
XO0 out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XO1 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=6

RC0 stage1 comp 3.6k
CC0 comp out 550f
.ends Amplifier

.subckt dut iref inp inn out
XB0 iref vbn vbp Bias_Generator
XA0 vbn vbp inp inn out Amplifier
.ends dut
