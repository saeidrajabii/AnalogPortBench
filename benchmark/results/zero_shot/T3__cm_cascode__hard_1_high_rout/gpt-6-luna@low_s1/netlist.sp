.subckt dut in out
* Simple NMOS current mirror. The wide devices reduce overdrive and
* improve low-voltage compliance; the cascode devices improve output resistance.
XMREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMRC vb vb in in sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMOUT nx in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMOC out vb nx nx sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
.ends dut
