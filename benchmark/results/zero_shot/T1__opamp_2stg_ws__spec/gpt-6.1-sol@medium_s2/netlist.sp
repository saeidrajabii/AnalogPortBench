* SKY130 port candidate; specification compliance requires simulation
* with the testbench's SKY130 models.

.subckt dut iref inp inn out

* Diode-connected reference device: reference current is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Auxiliary PMOS mirror supplies the cascode-bias generator.
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XBC vbcas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1

* Replica stack generates the output-current-sink cascode bias.
XBD0 vbbase vbbase 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XBD1 vbcas vbcas vbbase 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1

* NMOS differential input stage with PMOS current-mirror load.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XINP nfirst inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.2 nf=1 m=1

XLOAD0 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.7 nf=1 m=1
XLOAD1 nfirst nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.7 nf=1 m=1

* PMOS common-source output stage with cascoded NMOS current sink.
XOUT out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.5 nf=1 m=1
XSINK nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XCAS out vbcas nsink 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=0.8 nf=1 m=1

* Series-R Miller compensation.
RCOMP nfirst ncomp 1.5k
CCOMP ncomp out 1.1p

.ends dut
