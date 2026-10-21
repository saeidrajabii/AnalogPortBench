.subckt dut iref inp inn out
* The 20 uA reference is converted to a gate bias before it is mirrored.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=1
XSINK out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=2 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP  nx inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2 nf=1 m=1
XINN  nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2 nf=1 m=1
XPD   nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPM   nx nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XOUT  out nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=310 L=1.8 nf=1 m=1
RZ    nx nc 650
CC    nc out 550f
.ends dut
