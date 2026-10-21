.subckt dut in out
* Independent wide-swing cascode bias.
RBIAS vdd vcas 60k
XMBIAS vcas vcas 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=5 nf=1 m=1

* Reference branch: reference current enters a drain.
XMREFC in vcas nref 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=5 nf=1 m=1
XMREF nref in 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=5 nf=1 m=1

* Matched, low-overdrive cascode output branch.
XMOUTC out vcas nout 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=5 nf=1 m=1
XMOUT nout in 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=5 nf=1 m=1
.ends dut
