.subckt dut iref inp inn out

* Reference current enters a diode-connected NMOS drain.
* All operating currents are obtained through mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Input-stage tail: nominally twice the reference current.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=2

* PMOS cascode-gate bias, supplied by a mirrored reference.
XPB1 npbias npbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XPB2 pcbias pcbias npbias vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNB pcbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* NMOS differential input pair.
XINM nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPL1 npl1 nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPL2 npl2 nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPC1 nmirror pcbias npl1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPC2 nstage pcbias npl2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Common-source output stage with mirrored current sink.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=6

* Series-R Miller compensation.
RCOMP nstage ncomp 800
CCOMP ncomp out 550f

.ends dut
