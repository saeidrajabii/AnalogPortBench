.subckt dut in out
* Diode-connected reference stack
XMREF_BOTTOM nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=5 nf=1 m=800
XMREF_CAS in in nref 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=5 nf=1 m=800

* Matched cascoded output branch
XMOUT_BOTTOM nout nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=5 nf=1 m=800
XMOUT_CAS out in nout 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=5 nf=1 m=800
.ends dut
