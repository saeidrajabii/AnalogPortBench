.subckt dut iref inp inn out
* NMOS reference and mirrored tail/output-stage bias
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XNBP pbias_n iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=2 nf=1 m=1

* PMOS reference and mirrored loads
XPREF pbias_p pbias_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
XPDIODE d inn vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2 nf=1 m=1
XPMIR x d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2 nf=1 m=1
XPOUT out pbias_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=92 L=2 nf=1 m=1

* PMOS bias-leg sink
XNPBIAS pbias_p iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1

* Differential input stage
XMINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=2 nf=1 m=1
XMINN d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=2 nf=1 m=1

* Second gain stage
XMOUT out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=46 L=2 nf=1 m=1

* Miller compensation
RZ x ncomp 3k
CC ncomp out 600f
.ends dut
