.subckt dut iin out vb1 vb2 vb3 vb4
* Mirror the 20 uA reference into a diode-connected PMOS.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12000 L=10 nf=1 m=1
XNBias pbias iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12000 L=10 nf=1 m=1
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24000 L=10 nf=1 m=1

* Wide, long-channel output mirrors favor low headroom and low output dependence.
XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12000 L=10 nf=1 m=1
XPSOURCE out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24000 L=10 nf=1 m=1

* Unloaded bias-voltage outputs.
RVB1 vb1 pbias 1
RVB2 vb2 pbias 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
