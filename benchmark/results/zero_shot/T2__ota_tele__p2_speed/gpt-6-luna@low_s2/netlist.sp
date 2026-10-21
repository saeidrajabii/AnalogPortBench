.subckt dut iref inp inn out
* Reference-current sink and NMOS bias mirrors
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XM2BIAS n2bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMPBIAS vdd iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XM1 nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 nright inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Second gain stage and PMOS current-source load
XMPREF pctrl pctrl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPSINK pctrl n2bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPLOAD out pctrl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMN2 out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Miller compensation
CCOMP nright out 200f
.ends dut
