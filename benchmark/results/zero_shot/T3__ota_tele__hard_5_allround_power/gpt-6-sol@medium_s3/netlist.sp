.subckt dut iref inp inn out
* 20 uA reference mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.7 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.7 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.5 nf=1 m=1
XINN nstage inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.5 nf=1 m=1
XPL nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XPR nstage nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1

* Output-stage bias and gain stage
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.7 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=11 L=0.7 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24.75 L=0.7 nf=1 m=1
XOUTN out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1

* Miller compensation with a series nulling resistor
RZ nstage ncomp 4.5k
CC ncomp out 0.7p
.ends dut
