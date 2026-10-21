.subckt dut iref inp inn out
* Convert the reference current to an NMOS mirror bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1

* Generate a PMOS mirror bias without applying iref to a source terminal.
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XBR pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1

* First stage: PMOS differential pair with an NMOS mirror load.
XTAIL ptail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XINP dleft inp ptail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XINN nstage inn ptail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XLOAD1 dleft dleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.0 nf=1 m=1
XLOAD2 nstage dleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.0 nf=1 m=1

* Second stage and Miller compensation.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.0 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
RZ nstage ncomp 800
CC ncomp out 0.8p
.ends dut
