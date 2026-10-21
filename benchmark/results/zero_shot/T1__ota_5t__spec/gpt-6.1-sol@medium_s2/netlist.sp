* PMOS-input OTA with NMOS current-mirror load.
* Reference current is mirrored before generating the PMOS tail bias.

.subckt dut iref inp inn out
* 20 uA reference and nominal 2 uA bias mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=2 nf=1 m=1

* PMOS bias reference and nominal 34 uA tail current.
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=17

* Differential pair: inp drives the mirror-reference branch.
XMPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* Matched NMOS active load.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XMNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
.ends dut
