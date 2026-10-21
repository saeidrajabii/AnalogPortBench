.subckt dut iref inp inn out
* Reference-current mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XBR pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1

* PMOS differential stage. The input connections give a non-inverting
* response at the output of the second stage.
XTAIL ptail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=0.8 nf=1 m=1
XINN dleft inn ptail vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=0.5 nf=1 m=1
XINP nstage inp ptail vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=0.5 nf=1 m=1
XLOAD1 dleft dleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.0 nf=1 m=1
XLOAD2 nstage dleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=8.4 L=1.0 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
RZ nstage ncomp 450
CC ncomp out 1.4p
.ends dut
