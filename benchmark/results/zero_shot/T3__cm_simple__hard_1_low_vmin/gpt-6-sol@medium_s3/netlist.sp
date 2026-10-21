.subckt dut in out
* Long-channel matched devices provide high output resistance.
XMref in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=20 nf=1 m=300
XMout out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=20 nf=1 m=300

* At low output voltage, this device raises the mirror gate bias
* to improve current delivery. It is intended to be off at 0.9 V.
XMboost in out vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=0.35 nf=1 m=1
.ends dut
