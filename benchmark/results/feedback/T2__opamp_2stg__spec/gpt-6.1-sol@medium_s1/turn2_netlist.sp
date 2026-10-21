.subckt dut iref inp inn out

* Diode-connected reference device and mirrored bias currents.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=3
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=7

* Shared cascode-bias ladder, supplied by a mirrored reference.
RBN vdd vb_nc 22k
RBP vb_nc vb_pc 58k
XMNBIAS vb_pc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1

* Differential input pair.
XMNINN nd_inn inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XMNINP nd_inp inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1

* Input-branch cascodes.
XMNCASN nmirror vb_nc nd_inn 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMNCASP nstage vb_nc nd_inp 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* PMOS mirror with a cascoded high-impedance output branch.
XMPREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1.5 nf=1 m=1
XMPMIR np_int nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1.5 nf=1 m=1
XMPCAS nstage vb_pc np_int vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Second-stage common-source amplifier.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=1.2 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 2.5k
CCOMP ncomp out 750f

.ends dut
