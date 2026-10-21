.subckt dut iref inp inn out

* Reference-current receiver and mirrored PMOS bias generator
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.2 nf=1 m=1
XMNBias vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.2 nf=1 m=0.5
XMPREF vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.2 nf=1 m=1

* PMOS differential input stage
XMPTAIL ntail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.2 nf=1 m=4
XMPINP nstage inp ntail vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XMPINN nmirror inn ntail vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1.2 nf=1 m=1

* NMOS current-mirror load
XMNLOAD1 nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=1
XMNLOAD2 nstage nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=1

* Common-source output stage
XMNOUT out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XMPOUT out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.2 nf=1 m=8

* Series-R Miller compensation
RCOMP nstage ncomp 3.3k
CCOMP ncomp out 500f

.ends dut
