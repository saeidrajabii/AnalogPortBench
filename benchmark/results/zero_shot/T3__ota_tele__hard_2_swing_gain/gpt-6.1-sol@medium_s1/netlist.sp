.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, nominal 4 uA bias branch.
XBNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XBNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* PMOS bias mirror: nominal 20 uA input tail and 40 uA output bias.
XBPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XBTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.2 nf=1 m=1
XBOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1.2 nf=1 m=1

* PMOS differential pair and NMOS current-mirror load.
* Two inversions give a non-inverting inp-to-out response.
XIP1 nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XIP2 ndrive inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XIL1 nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XIL2 ndrive nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1

* Common-source output stage.
XON out ndrive 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1

* Series-R Miller compensation.
RCOMP ndrive ncomp 3k
CCOMP ncomp out 1.3p

.ends dut
