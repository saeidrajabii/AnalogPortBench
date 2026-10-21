.subckt dut iref inp inn out
* Reference-current sink and NMOS bias mirror
XMRD iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.5 nf=1 m=1

* NMOS differential pair; inn branch is diode-loaded, inp branch drives x
XMN_INN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMN_INP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* PMOS mirror load for the differential pair
XMP_D nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMP_M x nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* Second gain stage
XMP_OUT out nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMN_OUT out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Miller compensation
RZ x comp 1k
CC comp out 1.2p
.ends dut
