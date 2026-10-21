.subckt dut iref inp inn out
* Convert the reference current to a gate bias, then mirror it.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* Differential input stage.
XINN  pd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XINP  x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XPD   pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.5 nf=1 m=1
XPM   x pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.5 nf=1 m=1

* Weak DC path establishes the first-stage output bias.
RB    x pd 20meg

* Common-source output stage and compensation.
XPO   out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XNO   out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
RZ    x nc 1.7k
CC    nc out 0.7p
.ends dut
