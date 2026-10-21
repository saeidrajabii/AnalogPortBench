.subckt dut iref inp inn out
* NMOS reference and current mirrors
XREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XTAIL vbn   iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=6
XLOAD vbn   iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1

* PMOS reference and mirror bias
XBIASN nbp  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XPREF  nbp  nbp   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPMLOAD n1   nbp   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPMOUT out  nbp   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XIN1 n1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XIN2 n2   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XTAILM tail vbn 0    0    sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=6
XPM1  n1   n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPM2  n2   n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Second gain stage
XOUTN out  n2   0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Miller compensation
CCOMP n2 out 1p
.ends dut
