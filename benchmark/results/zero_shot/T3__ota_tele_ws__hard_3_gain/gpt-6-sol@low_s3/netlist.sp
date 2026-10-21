.subckt dut iref inp inn out
* The 20 uA reference is converted to a voltage before it is mirrored.
XBP iref iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS-input differential pair: 40 uA tail current.
XTAIL tail iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=2
XINP nleft inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=3 nf=1 m=1
XINN nfirst inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=3 nf=1 m=1

* NMOS current-mirror load.
XLOAD1 nleft nleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=1
XLOAD2 nfirst nleft 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=1

* Common-source output stage with a 60 uA mirrored load.
XOUT out nfirst 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1
XPOUT out iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* Miller compensation with a series nulling resistor.
RNULL nfirst ncomp 1k
CCOMP ncomp out 1.2p
.ends dut
