.subckt dut iref inp inn out
* 20 uA reference and NMOS current mirrors
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* First stage: differential pair with cascoded PMOS mirror load
XINP dref inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XINN dcas inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XPLREF midref midref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XPUREF dref dref midref vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XPLOUT midout midref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XPUOUT first dref midout vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XCAS dcas dref first 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* Second stage and its PMOS current-source bias
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XNOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.7 nf=1 m=1

* Miller compensation with a series nulling resistor
RNULL first comp 220
CCOMP comp out 0.65p
.ends dut
