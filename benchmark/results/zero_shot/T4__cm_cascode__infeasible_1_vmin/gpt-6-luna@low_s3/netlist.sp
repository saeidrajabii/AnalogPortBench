.subckt dut in out
* Matched long-channel NMOS mirror; the large width lowers the output
* device's saturation voltage, while the long channel raises output resistance.
XMREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000000 L=100 nf=1 m=1
XMOUT out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000000 L=100 nf=1 m=1
.ends dut
