.subckt dut iref inp inn out
* Convert the reference current to an NMOS gate bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Cascode gate biases.
RNC1 vdd ncas 360k
RNC2 ncas 0 640k
RPC1 vdd pcas 750k
RPC2 pcas 0 250k

* Differential input stage with cascoded NMOS and PMOS loads.
XINL nl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=4 nf=1 m=1
XINR nr inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=4 nf=1 m=1
XNCL pl ncas nl 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XNCR first ncas nr 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1

XPTL ptop ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1
XPTR pr ptop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=4 nf=1 m=1
XPCL pl pcas ptop vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=2 nf=1 m=1
XPCR first pcas pr vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=2 nf=1 m=1

* Independently biased common-source output stage.
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=4 nf=1 m=1
XOUTN out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1

* Miller compensation.
RNULL first comp 1k
CCOMP comp out 0.7p
.ends dut
