.subckt dut iref inp inn out
* bias
XMN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN1 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMP0 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
* first stage
XMP1 tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XMI1 x inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMI2 d inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN3 d d 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN4 x d 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* second stage
XMN5 out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=5
XMP3 out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* compensation
Rz x cz 4k
Cc cz out 0.8p
.ends dut
