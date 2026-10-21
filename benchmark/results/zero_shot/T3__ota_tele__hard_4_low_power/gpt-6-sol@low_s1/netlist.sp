.subckt dut iref inp inn out
* Reference-current mirror and PMOS bias
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XBIASN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=1 nf=1 m=1
XBIASP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.5 L=1 nf=1 m=1

* PMOS differential input stage with an NMOS mirror load
XTAIL tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XINP nleft inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XINN nstage inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XLOAD1 nleft nleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.7 nf=1 m=1
XLOAD2 nstage nleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.7 nf=1 m=1

* Common-source output stage and Miller compensation
XOUT out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XPULL out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1 nf=1 m=1
RNULL ncomp out 1.5k
CCOMP nstage ncomp 0.45p
.ends dut
