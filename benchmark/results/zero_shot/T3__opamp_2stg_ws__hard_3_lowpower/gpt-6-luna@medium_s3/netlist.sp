.subckt dut iref inp inn out
* Reference-current mirror and PMOS bias reference
XMREFN  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XMBIASN vbias iref 0   0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XMBIASP vbias vbias vdd vdd  sky130_fd_pr__pfet_01v8_lvt W=6 L=1.5 nf=1 m=1

* Differential input stage and PMOS current-mirror load
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMINP  n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMINN  n2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Second gain stage
XMOUTN out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.8 nf=1 m=1
XMOUTP out vbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Miller compensation
RZ n2 ncomp 680
CC ncomp out 500f
.ends dut
