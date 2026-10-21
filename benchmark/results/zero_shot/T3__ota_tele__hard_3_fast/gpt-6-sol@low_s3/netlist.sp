.subckt dut iref inp inn out
* 20 uA reference is mirrored into the differential-pair tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=0.35 nf=1 m=1
XINN nmid inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=0.35 nf=1 m=1
XPL nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPR nmid nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Common-source output stage and series Miller compensation.
XOUTN out nmid 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.35 nf=1 m=1
XOUTP out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
RZ nmid nc 550
CC nc out 0.65p
.ends dut
