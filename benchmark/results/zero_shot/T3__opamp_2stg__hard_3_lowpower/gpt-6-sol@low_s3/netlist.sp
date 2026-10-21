.subckt dut iref inp inn out
* The reference current is received by a diode-connected NMOS and mirrored
* to the amplifier tail and the PMOS bias branch.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.8 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.8 nf=1 m=1

* PMOS current-source bias and second-stage load.
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.8 nf=1 m=1
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=0.8 nf=1 m=1

* NMOS differential input stage with a PMOS mirror load.
XNI nmirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNP nstage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPM1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XPM2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XNO out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.65 nf=1 m=1
RC nstage ncomp 2k
CC ncomp out 650f
.ends dut
