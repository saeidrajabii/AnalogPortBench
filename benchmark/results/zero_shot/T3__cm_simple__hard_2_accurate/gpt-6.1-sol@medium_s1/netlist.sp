* Low-voltage regulated current mirror.
* Supply node vdd and ground are provided by the testbench.

.subckt mirror_error_amp a b z pb
XTAIL s pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=8 nf=1 m=1
XPA d a s vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=8 nf=1 m=1
XPB z b s vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=8 nf=1 m=1
XNA d d 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=8 nf=1 m=10
XNB z d 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=8 nf=1 m=10
.ends mirror_error_amp

.subckt dut in out
* Approximately 80 mV reference for the mirror drain voltage.
RVT vdd vr 140k
RVB vr 0 10k

* Shared amplifier bias.
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=8 nf=1 m=1
RBIAS pb 0 150k

* Reference branch: feedback holds in near vr.
XAREF in vr gm pb mirror_error_amp
XNREF in gm 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=8 nf=1 m=20

* Output branch: feedback matches the two mirror drain voltages.
XNOUT x gm 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=8 nf=1 m=20
XNCAS out gc x 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=10
XAOUT in x gc pb mirror_error_amp

CGM gm 0 2p
CGC gc 0 2p
.ends dut
