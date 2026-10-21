.subckt dut iref inp inn out
* Reference current is converted to a gate bias and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.6 nf=1 m=1

* Differential-pair tail current and PMOS output-current bias.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.6 nf=1 m=5
XBIASN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.6 nf=1 m=1
XBIASP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1

* First stage: NMOS differential pair with PMOS mirror load.
XINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XINN pd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XLOAD1 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XLOAD2 x pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1

* Second stage and Miller compensation.
XOUTN out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XOUTP out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=7
RNULL x comp 800
CCOMP comp out 650f
.ends dut
