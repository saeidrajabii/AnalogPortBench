.subckt dut iref inp inn out
* Reference-current sink and NMOS mirror bias
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNBP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNS2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS bias for second-stage pull-up
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* First-stage NMOS differential pair with PMOS current-mirror load
XMNINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNINN nright inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPLOAD1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XMPLOAD2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Second gain stage
XMNS2 out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMPUP out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* Miller compensation
CCOMP nright out 2p
.ends dut
