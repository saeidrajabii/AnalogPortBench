.subckt dut iref inp inn out
* Convert the 20 uA reference current to an NMOS gate bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1

* NMOS differential pair with a long-channel PMOS current-mirror load.
XINL left inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=4 nf=1 m=1
XINR first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=4 nf=1 m=1
XLOADL left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=4 nf=1 m=1
XLOADR first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=4 nf=1 m=1

* Independently biased output-stage current source.
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=1
XOUTN out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=1

* Miller compensation with a series nulling resistor.
RNULL first comp 600
CCOMP comp out 1.5p
.ends dut
