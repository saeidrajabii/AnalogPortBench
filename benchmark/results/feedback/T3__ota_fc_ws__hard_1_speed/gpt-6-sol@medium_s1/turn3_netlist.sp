.subckt dut iref inp inn out
* Convert the reference current to a voltage and lower the tail gate
* bias slightly to keep the tail transistor in saturation.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
RBIAS1 iref tailgate 100k
RBIAS2 tailgate 0 550k
XTAIL tail tailgate 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=7

* Differential pair and current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=125 L=0.85 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=125 L=0.85 nf=1 m=1
XPMREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=38 L=1.6 nf=1 m=1
XPMOUT out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=38 L=1.6 nf=1 m=1
.ends dut
