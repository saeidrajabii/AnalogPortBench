.subckt dut iref inp inn out
* Reference-current mirror and differential-pair tail
XBIAS iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.6 L=1.2 nf=1 m=1

* NMOS differential pair with PMOS mirror load
XINN pdiode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.0 nf=1 m=1
XINP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.0 nf=1 m=1
XPDI pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPMIR gain pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Common-source output stage
XPOUT out pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=42 L=1.5 nf=1 m=1
XNOUT out gain 0 0 sky130_fd_pr__nfet_01v8_lvt W=38 L=1.0 nf=1 m=1

* Series-nulled Miller compensation
RZ gain comp 29k
CC comp out 0.6p
.ends dut
