.subckt dut iref inp inn out
* 20 uA reference current is received by a diode-connected NMOS.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* NMOS differential input stage with a PMOS current-mirror load.
XINN nload inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XINP nx inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XLOAD1 nload nload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XLOAD2 nx nload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Generate a PMOS bias from a mirrored reference current.
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Common-source output stage and series Miller compensation.
XOUTN out nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=38 L=0.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=4
RCOMP nx nc 1k
CCOMP nc out 0.65p
.ends dut
