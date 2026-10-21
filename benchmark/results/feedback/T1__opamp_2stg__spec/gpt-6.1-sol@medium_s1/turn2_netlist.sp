.subckt dut iref inp inn out

* Reference-current mirror
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS mirror bias
XNBP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XPBP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.8 nf=1 m=1

* NMOS output-cascode bias
XPNC bncas pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XNNC bncas bncas 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=1 nf=1 m=1

* PMOS output-cascode bias
XNPC bpcas iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XPPC bpcas bpcas vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=0.7 nf=1 m=1

* Differential input stage
XNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=2
XNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1

* First-stage current-mirror load
XPMD nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPML nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Cascoded second stage
XPGAIN npstack nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XPCAS out bpcas npstack vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XNCAS out bncas nnstack 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=4
XNSINK nnstack iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=4

* Revised Miller compensation
RCOMP nstage ncomp 2k
CCOMP ncomp out 650f

.ends dut
