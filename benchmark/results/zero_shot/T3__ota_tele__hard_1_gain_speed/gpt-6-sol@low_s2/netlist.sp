.subckt dut iref inp inn out
* Reference-current mirror: 20 uA nominal in the diode-connected device.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1

* NMOS differential pair with a nominal 40 uA tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=2
XINP d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XINN x inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1

* PMOS current-mirror load.
XLOAD1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
XLOAD2 x d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1

* Common-source output stage, nominally biased at 60 uA.
XOUTP out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=2 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=3

* Series-RC Miller compensation.
RCOMP x cmid 1.5k
CCOMP cmid out 0.85p
.ends dut
