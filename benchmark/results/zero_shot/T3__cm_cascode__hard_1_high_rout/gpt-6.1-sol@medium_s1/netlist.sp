* Low-voltage regulated-cascode current mirror.
* Numerical specification compliance requires TT-model simulation.

.subckt cm_servo sense target drive pb
* Increasing sense relative to target decreases drive.
XP1 nd sense ps vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=4 nf=1 m=1
XP2 ng target ps vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=4 nf=1 m=1
XPT ps pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=4 nf=1 m=1

XN1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XN2 ng nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1

XN3 drive ng 0 0 sky130_fd_pr__nfet_01v8_lvt W=320 L=4 nf=1 m=1
XP3 drive pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=4 nf=1 m=1
CC ng drive 5p
.ends cm_servo

.subckt dut in out
* Shared amplifier bias.
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=4 nf=1 m=1
RBIAS pb 0 68k

* Reference drain-voltage target: 80 mV.
RTOP vdd vb 140k
RBOT vb 0 10k

* Reference branch: reference current enters a drain, not a source.
XNREF xr in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XNCREF in gr xr 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XAREF xr vb gr pb cm_servo

* Output branch: servo matches its internal drain voltage to xr.
XNOUT xo in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XNCOUT out go xo 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XAOUT xo xr go pb cm_servo
.ends dut
