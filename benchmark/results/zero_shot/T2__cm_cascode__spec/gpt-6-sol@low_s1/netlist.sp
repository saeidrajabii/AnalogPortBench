.subckt dut in out
* Self-biased NMOS cascode current mirror.
XMREF_LO nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=4
XMREF_HI in in nref 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=4
XMOUT_LO nout nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=4
XMOUT_HI out in nout 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=4
.ends dut
