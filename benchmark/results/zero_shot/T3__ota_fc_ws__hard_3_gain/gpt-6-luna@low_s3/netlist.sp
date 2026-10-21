.subckt dut iref inp inn out
* Reference-current sink and NMOS bias mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS bias reference, with its current set by an NMOS mirror
XMPREF vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNPB vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* NMOS differential input pair and tail-current mirror
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMINP nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMINN nright inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* PMOS active-mirror load
XMPL nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPR nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Second gain stage
XMOUTN out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMOUTP out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Miller compensation
CCOMP nright out 2p
.ends dut
