* Two-stage OTA with mirrored reference bias and series-R Miller compensation.
* Candidate design; specification compliance requires the supplied TT simulations.

.subckt dut iref inp inn out

* Reference-current sensing and NMOS bias mirrors.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=1 nf=1 m=1

* PMOS bias mirror: nominal 60 uA input-stage tail current.
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* PMOS differential pair and NMOS current-mirror load.
* The inp branch drives the second-stage gate for non-inverting gain.
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1

* Common-source output stage.
XMPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* Miller compensation with a series zero-control resistor.
RZERO stage1 comp 1k
CCOMP comp out 0.85p

.ends dut
