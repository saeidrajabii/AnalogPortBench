* Two-stage, Miller-compensated port.
* Candidate sizing; specifications require verification with the target models.
.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XBN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XBN1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XBP0 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1

* PMOS differential pair with NMOS current-mirror load.
XTAIL tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=192 L=1 nf=1 m=1
XINP n1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XINN nm inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XLOAD1 nm nm 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XLOAD2 n1 nm 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Inverting second stage; overall inp-to-out gain is positive.
XGAIN out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XBIAS out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=288 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RZ n1 nc 1.5k
CC nc out 3p

.ends dut
