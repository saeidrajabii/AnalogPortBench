.subckt dut iref inp inn out
* Reference-current sink and NMOS bias mirror
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMTAIL tail_bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4

* PMOS bias branch for the second-stage current source
XMPREF p_bias p_bias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNREF p_bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load
XMINP nleft inp tail sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMINN nright inn tail sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMTAIL1 tail tail_bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
XMPL nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XMPR nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Second-stage common-source gain stage
XMOUTN out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XMOUTP out p_bias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=4

* Miller compensation
CCOMP nright out 1.5p
.ends dut
