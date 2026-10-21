.subckt dut iref inp inn out
* Reference current is received by a diode-connected NMOS and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1

* PMOS differential input stage with an NMOS mirror load.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XINP first inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2.5 nf=1 m=1
XLOAD2 first mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUTN out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=2.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=2.5 nf=1 m=1
RNULL first comp 300
CCOMP comp out 0.85p
.ends dut
