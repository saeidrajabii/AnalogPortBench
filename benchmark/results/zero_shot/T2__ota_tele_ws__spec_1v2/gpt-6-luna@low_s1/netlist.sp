.subckt dut iref inp inn out
* Reference sink and scaled tail-current sink
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=10

* NMOS differential pair
XMN1 nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMN2 nright inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* PMOS current-mirror load
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMP2 out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
.ends dut
