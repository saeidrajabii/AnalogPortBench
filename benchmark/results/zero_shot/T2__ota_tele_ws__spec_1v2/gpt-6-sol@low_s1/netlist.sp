.subckt dut iref inp inn out
* The 20 uA reference is converted to a gate bias before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS bias: one mirrored reference branch establishes the PMOS gate voltage.
XBN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XBP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.8 nf=1 m=2
XINN pg inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPL pg pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
XPR n1 pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1

* Common-source output stage and series-resistor Miller compensation.
XOP out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=5
XON out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
RC out nc 500
CC nc n1 0.8p
.ends dut
