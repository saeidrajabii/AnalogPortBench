.subckt dut iref inp inn out
* A 20 uA diode-connected reference establishes the NMOS mirror bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Tail-current and output-sink mirror devices.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XSNK nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* Generate the PMOS mirror bias and the NMOS cascode bias.
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XNREF pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XPCAS bcas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XNCASREF bcas bcas ncasref 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNCASBOT ncasref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XCAS out bcas nsink 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.5 nf=1 m=1

* NMOS differential input pair and PMOS mirror load.
XINP nplus inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XINN nminus inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XPLREF nminus nminus vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XPLMIR nplus nminus vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* PMOS common-source output stage and Miller compensation.
XOUT out nplus vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=0.6 nf=1 m=1
RZ nplus ncomp 1.4k
CC ncomp out 0.8p
.ends dut
