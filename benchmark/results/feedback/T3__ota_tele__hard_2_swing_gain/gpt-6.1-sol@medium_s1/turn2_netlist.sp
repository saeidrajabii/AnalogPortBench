.subckt dut iref inp inn out

* Reference-current mirror.
XBNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XBNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* Low-overdrive PMOS bias mirrors.
XBPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XBTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.2 nf=1 m=1
XBOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=450 L=1.8 nf=1 m=1

* Differential input stage with longer-channel mirror load.
XIP1 nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XIP2 ndrive inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XIL1 nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.8 nf=1 m=1
XIL2 ndrive nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.8 nf=1 m=1

* Longer-channel, lower-overdrive output stage.
XON out ndrive 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=1.5 nf=1 m=1

* Series-R Miller compensation.
RCOMP ndrive ncomp 3k
CCOMP ncomp out 0.9p

.ends dut
