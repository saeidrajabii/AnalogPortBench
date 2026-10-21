.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XBIASN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XBIASP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* Differential input stage with a PMOS current-mirror load
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XINP a inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=0.8 nf=1 m=1
XINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=0.8 nf=1 m=1
XLOAD1 a a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XLOAD2 n1 a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.8 nf=1 m=1

* Common-source output stage and Miller compensation
XOUT out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=95 L=0.7 nf=1 m=1
XOUTBIAS out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=0.6 nf=1 m=1
RZ n1 ccnode 2k
CC ccnode out 1.8p
.ends dut
