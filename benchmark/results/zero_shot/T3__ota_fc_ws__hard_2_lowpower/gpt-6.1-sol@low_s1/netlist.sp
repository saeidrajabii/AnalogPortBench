* Two-stage OTA with mirrored reference bias and Miller compensation.
* Candidate port; compliance requires verification with the supplied
* SKY130 models and testbench.

.subckt dut iref inp inn out

* Reference-current receiver and NMOS bias mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XOSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* PMOS bias generation and differential-pair tail source.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1

* PMOS input pair with NMOS current-mirror load.
* Input polarity gives a positive overall inp-to-out gain.
XPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* Common-source output stage.
XPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* Series-resistor Miller compensation.
RZERO stage1 comp 3k
CCOMP comp out 1.5p

.ends dut
