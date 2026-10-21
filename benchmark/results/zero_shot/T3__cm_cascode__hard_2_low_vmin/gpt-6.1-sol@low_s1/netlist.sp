.subckt dut in out
* Long-channel, low-current-density unity-ratio mirror.
* Candidate sizing; specifications require verification with the supplied models.
XREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=200 nf=1 m=20000
XOUT out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=200 nf=1 m=20000
.ends dut
