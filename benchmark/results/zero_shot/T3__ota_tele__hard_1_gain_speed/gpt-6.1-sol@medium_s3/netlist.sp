.subckt dut iref inp inn out

* Reference-current mirror
XBR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBM pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* PMOS bias reference, input-tail source, and output source
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XBT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=1 nf=1 m=1
XBO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=840 L=2 nf=1 m=1

* PMOS differential input stage
* Positive inp excursion lowers stage1 and raises out
XIP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XIN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1

* NMOS active-load mirror
XLD mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XLM stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1

* Common-source output stage
XOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1

* Series-resistor Miller compensation
RZ stage1 comp 2.5k
CC comp out 1.2p

.ends dut
