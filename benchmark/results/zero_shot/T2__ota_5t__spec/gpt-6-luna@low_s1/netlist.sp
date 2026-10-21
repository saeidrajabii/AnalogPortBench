.subckt bias_core iref tailgate
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMTail ntail tailgate 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends bias_core

.subckt OTA_5T tailgate inp inn out
XMN1 nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMN2 out inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMP2 out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMT ntail tailgate 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends OTA_5T

.subckt dut iref inp inn out
XI_BIAS iref vbias bias_core
XI_OTA vbias inp inn out OTA_5T
.ends dut
