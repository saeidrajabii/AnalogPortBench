.subckt dut iref inp inn out
* The reference current is converted to a voltage by a diode-connected
* NMOS, then mirrored into the input-pair tail and output-stage sink.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=17.6 L=1 nf=1 m=1
XSINK out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=26.4 L=1 nf=1 m=1

* Differential first stage. Its output, n1, drives the PMOS
* common-source second stage, preserving non-inverting polarity.
XINN  nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XINP  n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPDI  nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.8 nf=1 m=1
XPMIR n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.8 nf=1 m=1

XOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=135 L=0.8 nf=1 m=1

* Series-nulling-resistor Miller compensation.
RZ n1 nc 680
CC nc out 1p
.ends dut
