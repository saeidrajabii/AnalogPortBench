.subckt dut iref inp inn out
* The 20 uA reference is converted to a gate voltage before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP nr inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XINN nl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XPL nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XPR nr nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1

* Output-stage current-source bias.
XBP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1

* Common-source output stage and series Miller compensation.
XOUT out nr 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.35 nf=1 m=1
XLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 m=1
RZ nr nc 350
CC nc out 0.7p
.ends dut
