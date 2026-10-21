.subckt dut iref inp inn out
* Reference-current mirror.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* Differential input stage and current-mirror load.
XINN  pd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XINP  x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XPD   pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XPM   x pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
RB    x pd 20meg

* Output stage.
XPO   out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XNO   out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1

* Miller compensation with a left-half-plane zero.
RZ    x nc 20k
CC    nc out 0.46p
.ends dut
