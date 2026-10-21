.subckt dut iref inp inn out
* Reference sink and NMOS bias mirrors
XMR0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMR1 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMR2 n2bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* NMOS differential pair
XMN1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* PMOS current-mirror load
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1

* Second gain stage and resistive pull-up
XMN3 out n2 n2bias 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
RLOAD vdd out 15k

* Miller compensation
RZ n2 n2c 5k
CCOMP n2c out 200f
.ends dut
