.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBIAS vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* Cascode gate biases derived from a mirrored reference current.
RBNC vdd vbnc 5k
RBPC vbnc vbpc 25k
CBNC vbnc 0 2p
CBPC vbpc vdd 2p

* NMOS differential pair and mirrored tail current.
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMNINM nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XMNINP nright inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1

* Input-stage NMOS cascodes.
XMNCASM nmirror vbnc nleft 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XMNCASP nstage vbnc nright 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1

* PMOS mirror with cascoded high-impedance output branch.
XMPREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMPMIR npcas nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMPCAS nstage vbpc npcas vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1

* Common-source output stage with mirrored current sink.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.35 nf=1 m=1
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=10

* Series-R Miller compensation.
RCOMP nstage ncomp 600
CCOMP ncomp out 700f

.ends dut
