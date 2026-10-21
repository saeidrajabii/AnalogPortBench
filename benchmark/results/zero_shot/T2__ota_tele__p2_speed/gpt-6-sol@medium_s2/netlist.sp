.subckt dut iref inp inn out
* Reference-current mirror and branch biases
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XOUTBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

* Differential input stage and PMOS current-mirror load
XINN nload inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XLOADREF nload nload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XLOAD n1 nload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1

* Output stage and series-resistor Miller compensation
XOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=0.65 nf=1 m=1
RZ n1 nc 850
CC nc out 1.1p
.ends dut
