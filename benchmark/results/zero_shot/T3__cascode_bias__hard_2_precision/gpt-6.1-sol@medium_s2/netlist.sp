* Low-headroom regulated cascode mirrors.
* Numerical specifications require verification with the supplied TT models.
* Device dimensions are in micrometres.

.subckt dut iin out vb1 vb2 vb3 vb4

* Internal drain-voltage targets: approximately 0.09 V and 1.11 V.
RNSET_H vdd nset 123.333333k
RNSET_L nset 0 10k
RPSET_H vdd pset 10k
RPSET_L pset 0 123.333333k

* NMOS reference branch.
* The reference current enters a drain, not a source.
* vb3 is the diode-connected reference cascode gate.
RIN iin vb3 1m
XNR_C vb3 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XNR_M nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

* NMOS output current sink.
XNO_C out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XNO_M nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

* A separate NMOS replica transfers the reference current
* into the PMOS reference branch.
XNT_C vb2 vb3 nxfer 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XNT_M nxfer vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

* PMOS reference branch.
XPR_M pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1
XPR_C vb2 vb2 pref vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1

* PMOS output current source.
XPO_M psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1
XPO_C out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1

* NMOS-reference drain regulator.
* Increasing nref raises vb4 and increases the reference sink current.
RNA_T vdd ntail 100k
XNA_IN nload nref ntail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=20 nf=1 m=1
XNA_SET vb4 nset ntail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=20 nf=1 m=1
XNA_D nload nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1
XNA_L vb4 nload 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1

* PMOS-reference drain regulator.
* Increasing pref raises vb1 and reduces the reference source current.
RPA_T ptail 0 100k
XPA_IN pload pref ptail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=20 nf=1 m=1
XPA_SET vb1 pset ptail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=20 nf=1 m=1
XPA_D pload pload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=20 nf=1 m=1
XPA_L vb1 pload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=20 nf=1 m=1

.ends dut
