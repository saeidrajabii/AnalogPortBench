.subckt dut iref inp inn out
* Reference sink and current mirrors
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.6 nf=1 m=1
XMNTAIL tail_bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XMNPBIAS p_bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
* PMOS mirror provides the second-stage load current
XMPREF p_bias p_bias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XMPLOAD out p_bias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1
* First-stage differential pair and PMOS mirror load
XMTAIL tail inp 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XM1 nleft inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XM2 nright inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.6 nf=1 m=1
* Miller compensation
CCOMP nright ncomp 1p
RZ ncomp out 2k
.ends dut
