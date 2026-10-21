.subckt dut iref inp inn out
* 20 uA reference is sensed by a diode-connected NMOS and mirrored.
XBN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XBT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XBPNS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XBPP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XIN1 nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.5 nf=1 m=1
XIN2 x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.5 nf=1 m=1
XPL1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2.5 nf=1 m=1
XPL2 x nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2.5 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XOUTN out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2.5 nf=1 m=1
RCOMP x xc 1.5k
CCOMP xc out 1.2p
.ends dut
