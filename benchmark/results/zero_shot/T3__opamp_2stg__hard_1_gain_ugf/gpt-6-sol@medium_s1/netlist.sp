.subckt dut iref inp inn out
* The 20 uA reference is converted to a voltage and mirrored;
* it does not drive a transistor source.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* Cascode-bias branch, approximately 20 uA.
XBC0 nlow iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XBC1 ncas ncas nlow 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* NMOS differential input stage and PMOS mirror load.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=3
XINP nfirst inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XPM0 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPM1 nfirst nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1

* Common-source output stage with a cascoded NMOS sink.
XOUTP out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1.5 nf=1 m=2
XOUTN nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=5
XOUTC out ncas nsink 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=5

* Miller compensation with a series nulling resistor.
RZ nfirst ncomp 1.2k
CC ncomp out 650f
.ends dut
