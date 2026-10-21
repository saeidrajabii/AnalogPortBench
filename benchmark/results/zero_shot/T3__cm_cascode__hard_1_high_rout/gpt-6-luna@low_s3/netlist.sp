.subckt dut in out
* Wide, long-channel unity-ratio NMOS current mirror.
XMREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XMOUT out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
.ends dut
