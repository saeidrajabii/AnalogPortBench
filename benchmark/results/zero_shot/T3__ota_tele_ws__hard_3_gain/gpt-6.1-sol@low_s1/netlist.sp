.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias branch.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=3 nf=1 m=1

* PMOS input pair with a nominal 3:1 tail-current mirror.
XMPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=3 nf=1 m=1
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1

* NMOS current-mirror load.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1

* Common-source second stage with a nominal 5:1 bias mirror.
XMNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=2 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=3 nf=1 m=1

* Miller compensation with series zero-nulling resistance.
RCOMP stage1 comp 1k
CCOMP comp out 1.5p

.ends dut
