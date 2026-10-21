* Two-stage OTA with series-R Miller compensation.
* Candidate design; specification compliance requires SKY130 simulation.
.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XNB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNB1 pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPB0 pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Differential input stage: nominal tail current 40 uA.
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XN1 mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XN2 stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XP1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XP2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Common-source output stage: nominal bias current 100 uA.
XN3 out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XP3 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=5

* Miller compensation with a zero-setting series resistor.
RC stage1 comp 1.8k
CC comp out 0.75p

.ends dut
