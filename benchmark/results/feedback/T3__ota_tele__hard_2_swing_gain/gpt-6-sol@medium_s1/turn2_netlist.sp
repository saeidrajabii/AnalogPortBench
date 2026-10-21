.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Output-stage bias
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.5 nf=1 m=1

* Differential input stage and mirror load
XINN pnode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=2 nf=1 m=1
XINP v1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=2 nf=1 m=1
XLOAD1 pnode pnode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=3 nf=1 m=1
XLOAD2 v1 pnode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=3 nf=1 m=1

* Output stage and Miller compensation
XOUTN out v1 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.2 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=85 L=1.2 nf=1 m=1
RNULL v1 ccnode 2.5k
CCOMP ccnode out 1.4p
.ends dut
