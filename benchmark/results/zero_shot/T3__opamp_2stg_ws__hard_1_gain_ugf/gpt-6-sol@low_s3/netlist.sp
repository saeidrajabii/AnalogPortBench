.subckt dut iref inp inn out
* Reference current is converted to a gate bias before being mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=6

* NMOS differential input pair and PMOS current-mirror load.
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XINN nfirst inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XLOADREF nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1
XLOAD nfirst nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1

* Common-source output stage.
XOUT out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=8

* Miller compensation with a series nulling resistor.
RCOMP nfirst ncomp 220
CCOMP ncomp out 650f
.ends dut
