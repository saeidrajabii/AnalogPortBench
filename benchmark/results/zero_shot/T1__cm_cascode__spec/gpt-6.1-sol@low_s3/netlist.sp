.subckt dut in out
* Shared cascode bias: 0.75 V from the 1.8 V supply.
RBIAS_H vdd vcas 140k
RBIAS_L vcas 0 100k

* Reference branch.
XREF_C in vcas nref 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XREF_M nref in 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

* Matched output branch.
XOUT_C out vcas nout 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XOUT_M nout in 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
.ends dut
