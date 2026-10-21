.subckt dut in out
* Long-channel, matched NMOS current mirror.
XMREF in  in  0 0 sky130_fd_pr__nfet_01v8_lvt W=1000000 L=10000 nf=1 m=1
XMOUT out in  0 0 sky130_fd_pr__nfet_01v8_lvt W=1000000 L=10000 nf=1 m=1
.ends dut
