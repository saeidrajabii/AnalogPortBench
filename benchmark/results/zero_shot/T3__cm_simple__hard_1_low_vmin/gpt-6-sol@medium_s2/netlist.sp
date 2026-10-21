.subckt dut in out
* Long-channel mirror for high output resistance.
XREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=10 nf=1 m=50
XOUT out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10.6 L=10 nf=1 m=50

* Raise the mirror bias when out is low to improve low-voltage current.
RLOW out boost_gate 22Meg
RHIGH boost_gate vdd 100Meg
XBOOST in boost_gate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=2 nf=1 m=1
.ends dut
