.subckt dut iref inp inn out
* Reference-current mirror and tail-current source
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2

* Differential input stage with PMOS current-mirror load
XIN1 nmir inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XIN2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XLOAD1 nmir nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XLOAD2 n1 nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Mirrored bias for the common-source output stage
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=5
XOUTN out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=5

* Miller compensation with a series nulling resistor
RZ n1 nc 850
CC nc out 1.1p
.ends dut
