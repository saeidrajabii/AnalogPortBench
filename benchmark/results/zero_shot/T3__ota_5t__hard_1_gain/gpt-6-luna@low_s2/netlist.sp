.subckt dut iref inp inn out
* Reference-current sink and mirrored OTA tail current
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Five-transistor differential OTA with PMOS current-mirror load
XMN1 nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMN2 nright inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
.ends dut
