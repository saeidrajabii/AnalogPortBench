* Gain-boosted, low-compliance NMOS current mirror.
* Candidate sizing; specifications require verification with the supplied models.

.subckt dut in out

* Reference branch and output branch.
XMNREF nref in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
XMCREF in vcas nref 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
XMNOUT nout in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
XMCOUT out gcas nout 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1

* Copy the reference current to establish PMOS bias.
XMNB pbias in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
XMPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1

* Generate a cascode bias with approximately 100 mV source elevation.
XMPCB vcas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1
XMNCB vcas vcas vbsource 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
RB vbsource 0 5k

* Differential regulator comparing the two mirror drain voltages.
XMPTAIL ptail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1
XMPREF amp1 nref ptail vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1
XMPOUT aload nout ptail vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1
XMNLD aload aload 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
XMNL amp1 aload 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1

* Second gain stage drives the output cascode gate.
XMPDRV gcas pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=1
XMNDRV gcas amp1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
CCOMP amp1 gcas 2p

.ends dut
