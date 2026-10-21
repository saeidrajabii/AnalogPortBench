.subckt dut iref inp inn out
* Reference current is converted to a voltage, then mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.8 L=1 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18.75 L=2.5 nf=1 m=1

* Differential input stage and current-mirror load.
XINP d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.2 nf=1 m=1
XINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.2 nf=1 m=1
XLOAD1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2.5 nf=1 m=1
XLOAD2 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2.5 nf=1 m=1

* Common-source output stage and series-RC compensation.
XOUTN out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=2.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=2.5 nf=1 m=1
RNULL n1 nc 2k
CCOMP nc out 1.2p
.ends dut
