* Two-stage OTA with mirrored reference bias and Miller compensation.
* Global supply: vdd = 1.2 V.

.subckt dut iref inp inn out

* Reference-current mirror.
XMR0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMR1 pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1

* PMOS bias conversion: nominal 10 uA branch.
XMPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1

* Input-stage tail: nominal 30 uA.
XMPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=2 nf=1 m=1

* PMOS differential pair.
* Input assignment gives positive overall gain from inp to out.
XMP1 mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1
XMP2 stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1

* NMOS current-mirror active load.
XMN1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=2 nf=1 m=1
XMN2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=2 nf=1 m=1

* Common-source output stage with nominal 80 uA PMOS load.
XMNO out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XMPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1

* Series-resistor Miller compensation.
RZERO stage1 comp 700
CCOMP comp out 900f

.ends dut
