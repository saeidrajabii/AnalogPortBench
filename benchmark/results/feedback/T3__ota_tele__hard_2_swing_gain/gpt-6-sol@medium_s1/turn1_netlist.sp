.subckt dut iref inp inn out
* Reference-current mirror and tail current
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Bias for the second-stage PMOS current source
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* Differential input stage with PMOS mirror load
XINN pnode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=3 nf=1 m=1
XINP v1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=3 nf=1 m=1
XLOAD1 pnode pnode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=3 nf=1 m=1
XLOAD2 v1 pnode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=3 nf=1 m=1

* Common-source output stage and Miller compensation
XOUTN out v1 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=92 L=3.5 nf=1 m=1
RNULL v1 ccnode 4k
CCOMP ccnode out 0.9p
.ends dut
