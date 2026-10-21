.subckt dut iref inp inn out
* Reference mirror and differential-pair tail current
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* First stage: differential pair with PMOS mirror load
XNINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1
XPLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1

* Output-stage current-source bias
XNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1

* Second gain stage and Miller compensation
XNOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=1
RNULL n2 nc 2k
CCOMP nc out 1.2p
.ends dut
