.subckt dut iref inp inn out
* Reference-current mirror and tail bias
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load
XINP a inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XINN d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XPDI d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.5 nf=1 m=1
XPMIR a d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.5 nf=1 m=1

* Output-stage bias and common-source gain stage
XBIASN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1.5 nf=1 m=1
XBIASP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPOUT out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.5 nf=1 m=1
XNOUT out a 0 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1.5 nf=1 m=1

* Miller compensation with a series nulling resistor
RZ a cm 650
CC cm out 0.85p
.ends dut
