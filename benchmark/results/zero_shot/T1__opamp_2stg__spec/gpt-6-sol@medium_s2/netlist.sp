.subckt dut iref inp inn out
* Reference-current mirror and NMOS cascode bias
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=1.2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.4 L=1.2 nf=1 m=1
XOUTSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.6 L=1.2 nf=1 m=1
XBSINK pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.48 L=1.2 nf=1 m=1
RNC1 vdd nc 180k
RNC2 nc 0 240k

* Cascoded differential input stage and PMOS mirror load
XINP nlp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XINN nlr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XNCPL a nc nlp 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.6 nf=1 m=1
XNCR pc nc nlr 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.6 nf=1 m=1
XPTREF pt pt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPCREF pc pc pt vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPTLOAD ps pt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPCLOAD a pc ps vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1

* Level-shifted PMOS output stage
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XPFBIAS pg pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XFOLLOW 0 a pg vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XOUTPUT out pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Miller compensation
RZ a comp 1.6k
CC comp out 530f
.ends dut
