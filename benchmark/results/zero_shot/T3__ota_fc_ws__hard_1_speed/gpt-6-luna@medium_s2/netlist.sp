.subckt dut iref inp inn out
* NMOS reference sink and 4:1 tail-current mirror
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* NMOS differential pair; gate assignment gives non-inverting response at out
XMN1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN2 x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS mirror load for the differential pair
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 x n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* PMOS reference branch and 5:1 output-current mirror
XNPSINK pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XPPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XPOUT out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Second gain stage
XNOUT out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1

* Miller compensation with a series nulling resistor
CCOMP x comp 1.4p
RZ comp out 1.2k

* Weak DC common-mode return for the open-loop output
RUP vdd out 1Meg
RDN out 0 1Meg
.ends dut
