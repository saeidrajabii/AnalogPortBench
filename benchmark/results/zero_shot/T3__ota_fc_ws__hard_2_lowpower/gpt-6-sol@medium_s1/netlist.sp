.subckt dut iref inp inn out
* Reference current is converted to a gate bias before it is mirrored.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XINN  pd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XINP  x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XPD   pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XPM   x pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Common-source output stage.
XPO   out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1 nf=1 m=1
XNO   out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=1

* Miller compensation with a series nulling resistor.
RZ    x nc 2.7k
CC    nc out 0.75p
.ends dut
