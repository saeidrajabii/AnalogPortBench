.subckt dut iref inp inn out
* The reference current enters a diode-connected branch and is mirrored
* into the input stage and output-stage sink.
XBR1 iref iref nb 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XBR0 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.0 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
XTAIL nt nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.0 nf=1 m=1
XINP nx inp nt 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1.2 nf=1 m=1
XINN ny inn nt 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1.2 nf=1 m=1
XPL nx nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=65 L=1.2 nf=1 m=1
XPR ny nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=65 L=1.2 nf=1 m=1

* Common-source output stage with a cascoded current sink.
XOUT out ny vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.2 nf=1 m=1
XSNK0 ns nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=33 L=1.0 nf=1 m=1
XSNK1 out iref ns 0 sky130_fd_pr__nfet_01v8_lvt W=44 L=0.7 nf=1 m=1

* Series-RC Miller compensation.
RZ ny nc 1.2k
CC nc out 0.8p
.ends dut
