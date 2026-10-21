.subckt dut iref inp inn out
* Reference-current path and NFET bias.
XNR1 iref iref nb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XNR2 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XNT tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XNI1 first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.2 nf=1 m=1
XNI2 mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.2 nf=1 m=1
XPL1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1
XPL2 first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1

* Output stage with a cascoded NFET current sink.
XPO out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=170 L=2 nf=1 m=1
XNO1 nsink nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XNO2 out iref nsink 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1

* Miller compensation with a series nulling resistor.
RC first comp 10k
CC comp out 500f
.ends dut
