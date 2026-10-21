.subckt dut iref inp inn out
* NMOS reference and bias mirrors
XREF  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1.5 nf=1 m=1
XTAIL tail vbn  0    0    sky130_fd_pr__nfet_01v8_lvt W=3.0 L=1.5 nf=1 m=1
XPSINK vbp  vbn  0    0    sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1.5 nf=1 m=1

* PMOS reference for the output-stage current source
XPREF vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.0 L=1.5 nf=1 m=1
XPLOAD out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.5 L=1.5 nf=1 m=1

* Differential input stage; input ordering gives non-inverting feedback polarity
XINN nd   inn  tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XINP n1   inp  tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XPMD nd   nd   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPMR n1   nd   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1

* Common-source output stage
XOUTN out  n1   0    0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1

* Miller compensation with a series zero-setting resistor
RZ n1 nz 2k
CC nz out 470p
.ends dut
