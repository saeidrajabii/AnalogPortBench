.subckt dut iref inp inn out

* Reference and mirrored bias currents.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=3
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=7

* Cascode-bias ladder supplied by a mirrored reference current.
RBN vdd vb_nc 22k
RBP vb_nc vb_pc 58k
XMNBIAS vb_pc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1

* Differential input pair.
XMNINN nd_inn inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNINP nd_inp inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Input-branch cascodes.
XMNCASN nmirror vb_nc nd_inn 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMNCASP nstage vb_nc nd_inp 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Reduced-capacitance PMOS mirror and cascoded active load.
XMPREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPMIR np_int nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPCAS nstage vb_pc np_int vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Higher-transconductance output stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=0.5 nf=1 m=1

* Miller compensation with a left-half-plane zero.
RCOMP nstage ncomp 4.7k
CCOMP ncomp out 650f

.ends dut
