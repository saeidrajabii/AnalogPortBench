.subckt dut iref inp inn out

* Reference-current receiver and mirrored bias branch.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBIAS vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Cascode bias generation.
RBNC vdd vbnc 5k
RBPC vbnc vbpc 37.5k
CBNC vbnc 0 2p
CBPC vbpc vdd 2p

* Differential input stage.
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMNINM nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XMNINP nright inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1

* Input-stage NMOS cascodes.
XMNCASM nmirror vbnc nleft 0 sky130_fd_pr__nfet_01v8_lvt W=57 L=1 nf=1 m=1
XMNCASP nstage vbnc nright 0 sky130_fd_pr__nfet_01v8_lvt W=57 L=1 nf=1 m=1

* Lower-overdrive PMOS mirror and cascoded active load.
XMPREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XMPMIR npcas nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XMPCAS nstage vbpc npcas vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=1 nf=1 m=1

* Output stage with reduced gate capacitance.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=0.5 nf=1 m=1
XMNOUT noutsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=11
XMNOUTCAS out vbnc noutsink 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=0.7 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 2.7k
CCOMP ncomp out 420f

.ends dut
